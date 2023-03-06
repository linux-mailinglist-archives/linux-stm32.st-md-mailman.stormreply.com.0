Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A71F6AB5A6
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 05:37:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 097E0C65048;
	Mon,  6 Mar 2023 04:37:47 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 206CBC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 04:37:45 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pZ2b3-000dw7-Bm; Mon, 06 Mar 2023 12:37:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 06 Mar 2023 12:37:13 +0800
Date: Mon, 6 Mar 2023 12:37:13 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <ZAVt+c/1ZtCEVXAy@gondor.apana.org.au>
References: <ZAMQjOdi8GfqDUQI@gondor.apana.org.au>
 <E1pYOKH-000GYy-Rv@formenos.hmeau.com>
 <CACRpkdbVMkV1=hS38BUzhzccEH2HqUxSB44aan3e7ZcmNQ=m5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdbVMkV1=hS38BUzhzccEH2HqUxSB44aan3e7ZcmNQ=m5w@mail.gmail.com>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v5 PATCH 3/7] crypto: stm32 - Simplify finup
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

On Sun, Mar 05, 2023 at 11:08:24PM +0100, Linus Walleij wrote:
>
> All tests sadly fail after this patch:
> 
> [    4.699857] stm32-hash a03c2000.hash: allocated hmac(sha256) fallback
> [    4.708231] alg: ahash: stm32-hmac-sha256 test failed (wrong
> result) on test vector 0, cfg="init+finup aligned buffer"

We're making progress.  This worked on init+update+final, but then
failed on init+finup.  So it is indeed the finup code that was
broken by my patch as I forgot to set the rctx fields to include
the new data.

I'll repost the series.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
