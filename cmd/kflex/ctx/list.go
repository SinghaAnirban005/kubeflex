/*
Copyright 2023 The KubeStellar Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package ctx

import (
	"fmt"
	"os"

	"github.com/kubestellar/kubeflex/cmd/kflex/common"
	"github.com/spf13/cobra"
	"k8s.io/client-go/tools/clientcmd"
)

func CommandList() *cobra.Command {
	return &cobra.Command{
		Use:   "list",
		Short: "List all available contexts",
		Long:  `List all available contexts in the kubeconfig file`,
		Args:  cobra.ExactArgs(0),
		Run: func(cmd *cobra.Command, args []string) {
			kubeconfig, _ := cmd.Flags().GetString(common.KubeconfigFlag)
			cp := common.NewCP(kubeconfig)
			ExecuteCtxList(cp)
		},
	}
}

func ExecuteCtxList(cp common.CP) {
	config, err := clientcmd.LoadFromFile(cp.Kubeconfig)
	if err != nil {
		fmt.Printf("Error loading kubeconfig: %s\n", err)
		os.Exit(1)
	}

	if len(config.Contexts) == 0 {
		fmt.Println("No contexts found.")
		return
	}

	currentContext := config.CurrentContext
	fmt.Println("Available Contexts:")
	for name := range config.Contexts {
		prefix := " "
		if name == currentContext {
			prefix = "*"
		}
		fmt.Printf("%s %s\n", prefix, name)
	}
}
