Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8A338EE7
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 14:34:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D30AC58D4C;
	Fri, 12 Mar 2021 13:34:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4424CC57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:48:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55C2F64F89;
 Fri, 12 Mar 2021 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615553334;
 bh=uB3vMcXdC8aACPYGUHyfZ2GzV3nzneo8Q3EOByeTzW0=;
 h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
 b=ZmH3jzv//iRYRZfcceEQqb/LV0Ub7ujH+WFIPqjxApAXsK4UwH/Gap7lNJRDUsLaD
 5YzL4kBSXoh6sxORYrp6ohH9Gb/BddpzjQWU3LSDU/aJl0r4htusbgXIvv4E45LYjG
 1X2LcxvB/Sr8HANXumXGzHWSZvZKZYe5gdCZWo5WMc8eoTYPawcIe8KLDLxL/YLfwY
 aJSnm4Hy+K7xydXXlmU+YuIpLRWDknYAH9cF3hhXWlX/+7cXHXF8sUoSM4+EqE9ODw
 oT7j99a0pn8E14Td5LQOgGh86cvb/8cCj5vYh4kRgmDNPZCt6+gHmiAZQZ3X7uIBFZ
 b+iVASrAr6wFg==
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152744.1318653-1-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <e15b2fe2-3ce8-6196-1bac-f4d40776eb24@kernel.org>
Date: Fri, 12 Mar 2021 06:48:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152744.1318653-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 12 Mar 2021 13:34:48 +0000
Subject: Re: [Linux-stm32] [PATCH v3 15/15] ARM: socfpga: drop ARCH_SOCFPGA
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 3/11/21 9:27 AM, Krzysztof Kozlowski wrote:
> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  After conversion of all
> drivers to use the new ARCH_INTEL_SOCFPGA, the remaining ARM option can
> be removed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   arch/arm/configs/multi_v7_defconfig | 2 +-
>   arch/arm/configs/socfpga_defconfig  | 2 +-
>   arch/arm/mach-socfpga/Kconfig       | 8 ++------
>   3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 3823da605430..591b15164e3d 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -79,7 +79,7 @@ CONFIG_ARCH_MSM8960=y
>   CONFIG_ARCH_MSM8974=y
>   CONFIG_ARCH_ROCKCHIP=y
>   CONFIG_ARCH_RENESAS=y
> -CONFIG_ARCH_SOCFPGA=y
> +CONFIG_ARCH_INTEL_SOCFPGA=y
>   CONFIG_PLAT_SPEAR=y
>   CONFIG_ARCH_SPEAR13XX=y
>   CONFIG_MACH_SPEAR1310=y
> diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
> index 0c60eb382c80..2d9404ea52c6 100644
> --- a/arch/arm/configs/socfpga_defconfig
> +++ b/arch/arm/configs/socfpga_defconfig
> @@ -9,7 +9,7 @@ CONFIG_NAMESPACES=y
>   CONFIG_BLK_DEV_INITRD=y
>   CONFIG_EMBEDDED=y
>   CONFIG_PROFILING=y
> -CONFIG_ARCH_SOCFPGA=y
> +CONFIG_ARCH_INTEL_SOCFPGA=y
>   CONFIG_ARM_THUMBEE=y
>   CONFIG_SMP=y
>   CONFIG_NR_CPUS=2
> diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
> index e43ed0ca6860..43ddec677c0b 100644
> --- a/arch/arm/mach-socfpga/Kconfig
> +++ b/arch/arm/mach-socfpga/Kconfig
> @@ -1,8 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> -menuconfig ARCH_SOCFPGA
> +menuconfig ARCH_INTEL_SOCFPGA
>   	bool "Altera SOCFPGA family"
>   	depends on ARCH_MULTI_V7
> -	select ARCH_INTEL_SOCFPGA
>   	select ARCH_SUPPORTS_BIG_ENDIAN
>   	select ARM_AMBA
>   	select ARM_GIC
> @@ -20,10 +19,7 @@ menuconfig ARCH_SOCFPGA
>   	select PL310_ERRATA_753970 if PL310
>   	select PL310_ERRATA_769419
>   
> -if ARCH_SOCFPGA
> -config ARCH_INTEL_SOCFPGA
> -	bool
> -
> +if ARCH_INTEL_SOCFPGA
>   config SOCFPGA_SUSPEND
>   	bool "Suspend to RAM on SOCFPGA"
>   	help
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
