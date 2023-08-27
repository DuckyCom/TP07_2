using Dapper;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace TP07.Models;
public class BD{

    private static string _connectionString = @"Server=localhost; Database=PreguntadOrt;Trusted_Conecction=True";
    
    public static List<Categoria> ObtenerCategorias(){
        using (SqlConnection conexion = new SqlConnection(_connectionString))
        {
            string sql = "SELECT [Categorias], [Nombre], [Foto] FROM [dbo].[Categorias];";
            return conexion.Query<Categoria>(sql).ToList();
        }
    }
    public static List<Dificultad> ObtenerDificultades(){
        using (SqlConnection conexion = new SqlConnection(_connectionString))
        {
            string sql = "SELECT [Dificultades], [nombre] FROM [dbo].[Dificultades];";
            return conexion.Query<Dificultad>(sql).ToList();
        }
    }
    public static List<Pregunta> ObtenerPreguntas(int idDificultad, int idCategoria){
        List<Pregunta> info = new List<Pregunta>{};
        if (idDificultad == -1 && idCategoria == -1)
        {
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                string sql = "SELECT [IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto] FROM [dbo].[Preguntas];";
                info = conexion.Query<Pregunta>(sql).ToList();
            }  
        }
        else if(idDificultad == -1)
        {
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                string sql = "SELECT [IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto] FROM [dbo].[Preguntas] WHERE IdCategoria = @idCategoria;";
                info = conexion.Query<Pregunta>(sql, new { IdCategoria = idCategoria }).ToList();
            }  
        }
        else if(idCategoria == -1)
        {
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                string sql = "SELECT [IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto] FROM [dbo].[Preguntas] WHERE IdDificultad = @idDificultad;";
                info = conexion.Query<Pregunta>(sql, new { idDificultad = idDificultad }).ToList();
            }  
        }
        else
        {
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                string sql = "SELECT [IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto] FROM [dbo].[Preguntas] WHERE IdCategoria = @idCategoria AND IdDificultad = @idDificultad";
                info = conexion.Query<Pregunta>(sql, new { IdCategoria = idCategoria, idDificultad = idDificultad }).ToList();
            }   
        }
        return info;
    }
    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas) {
        List<Respuesta> info = new List<Respuesta>{};
        Respuesta info2;
        foreach (var idPregunta in preguntas)
        {
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                string sql = "SELECT [IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto] FROM [dbo].[Respuestas] WHERE IdPregunta = @idPregunta;";
                info2 = conexion.QueryFirstOrDefault<Respuesta>(sql, new { IdPregunta = idPregunta });
            }
            info.Add(info2);
        }
        return info;
    }
}