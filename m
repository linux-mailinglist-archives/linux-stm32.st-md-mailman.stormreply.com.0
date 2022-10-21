Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04694607528
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Oct 2022 12:41:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E08BC64116;
	Fri, 21 Oct 2022 10:41:33 +0000 (UTC)
Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B92F5C64101
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 10:41:32 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1olpS3-004ceY-HY; Fri, 21 Oct 2022 18:41:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 21 Oct 2022 18:41:07 +0800
Date: Fri, 21 Oct 2022 18:41:07 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tomas Marek <tomas.marek@elrest.cz>
Message-ID: <Y1J3QwynPFIlfrIv@loth.rohan.me.apana.org.au>
References: <20221012160924.12226-1-tomas.marek@elrest.cz>
 <20221012160924.12226-2-tomas.marek@elrest.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012160924.12226-2-tomas.marek@elrest.cz>
Cc: oleg.karfich@wago.com, herbert@gondor.apana.org.au,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, mpm@selenic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] hwrng: stm32 - fix number of returned
	bytes on read
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

On Wed, Oct 12, 2022 at 06:09:23PM +0200, Tomas Marek wrote:
>
> diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
> index bc22178f83e8..8eaacefd498b 100644
> --- a/drivers/char/hw_random/stm32-rng.c
> +++ b/drivers/char/hw_random/stm32-rng.c
> @@ -49,11 +49,13 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>  		/* Manage timeout which is based on timer and take */
>  		/* care of initial delay time when enabling rng	*/
>  		if (!sr && wait) {
> -			retval = readl_relaxed_poll_timeout_atomic(priv->base
> +			int ret;
> +
> +			ret = readl_relaxed_poll_timeout_atomic(priv->base

This would make a lot more sense if you called it err instead of ret.

But as you're fixing a real bug I'm going to apply your patch as is
and you can post an incremental patch to improve it.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
