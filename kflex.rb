# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kflex < Formula
  desc ""
  homepage "https://github.com/kubestellar/kubeflex"
  version "0.8.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.8.9/kubeflex_0.8.9_darwin_amd64.tar.gz"
      sha256 "bd3133cededc359be45077e1f9443761fad5610aaaa1f228ec64c4c7a82f732b"

      def install
        bin.install "bin/kflex"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.8.9/kubeflex_0.8.9_darwin_arm64.tar.gz"
      sha256 "931ccb25a4c14ba2779981c472ed88423656bb2ddda3f419a3da81efd5725b5b"

      def install
        bin.install "bin/kflex"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.8.9/kubeflex_0.8.9_linux_amd64.tar.gz"
      sha256 "de966ec270b86c2f68562e8418e626bfb972a00cf484de1f71201e0bde133fbb"
      def install
        bin.install "bin/kflex"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.8.9/kubeflex_0.8.9_linux_arm64.tar.gz"
      sha256 "0cdbc9039fabcc3e3d78ac14cd1f906bd5ad81c7d7f39769d5ae9d8ab67ef70f"
      def install
        bin.install "bin/kflex"
      end
    end
  end
end
