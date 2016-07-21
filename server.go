package main

import (
	"fmt"
	"github.com/chengchenginc/corps/config"
	"github.com/chengchenginc/corps/http"
	"github.com/labstack/echo"
	"github.com/labstack/echo/engine/standard"
	mw "github.com/labstack/echo/middleware"
	"strconv"
)

func loadRoute() {
	config.LoadConfig("config/config.toml")
	fmt.Println(config.Config.Server.Port)
	e := echo.New()
	// Root level middleware
	e.Use(mw.Logger())
	e.Use(mw.Recover())
	e.Use(mw.CORS())

	http.LoadRoutes(e)
	e.Run(standard.New(":" + strconv.Itoa(config.Config.Server.Port)))
}

func main() {
	loadRoute()
}
