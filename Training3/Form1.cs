using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace Training3
{
    public partial class Form1 : Form
    {
        private Dictionary<string, List<string>> stateCitiesMap;
        public Form1()
        {
            InitializeComponent();
            InitializeCityData();
        }

        SqlConnection conn = new SqlConnection(@"Data Source=SHARUK\SQLEXPRESS;Initial Catalog=oracle;Integrated Security=True");

        private void InitializeCityData()
        {
            stateCitiesMap = new Dictionary<string, List<string>>
            {
                { "Kerala", new List<string> { "Thrissur", "Eranakulam", "Kozhikode" , "Trivandrum" } },
                { "Tamil Nadu", new List<string> { "Chennai", "Coimbatore", "Salem" } },
                { "Karnataka", new List<string> { "Bangalore", "Hosur", "Electronic city" } },
                { "Maharashtra", new List<string> { "Mumbai", "Pune", "Andheri" } },
            };
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
            comboBox1.Items.Add("Kerala");
            comboBox1.Items.Add("Tamil Nadu");
            comboBox1.Items.Add("Karnataka");
            comboBox1.Items.Add("Maharashtra");

            DateTime currentDate = DateTime.Today;
            DateTime maxDate = currentDate.AddYears(-18);
            DateTime minDate = maxDate.AddYears(-100);   
            dateTimePicker1.MinDate = minDate;
            dateTimePicker1.MaxDate = maxDate;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string gender = radioButton1.Checked ? "Male" : (radioButton2.Checked ? "Female" : "Other");
            DateTime dob = dateTimePicker1.Value;

            if (!IsValidName(textBox1.Text))
            {
                MessageBox.Show("Invalid first name format.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!IsValidName(textBox2.Text))
            {
                MessageBox.Show("Invalid last name format.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

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
            using (SqlCommand command = new SqlCommand("INSERT INTO register (fname, lname, dob, age, gender, phone, email, address, state, city, uname, psw) VALUES (@fname, @lname, @dob, @age, @gender, @phone, @email, @address, @state, @city, @uname, @psw)", conn))
            {
                command.Parameters.AddWithValue("@fname", textBox1.Text);
                command.Parameters.AddWithValue("@lname", textBox2.Text);
                command.Parameters.AddWithValue("@dob", dob);
                command.Parameters.AddWithValue("@age", textBox4.Text);
                command.Parameters.AddWithValue("@gender", gender);
                command.Parameters.AddWithValue("@phone", textBox6.Text);
                command.Parameters.AddWithValue("@email", textBox7.Text);
                command.Parameters.AddWithValue("@address", textBox8.Text);

                command.Parameters.AddWithValue("@state", comboBox1.SelectedItem.ToString());
                command.Parameters.AddWithValue("@city", comboBox2.SelectedItem.ToString());
                command.Parameters.AddWithValue("@uname", textBox11.Text);
                command.Parameters.AddWithValue("@psw", textBox12.Text);

                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
            }

            MessageBox.Show("Registration successful.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            this.Close();
        }


        private bool IsValidName(string name)
        {
            return !string.IsNullOrEmpty(name) && !Regex.IsMatch(name, @"\d");
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

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

            comboBox2.Items.Clear();
            string selectedState = comboBox1.SelectedItem.ToString();

            if (stateCitiesMap.ContainsKey(selectedState))
            {
                List<string> cities = stateCitiesMap[selectedState];
                foreach (string city in cities)
                {
                    comboBox2.Items.Add(city);
                }
            }
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            DateTime dob = dateTimePicker1.Value;
            int age = CalculateAge(dob);
            textBox4.Text = age.ToString();
        }

        private int CalculateAge(DateTime dob)
        {
            DateTime currentDate = DateTime.Today;
            int age = currentDate.Year - dob.Year;
            if (dob > currentDate.AddYears(-age))
            {
                age--;
            }

            return age;
        }
    }
}
  
