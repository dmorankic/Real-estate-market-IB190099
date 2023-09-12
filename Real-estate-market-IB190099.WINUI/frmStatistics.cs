using Microcharts;
using SkiaSharp;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microcharts.Forms;
using SkiaSharp.Views.Forms;
using System.Drawing.Imaging;
using DevExpress.XtraCharts;
using DevExpress.CodeParser;
using System.Numerics;
using Xamarin.Forms;
using SkiaSharp.Views.Desktop;
using System.Drawing;
using System.Windows.Forms;
using Real_estate_market_IB190099.Services;
using Real_estate_market_IB190099.Model;
using DevExpress.DataProcessing;

namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmStatistics : Form
    {
        public List<PaymentModel> _payments;
        public List<PaymentModel> _rentPayments;
        public List<PaymentModel> _salePayments;
        public double rent=0;
        public double sale=0;
        public double[] months =new double[13] {0,0,0,0,0,0,0,0,0,0,0,0,0};
        public List<int> employees=new List<int>();
        public double[] employeesRevenue;
        List<string> labelsDonut =new List<string>();




        public APIService paymentService { get; set; } = new APIService("Payment");
        public frmStatistics()
       {
            InitializeComponent();
            
        }


        private async void frmStatistics_Load(object sender, EventArgs e)
        {
            lblYear.Text += DateTime.Now.Year;
            lblMonth.Text += DateTime.Now.Year;
            lblEmp.Text += DateTime.Now.Year;

            _payments = await paymentService.Get<List<PaymentModel>>();
            _salePayments = _payments
                .Where(x=>x.TransactionDate.Value.Year==DateTime.Now.Year)
                .Where(x => x.Advertise.Type.ToLower() == "sale").ToList();
            _rentPayments = _payments
                .Where(x => x.TransactionDate.Value.Year == DateTime.Now.Year)
                .Where(x => x.Advertise.Type.ToLower() == "rent").ToList();
            _salePayments.ForEach(x => { sale+=x.Amount; });
            _rentPayments.ForEach(x => { rent += x.Amount; });
            _payments.Where(x => x.TransactionDate.Value.Year == DateTime.Now.Year).Where(x=>x.EmployeeId!=0).DistinctBy(x => x.EmployeeId).ForEach(x => { employees.Add(x.EmployeeId);
                labelsDonut.Add($"{x.Employee.FirstName} {x.Employee.LastName}");
            });
            employeesRevenue=new double[employees.Count] ;
            for(int i = 0; i < employees.Count; i++)
            {
                _payments.ForEach(x => {
                    if (x.EmployeeId == employees[i])
                    {
                        employeesRevenue[i] += x.Amount;
                    }
                });
            }
            for(int i = 1; i <= 12; i++)
            {
                _payments.Where(x=>x.TransactionDate.Value.Year== DateTime.Now.Year).ForEach(x => {
                    if (x.TransactionDate.Value.Month == i)
                    {
                        months[i] += x.Amount;
                    }
                });
            }

            var plt = new ScottPlot.Plot(400, 500);

            double[] values = { rent, sale };
            string[] labels = { $"rent : ${rent}", $"sale : ${sale}" };
            var pie = plt.AddPie(values);
            pie.Explode = true;
            pie.SliceLabels=labels;

            plt.Legend(location: ScottPlot.Alignment.UpperCenter);
            pie.ShowPercentages = true;
            pictureBox1.ImageLocation = plt.SaveFig("pie_quickstart.png");
            pictureBox1.Width = 800;
            pictureBox1.Height = 600;



            var pltBar = new ScottPlot.Plot(800, 500);

            double[] valuesBar = months ;
           

            Func<double, string> customFormatter = y => $"${y}";
  
            var bar = pltBar.AddBar(valuesBar);
            bar.ShowValuesAboveBars = true;
            bar.ValueFormatter = customFormatter;
            bar.Font.Color = System.Drawing.Color.Green;
            bar.Font.Size = 18;


            bar.Font.Bold = true;

            pltBar.SetAxisLimits(yMin: 0);
            pltBar.SetAxisLimits(xMin: 0);
            pltBar.SetAxisLimits(xMax: 13);


            pictureBox2.ImageLocation = pltBar.SaveFig("bar_values_custom_font.png");
            pictureBox2.Width = 1200;
            pictureBox2.Height = 600;



            var pltDonut = new ScottPlot.Plot(400, 500);

            double[] valuesDonut = employeesRevenue;
            var donut = pltDonut.AddPie(valuesDonut);
            donut.SliceLabels = labelsDonut.ToArray();
            donut.Explode = true;
            donut.DonutSize = .6;
            donut.ShowPercentages = true;
            pltDonut.Legend(location: ScottPlot.Alignment.UpperCenter);


            pictureBox3.ImageLocation = pltDonut.SaveFig("pie_donut.png"); 
            pictureBox3.Width = 600;
            pictureBox3.Height = 600;

        }

        private void btnSale_Click(object sender, EventArgs e)
        {
            frmSale frm = new frmSale();
            Hide();
            frm.Show();
        }

        private void btnUsers_Click(object sender, EventArgs e)
        {
            frmUsers frm = new frmUsers();
            Hide();
            frm.Show();
        }

        private void btnDemand_Click(object sender, EventArgs e)
        {
            frmDemand frm = new frmDemand();
            Hide();
            frm.Show();
        }

        private void btnRent_Click(object sender, EventArgs e)
        {
            frmRent frm = new frmRent();
            Hide();
            frm.Show();
        }

        private void btnPending_Click(object sender, EventArgs e)
        {
            frmPending frm = new frmPending();
            Hide();
            frm.Show();
        }

        private void btnMessages_Click(object sender, EventArgs e)
        {
            frmMessages frm = new frmMessages();
            Hide();
            frm.Show();
        }

       
    }
}
