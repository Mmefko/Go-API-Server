package main

import (
	"linkedin/internal/backend"
)

func main() {
	a := backend.App{}
	a.Port = ":9003"
	a.Initialize()
	a.Run()
}
