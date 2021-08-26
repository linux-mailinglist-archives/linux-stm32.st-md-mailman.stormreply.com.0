Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0663F8A68
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Aug 2021 16:50:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87378C57B7A;
	Thu, 26 Aug 2021 14:50:21 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8C61C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 14:50:19 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1mJGhv-00067q-BV; Thu, 26 Aug 2021 16:50:19 +0200
To: Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <YSepFyt8o+5lAsrA@nx64de-df6d00>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <6e6f91ab-d2b7-69d2-ccfb-6282945e5ab6@pengutronix.de>
Date: Thu, 26 Aug 2021 16:50:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSepFyt8o+5lAsrA@nx64de-df6d00>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: set the DCMI pins on
	stm32mp157c-odyssey
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

On 26.08.21 16:45, Grzegorz Szymaszek wrote:
> The Seeed Odyssey-STM32MP157C board has a 20-pin DVP camera output. The
> DCMI pins used on this output are defined in the pin state definition
> &pinctrl/dcmi-1, AKA &dcmi_pins_b (added in mainline commit
> 02814a41529a55dbfb9fbb2a3728e78e70646ea6). Set these pins as the default
> pinctrl of the DCMI peripheral in the board device tree.
> 
> The pins are not used for any other purpose, so it seems safe to assume
> most users will not need to override (delete) what this patch provides.
> status defaults to "disabled", so the peripheral will not be
> unnecessarily started. And the users who actually intend to make use of
> a camera on the DVP port will have this little part of the configuration
> ready.
> 
> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  arch/arm/boot/dts/stm32mp157c-odyssey.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> index be1dd5e9e744..554f5d3bcdc3 100644
> --- a/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> @@ -22,6 +22,12 @@ chosen {
>  	};
>  };
>  
> +&dcmi {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&dcmi_pins_b>;
> +	pinctrl-1 = <&dcmi_sleep_pins_b>;
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
