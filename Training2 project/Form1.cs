using System;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Training2_project
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection(@"Data Source=SHARUK\SQLEXPRESS;Initial Catalog=login;Integrated Security=True");

        private void Form1_Load(object sender, EventArgs e)
        {
            GetEmployeesRecord();
        }

        private void GetEmployeesRecord()
        {
            
            SqlCommand cmd = new SqlCommand("Select * from employee_table", con);
            DataTable dt = new DataTable();

            con.Open();

            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            con.Close();

            dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            if (IsValid())
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO employee_table VALUES (@Name, @Mobile_No, @Address, @Fathers_Name,  @Salary)", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Name", textBox2.Text);
                cmd.Parameters.AddWithValue("@@Mobile_No", textBox5.Text);
                cmd.Parameters.AddWithValue("@Address", textBox3.Text);
                cmd.Parameters.AddWithValue("@Fathers_Name", textBox1.Text);
                cmd.Parameters.AddWithValue("@Salary", textBox4.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("New employee is registered", "Saved", MessageBoxButtons.OK, MessageBoxIcon.Information);
                GetEmployeesRecord();
            }
        }

        private bool IsValid()
        {
            if(textBox2.Text == String.Empty)
            {
                MessageBox.Show("Employee name required", "Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if(Employee_Id > 0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE employee_table SET Name = @Name,Mobile_no = @Mobile_No, Address = @Address,Fathers_name = @Fathers_Name,Salary = @Salary WHERE Employee_Id = @Id", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Name", textBox2.Text);
                cmd.Parameters.AddWithValue("@Mobile_No", textBox5.Text);
                cmd.Parameters.AddWithValue("@Address", textBox3.Text);
                cmd.Parameters.AddWithValue("@Fathers_Name", textBox1.Text);
                cmd.Parameters.AddWithValue("@Salary", textBox4.Text);
                cmd.Parameters.AddWithValue("@Id", this.Employee_Id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Employee Information Updated", "Updated", MessageBoxButtons.OK, MessageBoxIcon.Information);
                GetEmployeesRecord();
            }
            else
            {
                MessageBox.Show("Please Select a student", "Select?", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}
