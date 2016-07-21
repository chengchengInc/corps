package config
import (
    "fmt"
    _ "os"
    _ "bytes"
	  "io/ioutil"
    "github.com/BurntSushi/toml"
)

type tomlConfig struct{
   Title string
   DB database `toml:"database"`
   Server server `toml:"server"`
}

type database struct{
    Driver string
    DSN  string
}

type server struct{
     Port int
}

var Config  = tomlConfig{}

func LoadConfig(filePath string) error{
    // 如果配置文件不存在
    configBytes, err := ioutil.ReadFile(filePath)
  	if err != nil {
  		return err
  	}else{
      fmt.Printf("%v", string(configBytes))
    }
    if _, err := toml.DecodeFile(filePath, &Config); err != nil {
  		 fmt.Println(err)
  		 return err
	  }
    return nil
}
