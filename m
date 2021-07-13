Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C33C703C
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 14:20:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59945C57B6F;
	Tue, 13 Jul 2021 12:20:34 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17166C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 12:20:31 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-231-Dk-aoIJGObaCzW5wvCtF0g-1; Tue, 13 Jul 2021 13:20:28 +0100
X-MC-Unique: Dk-aoIJGObaCzW5wvCtF0g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Tue, 13 Jul 2021 13:20:26 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 13 Jul 2021 13:20:26 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Russell King' <linux@armlinux.org.uk>
Thread-Topic: [PATCH] divide by 3*sizeof(u32) when computing array_size
Thread-Index: AQHXd8hGdzQpdmgYHUiEx+VC3p1WwKtAvfwg///0h4CAAB31IA==
Date: Tue, 13 Jul 2021 12:20:26 +0000
Message-ID: <2f725f0be09349308bf7d9a24399d516@AcuMS.aculab.com>
References: <20210712231910.GA1831270@pc>
 <20210713063053.qqttzxlopvpnadj3@pengutronix.de>
 <20210713091954.GG22278@shell.armlinux.org.uk>
 <012ccfea2a564274bd9d2e1cfc130873@AcuMS.aculab.com>
 <20210713112253.GH22278@shell.armlinux.org.uk>
In-Reply-To: <20210713112253.GH22278@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Salah Triki <salah.triki@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] divide by 3*sizeof(u32) when computing
	array_size
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

From: Russell King
> Sent: 13 July 2021 12:23
> 
> On Tue, Jul 13, 2021 at 11:07:00AM +0000, David Laight wrote:
> > From: Russell King
> > > Sent: 13 July 2021 10:20
> > ....
> > > I would also note that the code relies on there being no padding in
> > > struct stm32_breakinput - it should be noted that a strict
> > > interpretation of the C standard allows padding to be added anywhere
> > > to a structure - at the start, end or between members.
> >
> > I'm pretty certain I remember that padding before the first member
> > isn't allowed.
> 
> You may be right there.
> 
> > In any case the kernel generally assumes there is no extra padding.
> > (eg for structures that map hardware registers.)
> 
> That's incorrect. Places where we care either generally end up with
> __packed or are carefully layed out to ensure members are naturally
> aligned to reduce the likelyhood of it. 32-bit OABI ARM has been
> particularly "fun" in this respect.

I did say 'extra padding'.
Ensuring everything is naturally aligned is best - shame the standards
bodies don't do that - just look at the SCTP socket options.

Adding __packed is right sometimes, but it isn't without cost
and is probably wrong for anything hardware related.
Definitely useful on structure members to remove the padding
before that specific member (eg for 64bit in x86 compat code).
But marking a structure __packed is usually wrong (or bad).

> > For big structures it is worth adding a compile-time check of
> > the structure size - but not really for three u32.
> 
> Sorry, structure size has absolutely nothing to do with whether it's
> a good idea to have a compile-time check. The deciding factor is
> whether the code relies on some property such as it being a certain
> size. Such as in this exact case. If you grep for "BUILD_BUG_ON.*sizeof"
> in fs/ for example, this illustrates the point rather well.

I'd not bother if the size is obviously going to be correct.

I did get some odd bugs a few years ago from a compiler that aligned
all structures on 4-byte boundaries.
I had to change a structure of two u16 into an array :-)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
