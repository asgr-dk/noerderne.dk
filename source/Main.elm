module Main exposing (main)

import Browser
import Browser.Navigation
import Element exposing (Element, el)
import Element.Input
import Url exposing (Url)
import Element.Font as Font

type alias Flags =
    {}


type alias Model =
    {}


type Msg
    = DoNothing


init : Flags -> Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DoNothing ->
            ( model, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = "Nørderne"
    , body =
        [ Element.layout
            [ Element.width Element.fill
            , Element.height Element.fill
            ]
            (Element.column [Element.spacing 10]
            [ Element.image [ Element.width Element.fill ]
              { src = "/image/cano_summer_2026.jpg", description = "..." }
            , el [] (Element.text "Nørderne")
            , el [] (Element.text "CVR 46258711")
            , Element.link [ Font.underline ] { label = Element.text "mail@noerderne.dk", url = "mailto:mail@noerderne.dk" }
            , Element.newTabLink [ Font.underline ] { label = Element.text "stiftelsesdokument", url = "/document/deed.md" }
            , Element.newTabLink [ Font.underline ] { label = Element.text "vedtægter", url = "/document/bylaws.md" }
            ])
        ]
    }


subs : Model -> Sub Msg
subs model =
    Sub.none


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = subs
        , onUrlChange = always DoNothing
        , onUrlRequest = always DoNothing
        }
