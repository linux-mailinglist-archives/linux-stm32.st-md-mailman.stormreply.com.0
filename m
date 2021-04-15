Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A7360A62
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 15:21:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BE78C57B79;
	Thu, 15 Apr 2021 13:21:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E90FC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 13:21:29 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8025681E77;
 Thu, 15 Apr 2021 15:21:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1618492888;
 bh=ZONWGzYKtU8DHCzBAyEFfKxI0PsF5qLdYZOEWoxUxKQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rFO2ciQsIJnRAm72WtUX1yUdmKRSKfPKLDR/Zkra4IVdcKMG9S/2EoTdPdr1yEazy
 +V5V1F4LGvrw4RrmrpCZXFx50uaqsIYaU/af6YL3hPsgqEAjiOA99WEPKs5Vr+LNl+
 nCxoVRycYBM7p8bG1ewYdBtqr3imi2bM2JhN2lQvSMzOSP1g/4n/Zlp+4oUIqdIVGB
 4H5iVZeBMkNhxtCBLLNG4O//I+MILGLIKcLPnFx4LH5bnFmPb6o9ZlQgbofSAYYu0s
 ayRhbM9YD5mIKPKqhQIxEpzUYdiA7pLhWNGSln3l9RIHsO6UjVjxNEVFyae/Q1011+
 1dd4NJLYniHHw==
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-12-alexandre.torgue@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <3b39908b-a263-a5d4-f6ac-ac30ffb06269@denx.de>
Date: Thu, 15 Apr 2021 15:21:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415101037.1465-12-alexandre.torgue@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/13] ARM: dts: stm32: fix LTDC port node
 on STM32 MCU ad MPU
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

On 4/15/21 12:10 PM, Alexandre Torgue wrote:
> Running "make dtbs_check W=1", some warnings are reported concerning
> LTDC port subnode:
> 
> /soc/display-controller@5a001000/port:
> unnecessary #address-cells/#size-cells without "ranges" or child "reg"
> property
> /soc/display-controller@5a001000/port: graph node has single child node
> 'endpoint', #address-cells/#size-cells are not necessary

btw could you retain diffstat on your patches ? It's useful to see which 
files changed right away.

[...]

> diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> index 2bc92ef3aeb9..19ef475a48fc 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> @@ -82,9 +82,15 @@
>   };
>   
>   &ltdc {
> -	status = "okay";
> -
>   	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ltdc_ep0_out: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&sii9022_in>;
> +		};
> +
>   		ltdc_ep1_out: endpoint@1 {
>   			reg = <1>;
>   			remote-endpoint = <&dsi_in>;

[...]

> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> index 64dca5b7f748..e7f10975cacf 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> @@ -277,11 +277,7 @@
>   	status = "okay";
>   
>   	port {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ltdc_ep0_out: endpoint@0 {
> -			reg = <0>;
> +		ltdc_ep0_out: endpoint {
>   			remote-endpoint = <&adv7513_in>;
>   		};
>   	};

I think this is wrong, the AV96 can have two displays connected to two 
ports of the LTDC, just like DK2 for example.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
