Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 863B26CBB9B
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 11:58:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FE3EC69069;
	Tue, 28 Mar 2023 09:58:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CFC0C65E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 09:58:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32S9shk6000530; Tue, 28 Mar 2023 11:58:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WgobufBoN42IEs5ZSFVLsVL/P0UO9CKmIaFyDWY7oXg=;
 b=MQ81+Hk16ObyxQLguF2YIAmUZGFebM8Y/yfQSIKptWESFOrzK0jRQ4cuXeWNK/2zauil
 MEyIEY09orvrN4ffckmH0CQuf9Y9hJzdot2q7W36lGCYzHEdh7fnNJUwwK38C1PmQIDH
 mllTyAVPxcpIU61E/xOOJdjZYr8dN8zhK4cwDD97VWIHWV0CGeJE+G6eIW4mrXmtDTUo
 Cv0YDODhnr7MVPUYuBMuNfz5Z9r+JzyA9zg0sFfadFlzSU9oB1PRjHHW241jZCObxAKf
 kp8M2UWpcAM92bJN9TkyXf8Av6i9Aunhtm2ZggVqLjtnd3FU7S15PmIU4I4sOxugmw8I RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pkvs4rnts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 11:58:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C79A10002A;
 Tue, 28 Mar 2023 11:58:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65723211F1E;
 Tue, 28 Mar 2023 11:58:36 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 11:58:35 +0200
Message-ID: <1a2d16c8-8c16-5fcc-7906-7b454a81922f@foss.st.com>
Date: Tue, 28 Mar 2023 11:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230323123242.3763673-1-o.rempel@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230323123242.3763673-1-o.rempel@pengutronix.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] ARM: dts: stm32: prtt1c: Add PoDL PSE
	regulator nodes
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

Hi Oleksij

On 3/23/23 13:32, Oleksij Rempel wrote:
> This commit introduces Power over Data Line (PoDL) Power Source
> Equipment (PSE) regulator nodes to the PRTT1C devicetree. The addition
> of these nodes enables support for PoDL in PRTT1C devices, allowing
> power delivery and data transmission over a single twisted pair.
> 
> The new PoDL PSE regulator nodes provide voltage capability information
> of the current board design, which can be used as a hint for system
> administrators when configuring and managing power settings. This
> update enhances the versatility and simplifies the power management of
> PRTT1C devices while ensuring compatibility with connected Powered
> Devices (PDs).
> 
> After applying this patch, the power delivery can be controlled from
> user space with a patched [1] ethtool version using the following commands:
>    ethtool --set-pse t1l2 podl-pse-admin-control enable
> to enable power delivery, and
>    ethtool --show-pse t1l2
> to display the PoDL PSE settings.
> 
> By integrating PoDL PSE support into the PRTT1C devicetree, users can
> benefit from streamlined power and data connections in their
> deployments, improving overall system efficiency and reducing cabling
> complexity.
> 
> [1] https://lore.kernel.org/all/20230317093024.1051999-1-o.rempel@pengutronix.de/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---

Please, fix the introduction of those new yaml validation errors:

arch/arm/boot/dts/stm32mp151a-prtt1c.dtb: ethernet-pse-1: $nodename:0: 
'ethernet-pse-1' does not match '^ethernet-pse(@.*)?$'
         From schema: 
/Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml
arch/arm/boot/dts/stm32mp151a-prtt1c.dtb: ethernet-pse-2: $nodename:0: 
'ethernet-pse-2' does not match '^ethernet-pse(@.*)?$'
         From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml


Thanks
Alex




>   arch/arm/boot/dts/stm32mp151a-prtt1c.dts | 32 ++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151a-prtt1c.dts b/arch/arm/boot/dts/stm32mp151a-prtt1c.dts
> index 58bb05a8c685..ca0d3329cfd7 100644
> --- a/arch/arm/boot/dts/stm32mp151a-prtt1c.dts
> +++ b/arch/arm/boot/dts/stm32mp151a-prtt1c.dts
> @@ -23,6 +23,18 @@ clock_sja1105: clock-sja1105 {
>   		clock-frequency = <25000000>;
>   	};
>   
> +	pse_t1l1: ethernet-pse-1 {
> +		compatible = "podl-pse-regulator";
> +		pse-supply = <&reg_t1l1>;
> +		#pse-cells = <0>;
> +	};
> +
> +	pse_t1l2: ethernet-pse-2 {
> +		compatible = "podl-pse-regulator";
> +		pse-supply = <&reg_t1l2>;
> +		#pse-cells = <0>;
> +	};
> +
>   	mdio0: mdio {
>   		compatible = "virtual,mdio-gpio";
>   		#address-cells = <1>;
> @@ -32,6 +44,24 @@ mdio0: mdio {
>   
>   	};
>   
> +	reg_t1l1: regulator-pse-t1l1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pse-t1l1";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		gpio = <&gpiog 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_t1l2: regulator-pse-t1l2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pse-t1l2";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		gpio = <&gpiog 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>   	wifi_pwrseq: wifi-pwrseq {
>   		compatible = "mmc-pwrseq-simple";
>   		reset-gpios = <&gpiod 8 GPIO_ACTIVE_LOW>;
> @@ -92,6 +122,7 @@ t1l1_phy: ethernet-phy@7 {
>   		reset-gpios = <&gpiog 12 GPIO_ACTIVE_LOW>;
>   		reset-assert-us = <10>;
>   		reset-deassert-us = <35>;
> +		pses = <&pse_t1l1>;
>   	};
>   
>   	/* TI DP83TD510E */
> @@ -102,6 +133,7 @@ t1l2_phy: ethernet-phy@10 {
>   		reset-gpios = <&gpiog 11 GPIO_ACTIVE_LOW>;
>   		reset-assert-us = <10>;
>   		reset-deassert-us = <35>;
> +		pses = <&pse_t1l2>;
>   	};
>   
>   	/* Micrel KSZ9031 */

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
