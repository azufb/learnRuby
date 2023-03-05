require "sqlite3" # gemの読み込み
require "csv"

class JZipCode
    CSV_COLUMN = { code: 2, pref: 6, city: 7, addr: 8 }

    # 初期化
    def initialize(dbfile)
        @dbfile = dbfile
    end

    # テーブルの作成とデータ登録
    def create(zipfile)
        return if File.exist?(@dbfile)

        SQLite3::Database.open(@dbfile) do |db|
            db.execute(<<- SQL)
                CREATE TABLE IF NOT EXISTS zip_codes
                (code TEXT, pref TEXT, city TEXT, addr TEXT, alladdr TEXT)
            SQL

            db.execute("BEGIN TRANSACTION")
            CSV.open(zipfile, "r:Shift_JIS:UTF-8") do |csv|
                csv.each do |rec|
                    data = Hash.new
                    CSV_COLUMN.each { |key, index| data[key] = rec[index] }
                    data[:alladdr] = data[:pref] + data[:city] + data[:addr]
                    db.execute(<<- SQL, data)
                        INSERT INTO zip_codes VALUES
                            (:code, :pref, :city, :addr, :alladdr)
                    SQL
                end
            end
            db.execute("COMMIT TRANSACTION")
        end
        return true
    end

    # 郵便番号から検索
    def find_by_code(code)
        ret = []
        SQLite3::Database.open(@dbfile) do |db|
            db.execute(<<- SQL, code) { |row| ret << row.join(" ") }
                SELECT code, alladdr
                    FROM zip_codes
                WHERE code = ?
            SQL
        end
        return ret.map { |line| line + "\n" }.join
    end

    # 文字列から検索
    def find_by_address(addr)
        ret = []
        SQLite3::Database.open(@dbfile) do |db|
            # 部分一致検索で使う文字列
            like = "%#{addr}%"
            db.execute(<<- SQL, like) { |row| ret << row.join(" ") }
                SELECT code, alladdr
                    FROM zip_codes
                # カラム名 LIKE "%文字列%"で部分一致検索できる。
                WHERE alladdr LIKE ?
            SQL
        end
        return ret.map { |line| line + "\n" }.join
    end
end