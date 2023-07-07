Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74F74AFA0
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jul 2023 13:24:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 930F1C6B45A;
	Fri,  7 Jul 2023 11:24:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71667C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 11:24:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2404561719;
 Fri,  7 Jul 2023 11:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5956EC433C7;
 Fri,  7 Jul 2023 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1688729088;
 bh=LOgGo2S8J0W/3urW+Ti0fTdtCUZF8vgQbegkxehA2Nw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6pm8aS+Hqo30H+UfcDWPK9FUel6+CEaeLnbsqjg5FNFn7kS9vpsV/yUffNtNtN4r
 eYj8wPa9jFaESU9qYfLPXkEq1P+y26NKM033eo6Tum/YGx4QnFqAodrRTvrUgwxjd+
 Hb0ygjCLtz/yNG4DLd9KU6K45+rum5O927EybD2I=
Date: Fri, 7 Jul 2023 11:37:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <2023070748-false-enroll-e5dc@gregkh>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, hugues.fruchet@foss.st.com, lee@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alsa-devel@alsa-project.org, richardcochran@gmail.com, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 05/10] firewall: introduce stm32_firewall
	framework
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

On Wed, Jul 05, 2023 at 07:27:54PM +0200, Gatien Chevallier wrote:
> Introduce a firewall framework that offers to firewall consumers different
> firewall services such as the ability to check their access rights against
> their firewall controller(s).
> 
> The firewall framework offers a generic API that is defined in firewall
> controllers drivers to best fit the specificity of each firewall.

But you aren't defining a "generic" api here, you are defining a
specific one for your specific hardware.

Or am I missing something?

> 
> There are various types of firewalls:
> -Peripheral firewalls that filter accesses to peripherals
> -Memory firewalls that filter accesses to memories or memory regions
> -Resource firewalls that filter accesses to internal resources such as
> reset and clock controllers
> 
> A firewall controller must be probed at arch_initcall level and register
> to the framework so that consumers can use their services.

Why must it happen at arch_initcall?  So it can never be a module?  That
feels wrong.

> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  MAINTAINERS                               |   5 +
>  arch/arm64/Kconfig.platforms              |   1 +
>  drivers/bus/Kconfig                       |  10 +
>  drivers/bus/Makefile                      |   1 +
>  drivers/bus/stm32_firewall.c              | 252 ++++++++++++++++++++++
>  drivers/bus/stm32_firewall.h              |  83 +++++++
>  include/linux/bus/stm32_firewall_device.h | 134 ++++++++++++
>  7 files changed, 486 insertions(+)
>  create mode 100644 drivers/bus/stm32_firewall.c
>  create mode 100644 drivers/bus/stm32_firewall.h
>  create mode 100644 include/linux/bus/stm32_firewall_device.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41385f01fa98..fabf95ba9b86 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20123,6 +20123,11 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>  F:	drivers/media/i2c/st-mipid02.c
>  
> +ST STM32 FIREWALL
> +M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
> +S:	Maintained
> +F:	drivers/bus/stm32_firewall.c
> +
>  ST STM32 I2C/SMBUS DRIVER
>  M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
>  M:	Alain Volmat <alain.volmat@foss.st.com>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6069120199bb..5a46e90f1e4e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -293,6 +293,7 @@ config ARCH_STM32
>  	select ARM_SMC_MBOX
>  	select ARM_SCMI_PROTOCOL
>  	select COMMON_CLK_SCMI
> +	select STM32_FIREWALL
>  	help
>  	  This enables support for ARMv8 based STMicroelectronics
>  	  STM32 family, including:
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index fcfa280df98a..4d54a7ea52b2 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -163,6 +163,16 @@ config QCOM_SSC_BLOCK_BUS
>  	  i2c/spi/uart controllers, a hexagon core, and a clock controller
>  	  which provides clocks for the above.
>  
> +config STM32_FIREWALL
> +	bool "STM32 Firewall framework"
> +	depends on ARCH_STM32

Why this dependency?

> +	default MACH_STM32MP157 || MACH_STM32MP13 || MACH_STM32MP25
> +	help
> +	  Say y to enable firewall framework and its services. Firewall
> +	  controllers will be able to register to the framework. Firewall
> +	  controllers must be initialized and register to the firewall framework
> +	  at arch_initcall level.

This needs better wording saying it is only for stm32 devices.

> +
>  config SUN50I_DE2_BUS
>  	bool "Allwinner A64 DE2 Bus Driver"
>  	  default ARM64
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index d90eed189a65..fc0511450ec2 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
>  obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
>  obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
>  obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
> +obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o
>  obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
>  obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
>  obj-$(CONFIG_OF)		+= simple-pm-bus.o
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> new file mode 100644
> index 000000000000..510db5bc6eaf
> --- /dev/null
> +++ b/drivers/bus/stm32_firewall.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

Are you _SURE_ this needs to be "or later"?  Sorry, I have to ask.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
