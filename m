Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E90705079
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 16:21:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A70E4C6B441;
	Tue, 16 May 2023 14:21:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26064C6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 14:21:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GBN5ht012009; Tue, 16 May 2023 16:21:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AiCKeYgU5G48GckAjtlCIZjdqSK5C4db7GnegqubSJA=;
 b=SUUgTEuh74w6Df5PCtVkMH27lqjIbfm8tBgtVhsj1jNhr92iVpx2JthOsRg/S2hHlTT4
 aSzap3xtKS6hxD6iU1ELsiqkmhOgsxBpv2+HTBEVGTeErqvLk8pLfOg9Sc4HtTv/IUZY
 KjqffjgeR1VsyieRtkl+4UVAVA3u2OW5ghYeFKPdpQ4Fy/DSi1YOGcdvj8HBPFMJ6D4x
 EkCxrgx9xKkSyuctpZT+hYSuy/h2+R/i0yrlacnYRU00GOcG3ZicaCq4VieqCZgkVZqL
 O32jpcBCqbfBMdaiaQcWT2xb97xCXjRuXo+mEeT/gU/wgyo4PN/VuiaqKoLMBZJB/ttk Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qkgqx1q01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 16:21:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4470F10002A;
 Tue, 16 May 2023 16:21:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3779422F7B6;
 Tue, 16 May 2023 16:21:18 +0200 (CEST)
Received: from [10.252.0.230] (10.252.0.230) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 16 May
 2023 16:21:17 +0200
Message-ID: <0dc56bcc-1873-1f79-197d-8a1fd5a99cb4@foss.st.com>
Date: Tue, 16 May 2023 16:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20230505213729.119789-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230505213729.119789-1-marex@denx.de>
X-Originating-IP: [10.252.0.230]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_07,2023-05-16_01,2023-02-09_01
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Move ethernet MAC EEPROM
 from SoM to carrier boards
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

Hi

On 5/5/23 23:37, Marek Vasut wrote:
> The ethernet MAC EEPROM is not populated on the SoM itself, it has to be
> populated on each carrier board. Move the EEPROM into the correct place
> in DTs, i.e. the carrier board DTs. Add label to the EEPROM too.
> 
> Fixes: 7e76f82acd9e1 ("ARM: dts: stm32: Split Avenger96 into DHCOR SoM and Avenger96 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied on stm32-next.

Thanks.
Alex



> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi   | 6 ++++++
>   arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi | 6 ++++++
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi         | 6 ------
>   arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi   | 8 ++++++++
>   4 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> index 8232bbbae379c..302efac5d26f0 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> @@ -321,6 +321,12 @@ adv7513_i2s0: endpoint {
>   			};
>   		};
>   	};
> +
> +	dh_mac_eeprom: eeprom@53 {
> +		compatible = "atmel,24c02";
> +		reg = <0x53>;
> +		pagesize = <16>;
> +	};
>   };
>   
>   &ltdc {
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
> index c32c160f97f20..39af79dc654cc 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
> @@ -192,6 +192,12 @@ eeprom@50 {
>   		reg = <0x50>;
>   		pagesize = <16>;
>   	};
> +
> +	dh_mac_eeprom: eeprom@53 {
> +		compatible = "atmel,24c02";
> +		reg = <0x53>;
> +		pagesize = <16>;
> +	};
>   };
>   
>   &sdmmc1 {	/* MicroSD */
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index 948054382136b..864960387e634 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -213,12 +213,6 @@ watchdog {
>   			status = "disabled";
>   		};
>   	};
> -
> -	eeprom@53 {
> -		compatible = "atmel,24c02";
> -		reg = <0x53>;
> -		pagesize = <16>;
> -	};
>   };
>   
>   &ipcc {
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
> index 5fdb74b652aca..faed31b6d84a1 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
> @@ -90,6 +90,14 @@ phy0: ethernet-phy@7 {
>   	};
>   };
>   
> +&i2c4 {
> +	dh_mac_eeprom: eeprom@53 {
> +		compatible = "atmel,24c02";
> +		reg = <0x53>;
> +		pagesize = <16>;
> +	};
> +};
> +
>   &sdmmc1 {
>   	pinctrl-names = "default", "opendrain", "sleep";
>   	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_b>;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
