package http

import (
    "net/http"
    "github.com/labstack/echo"
)


func LoadRoutes(route *echo.Echo){
      //company
      route.GET("/company/list",func(c echo.Context)  error{
        return c.String(http.StatusOK, "ok")
      })
      route.GET("/company/:id",func(c echo.Context)  error{
          return c.String(http.StatusOK, "ok")
      })
      route.POST("/company/add",func(c echo.Context)  error{
          return c.String(http.StatusOK, "ok")
      })

      //department
      route.GET("/department/list",func(c echo.Context) error{
          cid := c.QueryParam("cid") //company id
          return c.String(http.StatusOK, "ok"+cid)
      })
      route.GET("/department/:id",func(c echo.Context) error{
        return c.String(http.StatusOK, "ok")
      })
      route.POST("/department/add",func(c echo.Context) error{
        return c.String(http.StatusOK, "ok")
      })

      //comments
      route.GET("/comments/list",func(c echo.Context) error{
           cid := c.QueryParam("cid")
           pid := c.QueryParam("pid") //department id
           return c.String(http.StatusOK, "ok"+cid+pid)
      })

      //production
      route.GET("/production/list",func(c echo.Context) error{
        cid := c.QueryParam("cid")
        pid := c.QueryParam("pid") //department id
        return c.String(http.StatusOK, "ok"+cid+pid)
      })

}
