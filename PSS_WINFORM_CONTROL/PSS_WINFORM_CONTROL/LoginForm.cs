using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;

namespace PSS_WINFORM_CONTROL
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
            buttonCancel.BackColor = Color.Red;
        }

        private void LoginForm_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                buttonLogin.PerformClick();
            }
            if(e.KeyCode == Keys.Escape)
            {
                buttonCancel.PerformClick();
            }
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            Model1 ms = new Model1();
            user us = ms.users.Where(c => c.username.Equals(txtName.Text) && c.role_id == 3).FirstOrDefault();
            MD5 md5Hash = MD5.Create();
            String hashedPass = GetMd5Hash(md5Hash, txtPass.Text);
            Console.WriteLine(hashedPass);
            if (us == null)
            {
                MessageBox.Show("Please input again", "Username or password wrong!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if (us.password.Equals(hashedPass))
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

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }
        // Verify a hash against a string.
        static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
        {
            // Hash the input.
            string hashOfInput = GetMd5Hash(md5Hash, input);

            // Create a StringComparer an compare the hashes.
            StringComparer comparer = StringComparer.OrdinalIgnoreCase;

            if (0 == comparer.Compare(hashOfInput, hash))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
