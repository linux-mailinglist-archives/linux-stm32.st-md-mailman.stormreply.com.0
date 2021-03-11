Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC43B3378DC
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 17:11:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9216FC5718B;
	Thu, 11 Mar 2021 16:11:55 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E363C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 16:11:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DxDV06DYQz1s00y;
 Thu, 11 Mar 2021 17:11:52 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DxDV0432hz1qr4l;
 Thu, 11 Mar 2021 17:11:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id jnJYO_qSd5et; Thu, 11 Mar 2021 17:11:50 +0100 (CET)
X-Auth-Info: 2KuBOCaE/sL/z2h12qu6ViGM9U9yOLCzuzHVP39GOc4=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 11 Mar 2021 17:11:50 +0100 (CET)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, "Alex G."
 <mr.nuke.me@gmail.com>,
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
 <c1c9c89b-8794-9b91-b626-d743cd8ff31e@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <b87a2b24-678a-724d-e5df-1eabf5969ad2@denx.de>
Date: Thu, 11 Mar 2021 17:11:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c1c9c89b-8794-9b91-b626-d743cd8ff31e@pengutronix.de>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 3/11/21 3:41 PM, Ahmad Fatoum wrote:
> Hello,

Hi,

> On 11.03.21 15:02, Alexandre TORGUE wrote:
>> On 3/11/21 12:43 PM, Marek Vasut wrote:
>>> On 3/11/21 9:08 AM, Alexandre TORGUE wrote:
>>>> 1- Break the current ABI: as soon as those patches are merged, stm32mp157c-dk2.dtb will impose to use
>>>> A tf-a for scmi clocks. For people using u-boot spl, the will have to create their own "no-secure" devicetree.
>>>
>>> NAK, this breaks existing boards and existing setups, e.g. DK2 that does not use ATF.
>>>
>>>> 2-As you suggest, create a new "secure" dtb per boards (Not my wish for maintenance perspectives).
>>>
>>> I agree with Alex (G) that the "secure" option should be opt-in.
>>> That way existing setups remain working and no extra requirements are imposed on MP1 users. Esp. since as far as I understand this, the "secure" part isn't really about security, but rather about moving clock configuration from Linux to some firmware blob.
>>>
>>>> 3- Keep kernel device tree as they are and applied this secure layer (scmi clocks phandle) thanks to dtbo in
>>>> U-boot.
>>>
>>> Is this really better than
>>> #include "stm32mp15xx-enable-secure-stuff.dtsi"
>>> in a board DT ? Because that is how I imagine the opt-in "secure" option could work.
>>>
>>
>> Discussing with Patrick about u-boot, we could use dtbo application thanks to extlinux.conf. BUT it it will not prevent other case (i.e. TF-A which jump directly in kernel@). So the "least worst" solution is to create a new "stm32mp1257c-scmi-dk2 board which will overload clock entries with a scmi phandle (as proposed by Alex).
> 
> I raised this issue before with your colleagues. I still believe the correct way
> would be for the TF-A to pass down either a device tree or an overlay with the
> actual settings in use, e.g.:
> 
>    - Clocks/Resets done via SCMI
>    - Reserved memory regions
> 
> If TF-A directly boots Linux, it can apply the overlay itself, otherwise it's
> passed down to SSBL that applies it before booting Linux.

That sounds good and it is something e.g. R-Car already does, it merges 
DT fragment from prior stages at U-Boot level and then passes the result 
to Linux.

So on ST hardware, the same could very well happen and it would work for 
both non-ATF / ATF / ATF+TEE options.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
