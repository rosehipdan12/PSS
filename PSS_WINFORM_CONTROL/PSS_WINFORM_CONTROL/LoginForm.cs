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
            user us = ms.users.Where(c => c.username.Equals(txtName.Text) && c.role_id==3).FirstOrDefault();
            if(us == null)
            {
                MessageBox.Show("Please input again", "Username or password wrong!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if(us.password.Equals(txtPass.Text))
            {
                Form1 mainForm = new Form1();
                mainForm.Show();
                //Hide login form
                this.Hide();
            }
            else
            {
                MessageBox.Show("Please input again", "Username or password wrong!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            

        }

        private void LoginForm_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                btnLogin.PerformClick();
            }
            if(e.KeyCode == Keys.Escape)
            {
                btnCancel.PerformClick();
            }
        }
    }
}
