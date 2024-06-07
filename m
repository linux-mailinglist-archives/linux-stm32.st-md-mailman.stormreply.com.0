Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7D900418
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 14:55:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EB5BC7129F;
	Fri,  7 Jun 2024 12:55:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 413F1C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 12:55:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6ACDB8841D;
 Fri,  7 Jun 2024 14:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717764900;
 bh=xkJGBefc0fkNNjL/OHeRyUcUqgQcSbwLbav+7Ogt6gg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kU8pnwoU8Te7ZPY/7WMfjdbgzFhkALkAuOFGmXYvd70fzPFlYKwt1oh2rI4eoPD1y
 QtivI5e6w4I51vudACZSaZljMpEYomnvFVv1+C58PztfyIs5elfP9MKtKr8YMruR1t
 LbvOhIlFa2ts5VZbLcOk69JergipO2633FwNccyYRtwXDxbS2bLvpfvMJyL+NHR/n7
 eTeZWmb2B2OJvbdosr9UkURv3s+mrxizPMPwbE5IE2/B5UQjoeiAwCIjpiP+p8dx7A
 x18X/EuB0cueo0SOWcMYTHh89TvRyEAx3ZyiULStZj9FgsH5aIe3vSX3bEYP3hzRzs
 6twdv8r/9hKKg==
Message-ID: <6d60bbc6-5ed3-4bb1-ad72-18a2be140b81@denx.de>
Date: Fri, 7 Jun 2024 14:48:58 +0200
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
 <20240607095754.265105-10-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240607095754.265105-10-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 09/12] ARM: dts: stm32: add ethernet1
 and ethernet2 support on stm32mp13
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

[...]

> @@ -1505,6 +1511,38 @@ sdmmc2: mmc@58007000 {
>   				status = "disabled";
>   			};
>   
> +			ethernet1: ethernet@5800a000 {
> +				compatible = "st,stm32mp13-dwmac", "snps,dwmac-4.20a";
> +				reg = <0x5800a000 0x2000>;
> +				reg-names = "stmmaceth";
> +				interrupts-extended = <&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +						      <&exti 68 1>;
> +				interrupt-names = "macirq", "eth_wake_irq";
> +				clock-names = "stmmaceth",
> +					      "mac-clk-tx",
> +					      "mac-clk-rx",
> +					      "ethstp",
> +					      "eth-ck";
> +				clocks = <&rcc ETH1MAC>,
> +					 <&rcc ETH1TX>,
> +					 <&rcc ETH1RX>,
> +					 <&rcc ETH1STP>,
> +					 <&rcc ETH1CK_K>;
> +				st,syscon = <&syscfg 0x4 0xff0000>;
> +				snps,mixed-burst;
> +				snps,pbl = <2>;
> +				snps,axi-config = <&stmmac_axi_config_1>;
> +				snps,tso;
> +				access-controllers = <&etzpc 48>;

Keep the list sorted.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
