Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9FE927B46
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 18:39:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A23FDC78006;
	Thu,  4 Jul 2024 16:39:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2042CC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2024 16:39:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464ChNxv024579;
 Thu, 4 Jul 2024 18:39:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 06rchv0CE49MXS+hxEoFZGZF+QUXysD3SdFe6kqdNe0=; b=wlfywOpPHivU12nC
 KThtgKR5y2XilZi13cJd3u5L3Asj0SeRDB3LrcGtuzPN8qOtSOqDZj75l1QaZF9s
 e4bvDSuzEtK3JDUpTEYhgjDxaMqBsUPApoxY+x4qG2OfWNmjnxsQzL+HLP6/x/Kv
 +cTgmW3SYsj9p22q69ja1DmgCFGqPnhQY2jc8qdqUqiXFOb2P2KEknQcq2Crz6Fe
 xCAcO8gpYoD9Vgme/FKQqOJGte9KJ92cjSNW8RRrPVbCOz0Rdq3r5IP7lEsKUsVp
 yYYOw9aBo9qD+h1GYg9+nT6ByNBGNhHkvbF4FLCEvqv+MrW9H0DHil+J/Z/EIR/y
 3jzZ9w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4029kx6030-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 18:39:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 22E1640048;
 Thu,  4 Jul 2024 18:39:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 898BF22AFEF;
 Thu,  4 Jul 2024 18:38:24 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Jul
 2024 18:38:23 +0200
Message-ID: <501e109a-478a-4f94-a673-27048b44e5d5@foss.st.com>
Date: Thu, 4 Jul 2024 18:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20240629202847.90693-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240629202847.90693-1-marex@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_13,2024-07-03_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Keep MDIO bus in AF
 across suspend DH STM32MP13xx DHCOR DHSBC board
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

On 6/29/24 22:28, Marek Vasut wrote:
> The RTL8211F PHY gets confused when the MDIO bus lines get switched
> to ANALOG during suspend/resume cycle. Keep the MDIO and MDC lines
> in AF during suspend/resume to avoid confusing the PHY. The PHY can
> be brought out of the confused state by restarting auto-negotiation
> too, but that seems like an odd workaround and shouldn't be in the
> PHY driver.
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
>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
> index d3deec602ae7a..e6c0dceee9866 100644
> --- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
> @@ -88,14 +88,20 @@ pins2 {
>   
>   	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
>   		pins1 {
> +			pinmux = <STM32_PINMUX('A', 2, AF11)>, /* ETH_MDIO */
> +				 <STM32_PINMUX('G', 2, AF11)>; /* ETH_MDC */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +
> +		pins2 {
>   			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
>   				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
>   				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
>   				 <STM32_PINMUX('E', 5, ANALOG)>, /* ETH_RGMII_TXD3 */
>   				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
>   				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_GTX_CLK */
> -				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
> -				 <STM32_PINMUX('G', 2, ANALOG)>, /* ETH_MDC */
>   				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
>   				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
>   				 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH_RGMII_RXD1 */
> @@ -169,14 +175,20 @@ pins2 {
>   
>   	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
>   		pins1 {
> +			pinmux = <STM32_PINMUX('B', 6, ANALOG)>, /* ETH_MDIO */
> +				 <STM32_PINMUX('G', 5, ANALOG)>; /* ETH_MDC */

Why don't you put PB6 and PG5 in AF for the sleep config as for ETH1 ?

> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +
> +		pins2 {
>   			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
>   				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD1 */
>   				 <STM32_PINMUX('G', 1, ANALOG)>, /* ETH_RGMII_TXD2 */
>   				 <STM32_PINMUX('E', 6, ANALOG)>, /* ETH_RGMII_TXD3 */
>   				 <STM32_PINMUX('F', 6, ANALOG)>, /* ETH_RGMII_TX_CTL */
>   				 <STM32_PINMUX('G', 3, ANALOG)>, /* ETH_RGMII_GTX_CLK */
> -				 <STM32_PINMUX('B', 6, ANALOG)>, /* ETH_MDIO */
> -				 <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_MDC */
>   				 <STM32_PINMUX('F', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
>   				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
>   				 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
