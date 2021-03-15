Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E2033C13C
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 17:09:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55A91C57A41;
	Mon, 15 Mar 2021 16:09:01 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6A1EC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 16:08:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DzhDp2f9Hz1s0CD;
 Mon, 15 Mar 2021 17:08:58 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DzhDp1KRPz1qqkT;
 Mon, 15 Mar 2021 17:08:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id TYWZ9wWsrO-H; Mon, 15 Mar 2021 17:08:56 +0100 (CET)
X-Auth-Info: H1HQvUVis0A8yzgMAJBGUa5JREK6fjIxg2KuYp9qcRc=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 15 Mar 2021 17:08:56 +0100 (CET)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
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
 <d452b0ac-d11b-0e6e-56db-568d7c9238a0@pengutronix.de>
 <34769f70-c7e2-984c-fd86-b82aaf38ba57@denx.de>
 <42dad6a8-9a68-360f-3308-11194d256900@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <92c2c718-ab60-9938-80e6-8c5c950f4e71@denx.de>
Date: Mon, 15 Mar 2021 17:08:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <42dad6a8-9a68-360f-3308-11194d256900@pengutronix.de>
Content-Language: en-US
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
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

On 3/15/21 4:05 PM, Ahmad Fatoum wrote:
> Hello,
> 
> On 15.03.21 15:29, Marek Vasut wrote:
>> On 3/15/21 1:05 PM, Ahmad Fatoum wrote:
>>> On 15.03.21 12:41, Christoph Niedermaier wrote:
>>>>> So I'll pose another question here to the GPIO maintainers.
>>>>>
>>>>> Is it OK to define gpio-line-names in SoM DTSI even for pins which will
>>>>> not be used as GPIOs e.g. because they are muxed differently in the
>>>>> carrier board DTS ?
>>>>>
>>>>> If that is OK, then the above approach is then also OK.
>>>>
>>>> In our case, we cannot mux the GPIO pins in the carrier board DTS
>>>> to another functions, because then we break our SOM standard (DHCOM).
>>>> So in the case we relabel a GPIO in the carrier board e.g. "DHCOM-I"
>>>> becomes "LED1" the mux function have to be GPIO.
>>>
>>> For standards like SMARC, where the interface is predefined, I think it makes
>>> much sense to have the SoM dtsi contain not only the line-names, but also
>>> ready-to-use, pinmuxing settings.
>>>
>>> Base boards can then either enable peripherals with just a status = "okay"
>>> if they follow the standard or just override it if they choose to do
>>> stuff differently.
>>
>> Sadly, I think I have to remind you of the discussion around pinctrl groups we have in stm32mp15-pinctrl.dtsi and how that does not scale. This is a very similar situation here, since the SoM is rather universal.
> 
> I don't think this is directly comparable. A SoC has _lots_ of possible way to mux and
> conf pads. A SMARC, AFAIU, has exactly one official pinout. That one you can add into
> the dtsi and the bast board either extends that or overrides it if it diverges.

That's not the case here.

>> And the other thing I would like to point out here are the discussions around DT connector. What you described above is exactly that, except the implementation is still not finished. Let's CC Frank.
> Thanks for the pointer. I'll check it out.

Sure
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
