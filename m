Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE0D60765C
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Oct 2022 13:39:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEC3CC64116;
	Fri, 21 Oct 2022 11:39:22 +0000 (UTC)
Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 075CBC64108
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 11:39:21 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1olqMF-004dzU-4V; Fri, 21 Oct 2022 19:39:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 21 Oct 2022 19:39:11 +0800
Date: Fri, 21 Oct 2022 19:39:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tomas Marek <tomas.marek@elrest.cz>
Message-ID: <Y1KE3zg3cn7kVH5t@gondor.apana.org.au>
References: <20221012160924.12226-1-tomas.marek@elrest.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012160924.12226-1-tomas.marek@elrest.cz>
Cc: oleg.karfich@wago.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com, mpm@selenic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] hwrng: stm32 - improve performance
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

On Wed, Oct 12, 2022 at 06:09:22PM +0200, Tomas Marek wrote:
> Fix issues in the STM32 TRNG driver to improve performance.
> 
> Tomas Marek (2):
>   hwrng: stm32 - fix number of returned bytes on read
>   hwrng: stm32 - fix read of the last word
> 
>  drivers/char/hw_random/stm32-rng.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> -- 
> 2.17.1

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
