Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E47BD902EEF
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 05:13:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 953A4C6C838;
	Tue, 11 Jun 2024 03:13:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D651CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 03:13:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF9B660B5B;
 Tue, 11 Jun 2024 03:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA24C2BBFC;
 Tue, 11 Jun 2024 03:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718075596;
 bh=ZMZKxxJuYo9eKsMIOrsBuBANLaKNn9wG+ufnOZCOjg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qwrt7BtcqvK3RqTdB+lO3NW2bXjr5H6ZeRZRK31zbrHc2Dw8811Rc9KWlhaRKnwpg
 kaGVXt8lp+WTZDw2EJeZ2b/rKVU7nX9BoGIcCLyGcvHDtBtjW12M7yR0i371HyNbj7
 W0d603VGCTb8cU2/jQxFXpkiQQ8tvE9jDRu54Qr2kcfu84Z85k4Esc0YMVKzD5c3An
 T22n5eTOYz6MzRZe+nbjkJHaVZqRsbDhvwilQlC7bCrQMyer7dqSP0ynMcCVYCM74t
 DaMBqK+kHk57pPXIlLqXiBmUTouhB+0NLMdTrdoAsbCosCP+8BhzYxOy6xfxfH/bqd
 C/1n6fqamoA2w==
Date: Mon, 10 Jun 2024 20:13:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <20240611031314.GA2557@sol.localdomain>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
 <87tti098af.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <Zme3EcW4Uz8kTbTt@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zme3EcW4Uz8kTbTt@gondor.apana.org.au>
Cc: robh@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 kristo@kernel.org, devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh@ti.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, catalin.marinas@arm.com, akpm@linux-foundation.org,
 will@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Subject: Re: [Linux-stm32] [PATCH v3 0/6] Add support for MCRC64 engine to
 calculate 64-bit CRC in Full-CPU mode
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

On Tue, Jun 11, 2024 at 10:31:45AM +0800, Herbert Xu wrote:
> On Mon, Jun 10, 2024 at 08:03:44PM +0530, Kamlesh Gurudasani wrote:
> > <kamlesh@ti.com> writes:
> > 
> > > From: Kamlesh Gurudasani <kamlesh@ti.com>
> > >
> > > MCRC64 engine calculates 64-bit cyclic redundancy checks (CRC)
> > > according to the ISO 3309 standard.
> > 
> > Could you please review this and let me know if any changes are needed
> > to get it merged.
> 
> Eric Biggers had concerns about adding this to the kernel.  I'd
> like know if he's OK with this or not.
> 

I thought the rule is that there needs to be an in-kernel user to add algorithms
to the crypto API?  Is there any precedent for adding new algorithms purely so
that accelerators that implement them can be accessed from userspace via AF_ALG?

Even if acceptable, the motivation for this one does seem weak, given that a
userspace software implementation would actually be faster.  It could be
marginally useful for freeing up the CPU for other tasks if the inputs being
processed are very large (probably at least several megabytes), though.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
