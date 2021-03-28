using System;
using Newtonsoft.Json;
using System.Net.Http;
using System.Threading.Tasks;
using MSCompras.Models;

namespace GatewayTienda.Clients
{
    public class ComprasClient
    {
        HttpClient client;
        private string urlServicio = "";

        public ComprasClient()
        {
            urlServicio = Environment.GetEnvironmentVariable("URL_MS_COMPRAS");
            client = new HttpClient();
        }

         public async Task<Compra[]> BuscarCompra(int idCompra)
         {
            Compra[] values;
            string url = urlServicio + "/compras/buscar?";
            if(idCompra >= 0) 
            {
                url += "&";
                url += "idCompra=" + idCompra;
            }else{
                return null;
            }
            try
            {
                string responseBody = await client.GetStringAsync(url);
                values = JsonConvert.DeserializeObject<Compra[]>(responseBody);
                return values;
            }
            catch (Exception ex)
            {
                Console.WriteLine("\nError al obtener una respuesta.");
                Console.WriteLine("Error: {0}", ex.Message);
                return null;
            }
         }

          public async Task<Compra> BuscarDetallesDeCompra(int idCompra = -1)
         {
            Compra value;
            string url = urlServicio + "/compras/detalles/";
            if(idCompra >= 0) 
            { 
                url +=  idCompra;
            }else{
                return null;
            }
            try
            {
                string responseBody = await client.GetStringAsync(url);
                value = JsonConvert.DeserializeObject<Compra>(responseBody);
                return value;
            }
            catch (Exception ex)
            {
                Console.WriteLine("\nError al obtener una respuesta.");
                Console.WriteLine("Error: {0}", ex.Message);
                return null;
            }
         }
    }
}