Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0985EADD7
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Sep 2022 19:14:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AECCC5F1ED;
	Mon, 26 Sep 2022 17:14:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A49CC035BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 17:14:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5CB56108F;
 Mon, 26 Sep 2022 17:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FA3C433C1;
 Mon, 26 Sep 2022 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664212488;
 bh=oU8fn0BSKQJ81q0PJD4003aYsQpw2jnsAd7aL0fi5nI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsxD7Ezrth60I4eEJPxOWVxcAYT2+wvpZ0iLXxTkTwgbAKPsnHPVrnHZUJkn/mAtn
 M9DC0FakD7h5p5ZpwtaScOq0NkEKGdLXtf7N9QA8/r6tTs8Cjsjbo/5WKt9/5ROSbD
 Sc8lIErYHDImiS+EabT9oWGV62HB7RgUR03qP/IEsTsg1aTWGdIGhL9xkFm2A0VjU1
 bsc1YryL1H9Epxf3UOjmRM1vqcvE3WVM0iYFE0w6fUwVBDEb7zHrP9bqPE/xWEBgoY
 hKW9OKepxAq0AKO/57OTL7Aoe63pnrdTvFfJsrQJhrmmqiBoTNATuhAwR903oAbwIl
 goVPh7lyg0Puw==
Date: Mon, 26 Sep 2022 18:14:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <YzHd/U9vvSwuhKsx@sirena.org.uk>
References: <20220926093620.99898-1-tianjia.zhang@linux.alibaba.com>
 <20220926093620.99898-17-tianjia.zhang@linux.alibaba.com>
 <CAMj1kXF8Fi9cG4p6udRYT4LbCAj0UBXQL12nmQBFEWvZsVX7Wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXF8Fi9cG4p6udRYT4LbCAj0UBXQL12nmQBFEWvZsVX7Wg@mail.gmail.com>
X-Cookie: You may be recognized soon.  Hide.
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 16/16] crypto: arm64/sm4 - add ARMv9 SVE
 cryptography acceleration implementation
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
Content-Type: multipart/mixed; boundary="===============2172009004479199569=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2172009004479199569==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f7AumrwylgGDBblN"
Content-Disposition: inline


--f7AumrwylgGDBblN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 12:02:04PM +0200, Ard Biesheuvel wrote:

> Given that we currently do not support the use of SVE in kernel mode,
> this patch cannot be accepted at this time (but the rest of the series
> looks reasonable to me, although I have only skimmed over the patches)

> In view of the disappointing benchmark results below, I don't think
> this is worth the hassle at the moment. If we can find a case where
> using SVE in kernel mode truly makes a [favorable] difference, we can
> revisit this, but not without a thorough analysis of the impact it
> will have to support SVE in the kernel. Also, the fact that SVE may

The kernel code doesn't really distinguish between FPSIMD and SVE in
terms of state management, and with the sharing of the V and Z registers
the architecture is very similar too so it shouldn't be too much hassle,
the only thing we should need is some management for the VL when
starting kernel mode SVE (probably just setting the maximum VL as a
first pass).

The current code should *work* and on a system with only a single VL
supported it'd be equivalent since setting the VL is a noop, it'd just
mean that any kernel mode SVE would end up using whatever the last VL
set on the PE happened to be in which could result in inconsistent
performance.=20

> also cover cryptographic extensions does not necessarily imply that a
> micro-architecture will perform those crypto transformations in
> parallel and so the performance may be the same even if VL > 128.

Indeed, though so long as the performance is comparable I guess it
doesn't really hurt - if we run into situations where for some
implementations SVE performs worse then we'd need to do something more
complicated than just using SVE if it's available but...

> In summary, please drop this patch for now, and once there are more
> encouraging performance numbers, please resubmit it as part of a
> series that explicitly enables SVE in kernel mode on arm64, and
> documents the requirements and constraints.

=2E..in any case as you say until there are cases where SVE does better
for some in kernel use case we probably just shouldn't merge things.

Having said that I have been tempted to put together a branch which has
a kernel_sve_begin() implementation and collects proposed algorithm
implementations so they're there for people to experiment with as new
hardware becomes available.  There's clearly interest in trying to use
SVE in kernel and it makes sense to try to avoid common pitfalls and
reduce duplication of effort.

A couple of very minor comments on the patch:

> > +config CRYPTO_SM4_ARM64_SVE_CE_BLK
> > +       tristate "Ciphers: SM4, modes: ECB/CBC/CFB/CTR (ARMv9 cryptogra=
phy
> +acceleration with SVE2)"
> > +       depends on KERNEL_MODE_NEON
> > +       select CRYPTO_SKCIPHER
> > +       select CRYPTO_SM4
> > +       select CRYPTO_SM4_ARM64_CE_BLK
> > +       help

Our current baseline binutils version requirement predates SVE support
so we'd either need to manually encode all SVE instructions used or add
suitable dependency.  The dependency seems a lot more reasonable here,
and we could require a new enough version to avoid the manual encoding
that is done in the patch (though I've not checked how new a version
that'd end up requiring, it might be unreasonable so perhaps just
depending on binutils having basic SVE support and continuing with the
manual encoding might be more helpful).

> > +.macro sm4e, vd, vn
> > +       .inst 0xcec08400 | (.L\vn << 5) | .L\vd
> > +.endm

For any manual encodings that do get left it'd be good to note the
binutils and LLVM versions which support the instruction so we can
hopefully at some point switch to assembling them normally.

> > +static int __init sm4_sve_ce_init(void)
> > +{
> > +       if (sm4_sve_get_vl() <=3D 16)
> > +               return -ENODEV;

I'm not clear what this check is attempting to guard against - what's
the issue with larger VLs?

If it is needed then we already have a sve_get_vl() in the core kernel
which we should probably be making available to modules rather than
having them open code something (eg, making it a static inline rather
than putting it in asm).

--f7AumrwylgGDBblN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMx3fwACgkQJNaLcl1U
h9C8Pgf9GG6I05ACG8YLcqEf0Y5yObFlPelhwSsSzTXK+0+/qIciuuTFJnnq0/Bm
0+uR1I3XV5kCEsQRyeiXgOqzpkXdsy5ggrY29lme2tnBMA5DTV9/rhDdyoIdMcG4
JUVAdgFQ5UfZeLUkMTYreey6trdhQqJwi++7+oZBKnO59jmud3Mp6s0g4E++Kjv/
GvNSjKTOYl82Y433h5GvQ9J14zr/Vu2ZPj3H7XowF4HbFAu9VysfLtNmSSukK2Nu
fXAru8Tfoz3CxrvTUWcaYOU/5I+0uuVUiIdvpeyQHW+Z8KoKE0Bh+w9Y0GK8WoeL
AJGmPrT9aUIP7QgrTreHldsucUjVwA==
=wgDg
-----END PGP SIGNATURE-----

--f7AumrwylgGDBblN--

--===============2172009004479199569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2172009004479199569==--
