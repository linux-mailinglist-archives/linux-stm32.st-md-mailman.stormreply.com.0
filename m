Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D794F90D74A
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 17:30:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70D36C78001;
	Tue, 18 Jun 2024 15:30:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02D58C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 15:30:24 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0C62E88365;
 Tue, 18 Jun 2024 17:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718724620;
 bh=0+tHVtPjS+usxhPkQGdFYgz79OPBV4S+QswV7CWb6Ew=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nw99PiWWGbqLM4jY6qhcmnH/wH6U3fUbxe10dzidJ+7q3kVWQOvDdHj3hJibV3lLm
 kR//Esyklgh6HDqyXLhovV1O6c61PMp2+HEaRKYr4Ov93NFgPGaOYb1RnAslRnAAB1
 qP60D2jgyRfUoX+5gUkn4JrJBKemgUyluV/wItf02lnXzSorv0pDq5ngyeuC7osvcb
 8SLZXUz5m/b1x7L60tdQbPblaXHYkPpfLpARA64x/A3mJS0a7u/cqQfGPYXi74vKct
 Jx5AG/hBEH2y/edxHZnykEnI/ah/2ekN0x+i3DRxeV0vbL6RceyxQFRXxfQa5nShpT
 2DdXYprIiDwig==
Message-ID: <986f2cd3-2440-4579-a4f9-749a6fff61f5@denx.de>
Date: Tue, 18 Jun 2024 17:02:15 +0200
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
References: <20240618093527.318239-1-christophe.roullier@foss.st.com>
 <20240618093527.318239-4-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240618093527.318239-4-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/3] arm64: dts: st: enable Ethernet2 on
 stm32mp257f-ev1 board
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

On 6/18/24 11:35 AM, Christophe Roullier wrote:
> ETHERNET2 instance is connected to Realtek PHY in RGMII mode
> Ethernet is SNSP IP with GMAC5 version.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> index 27b7360e5dba..6d8bf1342e23 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> @@ -17,6 +17,7 @@ / {
>   	compatible = "st,stm32mp257f-ev1", "st,stm32mp257";
>   
>   	aliases {
> +		ethernet0 = &ethernet2;
>   		serial0 = &usart2;
>   	};
>   
> @@ -55,6 +56,29 @@ &arm_wdt {
>   	status = "okay";
>   };
>   
> +&ethernet2 {
> +	status = "okay";
> +	pinctrl-0 = <&eth2_rgmii_pins_a>;
> +	pinctrl-1 = <&eth2_rgmii_sleep_pins_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rgmii-id";
> +	max-speed = <1000>;

Keep the list sorted.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
