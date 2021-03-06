﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<LabnetClient.Models.PatientViewModel>" %>
<%= Html.ValidationSummary() %>
<div class="Module">
    <div class="ModuleTitle">
        <h3 class="Title">
            <%if (Model.ViewMode == DomainModel.Constant.ViewMode.Create)
              {%>
            <%=Resources.PatientStrings.PatientCreate_Title%>
            <%}
              else
              { %>
            <%=Resources.PatientStrings.PatientEdit_Title %>
            <%} %>
        </h3>
    </div>
    <%Html.BeginForm(); %>
    <%= Html.HiddenFor(p=>p.LabExamination.Id) %>
    <%= Html.HiddenFor(p=>p.LabExamination.PartnerName) %>
    <%= Html.HiddenFor(p=>p.LabExamination.DoctorName) %>
    <%= Html.HiddenFor(p=>p.LabExamination.DoctorId) %>
    <%= Html.HiddenFor(p=>p.LabExamination.PartnerId) %>
    <div class="ModuleContent">
        <div class="ContentTop">
            <div class="LeftCol">
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientSTT %></label>
                    </div>
                    <div class="Column">
                        <%=Html.TextBox("stt",Model.LabExamination.OrderNumber, new { Class = "textInput50 number readonly", style = "padding-left:10px; color:Red; font-size:18px!important; padding:0px" , Disabled="Disabled"})%>
                        <%= Html.HiddenFor(p=>p.LabExamination.OrderNumber) %>
                        <input type="hidden" value="<%=Model.LabExamination.OrderNumber %>" name="LabExamination.OrderNumber" id="LabExamination_OrderNumber"/>
                    </div>
                </div>
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientInsert_Partner %></label>
                    </div>
                    <div class="Column">
                     <%--   <%= Html.DropDownListFor(p => p.LabExamination.PartnerId, Model.SelectListPartner) %>--%>
                    <%Html.RenderPartial("ComboBox", Model.ComboBoxNoiGuiMauModel); %>
                    </div>
                </div>
            </div>
            <div class="RightCol">
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientInsert_ReceivedDate%></label>
                    </div>
                    <div class="Column">
                        <%if (Model.ViewMode == DomainModel.Constant.ViewMode.Edit)
                          { %>
                        <%=Html.TextBox("LabExamination.ReceivedDate", Model.LabExamination.ReceivedDate.Value.ToString("d"), new { ID = "LabExamination_ReceivedDate", Class = "textInput100 readonly" })%>
                        <%}
                          else
                          {%>
                        <%=Html.TextBox("LabExamination.ReceivedDate", Model.LabExamination.ReceivedDate.Value.ToString("d"), new { ID = "LabExamination_ReceivedDate", Class = "textInput100 date" })%>
                        <%} %>
                    </div>
                </div>
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientCode %></label>
                    </div>
                    <div class="Column">
                        <b style="color:Red; font-size:18px!important"><%= Model.LabExamination.ExaminationNumber%></b>
                        <%= Html.HiddenFor(p=>p.LabExamination.ExaminationNumber) %>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="line">
        </div>
        <div class="ContentTop">
            <div class="LeftCol">
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientName%></label>
                    </div>
                    <div class="Column">
                        <%=Html.TextBoxFor(m => m.Patient.FirstName, new  {Class="textInput" })%>
                    </div>
                </div>
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientBirthday%></label>
                    </div>
                    <div class="Column">
                        <%=Html.TextBoxFor(m => m.Patient.BirthDate, new  {Class="textInput" })%>
                    </div>
                </div>
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientPhone%></label>
                    </div>
                    <div class="Column">
                        <%=Html.TextBoxFor(m => m.Patient.Phone, new  {Class="textInput number" })%>
                    </div>
                </div>
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientEmail%></label>
                    </div>
                    <div class="Column">
                        <%=Html.TextBoxFor(m => m.Patient.Email, new  {Class="textInput" })%>
                    </div>
                </div>
            </div>
            <div class="RightCol">
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientGender%></label>
                    </div>
                    <div class="Column">
                        <select name="Patient.Gender" id="Patient_Gender">
                            <option value="true">Nam </option>
                            <option value="false">Nữ </option>
                        </select>
                    </div>
                </div>
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientIDNumber%></label>
                    </div>
                    <div class="Column">
                        <%=Html.TextBoxFor(m => m.Patient.IndentifierNumber, new { Class = "textInput number" })%>
                    </div>
                </div>
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientAddress%></label>
                    </div>
                    <div class="Column">
                        <%=Html.TextBoxFor(m => m.Patient.Address, new  {Class="textInput" })%>
                    </div>
                </div>
                <div class="Row">
                    <div class="Column">
                        <label class="lbTitle">
                            <%=Resources.PatientStrings.PatientInsert_SpecifiedDoctor%></label>
                    </div>
                    <div class="Column">
                        <%=Html.TextBoxFor(m => m.LabExamination.SpecifiedDoctor, new  {Class="textInput" })%>
                    </div>
                </div>
            </div>
            <div class="Row clear">
                <div class="Column">
                    <label class="lbTitle">
                        <%=Resources.PatientStrings.PatientDiagnosis%></label>
                </div>
                <div class="Column">
                    <%=Html.TextAreaFor(m => m.LabExamination.Diagnosis, new { cols = 75, rows = 3 })%>
                </div>
            </div>
            <% Html.EndForm(); %>
        </div>
        <div class="clear">
        </div>
        <div class="line">
        </div>
        <div class="ContentBottom">
            <div class="Row">
                <div class="Column">
                    <label class="lbTitle Width110 MarginT5">
                        <%=Resources.PatientStrings.PatientInsert_Panel %></label>
                </div>
                <div class="Column" id="PanelAutoComplete">
                    <%Html.RenderPartial("ComboBox", Model.ComboBoxPanelModel); %>
                </div>
                <div class="Column">
                    <label class="lbTitle Width110 MarginT5 MarginL100">
                        <%=Resources.PatientStrings.PatientInsert_XetNghiem %></label>
                </div>
                <div class="Column" id="TestAutoComplete">
                    <%Html.RenderPartial("ComboBox", Model.ComboBoxTestModel); %>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="Row">
                <div class="Column">
                    <label class="lbTitle Width110  ">
                        <%=Resources.PatientStrings.PatientInsert_TestSection%></label>
                </div>
                <div class="Column" id="TestSectionAutoComplete">
                    <%Html.RenderPartial("ComboBox", Model.ComboBoxTestSectionModel); %>
                </div>
                <div class="clear">
                </div>
            </div>
            <div id="PatientTestTable">
                <%Html.RenderPartial("DataTable", Model.JQGrid); %>
            </div>
            <div align="center">
                <input type="button" value="<%=Resources.PatientStrings.PatientInsert_Button_Save%>"
                    id="btnSavePatientInfo" />
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">
    function GetTestData(url,id)
    {
        $.ajax({
            url: url,
            data: {
                Id: id
            },
            type: "POST",
            async: true,
            dataType: "Json",
            success: function (data) {
                var allInputs = DataTableGetArrayDataSource_<%: Model.JQGrid.TableId %>();
                //Remove item in data array that already existed in grid
                for (var t = 0; t < allInputs.length; t++) {
                    var testId = allInputs[t].TestId;
                    for (var j = 0; j < data.length; j++) {
                        var test = data[j].TestId;
                        if (test == testId) {
                            data.splice(j, 1);
                        }
                    }
                }
              
                for (var i = 0; i < data.length; i++) {
                    var array = $("#<%: Model.JQGrid.TableId %>").jqGrid().getRowData();
                    jQuery("#<%: Model.JQGrid.TableId %>").jqGrid('addRowData', array.length, data[i]);
                }
            }
        });
    }

    function <%:Model.ComboBoxNoiGuiMauModel.ComboBoxId %>_ComboBoxSelect(id, label, tag) {
          if(tag=="BacSi")
          {
            $("#LabExamination_DoctorId").val(id);
            $("#LabExamination_PartnerId").val("-1");
            $("#LabExamination_DoctorName").val(label);
            $("#LabExamination_PartnerName").val("");  
          }
          else if(tag=="Lab")
          {
            $("#LabExamination_DoctorId").val("-1");
            $("#LabExamination_PartnerId").val(id);
            $("#LabExamination_DoctorName").val("");
            $("#LabExamination_PartnerName").val(label);  
          }
          else{
            $("#LabExamination_DoctorId").val("-1");
            $("#LabExamination_PartnerId").val("-1");
            $("#LabExamination_DoctorName").val("");
            $("#LabExamination_PartnerName").val("");  
          }

    }

    function <%:Model.ComboBoxPanelModel.ComboBoxId %>_ComboBoxSelect(id, label, tag) {
        GetTestData("/BenhNhan/GetPanelTests",id);
    }
    function <%:Model.ComboBoxTestModel.ComboBoxId %>_ComboBoxSelect(id, label, tag) {
        GetTestData("/BenhNhan/GetTests",id);
    }
    
    function <%:Model.ComboBoxTestSectionModel.ComboBoxId %>_ComboBoxSelect(id, label, tag) {
    
        GetTestData("/BenhNhan/GetTestsOfTestSection",id);
      
    }
    $(document).ready(function () {
        $("#LabExamination_OrderNumber").keyup(function (event) {
            if (event.keyCode == 13) {
                var date = $("#LabExamination_ReceivedDate").val();
                $.ajax({
                    url: "/BenhNhan/SearchByOrderNumber",
                    data: {
                        OrderNumber: $(this).val(),
                        ReceivedDate: date
                    },
                    type: "POST",
                    success: function (data) {
                        alert(data);
                        if (data.trim().toLowerCase().indexOf("false") != -1)
                            alert("Số thứ tự bạn tìm kiếm không tồn tại");
                        else {
                            window.location = "/BenhNhan/Edit/" + data + "?OrderNumber=" + $("#LabExamination_OrderNumber").val() + "&ReceivedDate=" + date;
                        }
                    }

                });
            }
        });

        $("#btnSavePatientInfo").click(function (event) {
            event.preventDefault();
            $("#DataTableSaveButton_<%:Model.JQGrid.TableId %>").click();
            $("form").submit();
        });

        //        <%if(Model.ViewMode == DomainModel.Constant.ViewMode.Edit){ %>
        //            $("<%: Model.JQGrid.TableId %> tr td :checkbox").attr("disabled","disabled");
        //        <%} %>
    });
    
    </script>
