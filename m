Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A923EFF9
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Aug 2020 17:25:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD408C36B3A;
	Fri,  7 Aug 2020 15:25:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BD7CC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Aug 2020 15:25:13 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1k44F4-0007jd-Se; Fri, 07 Aug 2020 17:25:10 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Holger Assmann <h.assmann@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
References: <20200807150355.6116-1-h.assmann@pengutronix.de>
 <83fb8c55-7ea6-8212-9e67-30e24d14faa6@pengutronix.de>
Message-ID: <4ad3919e-46da-4fd5-d297-a696d96eb0b7@pengutronix.de>
Date: Fri, 7 Aug 2020 17:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <83fb8c55-7ea6-8212-9e67-30e24d14faa6@pengutronix.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: lxa-mc1: Fix kernel
 warning about PHY delays
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

On 8/7/20 5:24 PM, Ahmad Fatoum wrote:
> On 8/7/20 5:03 PM, Holger Assmann wrote:
>> The KSZ9031 PHY skew timings for rxc/txc, originally set to achieve
>> the desired phase shift between clock- and data-signal, now trigger a
>> kernel warning when used in rgmii-id mode:
>>
>>  *-skew-ps values should be used only with phy-mode = "rgmii"
>>
>> This is because commit bcf3440c6dd7 ("net: phy: micrel: add phy-mode
>> support for the KSZ9031 PHY") now configures own timings when
>> phy-mode = "rgmii-id". Device trees wanting to set their own delays
>> should use phy-mode "rgmii" instead as the warning prescribes.
>>
>> The "standard" timings now used with "rgmii-id" work fine on this
>> board, so drop the explicit timings in the device tree and thereby
>> silence the warning.
>>
>> Fixes: 666b5ca85cd3 ("ARM: dts: stm32: add STM32MP1-based Linux Automation MC-1 board")
>> Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
> 
> Acked-by: Ahmad Fatoum <a.fatoum@pengutronic.de>

Typo Correction: Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

:-)

> 
>> ---
>>  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
>> index 5700e6b700d3..b85025d00943 100644
>> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
>> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
>> @@ -121,8 +121,6 @@
>>  			reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>; /* ETH_RST# */
>>  			interrupt-parent = <&gpioa>;
>>  			interrupts = <6 IRQ_TYPE_EDGE_FALLING>; /* ETH_MDINT# */
>> -			rxc-skew-ps = <1860>;
>> -			txc-skew-ps = <1860>;
>>  			reset-assert-us = <10000>;
>>  			reset-deassert-us = <300>;
>>  			micrel,force-master;
>>
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
