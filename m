Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B178F90041C
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 14:55:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65D4BC78003;
	Fri,  7 Jun 2024 12:55:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46E7FC712A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 12:55:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CF90A88428;
 Fri,  7 Jun 2024 14:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717764902;
 bh=H3pD+wrDGfjdRYDIP++BQRs9a9wH8JWsXe+QrM1Swu8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ywRycXCmxPSHsQukLDZQCBQkIQtomx8KYEyGQJ8ekmFP+ZWlCBBaKAUdXLXWB5NXs
 ynQryKbGm3yFWafgDo+n+Zf6080pAMbOZebo3Nxw01QOaImiQy36DDogCBOfUKIcgp
 5qTwVPwadGJ91KBIwWGQpW12zdUff2g/OmsHdZWepNGjS7unpRuqItCzE+goKJETaF
 1QKqtKTdDvFdkZyFvySPQ83u7vNojgRLPbCvFdxo+a6FOVeOE2e6i3xiW4DU8uQI5p
 e+9cOB/vxytjMEiFmbiCsw9uBbrct1h0ZlGtO1yaDKL8j2FZgIhudw27qSy+ZqFtkI
 P2C836a/ueOdA==
Message-ID: <5b1a7185-2273-40e9-8451-ba9add689637@denx.de>
Date: Fri, 7 Jun 2024 14:49:22 +0200
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
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-12-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240607095754.265105-12-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 11/12] ARM: dts: stm32: add ethernet1
 for STM32MP135F-DK board
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

On 6/7/24 11:57 AM, Christophe Roullier wrote:
> Ethernet1: RMII with crystal
> Ethernet2: RMII with no cristal, need "phy-supply" property to work,
> today this property was managed by Ethernet glue, but should be present
> and managed in PHY node. So I will push second Ethernet in next step.
> 
> PHYs used are SMSC (LAN8742A)
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> index 567e53ad285fa..16e91b9d812d8 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> @@ -19,6 +19,7 @@ / {
>   	compatible = "st,stm32mp135f-dk", "st,stm32mp135";
>   
>   	aliases {
> +		ethernet0 = &ethernet1;
>   		serial0 = &uart4;
>   		serial1 = &usart1;
>   		serial2 = &uart8;
> @@ -141,6 +142,28 @@ &cryp {
>   	status = "okay";
>   };
>   
> +&ethernet1 {
> +	status = "okay";
> +	pinctrl-0 = <&eth1_rmii_pins_a>;
> +	pinctrl-1 = <&eth1_rmii_sleep_pins_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rmii";
> +	phy-handle = <&phy0_eth1>;
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +
> +		phy0_eth1: ethernet-phy@0 {
> +			compatible = "ethernet-phy-id0007.c131";
> +			reset-gpios = <&mcp23017 9 GPIO_ACTIVE_LOW>;
> +			reg = <0>;


Keep the list sorted.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
