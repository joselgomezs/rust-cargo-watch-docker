use std::env;
use actix_web::{get, App, HttpResponse, HttpServer, Responder};

#[get("/")]
async fn hello() -> impl Responder  {
    println!("Welp we got a call");
    HttpResponse::Ok().body("Hello world")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let port = match env::var("PORT") {
        Ok(value) => value.parse::<u16>().unwrap(),
        Err(e) => panic!("PORT env variable is not set. Error: {e}")
    };
    println!("Server up at port numbrer :{port}. Happy coding!");

    HttpServer::new(|| {
        App::new()
            .service(hello)
    })
    .bind(("0.0.0.0", port))?
    .run()
    .await
}