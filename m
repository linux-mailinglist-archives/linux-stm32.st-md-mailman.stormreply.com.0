Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6438760CF59
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Oct 2022 16:42:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC6E6C03FCB;
	Tue, 25 Oct 2022 14:42:06 +0000 (UTC)
Received: from smtp.cesky-hosting.cz (smtp.cesky-hosting.cz [91.239.200.238])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D727C03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 14:42:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at smtp.cesky-hosting.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elrest.cz;
 s=rampa2-202208; t=1666708924;
 bh=PYEMZsYHKT+dgDkbswL32nBIM4jvIDqtH1ZQB5oxgLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m2nWdHhQD7eu7Wb8ByqsPWL4jwyQU/WyFlfdQ8Ru+fVoo6Nm9RHUbJFEQTx3skIfB
 hcHg5j1CrP45NcSoHHlehuh7usLdkvg1gfD4dNIUSIdG+op+mJ9vQO73LO1PUhnfOM
 MUCEyoV8mrsQ6faEwpas8Fcw95j+S0Q4bi/sAvijOB0pqfh5+55TndPV3Z22sJW3Jt
 CTN+S4Egexqf/XrXeSFv2O60zBQgvMTg6UtcawgSvmoFWdjghdfBv4nA00XpLxXbeH
 Iad38s4QwS31qYcb+FTpMmaePxsBYGUTbQvlqdxwIOllnr3f/3rhzWxeKiwVPzKMK8
 vIBlmBqsvQXqQ==
Received: from edaa77c5b7e3 (unknown [5.181.92.50])
 (Authenticated sender: tomas.marek@elrest.cz)
 by smtp.cesky-hosting.cz (Postfix) with ESMTPSA id 179143C0;
 Tue, 25 Oct 2022 16:41:58 +0200 (CEST)
Date: Tue, 25 Oct 2022 16:41:38 +0200
From: Tomas Marek <tomas.marek@elrest.cz>
To: Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <20221025144138.GA8@edaa77c5b7e3>
References: <20221012160924.12226-1-tomas.marek@elrest.cz>
 <20221012160924.12226-2-tomas.marek@elrest.cz>
 <Y1J3QwynPFIlfrIv@loth.rohan.me.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1J3QwynPFIlfrIv@loth.rohan.me.apana.org.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: oleg.karfich@wago.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com, mpm@selenic.com,
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

On Fri, Oct 21, 2022 at 06:41:07PM +0800, Herbert Xu wrote:
> On Wed, Oct 12, 2022 at 06:09:23PM +0200, Tomas Marek wrote:
> >
> > diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
> > index bc22178f83e8..8eaacefd498b 100644
> > --- a/drivers/char/hw_random/stm32-rng.c
> > +++ b/drivers/char/hw_random/stm32-rng.c
> > @@ -49,11 +49,13 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
> >  		/* Manage timeout which is based on timer and take */
> >  		/* care of initial delay time when enabling rng	*/
> >  		if (!sr && wait) {
> > -			retval = readl_relaxed_poll_timeout_atomic(priv->base
> > +			int ret;
> > +
> > +			ret = readl_relaxed_poll_timeout_atomic(priv->base
> 
> This would make a lot more sense if you called it err instead of ret.
> 
> But as you're fixing a real bug I'm going to apply your patch as is
> and you can post an incremental patch to improve it.

OK, sounds reasonable. I'll post new patch and rename ret to err.

Thanks for the hint and for the review.

Tomas

> 
> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
