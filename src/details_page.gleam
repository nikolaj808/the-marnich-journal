import gleam/bytes_builder
import gleam/http/response.{type Response}
import lustre/element
import lustre/element/html.{html}
import mist.{type ResponseData}

pub fn details_page(user_id: String) -> Response(ResponseData) {
  let res = response.new(200)
  let html =
    html([], [
      html.head([], [html.title([], "User Details")]),
      html.body([], [
        html.h1([], [html.text("User Details")]),
        html.p([], [html.text("User ID: " <> user_id)])
      ])
    ])

  response.set_body(res,
    html
    |> element.to_document_string
    |> bytes_builder.from_string
    |> mist.Bytes
  )
}
