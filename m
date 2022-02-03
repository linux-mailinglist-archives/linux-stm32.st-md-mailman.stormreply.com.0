Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8F34AC4D4
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:03:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5C46C60465;
	Mon,  7 Feb 2022 16:03:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FA29C60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:03:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 32E1181F0B;
 Thu,  3 Feb 2022 18:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1643909104;
 bh=m+N3MoX1/LE+15s/+NTNTKxRDOY/z4DDw+htkzNgE3M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bjoCLfODyyae88W21rRnORrVj+1mQQh9CW3ha4R4Gvo6vqM6j7YWesMa/Y5/pCFMy
 DHhx4WHz5jChtGRckwKV3B/SkN+ta4efiguIbI3OXY+KAw2xGbZJgLolGYvJA3s/ab
 J5GN164KC1qhxoLbox4UW1kyhTmRkcA0CnIna3Z0us1J0l5DeKMr1pHLQ7MCvG/tSD
 vi/fvJmH7/myw2w23DIG+nSxGrTRf+vFS0Efnk+2MmuazgRKOpgXZ5CZlfLTyUHUL+
 vs8KISFPwmT6r87KyjfHLMdnL9K/XRMnQGsmyobopttpgnIrpKMLzGl7MFPgtlfync
 iW2TNft8rPn6g==
Message-ID: <0b0cdffe-b4cc-e125-f3ea-4ece582f806b@denx.de>
Date: Thu, 3 Feb 2022 18:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Erwan Le Ray <erwan.leray@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220203171114.10888-1-erwan.leray@foss.st.com>
 <20220203171114.10888-17-erwan.leray@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220203171114.10888-17-erwan.leray@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 16/16] ARM: dts: stm32: keep uart nodes
 behavior on stm32mp15xx-dhcor-avenger96
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

On 2/3/22 18:11, Erwan Le Ray wrote:
> DMA configuration is added to uart nodes in stm32mp15x device tree.
> Delete uart4 DMA property in stm32mp15xx-dhcor-avenger96 board device
> tree to keep console in irq mode, as DMA support for console has been
> removed from the driver by commit e359b4411c28 ("serial: stm32: fix
> threaded interrupt handling").
> Delete also usart2 and uart7 DMA property to keep current behavior.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> index 6885948f3024..61e17f44ce81 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> @@ -376,6 +376,8 @@
>   	label = "LS-UART1";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&uart4_pins_b>;
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
>   	status = "okay";
>   };
>   
> @@ -385,6 +387,8 @@
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&uart7_pins_a>;
>   	uart-has-rtscts;
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
>   	status = "okay";
>   };
>   
> @@ -394,6 +398,8 @@
>   	pinctrl-0 = <&usart2_pins_a>;
>   	pinctrl-1 = <&usart2_sleep_pins_a>;
>   	st,hw-flow-ctrl;
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
>   	status = "okay";
>   
>   	bluetooth {

Maybe you can squash all the DHSOM board changes into a single patch ?

That said, the change is fine on DHSOM.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
