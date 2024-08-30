Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 717D396613F
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 14:02:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23D05C6DD9A;
	Fri, 30 Aug 2024 12:02:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA33AC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 12:02:08 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U7C7dT029757;
 Fri, 30 Aug 2024 14:01:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JxLqwOI2y8G6VvTSqDDxmPj3GGBoVay6s4WFCUCC6xk=; b=wg7QFA47jBgt7nQw
 moCsVUmfl8DGset4TFLOfjPDYRps5iabLLrrdhtmxh5j/WwjVu5kI6SXQPUYRmnp
 VNom+FhD0ejBMkJ/w8qmJ0R3Mud3pgDzVmLL5TYHvOl9oMvWIJSmZcwm8rXFpGFv
 VcwM+ZQ+hXocw/Ts/qag+Y3cH8Sy90cijdEL0n5uMCVAbQa5ISoFjHlTOYMwhojv
 vWKtE5Adc0s8w7OVZkhHOHke+IPa4m/Jp8KABvNMMnU8ZJyl/ZMYfZnISSFb3dyt
 6HqHjhj/W4aWAa3QvxC4ZOSuMJ/rqkjxc4dGUes2Ab9jIGtQMUFXdSntQ6wjHA1I
 FgkPlA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41a4y693w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 14:01:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1C67A40045;
 Fri, 30 Aug 2024 14:01:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A325261C00;
 Fri, 30 Aug 2024 14:01:06 +0200 (CEST)
Received: from [10.252.31.165] (10.252.31.165) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 14:01:05 +0200
Message-ID: <0d338c86-5a34-4a3b-a5b8-7b87d1c32431@foss.st.com>
Date: Fri, 30 Aug 2024 14:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20240705075918.41213-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240705075918.41213-1-marex@denx.de>
X-Originating-IP: [10.252.31.165]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_06,2024-08-30_01,2024-05-17_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Keep MDIO bus in AF
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

On 7/5/24 09:59, Marek Vasut wrote:
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
> V2: Fixup the eth2_rgmii_sleep_pins_a into AF as well
> ---
>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
> index ca19c8c6b6771..62c64e9c2b9f0 100644
> --- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
> @@ -94,14 +94,20 @@ pins2 {
>   	/omit-if-no-ref/
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
> @@ -178,14 +184,20 @@ pins2 {
>   	/omit-if-no-ref/
>   	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
>   		pins1 {
> +			pinmux = <STM32_PINMUX('B', 6, AF11)>, /* ETH_MDIO */
> +				 <STM32_PINMUX('G', 5, AF10)>; /* ETH_MDC */
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

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
