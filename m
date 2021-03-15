Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2197133BF4F
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 16:01:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9993DC57B55;
	Mon, 15 Mar 2021 15:01:38 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BCA4C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 15:01:36 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Dzfl344kjz1rypb;
 Mon, 15 Mar 2021 16:01:35 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Dzfl338jRz1qql8;
 Mon, 15 Mar 2021 16:01:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ovvWHqiRVnPo; Mon, 15 Mar 2021 16:01:33 +0100 (CET)
X-Auth-Info: JdnvyQpwmBUTy5o1FfPNqywU9htsbIeyV1SUc8jcl/o=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 15 Mar 2021 16:01:33 +0100 (CET)
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>
References: <20200724101610.146403-1-marex@denx.de>
 <ca48284998c14faf8ed17e6fa0cfac42@dh-electronics.com>
 <495b2f6b-04b7-c1eb-7aed-cd55636bef46@denx.de>
 <4530980295044f8ab9c1cfe14e02f90f@dh-electronics.com>
 <6616e8b0-2b7d-a157-c24f-0493ce03c45b@denx.de>
 <86beeb51e9594b14ac0f449495b46736@dh-electronics.com>
 <7504da89-63a7-1b80-3159-a0346535137e@denx.de>
 <788d7d182b13448c8afc4b99518daa34@dh-electronics.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ca12f045-b4bf-3189-4cb5-db46eb791050@denx.de>
Date: Mon, 15 Mar 2021 15:26:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <788d7d182b13448c8afc4b99518daa34@dh-electronics.com>
Content-Language: en-US
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fill GPIO line names on
	AV96
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

On 3/15/21 12:41 PM, Christoph Niedermaier wrote:

[...]

>>>>>>>> Fill in the custom GPIO line names used by DH.
>>>>>>>>
>>>>>>> [...]
>>>>>>>> +&gpioa {
>>>>>>>> +       gpio-line-names = "", "", "", "",
>>>>>>>> +                         "", "", "", "",
>>>>>>>> +                         "", "", "", "DH-GPIO-K",
>>>>>>>> +                         "DH-GPIO-I", "", "DH-GPIO-A", "";
>>>>>>>> +};
>>>>>>>> +
>>>>>>> [...]
>>>>>>>
>>>>>>> We have been using the GPIO names at DH electronics for some time and also
>>>>>>> on other SOMs, but have not yet streamed them. We started with the naming
>>>>>>> only with a capital letter "A-W" since then without problems. To avoid a
>>>>>>> hard cut or patching for us and our customers it would be good if we could
>>>>>>> use the same naming in the mainline kernel as well. Marek, we would be
>>>>>>> happy if you would adopt our valued GPIO naming in your patch.
>>>>>>
>>>>>> My counter-argument to this is that the naming should be unique and
>>>>>> provide a hint where those GPIO lines come from, so maybe even DH-GPIO-n
>>>>>> should rather be DHCOM-n . I can't say I'm particularly fond of the
>>>>>> plain 'n' naming of GPIO lines, because then the GPIO label (and e.g.
>>>>>> listing in libgpiod tools) does not give any hint what the GPIO is or
>>>>>> where it comes from. Also, I worry a plain 'n' naming might clash with
>>>>>> other GPIO IPs easily, while a more unique name can not.
>>>>>
>>>>> Hello Marek,
>>>>>
>>>>> after an internal discussion, we decided the following:
>>>>>
>>>>> Could you update the patch for the Avenger96 to the GPIO naming "AV96-n".
>>>>>
>>>>> Moreover for the SOM layer (stm32mp15xx-dhcom-som.dtsi) we would prefer
>>>>> "DHCOM-n". It would be nice if you could create a patch for it.
>>>>
>>>> I don't think we should have any SoM-side gpio-line-names, because once
>>>> you plug the SoM into new carrier board, the gpio-lane-names will no
>>>> longer make sense. So, I think all the gpio-line-names should be
>>>> implemented in the carrier board DTS.
>>>
>>> The idea is to define the GPIO names on the SOM layer and then
>>> overwrite them on the carrier board DTS if needed. If there is no
>>> naming on the carrier board, at least you have access via the DHCOM
>>> GPIO names. The DHCOM GPIO names are standardized, so that you can
>>> be sure that the assignment to a pin always fits.
>>
>> So I'll pose another question here to the GPIO maintainers.
>>
>> Is it OK to define gpio-line-names in SoM DTSI even for pins which will
>> not be used as GPIOs e.g. because they are muxed differently in the
>> carrier board DTS ?
>>
>> If that is OK, then the above approach is then also OK.
> 
> In our case, we cannot mux the GPIO pins in the carrier board DTS
> to another functions, because then we break our SOM standard (DHCOM).

You can, assume you take two of the SoM GPIO-X and GPIO-Y signals which 
are present e.g. on the PDK2 jumper header and connect I2C EEPROM to 
those two pins. Then you mux those two pins as I2C bus. And that happens 
on the carrier board level (or a DTO, but that's out of scope here).

> So in the case we relabel a GPIO in the carrier board e.g. "DHCOM-I"
> becomes "LED1" the mux function have to be GPIO.

In the above example, the mux function becomes i2c in the carrier board 
DT and the gpio-line-names remains the same since its included from the 
SoM DTSI. I would like to know whether this is OK or whether we need to 
patch the gpio-line-names in the carrier board DT and remove the GPIO-X 
and GPIO-Y from the gpio-line-names there.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
