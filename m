Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CF5141DD
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Apr 2022 07:44:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95B41C6047D;
	Fri, 29 Apr 2022 05:44:18 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8173DC5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Apr 2022 05:44:16 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0]
 helo=igor.pengutronix.de) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1nkJQN-0005Yv-5z; Fri, 29 Apr 2022 07:44:15 +0200
References: <20220414100700.1733914-1-s.trumtrar@pengutronix.de>
 <20220414100700.1733914-2-s.trumtrar@pengutronix.de>
 <da6cc91c-718c-83cc-aa63-1e4e134fb069@foss.st.com>
User-agent: mu4e 1.4.13; emacs 29.0.50
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Date: Fri, 29 Apr 2022 07:32:33 +0200
In-reply-to: <da6cc91c-718c-83cc-aa63-1e4e134fb069@foss.st.com>
Message-ID: <87wnf8wij2.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: add stm32mp1 pwr
	voltage regulator
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

Alexandre TORGUE <alexandre.torgue@foss.st.com> writes:

> [1. text/plain]
> Hi Steffen
>
> On 4/14/22 12:06, Steffen Trumtrar wrote:
>> Add the devicetree binding for the STM32MP1 PWR voltage regulator.
>> Currently there is only a devicetree binding for this peripheral in the
>> mainline kernel and no driver.
>> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>> ---
>>   arch/arm/boot/dts/stm32mp151.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi
>> b/arch/arm/boot/dts/stm32mp151.dtsi
>> index d8327298e2be..1816d9b02bb8 100644
>> --- a/arch/arm/boot/dts/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
>> @@ -1181,6 +1181,14 @@ pwr_mcu: pwr_mcu@50001014 {
>>   			reg = <0x50001014 0x4>;
>>   		};
>>   +		pwr_irq: pwr@50001020 {
>
> label not used
>

you are right. I can remove it.

>> +			compatible = "st,stm32mp1-pwr";
>> +			reg = <0x50001020 0x100>;
>> +			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <3>;
>> +		};
>> +
>
> PWR irqchip has been pushed on kernel.org ?
>

No, not the driver. But the binding is. At least I thought that. Just
rechecked and I didn't check properly. It is a different binding.

Just scratch this patch then.


Best regards,
Steffen

--
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
