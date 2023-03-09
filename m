Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE116B304F
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 23:19:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6935C6A60D;
	Thu,  9 Mar 2023 22:19:49 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22750C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 22:19:48 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-16-mytVSe0nOmGLnDgiSo5IHA-1; Thu, 09 Mar 2023 22:19:46 +0000
X-MC-Unique: mytVSe0nOmGLnDgiSo5IHA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.47; Thu, 9 Mar
 2023 22:19:44 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.047; Thu, 9 Mar 2023 22:19:44 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Walleij' <linus.walleij@linaro.org>, Herbert Xu
 <herbert@gondor.apana.org.au>
Thread-Topic: [v5 PATCH 7/7] crypto: stm32 - Save and restore between each
 request
Thread-Index: AQHZUlnVfe29z1dm7kSSXyVRszx6pK7zBGDQ
Date: Thu, 9 Mar 2023 22:19:44 +0000
Message-ID: <dac62e9452a5417e9de00546d1aae1f4@AcuMS.aculab.com>
References: <E1pZ2fs-000e27-4H@formenos.hmeau.com>
 <CACRpkdY8iN_ga0VuQ-z=8KUWaJ6=5rh2vZEwcp+oNgcBuPFk=g@mail.gmail.com>
 <ZAcNhtm/+mik1N2m@gondor.apana.org.au>
 <CACRpkdbcrCa9v82xVWtixWdDPvCu6E6Rkw-3Vg3APisdvYGwqQ@mail.gmail.com>
 <ZAf/rAbc3bMIwBcr@gondor.apana.org.au> <ZAgDku9htWcetafb@gondor.apana.org.au>
 <CACRpkdZ-zPZG4jK-AF2YF0wUFb8qrKBeoa4feb1qJ9SPusjv+Q@mail.gmail.com>
 <ZAhfBmlNHUpGEwW3@gondor.apana.org.au> <ZAhhGch6TtI8LA6x@gondor.apana.org.au>
 <CACRpkdabjrpsiVgm=EyGrTK7PGXth6FdvxSp=QULA+LyqtdBgg@mail.gmail.com>
 <ZAl1gGCv51FKOXtm@gondor.apana.org.au>
 <CACRpkdY4gAT7RUtL6ctcsqxEX2_rZMyjMktPta7e4UB19OyGow@mail.gmail.com>
In-Reply-To: <CACRpkdY4gAT7RUtL6ctcsqxEX2_rZMyjMktPta7e4UB19OyGow@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: Li kunyu <kunyu@nfschina.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [v5 PATCH 7/7] crypto: stm32 - Save and restore
 between each request
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

From: Linus Walleij
> Sent: 09 March 2023 07:35
...
> But actually I think the bug will never trigger, because the datasheet
> for the DB8500 (Ux500) says this:
> 
> "Then the message can be sent, by writing it word per word into the
> HASH_DIN register.
> When a block of 512 bits, i.e. 16 words have been written, a partial
> digest computation will
> start upon writing the first data of the next block. The AHB bus will
> be busy for 82 cycles for
> SHA-1 algorithm (66 cycles for SHA-256 algorithm)."

What speed clock is that?

4 or 5 extra clocks/word may (or may not) be significant.

In terms of latency it may be noise compared to some PCIe
reads done by hardware interrupt handlers.
Some slow PCIe targets (like the fpga one we use) pretty
much take 1us to handle a read cycle.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
