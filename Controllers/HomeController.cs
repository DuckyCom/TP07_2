using Microsoft.AspNetCore.Mvc;
using TP07.Models;
namespace TP07.Controllers;


public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View("Index");
    }
    public IActionResult ConfigurarJuego(){
        if (Juego.ObtenerPreguntas() == null)
        {
            Juego.InicializarJuego();
            return View("ConfigurarJuego");
        }
        else
        {
            return RedirectToAction("Jugar");
        }
    }
    public IActionResult Comenzar(string username,int dificultad,int categoria){
        Juego.CargarPartida(username,dificultad,categoria);
        if (Juego.ObtenerPreguntas != null)
        {
            return RedirectToAction("Jugar");
        }
        else 
        {
            return RedirectToAction("Comenzar", new {username = username, dificultad = dificultad, categoria = categoria});
        }
    }
    public IActionResult Jugar(){
        ViewBag.Pregunta = Juego.ObtenerProximaPregunta();
        ViewBag.Username = Juego.ObtenerNombre();
        ViewBag.Puntaje = Juego.ObtenerPuntaje();
        if (ViewBag.Pregunta != null)
        {
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Pregunta.IdPregunta);
            return View("Juego");
        }
        else
        {
            return View("Fin");
        }
    }
    [HttpPost]public IActionResult VerificarRespuesta(int idPregunta,Respuesta respuesta){
        ViewBag.Puntaje = Juego.ObtenerPuntaje();
        ViewBag.Correcto = Juego.VerificarRespuesta(idPregunta, respuesta);
        return View("Respuesta");
    }
    
}
