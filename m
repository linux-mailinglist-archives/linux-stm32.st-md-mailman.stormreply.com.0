Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C79139A31F
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 16:27:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6C7BC57B69;
	Thu,  3 Jun 2021 14:27:02 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB38DC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 14:27:01 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1looJJ-0007gc-51; Thu, 03 Jun 2021 16:27:01 +0200
To: Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <YLjl6lE+uZ5ZCdiS@nx64de-df6d00>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <fcee4f30-446e-f4da-6d95-c9223cf82981@pengutronix.de>
Date: Thu, 3 Jun 2021 16:26:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLjl6lE+uZ5ZCdiS@nx64de-df6d00>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: set stm32mp157c-odyssey
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

Hello Grzegorz,

On 03.06.21 16:23, Grzegorz Szymaszek wrote:
> The Seeed Odyssey-STM32MP157C board has a 20-pin DVP camera output.
> stm32mp15-pinctrl.dtsi contains one pin state definition for the DCMI
> interface, dcmi-0, AKA phandle dcmi_pins_a. This definition is
> incompatible with the pins used on the Odyssey board, where:
> - there are 8 data pins instead of 12,
> - DCMI_HSYNC is available at PA4 instead of PH8,
> - DCMI_D0 is at PC6 instead of PH9,
> - DCMI_D3 is at PE1 instead of PH12,
> - DCMI_D4 is at PE11 instead of PH14,
> - DCMI_D5 is at PD3 instead of PI4,
> - DCMI_D6 is at PE13 instead of PB8,
> - DCMI_D7 is at PB9 instead of PE6.
> 
> Override the dcmi_pins_a definition (as well as dcmi_sleep_pins_a) in
> the Odyssey device tree.

Rather define a new pinctrl group (e.g. &dcmi_pins_b) and use that
instead of overriding an existing one.

Current convention is also to place all STM32MP1 pinctrl nodes into
a central file, not in the individual board device trees.

Cheers,
Ahmad

> 
> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> ---
>  arch/arm/boot/dts/stm32mp157c-odyssey.dts | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> index be1dd5e9e744..2d6cf70ca623 100644
> --- a/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> @@ -22,6 +22,38 @@ chosen {
>  	};
>  };
>  
> +&dcmi_pins_a {
> +	pins {
> +		pinmux = <STM32_PINMUX('A', 4,  AF13)>,/* DCMI_HSYNC */
> +			 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
> +			 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
> +			 <STM32_PINMUX('C', 6,  AF13)>,/* DCMI_D0 */
> +			 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
> +			 <STM32_PINMUX('H', 11, AF13)>,/* DCMI_D2 */
> +			 <STM32_PINMUX('E', 1,  AF13)>,/* DCMI_D3 */
> +			 <STM32_PINMUX('E', 11, AF13)>,/* DCMI_D4 */
> +			 <STM32_PINMUX('D', 3,  AF13)>,/* DCMI_D5 */
> +			 <STM32_PINMUX('E', 13, AF13)>,/* DCMI_D6 */
> +			 <STM32_PINMUX('B', 9,  AF13)>;/* DCMI_D7 */
> +	};
> +};
> +
> +&dcmi_sleep_pins_a {
> +	pins {
> +		pinmux = <STM32_PINMUX('A', 4,  ANALOG)>,/* DCMI_HSYNC */
> +			 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
> +			 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
> +			 <STM32_PINMUX('C', 6,  ANALOG)>,/* DCMI_D0 */
> +			 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
> +			 <STM32_PINMUX('H', 11, ANALOG)>,/* DCMI_D2 */
> +			 <STM32_PINMUX('E', 1,  ANALOG)>,/* DCMI_D3 */
> +			 <STM32_PINMUX('E', 11, ANALOG)>,/* DCMI_D4 */
> +			 <STM32_PINMUX('D', 3,  ANALOG)>,/* DCMI_D5 */
> +			 <STM32_PINMUX('E', 13, ANALOG)>,/* DCMI_D6 */
> +			 <STM32_PINMUX('B', 9,  ANALOG)>;/* DCMI_D7 */
> +	};
> +};
> +
>  &ethernet0 {
>  	status = "okay";
>  	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
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
