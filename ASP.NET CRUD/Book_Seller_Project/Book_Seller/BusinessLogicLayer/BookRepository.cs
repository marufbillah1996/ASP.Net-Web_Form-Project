using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Book_Seller.BusinessLogicLayer
{
    public class BookRepository
    {
        SqlConnection con;
        public BookRepository()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public ICollection<BookDTO> GetAll()
        {
            List<BookDTO> books = new List<BookDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Books", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    books.Add(new BookDTO
                    {
                        BookID = r.Field<int>("BookID"),
                        Title = r.Field<string>("Title"),
                        GenreID = r.Field<int>("GenreID"),
                        Price = r.Field<decimal>("Price"),
                        PublishDate = r.Field<DateTime>("PublishDate"),
                        Available = r.Field<Boolean>("Available"),
                        PublisherID = r.Field<int>("PublisherID")
                    });
                }
                return books;
            }

        }
        public void Insert(BookDTO dto)
        {
            string sql = @"INSERT INTO [dbo].[Books]
                           ([Title]
                           ,[GenreID]
                           ,[Price]
                           ,[PublishDate]
                           ,[Available]
                           ,[PublisherID])
                     VALUES
                           (@Title
                           ,@GenreID
                           ,@Price
                           ,@PublishDate
                           ,@Available
                           ,@PublisherID)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@Title", dto.Title);
                cmd.Parameters.AddWithValue("@GenreID", dto.GenreID);
                cmd.Parameters.AddWithValue("@Price", dto.Price);
                cmd.Parameters.AddWithValue("@PublishDate", dto.PublishDate);
                cmd.Parameters.AddWithValue("@Available", dto.Available);
                cmd.Parameters.AddWithValue("@PublisherID", dto.PublisherID);
                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }
        }
        public void Update(BookDTO dto)
        {
            string sql = @"UPDATE [dbo].[Books]
               SET [Title] = @Title
                  ,[GenreID] = @GenreID
                  ,[Price] = @Price
                  ,[PublishDate] = @PublishDate
                  ,[Available] = @Available
                  ,[PublisherID] = @PublisherID
             WHERE BookID = @BookID";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@Title", dto.Title);
                cmd.Parameters.AddWithValue("@GenreID", dto.GenreID);
                cmd.Parameters.AddWithValue("@Price", dto.Price);
                cmd.Parameters.AddWithValue("@PublishDate", dto.PublishDate);
                cmd.Parameters.AddWithValue("@Available", dto.Available);
                cmd.Parameters.AddWithValue("@PublisherID", dto.PublisherID);
                cmd.Parameters.AddWithValue("@BookID", dto.BookID);
                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }

        }
        public void Delete(BookDTO dto)
        {
            string sql = @"DELETE FROM Books WHERE BookID=@BookID";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            { 
                cmd.Parameters.AddWithValue("@BookID", dto.BookID);
                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }

        }
        public DataTable PublisherDropItems()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Publishers", this.con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
    }
}