import gleam/bytes_builder
import gleam/http/response.{type Response}
import lustre/element
import lustre/element/html.{html}
import mist.{type ResponseData}

pub fn home_page() -> Response(ResponseData) {
  let res = response.new(200)
  let html =
    html([], [
      html.head([], [html.title([], "Home")]),
      html.body([], [
        html.h1([], [html.text("Welcome!")]),
        html.p([], [html.text("Hello, world!")])
      ])
    ])

  response.set_body(res,
    html
    |> element.to_document_string
    |> bytes_builder.from_string
    |> mist.Bytes
  )
}
