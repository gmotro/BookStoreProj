using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using MyTestWebApp;


namespace MyWebProject
{
    public class Book
    {
        private int m_BookID = -1;
        private string m_Title;
        private Author m_Author;
        private Genre m_Genre;
        private Publisher m_Publisher;

        private DataTable m_tableBook;

        public int BookID
        {
            get { return m_BookID; }
            set { m_BookID = value; }
        }

        public string Title
        {
            get { return m_Title; }
            set { m_Title = value; }
        }

        public Author Author
        {
            get { return m_Author; }
            set { m_Author = value; }
        }

        public Genre Genre
        {
            get { return m_Genre; }
            set { m_Genre = value; }
        }

        public Publisher Publisher
        {
            get { return m_Publisher; }
            set { m_Publisher = value; }
        }


        // Constructor 
        public Book(string Title, string FirstName,string LastName, DateTime DOB, string Genre, string Publisher)
        {
            this.m_Title = Title;
            this.m_Author = new Author(FirstName
                                       , LastName
                                       , DOB
                                       );
            this.m_Genre = new Genre(Genre);
            this.m_Publisher = new Publisher(Publisher);
        }

        // Constructor by BookID
        public Book(int bookid)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();

            parameters.Add("@Bookid", bookid);
            m_tableBook = Helper.RunStoredProcedureReturnDataTable("BookGetAllInformationByBookID", parameters);

            this.m_BookID = bookid;
            this.m_Title = m_tableBook.Rows[0]["Title"].ToString(); 
            this.m_Author = new Author(m_tableBook.Rows[0]["AuthorLastName"].ToString()
                                       , m_tableBook.Rows[0]["AuthorFirstName"].ToString()
                                       , Convert.ToDateTime(m_tableBook.Rows[0]["Author_DOB"].ToString())
                                       );
            this.m_Genre = new Genre(m_tableBook.Rows[0]["GenreName"].ToString());
            this.m_Publisher = new Publisher(m_tableBook.Rows[0]["PublisherName"].ToString());
        }



        public void InsertNewBook()
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();

            parameters.Add("@Title", m_Title);
            parameters.Add("@AuthFirstname", this.m_Author.Firstname);
            parameters.Add("@AuthLastname", this.m_Author.Lastname);
            parameters.Add("@AuthDOB", this.m_Author.DOB);
            parameters.Add("@Genrename", this.m_Genre.Genrename);
            parameters.Add("@PublisherName", this.m_Publisher.PublisherName);
            Helper.RunStoredProcedure("CreateNewBookSP", parameters);  
        }

        public void UpdateExistingBook()
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();

            parameters.Add("@BookID", m_BookID);
            parameters.Add("@Title", m_Title);
            parameters.Add("@AuthFirstname", this.m_Author.Firstname);
            parameters.Add("@AuthLastname", this.m_Author.Lastname);
            parameters.Add("@AuthDOB", this.m_Author.DOB);
            parameters.Add("@Genrename", this.m_Genre.Genrename);
            parameters.Add("@PublisherName", this.m_Publisher.PublisherName);
            Helper.RunStoredProcedure("UpdateExistingBookSP", parameters); 

        }

    }
}