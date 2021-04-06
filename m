Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D13558DD
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 18:10:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF400C5719D;
	Tue,  6 Apr 2021 16:10:04 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FB45CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 16:10:02 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id i81so15649571oif.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Apr 2021 09:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=70/WXuRSOVM+Cc9ViyI6lDUSxH+eDXC41IovFsWbeYs=;
 b=mZHPqUim93e/5u+URkvc/Ye1e5GK97PBlzfwKox4sOBT0lN+SkMyIKlSxqOOXncrAK
 6vC4G+ZyvQX97b1+02ESEbKpWxy6wpdVgcvS3TML68NHexPqdOTJYcS2owuFsU4G/IQw
 2m6PgS4O+foYkxYMBeufP2rbxsFCpYuGbB+YZgt6f42vITYALda/lf2H3CFixXYuqAVN
 Qot5vsNWbluJqtZuxX7JwGE2pWMkl7cmc3V4dMSdVzMMp07mI8uZbBp0dyzbOk4mRjfO
 NMLENOqxmZvhSEPNuzYgXh1CIdskUDOAzniyiTPpp+6SJZhlzYwHIn0rsE4GObpAQKPP
 CJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=70/WXuRSOVM+Cc9ViyI6lDUSxH+eDXC41IovFsWbeYs=;
 b=mIPcAsPyeq37eHp3zIBedSd2b+UJLn/YGZt+nfS8V4WzResUefVY4m7KL61KPMtnI6
 kCfYB+diEnyBQN0udllYgl2rmVBa0/5H7YltyZfNiAUC+ZDGCC+DqJeLWn4Va6Gbxx/m
 Y7Q+FNl+70uevya+0o8IFOeOfddSPujLZeiCGDU0Ktda2xCOQhovzCZ2ylgCV7UCWaly
 1Rme1waKdZFl0huXQ46mninHUwTxpgKKMi+xf2IFjIYSi0Li2Toa/fL1bDobl1z9l3Pn
 egSS/PH16FNRvqa40V+aDqOXPXRzc3W/Wk74VmlTb6j7/L/7v3OPHCoDIhLoDWu263Nk
 i5/w==
X-Gm-Message-State: AOAM5311mQRgfjnf47BVB3UtOp/wfHUqdM6Ffqw9Dsluq/aGLEEOmY3v
 u3Pmzasm2Bk8a06HlhF2fwo=
X-Google-Smtp-Source: ABdhPJw+oRcabyeXlR7veCmXYel+3+bxwvoQzsVviymeaR2MbFVB6NWM8xsX1yZHtzLpbix2jLBDXA==
X-Received: by 2002:aca:4187:: with SMTP id o129mr3872937oia.10.1617725401042; 
 Tue, 06 Apr 2021 09:10:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r22sm4644989otg.4.2021.04.06.09.10.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Apr 2021 09:10:00 -0700 (PDT)
Date: Tue, 6 Apr 2021 09:09:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210406160959.GA208060@roeck-us.net>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-9-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311152545.1317581-9-krzysztof.kozlowski@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Tom Rix <trix@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
 Robert Richter <rric@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Borislav Petkov <bp@alien8.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 08/15] arm64: socfpga: merge Agilex and
 N5X into ARCH_INTEL_SOCFPGA
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Mar 11, 2021 at 04:25:38PM +0100, Krzysztof Kozlowski wrote:
> Agilex, N5X and Stratix 10 share all quite similar arm64 hard cores and
> SoC-part.  Up to a point that N5X uses the same DTSI as Agilex.  From
> the Linux kernel point of view these are flavors of the same
> architecture so there is no need for three top-level arm64
> architectures.  Simplify this by merging all three architectures into
> ARCH_INTEL_SOCFPGA and dropping the other ARCH* arm64 Kconfig entries.
> 
> The side effect is that the INTEL_STRATIX10_SERVICE will now be
> available for both 32-bit and 64-bit Intel SoCFPGA, even though it is
> used only for 64-bit.

Did you try to compile, say, arm:allmodconfig with this patch applied ?
Because for me that results in:

In file included from <command-line>:
drivers/firmware/stratix10-rsu.c: In function 'rsu_status_callback':
include/linux/compiler_types.h:320:38: error:
	call to '__compiletime_assert_177' declared with attribute error:
	FIELD_GET: type of reg too small for mask

and lots of similar errors.

Guenter

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/Kconfig.platforms       | 21 ++++-----------------
>  arch/arm64/boot/dts/intel/Makefile |  6 +++---
>  arch/arm64/configs/defconfig       |  3 +--
>  drivers/clk/Makefile               |  2 --
>  drivers/clk/socfpga/Kconfig        |  4 ++--
>  drivers/firmware/Kconfig           |  2 +-
>  drivers/fpga/Kconfig               |  2 +-
>  drivers/reset/Kconfig              |  2 +-
>  8 files changed, 13 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index ecab67a1afb8..ce50dd129eec 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -8,16 +8,6 @@ config ARCH_ACTIONS
>  	help
>  	  This enables support for the Actions Semiconductor S900 SoC family.
>  
> -config ARCH_AGILEX
> -	bool "Intel's Agilex SoCFPGA Family"
> -	help
> -	  This enables support for Intel's Agilex SoCFPGA Family.
> -
> -config ARCH_N5X
> -	bool "Intel's eASIC N5X SoCFPGA Family"
> -	help
> -	  This enables support for Intel's eASIC N5X SoCFPGA Family.
> -
>  config ARCH_SUNXI
>  	bool "Allwinner sunxi 64-bit SoC Family"
>  	select ARCH_HAS_RESET_CONTROLLER
> @@ -254,14 +244,11 @@ config ARCH_SEATTLE
>  	help
>  	  This enables support for AMD Seattle SOC Family
>  
> -config ARCH_STRATIX10
> -	bool "Altera's Stratix 10 SoCFPGA Family"
> -	select ARCH_INTEL_SOCFPGA
> -	help
> -	  This enables support for Altera's Stratix 10 SoCFPGA Family.
> -
>  config ARCH_INTEL_SOCFPGA
> -	bool
> +	bool "Intel's SoCFPGA ARMv8 Families"
> +	help
> +	  This enables support for Intel's SoCFPGA ARMv8 families:
> +	  Stratix 10 (ex. Altera), Agilex and eASIC N5X.
>  
>  config ARCH_SYNQUACER
>  	bool "Socionext SynQuacer SoC Family"
> diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
> index 3a052540605b..0b5477442263 100644
> --- a/arch/arm64/boot/dts/intel/Makefile
> +++ b/arch/arm64/boot/dts/intel/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -dtb-$(CONFIG_ARCH_AGILEX) += socfpga_agilex_socdk.dtb \
> -			     socfpga_agilex_socdk_nand.dtb
> +dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_socdk.dtb \
> +				socfpga_agilex_socdk_nand.dtb \
> +				socfpga_n5x_socdk.dtb
>  dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
> -dtb-$(CONFIG_ARCH_N5X) += socfpga_n5x_socdk.dtb
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d612f633b771..cf8a3009b858 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -28,7 +28,6 @@ CONFIG_KALLSYMS_ALL=y
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_PROFILING=y
>  CONFIG_ARCH_ACTIONS=y
> -CONFIG_ARCH_AGILEX=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_ALPINE=y
>  CONFIG_ARCH_BCM2835=y
> @@ -50,7 +49,7 @@ CONFIG_ARCH_RENESAS=y
>  CONFIG_ARCH_ROCKCHIP=y
>  CONFIG_ARCH_S32=y
>  CONFIG_ARCH_SEATTLE=y
> -CONFIG_ARCH_STRATIX10=y
> +CONFIG_ARCH_INTEL_SOCFPGA=y
>  CONFIG_ARCH_SYNQUACER=y
>  CONFIG_ARCH_TEGRA=y
>  CONFIG_ARCH_SPRD=y
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 1e29e5ad107a..96802294d35a 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -105,8 +105,6 @@ obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>  obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
>  obj-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga/
> -obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
> -obj-$(CONFIG_ARCH_N5X)			+= socfpga/
>  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>  obj-y					+= sprd/
>  obj-$(CONFIG_ARCH_STI)			+= st/
> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
> index bc102e0f0be0..b6c5b9737174 100644
> --- a/drivers/clk/socfpga/Kconfig
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -2,5 +2,5 @@
>  config CLK_INTEL_SOCFPGA64
>  	bool
>  	# Intel Stratix / Agilex / N5X clock controller support
> -	default (ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10)
> -	depends on ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10
> +	default ARM64 && ARCH_INTEL_SOCFPGA
> +	depends on ARM64 && ARCH_INTEL_SOCFPGA
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 3f14dffb9669..6a4e882e448d 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -206,7 +206,7 @@ config FW_CFG_SYSFS_CMDLINE
>  
>  config INTEL_STRATIX10_SERVICE
>  	tristate "Intel Stratix10 Service Layer"
> -	depends on (ARCH_STRATIX10 || ARCH_AGILEX) && HAVE_ARM_SMCCC
> +	depends on ARCH_INTEL_SOCFPGA && HAVE_ARM_SMCCC
>  	default n
>  	help
>  	  Intel Stratix10 service layer runs at privileged exception level,
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index 5ff9438b7b46..fd325e9c5ce6 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -60,7 +60,7 @@ config FPGA_MGR_ZYNQ_FPGA
>  
>  config FPGA_MGR_STRATIX10_SOC
>  	tristate "Intel Stratix10 SoC FPGA Manager"
> -	depends on (ARCH_STRATIX10 && INTEL_STRATIX10_SERVICE)
> +	depends on (ARCH_INTEL_SOCFPGA && INTEL_STRATIX10_SERVICE)
>  	help
>  	  FPGA manager driver support for the Intel Stratix10 SoC.
>  
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 4171c6f76385..b1e8efa16166 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -183,7 +183,7 @@ config RESET_SCMI
>  
>  config RESET_SIMPLE
>  	bool "Simple Reset Controller Driver" if COMPILE_TEST
> -	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARC
> +	default ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
>  	help
>  	  This enables a simple reset controller driver for reset lines that
>  	  that can be asserted and deasserted by toggling bits in a contiguous,
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
