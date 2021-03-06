﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Models
{
    [Serializable]
    public class TemporaryTable
    {
        public int SL { get; set; }
        public string ItemName { get; set; }
        public string CompanyName { get; set; }
        public int Quantity { get; set; }
    }
}