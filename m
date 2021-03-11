Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB03375E7
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 15:41:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07B77C5718B;
	Thu, 11 Mar 2021 14:41:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABF21C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 14:41:18 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1lKMV0-0001gR-ML; Thu, 11 Mar 2021 15:41:14 +0100
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Marek Vasut <marex@denx.de>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "Alex G." <mr.nuke.me@gmail.com>,
 Gabriel FERNANDEZ - foss <gabriel.fernandez@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Etienne CARRIERE <etienne.carriere@st.com>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <2e04f814-b694-119d-fe8a-13e6df129536@gmail.com>
 <AS8PR10MB4712C27260707345FA99ED5AEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
 <c57775fe-41ef-07f5-56a2-04b8f70797c1@denx.de>
 <463dafed-ec60-cd9a-33d2-ba118a6af629@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <c1c9c89b-8794-9b91-b626-d743cd8ff31e@pengutronix.de>
Date: Thu, 11 Mar 2021 15:41:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <463dafed-ec60-cd9a-33d2-ba118a6af629@foss.st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/14] Introduce STM32MP1 RCC in
 secured mode
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

On 11.03.21 15:02, Alexandre TORGUE wrote:
> On 3/11/21 12:43 PM, Marek Vasut wrote:
>> On 3/11/21 9:08 AM, Alexandre TORGUE wrote:
>>> 1- Break the current ABI: as soon as those patches are merged, stm32mp157c-dk2.dtb will impose to use
>>> A tf-a for scmi clocks. For people using u-boot spl, the will have to create their own "no-secure" devicetree.
>>
>> NAK, this breaks existing boards and existing setups, e.g. DK2 that does not use ATF.
>>
>>> 2-As you suggest, create a new "secure" dtb per boards (Not my wish for maintenance perspectives).
>>
>> I agree with Alex (G) that the "secure" option should be opt-in.
>> That way existing setups remain working and no extra requirements are imposed on MP1 users. Esp. since as far as I understand this, the "secure" part isn't really about security, but rather about moving clock configuration from Linux to some firmware blob.
>>
>>> 3- Keep kernel device tree as they are and applied this secure layer (scmi clocks phandle) thanks to dtbo in
>>> U-boot.
>>
>> Is this really better than
>> #include "stm32mp15xx-enable-secure-stuff.dtsi"
>> in a board DT ? Because that is how I imagine the opt-in "secure" option could work.
>>
> 
> Discussing with Patrick about u-boot, we could use dtbo application thanks to extlinux.conf. BUT it it will not prevent other case (i.e. TF-A which jump directly in kernel@). So the "least worst" solution is to create a new "stm32mp1257c-scmi-dk2 board which will overload clock entries with a scmi phandle (as proposed by Alex).

I raised this issue before with your colleagues. I still believe the correct way
would be for the TF-A to pass down either a device tree or an overlay with the
actual settings in use, e.g.:

  - Clocks/Resets done via SCMI
  - Reserved memory regions

If TF-A directly boots Linux, it can apply the overlay itself, otherwise it's
passed down to SSBL that applies it before booting Linux.

Cheers,
Ahmad

> 
> Gabriel, can you wait a bit before sending something about SCMI in dtsi, I would like to align this strategy internally.
> 
> Marek, Alex: thanks for your inputs.
> 
> Regards
> Alex
> 
>>> The third could be the less costly.
>>
>> [...]
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
