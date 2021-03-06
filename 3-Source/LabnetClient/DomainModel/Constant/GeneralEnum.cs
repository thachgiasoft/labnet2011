﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DomainModel.Constant
{
    public enum ViewMode
    {
        Create = 1,
        Edit = 2,
        Detail = 3,
    }
    public enum SearchTypeEnum
    {
        Contains,
        Word,
    }

    public enum AnalysisStatusEnum
    {
        New = 1,// Mới (Default)
        HaveResult = 2,// Đã có kết quả
        Approved = 3//Đã xác minh

    }

    public enum LabExaminationStatusEnum
    {
        New = 1,
        Approved = 2,
    }

    public enum LoaiNoiGuiMau
    {
        BacSi = 1,
        LabGuiMau = 2
    }

    public enum ConstantNumber
    {
        PatientNumberLength = 5,
        ExaminationNumberLength = 5,
        ConnetionCodeLength = 5
    }
}