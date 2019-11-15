using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PSS_WINFORM_CONTROL
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            Model1 ms = new Model1();
            user us = ms.users.Where(c => c.username.Equals(txtName.Text)).FirstOrDefault();
            if(us == null)
            {
                const string message = "Are you sure that you would like to close the form?";
                const string caption = "Form Closing";
                var result = MessageBox.Show(message, caption,
                                             MessageBoxButtons.YesNo,
                                             MessageBoxIcon.Question);

                // If the no button was pressed ...
                if (result == DialogResult.No)
                {
                    // cancel the closure of the form.
                    this.Close();
                }
            }
            else if(us.password.Equals(txtPass.Text))
            {
                Form1 mainForm = new Form1();
                mainForm.Show();
                
                this.Hide();
            }
            else
            {

            }
            

        }
    }
}
