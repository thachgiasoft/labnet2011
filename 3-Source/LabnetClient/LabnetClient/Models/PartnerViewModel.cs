﻿using DomainModel;

namespace LabnetClient.Models
{
    public class PartnerViewModel : BaseModel
    {
        public PartnerViewModel()
        {
            Partner = new VMPartner();
            Autocomplete = new AutocompleteModel("Partner.TestName");
        }

        /// <summary>
        /// Gets or set partner info
        /// </summary>
        public VMPartner Partner { get; set; }

        public AutocompleteModel Autocomplete { get; set; }

    }
}