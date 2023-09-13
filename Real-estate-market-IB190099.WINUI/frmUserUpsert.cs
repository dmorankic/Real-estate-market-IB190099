using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using System.ComponentModel;
using System.Net.Mail;
using System.Text.RegularExpressions;



namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmUserUpsert : Form
    {
        public UserModel _user = null;
        public bool _isMyProfile=false;
        public APIService usersService { get; set; } = new APIService("User");
        public frmUserUpsert(UserModel user=null,bool isMyProfile=false)
        {
            InitializeComponent();
            _user= user;    
            _isMyProfile= isMyProfile;
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
                if(_isMyProfile) { lblHeading.Text = "My profile"; }
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
                        if(_isMyProfile)
                        {
                            APIService.loggedUser= _user;
                        }
                        if (_user.Id == APIService.loggedUser.Id)
                        {
                            APIService.loggedUser = _user;
                        }

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
                            if (_isMyProfile)
                            {
                                APIService.loggedUser = _user;
                            }
                            if (_user.Id == APIService.loggedUser.Id)
                            {
                                APIService.loggedUser = _user;
                            }
                            if (_user != null)
                            {
                                MessageBox.Show("User data updated");
                            }
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

        private void txtEmail_Validating(object sender, CancelEventArgs e)
        {
            if (!isValidEmail())
            {
                e.Cancel = true;
                txtEmail.Focus();
                err.SetError(txtEmail, "Please provide a valid email address");
            }
            else
            {
                e.Cancel = false;
                err.SetError(txtEmail, "");
            }
        }

        private bool isValidEmail()
        {
            bool result = false;

            try
            {
                MailAddress ma = new MailAddress(txtEmail.Text);
                result = (txtEmail.Text.LastIndexOf(".") > txtEmail.Text.LastIndexOf("@"));
            }
            catch
            {
                result = false;
            }
            return result;
        }

        private void txtPhone_Validating(object sender, CancelEventArgs e)
        {
            if (!isValidPhoneNumber())
            {
                e.Cancel = true;
                txtPhone.Focus();
                err.SetError(txtPhone, "Please provide a valid phone number");
            }
            else
            {
                e.Cancel = false;
                err.SetError(txtPhone, "");
            }
        }

       private bool isValidPhoneNumber()
        {
            string pattern = @"^\d{3}\s\d{8,9}$";
            return Regex.IsMatch(txtPhone.Text, pattern);
        }

    
    }
}
