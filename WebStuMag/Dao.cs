using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace DatabaseEx
{
    class Dao
    {
        public MySqlConnection mySqlCon;
        public Dao()
        {
            String mysqlStr = "Database=student;Data Source=127.0.0.1;User Id=root;Password=li20010309;pooling=false;CharSet=utf8;port=3306";
            this.mySqlCon = new MySqlConnection(mysqlStr);
            this.mySqlCon.Open();
        }
        
        public MySqlConnection getMySqlCon()
        {

            return mySqlCon;
        }

        // 建立执行命令语句对象
        public static MySqlCommand getSqlCommand(String sql, MySqlConnection mysql)
        {
            MySqlCommand mySqlCommand = new MySqlCommand(sql, mysql);
            return mySqlCommand;
        }

        /// 查询并获得结果集并遍历

        public static void getResultset(MySqlCommand mySqlCommand)
        {
            MySqlDataReader reader = mySqlCommand.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        Console.WriteLine("编号:" + reader.GetInt32(0) + "  ID:" + reader.GetInt32(1) + "  |姓名:" + reader.GetString(2) + " |年龄:" + reader.GetInt32(3) + "|学历:" + reader.GetString(4));
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                reader.Close();
            }
        }
        /// 添加数据
        public static void getInsert(MySqlCommand mySqlCommand)
        {
            try
            {
                mySqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                String message = ex.Message;
                Console.WriteLine("插入数据失败了！" + message);
            }

        }
        // 修改数据
        public static void getUpdate(MySqlCommand mySqlCommand)
        {
            try
            {
                mySqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                String message = ex.Message;
                Console.WriteLine("修改数据失败了！" + message);
            }
        }
        // 删除数据
        public static void getDel(MySqlCommand mySqlCommand)
        {
            try
            {
                mySqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                String message = ex.Message;
                Console.WriteLine("删除数据失败了！" + message);
            }
        }

    }
}