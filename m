Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA5D24E9E2
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Aug 2020 22:57:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1881AC3FAD3;
	Sat, 22 Aug 2020 20:57:45 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58049C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 20:57:42 +0000 (UTC)
Received: from [2001:67c:670:201:5054:ff:fe8d:eefb] (helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1k9aa5-0000DW-IU; Sat, 22 Aug 2020 22:57:41 +0200
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20200822203611.61997-1-marex@denx.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <06ff393c-8594-f4c3-243b-9143f12e1723@pengutronix.de>
Date: Sat, 22 Aug 2020 22:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200822203611.61997-1-marex@denx.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add alternate pinmux for
 DCMI pins
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 8/22/20 10:36 PM, Marek Vasut wrote:
> Add another mux option for DCMI pins, this is used on AV96 board.
> 
> Upstream-Status: Work-in-progress

Is this a left-over? What is its meaning here?

Cheers,

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 37 ++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 1c4c3d32efae..d6847787c65a 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -118,6 +118,43 @@ pins {
>  		};
>  	};
>  
> +	dcmi_pins_b: dcmi-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 4,  AF13)>,/* DCMI_HSYNC */
> +				 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
> +				 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
> +				 <STM32_PINMUX('A', 9,  AF13)>,/* DCMI_D0 */
> +				 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
> +				 <STM32_PINMUX('E', 0, AF13)>,/* DCMI_D2 */
> +				 <STM32_PINMUX('E', 1, AF13)>,/* DCMI_D3 */
> +				 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
> +				 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
> +				 <STM32_PINMUX('I', 6,  AF13)>,/* DCMI_D6 */
> +				 <STM32_PINMUX('E', 6,  AF13)>,/* DCMI_D7 */
> +				 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
> +				 <STM32_PINMUX('H', 7,  AF13)>;/* DCMI_D9 */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	dcmi_sleep_pins_b: dcmi-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 4,  ANALOG)>,/* DCMI_HSYNC */
> +				 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
> +				 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
> +				 <STM32_PINMUX('A', 9,  ANALOG)>,/* DCMI_D0 */
> +				 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
> +				 <STM32_PINMUX('E', 0, ANALOG)>,/* DCMI_D2 */
> +				 <STM32_PINMUX('E', 1, ANALOG)>,/* DCMI_D3 */
> +				 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
> +				 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
> +				 <STM32_PINMUX('I', 6,  ANALOG)>,/* DCMI_D6 */
> +				 <STM32_PINMUX('E', 6,  ANALOG)>,/* DCMI_D7 */
> +				 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
> +				 <STM32_PINMUX('H', 7,  ANALOG)>;/* DCMI_D9 */
> +		};
> +	};
> +
>  	ethernet0_rgmii_pins_a: rgmii-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
