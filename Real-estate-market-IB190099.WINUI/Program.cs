using AutoMapper;
using Real_estate_market_IB190099.Services;

namespace Real_estate_market_IB190099.WINUI
{
    internal static class Program
    {
        [STAThread]
        static void Main()
        {
            ApplicationConfiguration.Initialize();
            
            Application.Run(new frmLogin());
        }
    }
}