Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF662F09C
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Nov 2022 10:10:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3285C65071;
	Fri, 18 Nov 2022 09:10:37 +0000 (UTC)
Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 749E9C65052
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Nov 2022 09:10:36 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1ovxO1-00FYNO-Pr; Fri, 18 Nov 2022 17:10:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 18 Nov 2022 17:10:13 +0800
Date: Fri, 18 Nov 2022 17:10:13 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tomas Marek <tomas.marek@elrest.cz>
Message-ID: <Y3dL9UCTvanZcVI0@gondor.apana.org.au>
References: <20221108064240.30878-1-tomas.marek@elrest.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108064240.30878-1-tomas.marek@elrest.cz>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, mpm@selenic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] hwrng: stm32 - rename readl return value
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

On Tue, Nov 08, 2022 at 07:42:40AM +0100, Tomas Marek wrote:
> Use a more meaningful name for the readl return value variable.
> 
> Link: https://lore.kernel.org/all/Y1J3QwynPFIlfrIv@loth.rohan.me.apana.org.au/
> 
> Signed-off-by: Tomas Marek <tomas.marek@elrest.cz>
> ---
>  drivers/char/hw_random/stm32-rng.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
