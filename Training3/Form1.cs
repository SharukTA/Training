using System;
using System.Text.RegularExpressions;
using System.Windows.Forms;


namespace Training3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (!IsValidEmail(textBox7.Text))
            {
                MessageBox.Show("Invalid email address.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!IsValidPhoneNumber(textBox6.Text))
            {
                MessageBox.Show("Invalid phone number.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!IsValidPassword(textBox12.Text))
            {
                MessageBox.Show("Invalid password format.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (textBox12.Text != textBox13.Text)
            {
                MessageBox.Show("Passwords do not match.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

        }
        private bool IsValidEmail(string email)
        {
            string pattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            return Regex.IsMatch(email, pattern);
        }

        private bool IsValidPhoneNumber(string phone)
        {
            string pattern = @"^\d{10}$";
            return Regex.IsMatch(phone, pattern);
        }

        private bool IsValidPassword(string password)
        {
            return !string.IsNullOrEmpty(password) && password.Length >= 8;
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }
    }
  
}
