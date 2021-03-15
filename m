Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2FF33B15A
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 12:43:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61F0BC57A41;
	Mon, 15 Mar 2021 11:43:08 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 565CBC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1615808521;
 bh=pEXzEzH1mqPCvhaK1bc3wRoqlOXHEqzeYarnky/FZ4s=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=cefJ57YP7PpOcWzLuu2zwWMEfXORGSZOxgX66MJUi5+TeXnBV8f5Zs18rphTPruTQ
 PjDHeeaatZ3TmQy9fQ6otc2CHZmQQFZORABM/mlfKbWE5ywteTRQQVdWWh9gO/MjUl
 CicJCgXtcqskNd1APeoKJFIuYLLrtD1befD1OXM11dwg7/vQAG6tlBHVba+uC3Wbo2
 BYLa/ROt6vMYdMJZmEK7Z8o6o8Ow4Ky5/c7uKwpXhaVNJFi98UrIdwJd3wbtROjcF7
 dqTyLHjoKldhvB8T+LMYTVionySY0ZykY2BkQp7tLz0iTREL8YoXis1BBJrmHskhBJ
 SvIKhmzVav+8w==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: 'Marek Vasut' <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>
Thread-Topic: [PATCH] ARM: dts: stm32: Fill GPIO line names on AV96
Thread-Index: AQHWYaO6J/6XL1V4zEuDGmQGjfuCx6kpjSowgAEUzoCBVyUjUIAAGzqAgAAb63CAADNngIAEBG/g
Date: Mon, 15 Mar 2021 11:41:52 +0000
Message-ID: <788d7d182b13448c8afc4b99518daa34@dh-electronics.com>
References: <20200724101610.146403-1-marex@denx.de>
 <ca48284998c14faf8ed17e6fa0cfac42@dh-electronics.com>
 <495b2f6b-04b7-c1eb-7aed-cd55636bef46@denx.de>
 <4530980295044f8ab9c1cfe14e02f90f@dh-electronics.com>
 <6616e8b0-2b7d-a157-c24f-0493ce03c45b@denx.de>
 <86beeb51e9594b14ac0f449495b46736@dh-electronics.com>
 <7504da89-63a7-1b80-3159-a0346535137e@denx.de>
In-Reply-To: <7504da89-63a7-1b80-3159-a0346535137e@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Marek Vasut <marex@denx.de>
Sent: Friday, March 12, 2021 10:01 PM
> On 3/12/21 6:38 PM, Christoph Niedermaier wrote:
>> From: Marek Vasut [mailto:marex@denx.de]
>> Sent: Friday, March 12, 2021 5:17 PM
>>> On 3/12/21 4:17 PM, Christoph Niedermaier wrote:
>>>> From: Marek Vasut [mailto:marex@denx.de]
>>>> Sent: Thursday, August 6, 2020 9:30 AM
>>>>
>>>>> On 8/6/20 9:09 AM, Christoph Niedermaier wrote:
>>>>>> From: Marek Vasut <marex@denx.de>
>>>>>> Sent: Friday, July 24, 2020 12:16 PM
>>>>>>>
>>>>>>> Fill in the custom GPIO line names used by DH.
>>>>>>>
>>>>>> [...]
>>>>>>> +&gpioa {
>>>>>>> +       gpio-line-names = "", "", "", "",
>>>>>>> +                         "", "", "", "",
>>>>>>> +                         "", "", "", "DH-GPIO-K",
>>>>>>> +                         "DH-GPIO-I", "", "DH-GPIO-A", "";
>>>>>>> +};
>>>>>>> +
>>>>>> [...]
>>>>>>
>>>>>> We have been using the GPIO names at DH electronics for some time and also
>>>>>> on other SOMs, but have not yet streamed them. We started with the naming
>>>>>> only with a capital letter "A-W" since then without problems. To avoid a
>>>>>> hard cut or patching for us and our customers it would be good if we could
>>>>>> use the same naming in the mainline kernel as well. Marek, we would be
>>>>>> happy if you would adopt our valued GPIO naming in your patch.
>>>>>
>>>>> My counter-argument to this is that the naming should be unique and
>>>>> provide a hint where those GPIO lines come from, so maybe even DH-GPIO-n
>>>>> should rather be DHCOM-n . I can't say I'm particularly fond of the
>>>>> plain 'n' naming of GPIO lines, because then the GPIO label (and e.g.
>>>>> listing in libgpiod tools) does not give any hint what the GPIO is or
>>>>> where it comes from. Also, I worry a plain 'n' naming might clash with
>>>>> other GPIO IPs easily, while a more unique name can not.
>>>>
>>>> Hello Marek,
>>>>
>>>> after an internal discussion, we decided the following:
>>>>
>>>> Could you update the patch for the Avenger96 to the GPIO naming "AV96-n".
>>>>
>>>> Moreover for the SOM layer (stm32mp15xx-dhcom-som.dtsi) we would prefer
>>>> "DHCOM-n". It would be nice if you could create a patch for it.
>>>
>>> I don't think we should have any SoM-side gpio-line-names, because once
>>> you plug the SoM into new carrier board, the gpio-lane-names will no
>>> longer make sense. So, I think all the gpio-line-names should be
>>> implemented in the carrier board DTS.
>>
>> The idea is to define the GPIO names on the SOM layer and then
>> overwrite them on the carrier board DTS if needed. If there is no
>> naming on the carrier board, at least you have access via the DHCOM
>> GPIO names. The DHCOM GPIO names are standardized, so that you can
>> be sure that the assignment to a pin always fits.
> 
> So I'll pose another question here to the GPIO maintainers.
> 
> Is it OK to define gpio-line-names in SoM DTSI even for pins which will
> not be used as GPIOs e.g. because they are muxed differently in the
> carrier board DTS ?
> 
> If that is OK, then the above approach is then also OK.

In our case, we cannot mux the GPIO pins in the carrier board DTS
to another functions, because then we break our SOM standard (DHCOM).
So in the case we relabel a GPIO in the carrier board e.g. "DHCOM-I"
becomes "LED1" the mux function have to be GPIO.

Regards,
Christoph
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
