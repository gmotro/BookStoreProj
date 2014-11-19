using System;
using System.Collections.Generic;
using System.Web;

namespace MyWebProject
{
    public class Genre
    {
        private int m_genreID = -1;
        private string m_genrename;

        public string Genrename
        {
            get { return m_genrename; }
            set { m_genrename = value; }
        }

        // Constructor with parameters
        public Genre(string genrename)
        {
            this.m_genrename = genrename;
        }


    }
}