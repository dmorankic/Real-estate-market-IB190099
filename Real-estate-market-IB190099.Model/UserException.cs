﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class UserException:Exception
    {
        public UserException(string message):base(message) { }  
    }
}