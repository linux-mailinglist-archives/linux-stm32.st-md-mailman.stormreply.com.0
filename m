Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 667BA6B1B09
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 06:58:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14CF9C6A60C;
	Thu,  9 Mar 2023 05:58:57 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16ED9C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 05:58:54 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pa9IG-0020DL-Mb; Thu, 09 Mar 2023 13:58:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 09 Mar 2023 13:58:24 +0800
Date: Thu, 9 Mar 2023 13:58:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <ZAl1gGCv51FKOXtm@gondor.apana.org.au>
References: <E1pZ2fs-000e27-4H@formenos.hmeau.com>
 <CACRpkdY8iN_ga0VuQ-z=8KUWaJ6=5rh2vZEwcp+oNgcBuPFk=g@mail.gmail.com>
 <ZAcNhtm/+mik1N2m@gondor.apana.org.au>
 <CACRpkdbcrCa9v82xVWtixWdDPvCu6E6Rkw-3Vg3APisdvYGwqQ@mail.gmail.com>
 <ZAf/rAbc3bMIwBcr@gondor.apana.org.au>
 <ZAgDku9htWcetafb@gondor.apana.org.au>
 <CACRpkdZ-zPZG4jK-AF2YF0wUFb8qrKBeoa4feb1qJ9SPusjv+Q@mail.gmail.com>
 <ZAhfBmlNHUpGEwW3@gondor.apana.org.au>
 <ZAhhGch6TtI8LA6x@gondor.apana.org.au>
 <CACRpkdabjrpsiVgm=EyGrTK7PGXth6FdvxSp=QULA+LyqtdBgg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdabjrpsiVgm=EyGrTK7PGXth6FdvxSp=QULA+LyqtdBgg@mail.gmail.com>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Mar 08, 2023 at 10:19:48PM +0100, Linus Walleij wrote:
> 
> So now the driver is fixed from a Ux500 point of view.

I think there is actually a nasty bug in it that may be hard to
trigger.

The stm32 driver as it stands will write up to 256 bytes into
the FIFO which on the ux500 is limited to 64 bytes.  We need to
change the fixed 256-byte size to be dependent on the hardware
type.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
