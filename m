Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4686AB5A8
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 05:41:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C752C65048;
	Mon,  6 Mar 2023 04:41:56 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF28CC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 04:41:53 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pZ2fF-000dzu-KO; Mon, 06 Mar 2023 12:41:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 06 Mar 2023 12:41:33 +0800
Date: Mon, 6 Mar 2023 12:41:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
References: <Y/yIbPBVCPx9K/0s@gondor.apana.org.au>
 <CACRpkdZC4z2Xng4=k94rmM=AFzNzTdXkvtkArMnK7afouz=7VA@mail.gmail.com>
 <Y/3FYZJeLE7DVPBf@gondor.apana.org.au>
 <Y/3IA4OjmUmjMgh1@gondor.apana.org.au>
 <Y/3N6zFOZeehJQ/p@gondor.apana.org.au>
 <CACRpkdZ3rCsOWqooNkPL6m7vZ2Z2Frh2sdxruKhrS0t3QHcSKw@mail.gmail.com>
 <Y/6sCC2nH0FcD6kJ@gondor.apana.org.au>
 <CACRpkdYN-SDfxXKLt3HWGVkWb3V1rABwvWuytwDrzfTqm81fNA@mail.gmail.com>
 <ZAA8doNUjYmTRScB@gondor.apana.org.au>
 <ZAMQjOdi8GfqDUQI@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAMQjOdi8GfqDUQI@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [v6 PATCH 0/7] crypto: stm32 - Save and restore
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

On Sat, Mar 04, 2023 at 05:34:04PM +0800, Herbert Xu wrote:
> 
> I've split the patch up into smaller chunks for easier testing.

v6 fixes a bug in the finup patch that caused the new data to
be discarded instead of hashed.

This patch series fixes the import/export functions in the stm32
driver.  As usual, a failure in import/export indicates a general
bug in the hash driver that may break as soon as two concurrent
users show up and hash at the same time using any method other
than digest or init+finup.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
