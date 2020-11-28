Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669F2C7197
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Nov 2020 23:00:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0C14C56632;
	Sat, 28 Nov 2020 22:00:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79B82C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Nov 2020 22:00:08 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kj8GF-0005eW-NB; Sat, 28 Nov 2020 23:00:07 +0100
To: Alexander Dahl <post@lespocky.de>, Rob Herring <robh+dt@kernel.org>
References: <20201128215353.3991-1-post@lespocky.de>
 <20201128215353.3991-4-post@lespocky.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <044d49be-2016-818e-b1b0-ee50c3b744e7@pengutronix.de>
Date: Sat, 28 Nov 2020 23:00:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201128215353.3991-4-post@lespocky.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-leds@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 3/5] ARM: dts: stm32: Fix schema
 warnings for pwm-leds
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

On 28.11.20 22:53, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
>   CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     v7 -> v8:
>       * rebased on v5.10-rc1
>       * updated indexes and added comment (Ahmad Fatoum)

Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks,

>     
>     v6 -> v7:
>       * split up patch (one per sub arch)
>       * added actual warnings to commit message
> 
>  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index 1e5333fd437f..5ed58110d963 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -36,34 +36,35 @@
>  		stdout-path = &uart4;
>  	};
>  
> -	led-act {
> +	led-controller-0 {
>  		compatible = "gpio-leds";
>  
> -		led-green {
> +		led-0 {
>  			label = "mc1:green:act";
>  			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  	};
>  
> -	led-rgb {
> +	led-controller-1 {
>  		compatible = "pwm-leds";
>  
> -		led-red {
> +		/* led-1 to led-3 are part of a single RGB led */
> +		led-1 {
>  			label = "mc1:red:rgb";
>  			pwms = <&leds_pwm 1 1000000 0>;
>  			max-brightness = <255>;
>  			active-low;
>  		};
>  
> -		led-green {
> +		led-2 {
>  			label = "mc1:green:rgb";
>  			pwms = <&leds_pwm 2 1000000 0>;
>  			max-brightness = <255>;
>  			active-low;
>  		};
>  
> -		led-blue {
> +		led-3 {
>  			label = "mc1:blue:rgb";
>  			pwms = <&leds_pwm 3 1000000 0>;
>  			max-brightness = <255>;
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
