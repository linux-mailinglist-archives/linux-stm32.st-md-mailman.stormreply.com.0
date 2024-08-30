Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59451966201
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 14:48:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09BF5C6DD9A;
	Fri, 30 Aug 2024 12:48:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A48CAC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 12:48:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U9Q19L031605;
 Fri, 30 Aug 2024 14:48:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kwNtTzv6FanOQm5qVQ6V3+Bba+TfPbAefol2UbbyNvI=; b=cMEqRotTZvUQ8e4d
 a9Y30irhWq9B/jDkIxZVQJ/c4dXQXhEQZbRz7LSKBl0psLx36QhF3ADxtXoi+K7Y
 uIc8n43v76iPFRzIzJcVIkzA5yX7udv89x0i6Ms0Wk7OGk6biT7Ijbh6gAbKZSvx
 8xRQ0OOgPUI0F5hcti06cj7Dnbomx/rhnW86Imdc5YLHL8wqK+bxundUE5imqkJF
 cQXDVM9wYhTMWvU0dilgDNw4VNf9Q2H44CWMFY1uq1h9srg0Oppm55V6VHssOO3p
 72Fomgl9ZZu/HVn/BCK+FxvIXnhOSBU0wmum1CxuamKrHMtWRNfJFX330/q122Ja
 pfvbLA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419putmp1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 14:48:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 74BF540046;
 Fri, 30 Aug 2024 14:48:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4CB02649DC;
 Fri, 30 Aug 2024 14:47:36 +0200 (CEST)
Received: from [10.252.31.165] (10.252.31.165) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 14:47:36 +0200
Message-ID: <e38b8da5-349d-4ee2-97d4-9c46c116120c@foss.st.com>
Date: Fri, 30 Aug 2024 14:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20240705215402.257070-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240705215402.257070-1-marex@denx.de>
X-Originating-IP: [10.252.31.165]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_07,2024-08-30_01,2024-05-17_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Describe PHY LEDs in DH
 STM32MP13xx DHCOR DHSBC board DT
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

Hi Marek

On 7/5/24 23:53, Marek Vasut wrote:
> The RTL8211 PHY on DH STM32MP13xx DHCOR DHSBC carrier board supports HW
> LED offload, the LEDs can be configured on link at 10/100/1000 line rate
> and on RXTX activity. There are two PHYs on this board, each only has two
> out of three LEDs connected to the PHY LED outputs. Describe this hardware
> configuration in DT.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   .../boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 

I have a yaml validation issue applying this patch.

   DTC_CHK arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: 
ethernet-phy@1: Unevaluated properties are not allowed 
('interrupt-parent', 'interrupts', 'reg', 'reset-assert-us', 
'reset-deassert-us', 'reset-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: 
ethernet-phy@1: leds:led@0:linux,default-trigger: 'oneOf' conditional 
failed, one must be fixed:
	'netdev' is not one of ['backlight', 'default-on', 'heartbeat', 
'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 
'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 
'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 
'usb-host', 'usbport']
	'netdev' does not match '^cpu[0-9]*$'
	'netdev' does not match '^hci[0-9]+-p

Can you have a look please ?


> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> index 1b916c419e8e2..c80a6ecdb47a6 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> @@ -100,6 +100,25 @@ ethphy1: ethernet-phy@1 {
>   			reset-assert-us = <15000>;
>   			reset-deassert-us = <55000>;
>   			reset-gpios = <&gpioa 11 GPIO_ACTIVE_LOW>;
> +
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@0 {
> +					reg = <0>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_WAN;
> +					linux,default-trigger = "netdev";
> +				};
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_YELLOW>;
> +					function = LED_FUNCTION_WAN;
> +					linux,default-trigger = "netdev";
> +				};
> +			};
>   		};
>   	};
>   };
> @@ -130,6 +149,25 @@ ethphy2: ethernet-phy@1 {
>   			reset-assert-us = <15000>;
>   			reset-deassert-us = <55000>;
>   			reset-gpios = <&gpiog 8 GPIO_ACTIVE_LOW>;
> +
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@0 {
> +					reg = <0>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_YELLOW>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +			};
>   		};
>   	};
>   };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
