using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
namespace Training_Project
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection(@"Data Source=SHARUK\SQLEXPRESS;Initial Catalog=login;Integrated Security=True");
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

                String uname, u_password;
                uname = textBox1.Text;
                u_password = textBox2.Text;
                try
                {
                    String querry = "Select * from login_table where username='" + textBox1.Text + "' AND password='" + textBox2.Text + "'";
                    SqlDataAdapter sda = new SqlDataAdapter(querry, conn);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        uname = textBox1.Text;
                        u_password = textBox2.Text;

                        Form2 min = new Form2();
                        min.Show();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("invalid login details", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        textBox1.Clear();
                        textBox2.Clear();
                        textBox2.Focus();
                    }


                }
                catch (Exception ex)
                {
                    MessageBox.Show("An error occurred: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }

            
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}