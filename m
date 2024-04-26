Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14C8B3C32
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 18:00:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B048AC71294;
	Fri, 26 Apr 2024 16:00:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3C62C71294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 16:00:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 621FF884FD;
 Fri, 26 Apr 2024 18:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1714147254;
 bh=nmPDhDmaIgQDkA6x6HObPcx/r00e6kxLkilPuXIURrI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bqzr2Sb9yVC8J/dWJRqBSJ4Kf1SRgyZA7YziXD9LhWuIc766fq+iLXU6LTtUw9p+N
 4Q05nS1575oJ1S6/4QWX/RWGpPjgNs2SRAmvaqz6d/Hc79i3PbcUaDRwd+IKS1wd/V
 7cNRAC0y35AO82v6uM+uXr9kkGa6MxexjNw+2HiCU2uOV+5Amx39uVLM4tChdbuAOq
 aVgXL17ZqKUooEQn7N+3L5d7/XNco8HAi8WhChW9myUArTjM3RTv9xRL1dyRWpkxvx
 Utezn/ahBqafr5aOtNvnpM4ayBbkGgtgUbdCA5KLPej1pVTeyq8sxG5OCAXmXsrhIw
 voCdCOmUU7c8Q==
Message-ID: <43024130-dcd6-4175-b958-4401edfb5fd8@denx.de>
Date: Fri, 26 Apr 2024 17:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-11-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240426125707.585269-11-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 10/11] ARM: dts: stm32: add ethernet1
 and ethernet2 for STM32MP135F-DK board
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

On 4/26/24 2:57 PM, Christophe Roullier wrote:
> Add dual Ethernet:
> -Ethernet1: RMII with crystal
> -Ethernet2: RMII without crystal
> PHYs used are SMSC (LAN8742A)
> 
> With Ethernet1, we can performed WoL from PHY instead of GMAC point
> of view.
> (in this case IRQ for WoL is managed as wakeup pin and configured
> in OS secure).

How does the Linux PHY driver process such a PHY IRQ ?

Or is Linux unaware of the PHY IRQ ? Doesn't that cause issues ?

> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> index 567e53ad285f..3b8eb0ab9ab9 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> @@ -19,6 +19,8 @@ / {
>   	compatible = "st,stm32mp135f-dk", "st,stm32mp135";
>   
>   	aliases {
> +		ethernet0 = &ethernet1;
> +		ethernet1 = &ethernet2;
>   		serial0 = &uart4;
>   		serial1 = &usart1;
>   		serial2 = &uart8;
> @@ -141,6 +143,52 @@ &cryp {
>   	status = "okay";
>   };
>   
> +&ethernet1 {
> +	status = "okay";
> +	pinctrl-0 = <&eth1_rmii_pins_a>;
> +	pinctrl-1 = <&eth1_rmii_sleep_pins_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rmii";
> +	max-speed = <100>;
> +	phy-handle = <&phy0_eth1>;

Keep the list sorted please (is the max-speed even needed? if not, drop it)

> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +
> +		phy0_eth1: ethernet-phy@0 {
> +			compatible = "ethernet-phy-id0007.c131";
> +			reset-gpios =  <&mcp23017 9 GPIO_ACTIVE_LOW>;
> +			reg = <0>;
> +			wakeup-source;
> +		};
> +	};
> +};
> +
> +&ethernet2 {
> +	status = "okay";
> +	pinctrl-0 = <&eth2_rmii_pins_a>;
> +	pinctrl-1 = <&eth2_rmii_sleep_pins_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rmii";
> +	max-speed = <100>;
> +	phy-handle = <&phy0_eth2>;
> +	st,ext-phyclk;
> +	phy-supply = <&scmi_v3v3_sw>;

Sort please

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
