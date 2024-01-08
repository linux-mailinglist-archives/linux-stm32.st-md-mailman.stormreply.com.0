Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A9826B9C
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 11:35:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00A6BC6C838;
	Mon,  8 Jan 2024 10:35:04 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAD75C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 10:35:02 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-131-SSdTflTDNiSgu7lU4QYbVg-1; Mon, 08 Jan 2024 10:35:00 +0000
X-MC-Unique: SSdTflTDNiSgu7lU4QYbVg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 8 Jan
 2024 10:34:35 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 8 Jan 2024 10:34:35 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andrew Lunn' <andrew@lunn.ch>, =?iso-8859-2?Q?Petr_Tesa=F8=EDk?=
 <petr@tesarici.cz>
Thread-Topic: [PATCH] net: stmmac: protect statistics updates with a spinlock
Thread-Index: AQHaP/3Ni9qIc9t6xUGHU0aBdMePobDPuW8A
Date: Mon, 8 Jan 2024 10:34:35 +0000
Message-ID: <d05ca29283eb47df9c58838cb87a887c@AcuMS.aculab.com>
References: <20240105091556.15516-1-petr@tesarici.cz>
 <CANn89iLuYZBersxq4aH-9Fg_ojD0fh=0xtdLbRdbMrup=nvrkA@mail.gmail.com>
 <20240105113402.0f5f1232@meshulam.tesarici.cz>
 <CANn89iLEvW9ZS=+WPETPC=mKRyu9AKmueGCWZZOrz9oX3Xef=g@mail.gmail.com>
 <20240105121447.11ae80d1@meshulam.tesarici.cz>
 <20240105142732.1903bc70@meshulam.tesarici.cz>
 <CANn89iLHLvGFX_JEYU-en0ZoCUpTvjXPBzFECxLFfa_Jhpcjmg@mail.gmail.com>
 <CANn89iKWSemsKmfsLjupwWBnyeKjtHH+mZjTzYiJT4G=xyUrNQ@mail.gmail.com>
 <20240105154558.2ca38aca@meshulam.tesarici.cz>
 <a8bb0eb0-8398-4e7e-8dc5-6ebf2f981ca8@lunn.ch>
In-Reply-To: <a8bb0eb0-8398-4e7e-8dc5-6ebf2f981ca8@lunn.ch>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: Jiri Pirko <jiri@resnulli.us>, open list <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu
 Tsai <wens@csie.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: protect statistics updates
	with a spinlock
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

From: Andrew Lunn
> Sent: 05 January 2024 17:37
> 
> > This only leaves an atomic_t in hard irq context. I have tried to find
> > something that could relax the requirement, but AFAICS at least some
> > setups use several interrupts that can be delivered to different CPUs
> > simultaneously, and all of them will walk over all channels. So we're
> > left with an atomic_t here.
> 
> You might want to consider per CPU statistics. Since each CPU has its
> own structure of statistics, you don't need atomic.
> 
> The code actually using the statistics then needs to sum up the per
> CPU statistics, and using syncp should be sufficient for that.

Doesn't that consume rather a lot of memory on systems with
'silly numbers' of cpu?

Updating an atomic_t is (pretty much) the same as taking a lock.
unlock() is also likely to also contain an atomic operation.
So if you update more than two atomic_t it is likely that a lock
will be faster.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
