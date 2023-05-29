﻿using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;



namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmUserUpsert : Form
    {
        public UserModel _user = null;
        public APIService usersService { get; set; } = new APIService("User");
        public frmUserUpsert(UserModel user=null)
        {
            InitializeComponent();
            _user= user;    
        }

        private void frmUserUpsert_Load(object sender, EventArgs e)
        {
            loadUserData();
        }

        private void loadUserData()
        {
            if (_user != null)
            {
                lblHeading.Text = "User ID " + _user.Id + " details";
                txtFirstName.Text = _user.FirstName;
                txtLastName.Text = _user.LastName;
                txtEmail.Text = _user.Email;
                txtPhone.Text = _user.Phone;
                dtBirth.Value = _user.DateOfBirth;
                txtGender.Text = _user.Gender;
                dtRegistered.Value = _user.DateRegistered;
                txtCity.Text = _user.Address.City.Name;
                txtZip.Text = _user.Address.City.ZipCode;
                txtStreet.Text = _user.Address.NumberStreet;
                txtRole.Text = _user.Role.Name;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dtBirth_ValueChanged(object sender, EventArgs e)
        {

        }

        private async void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ValidateChildren())
            {
                if (_user != null)
                {
                    PatchObject[] updateReq = new PatchObject[]
                    {
                    new PatchObject()
                    {
                        path = "/FirstName",
                        op = "replace",
                        value = txtFirstName.Text
                    },
                      new PatchObject()
                    {
                        path = "/LastName",
                        op = "replace",
                        value = txtLastName.Text
                    },
                      new PatchObject()
                    {
                        path = "/Email",
                        op = "replace",
                        value = txtEmail.Text
                    },
                      new PatchObject()
                    {
                        path = "/Phone",
                        op = "replace",
                        value = txtPhone.Text
                    },
                      new PatchObject()
                    {
                        path = "/DateOfBirth",
                        op = "replace",
                        value = dtBirth.Value
                    }
                      ,
                      new PatchObject()
                    {
                        path = "/DateRegistered",
                        op = "replace",
                        value = dtRegistered.Value
                    },
                      new PatchObject()
                    {
                        path = "/Gender",
                        op = "replace",
                        value = txtGender.Text
                    }
                    };
                    var AddressUpdateReq = new UserUpdateRequest()
                    {
                        CitytName = txtCity.Text,
                        NumberStreet = txtStreet.Text,
                        ZipCode = txtZip.Text
                    };
                    try
                    {
                        _user = await usersService.Put<UserModel>(_user.Id, AddressUpdateReq);

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }

                    try
                    {
                        if (_user != null)
                        {
                            _user = await usersService.Patch<UserModel>(_user.Id, updateReq);
                            MessageBox.Show("User data updated");
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }


                }
            }
       
        }

        private void txtZip_Validating(object sender, CancelEventArgs e)
        {
            ValidateNotEmptyTextField(e, txtZip, "Zip code should not be left blank!");
        }

        private void txtGender_Validating(object sender, CancelEventArgs e)
        {
            ValidateNotEmptyTextField(e, txtGender, "Gender should not be left blank!");
            if(txtGender.Text!="Male" && txtGender.Text != "Female")
            {

                e.Cancel = true;
                txtGender.Focus();
                err.SetError(txtGender, "Please insert valid gender (Male/Female)");
            }
            else
            {
                e.Cancel = false;
                err.SetError(txtGender, "");
            }
        }
        private void ValidateNotEmptyTextField(CancelEventArgs e,TextBox txtBox,string message)
        {
            if (string.IsNullOrWhiteSpace(txtBox.Text))
            {
                e.Cancel = true;
                txtBox.Focus();
                err.SetError(txtBox, message);
            }
            else
            {
                e.Cancel = false;
                err.SetError(txtBox, "");
            }
        }

        private void txtFirstName_Validating(object sender, CancelEventArgs e)
        {
            ValidateNotEmptyTextField(e, txtFirstName, "First name should not be left blank!");

        }

        private void txtLastName_Validating(object sender, CancelEventArgs e)
        {
            ValidateNotEmptyTextField(e, txtLastName, "Last name should not be left blank!");

        }

        private void txtCity_Validating(object sender, CancelEventArgs e)
        {
            ValidateNotEmptyTextField(e, txtCity, "City should not be left blank!");
        }

        private void txtStreet_Validating(object sender, CancelEventArgs e)
        {
            ValidateNotEmptyTextField(e, txtStreet, "Street should not be left blank!");

        }
    }
}
