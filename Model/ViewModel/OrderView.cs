﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    class OrderView
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }

        public int Quantity { get; set; }
        public string Description { get; set; }
    }
}
