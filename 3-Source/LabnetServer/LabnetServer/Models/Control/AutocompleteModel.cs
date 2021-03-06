﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LabnetServer.Models
{
    public class AutocompleteModel
    {

        public AutocompleteModel()
        {
            UseAjaxLoading = false;
            AutoCompleteId = String.Format("autoComplete_{0}", DateTime.Now.Ticks);
        }

        public AutocompleteModel(string bindingName):this()
        {
            BindingName = bindingName;
        }

        public AutocompleteModel(string bindingName,string getDataUrl)
            
        {
            BindingName = bindingName;
            GetDataUrl = getDataUrl;
            AutoCompleteId = String.Format("autoComplete_{0}", DateTime.Now.Ticks);
            UseAjaxLoading = true;
        }
        /// <summary>
        /// Gets or sets value of link to get data for control
        /// </summary>
        public string GetDataUrl { get; set; }

        /// <summary>
        /// Gets or sets value of name control value field 
        /// which specific dependent each parent model use this control ex: [Partner_Name]
        /// </summary>
        public string BindingName { get; set; }

        /// <summary>
        /// Gets or set id of autocomplete control
        /// </summary>
        public string AutoCompleteId { get; set; }

        /// <summary>
        /// Gets or sets the value indicate wherever control dynamic loading (ajax loading)
        /// by default this vaule is false
        /// </summary>
        public bool UseAjaxLoading { get; set; }

        /// <summary>
        /// Gets or sets custome css class for this control
        /// </summary>
        public string CustomeCss { get; set; }

        /// <summary>
        /// Gets or sets data of control if IsAjaxLoading is false
        /// </summary>
        public string JsonData { get; set; }

        /// <summary>
        /// Gets or sets selected value 
        /// </summary>
        public string SelectedValue { get; set; }


        /// <summary>
        /// 
        /// </summary>
        public string SelectedText { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string SelectedTag { get; set; }
    }
}