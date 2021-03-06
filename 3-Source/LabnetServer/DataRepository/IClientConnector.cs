﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataRepository
{
    public interface IClientConnector
    {
        string SetupConnectionWithLab(string connectionCode, int serverDoctorId,int clientDoctorId,string clientUrl,string doctorName);
        string SetupLabConnectionWithLab(string connectionCode, int serverLabId, int clientLabId, string clientUrl, string labName);
    }
}
