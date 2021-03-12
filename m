Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9403390FE
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 16:18:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15EDFC57B53;
	Fri, 12 Mar 2021 15:18:16 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59A88C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1615562271;
 bh=PyPG4rltTxsk7VdATBlWdkx9xB8FUr5EkOWDtHPq82U=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=aJVXwjKAZ6n/sbytlAzLvAUBVUxl6G3MyOg/5cse9M+hKB6tAcRukc+1rE4Xzzjhh
 +C5L6Ga4+StmtMZPMqQf1at9RcJZl9vhQ2BKMKo8BCuNWpKqm4uFmmqPckWAHbMfdO
 a1Fd9n8+CUBwJZ3jiJR/sHecPZ1fW0GVGrXO+oMzRyH5s8+u1INnMKRlihg1FHgxlc
 0Xv3zOuxKowB7Nq48UavSoRBlpzHGJfJUfttCPWpoohqFR1dBq3E70fDGD8GrUf+D8
 M+cr7C5whKJpi8KIq9CgveqkF54wyg4d9Ag765Xg228V84Tgh0yafQ7JS/JOOkCR8X
 7/C6qqd0pDW2w==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH] ARM: dts: stm32: Fill GPIO line names on AV96
Thread-Index: AQHWYaO6J/6XL1V4zEuDGmQGjfuCx6kpjSowgAEUzoCBVyUjUA==
Date: Fri, 12 Mar 2021 15:17:43 +0000
Message-ID: <4530980295044f8ab9c1cfe14e02f90f@dh-electronics.com>
References: <20200724101610.146403-1-marex@denx.de>
 <ca48284998c14faf8ed17e6fa0cfac42@dh-electronics.com>
 <495b2f6b-04b7-c1eb-7aed-cd55636bef46@denx.de>
In-Reply-To: <495b2f6b-04b7-c1eb-7aed-cd55636bef46@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Marek Vasut [mailto:marex@denx.de]
Sent: Thursday, August 6, 2020 9:30 AM

> On 8/6/20 9:09 AM, Christoph Niedermaier wrote:
>> From: Marek Vasut <marex@denx.de>
>> Sent: Friday, July 24, 2020 12:16 PM
>>>
>>> Fill in the custom GPIO line names used by DH.
>>>
>> [...]
>>> +&gpioa {
>>> +       gpio-line-names = "", "", "", "",
>>> +                         "", "", "", "",
>>> +                         "", "", "", "DH-GPIO-K",
>>> +                         "DH-GPIO-I", "", "DH-GPIO-A", "";
>>> +};
>>> +
>> [...]
>>
>> We have been using the GPIO names at DH electronics for some time and also
>> on other SOMs, but have not yet streamed them. We started with the naming
>> only with a capital letter "A-W" since then without problems. To avoid a
>> hard cut or patching for us and our customers it would be good if we could
>> use the same naming in the mainline kernel as well. Marek, we would be
>> happy if you would adopt our valued GPIO naming in your patch.
> 
> My counter-argument to this is that the naming should be unique and
> provide a hint where those GPIO lines come from, so maybe even DH-GPIO-n
> should rather be DHCOM-n . I can't say I'm particularly fond of the
> plain 'n' naming of GPIO lines, because then the GPIO label (and e.g.
> listing in libgpiod tools) does not give any hint what the GPIO is or
> where it comes from. Also, I worry a plain 'n' naming might clash with
> other GPIO IPs easily, while a more unique name can not.

Hello Marek,

after an internal discussion, we decided the following:

Could you update the patch for the Avenger96 to the GPIO naming "AV96-n".

Moreover for the SOM layer (stm32mp15xx-dhcom-som.dtsi) we would prefer
"DHCOM-n". It would be nice if you could create a patch for it.


Regards,
Christoph
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
