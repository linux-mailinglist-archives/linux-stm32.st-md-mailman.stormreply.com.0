Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 330FA29AA24
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Oct 2020 11:58:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA928C36B37;
	Tue, 27 Oct 2020 10:58:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B314C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Oct 2020 10:58:12 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kXMg7-00046a-Qk; Tue, 27 Oct 2020 11:58:11 +0100
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-11-post@lespocky.de>
 <b387bda8-3643-1d27-4996-2aa4dc94d69f@pengutronix.de>
 <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
Date: Tue, 27 Oct 2020 11:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
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

Hello,

On 10/27/20 11:05 AM, Alexander Dahl wrote:
> Hello Ahmad,
> 
> thanks for your feedback, comments below.
> 

>>> -	led-rgb {
>>> +	led-controller-2 {
>>
>> Is a single RGB LED really a controller?
> 
> I just followed the recommendations by Rob here.

Do you happen to know if the new multicolor LED support could be used here?

I find it unfortunate that the device tree loses information relevant to humans
to adhere to a fixed nomenclature. Apparently led-controller isn't even codified
in the YAML binding (It's just in the examples). If you respin, please add a
comment that this is a single RGB led. I'd prefer to keep the information
in the DTB as well though.



> 
>>>  		compatible = "pwm-leds";
>>>  
>>> -		led-red {
>>> +		led-2 {
>>
>> Shouldn't this have been led-1 as well or is the numbering "global" ?
> 
> Also good question. This numbering is for dts only, it usually does
> not correspond with LEDs on the board, so it could be numbered per
> led-controller as well?

I'd prefer that it starts by 1. That way it's aligned with PWM channel
ID.

Thanks for fixing the dtschema warnings by the way!

Cheers,
Ahmad

> 
> Greets
> Alex
> 
>>
>>>  			label = "mc1:red:rgb";
>>>  			pwms = <&leds_pwm 1 1000000 0>;
>>>  			max-brightness = <255>;
>>>  			active-low;
>>>  		};
>>>  
>>> -		led-green {
>>> +		led-3 {
>>>  			label = "mc1:green:rgb";
>>>  			pwms = <&leds_pwm 2 1000000 0>;
>>>  			max-brightness = <255>;
>>>  			active-low;
>>>  		};
>>>  
>>> -		led-blue {
>>> +		led-4 {
>>>  			label = "mc1:blue:rgb";
>>>  			pwms = <&leds_pwm 3 1000000 0>;
>>>  			max-brightness = <255>;
>>>
>>
>> -- 
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
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
