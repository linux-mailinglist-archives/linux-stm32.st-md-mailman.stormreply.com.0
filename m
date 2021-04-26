Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 095EE36B739
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Apr 2021 18:51:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B03F1C57182;
	Mon, 26 Apr 2021 16:51:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EFC9C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 16:51:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8AB561077;
 Mon, 26 Apr 2021 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619455908;
 bh=ArImBhpZxt47JQPcx4aIVUJwh3D5Y/IZQCOyCgBolw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sZ8wSmvnAPsVjdPN+14p4mG+pY8FQStUOzShe4TBoKfSSrlC90AdHQLHXStaRuQLZ
 oCOpgfBKyciGWPLYO9EZxoNqvD29QggjHkFCl4ysYpVAjHBqXH0ZB17u4MwwDyt8NX
 4N697mxhsNQ1Ve+BV8RC1qRfxWp5qTL4/E244OxxzDcB/AvA9vNHfid8pIMcywxjVJ
 sZpcNvIvwnY7WPyJXv4eKHmfRW0mUsRiQekfjfCXwdi0vEKRkxjTY/metzuW+qwLJp
 3d1AslK4/8Un5GTiHHFmdRD0rSFuRKWnUDsNFj8oTPVWqekmq4pC1kqJhtpr65jnDh
 7S4OfH/ku5Psg==
Date: Mon, 26 Apr 2021 17:51:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Message-ID: <20210426165118.GH4590@sirena.org.uk>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210426162610.erpt5ubeddx7paeq@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210426162610.erpt5ubeddx7paeq@ti.com>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] spi: spi-mem: add automatic poll
	status functions
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
Content-Type: multipart/mixed; boundary="===============7394538015572159576=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7394538015572159576==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZPDwMsyfds7q4mrK"
Content-Disposition: inline


--ZPDwMsyfds7q4mrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 09:56:12PM +0530, Pratyush Yadav wrote:
> On 26/04/21 04:39PM, patrice.chotard@foss.st.com wrote:

> > + * spi_mem_poll_status() - Poll memory device status
> > + * @mem: SPI memory device
> > + * @op: the memory operation to execute
> > + * @mask: status bitmask to ckeck
> > + * @match: status expected value

> Technically, (status & mask) expected value. Dunno if that is obvious=20
> enough to not spell out explicitly.

Is it possible there's some situation where you're waiting for some bits
to clear as well?

> > +		ret =3D ctlr->mem_ops->poll_status(mem, op, mask, match, timeout);

I'm not sure I like this name since it makes me think the driver is
going to poll when really it's offloaded to the hardware, but I can't
think of any better ideas either and it *is* what the hardware is going
to be doing so meh.

> I wonder if it is better to let spi-mem core take care of the timeout=20
> part. On one hand it reduces code duplication on the driver side a=20
> little bit. Plus it makes sure drivers don't mess anything up with bad=20
> (or no) handling of the timeout. But on the other hand the interface=20
> becomes a bit awkward since you'd have to pass a struct completion=20
> around, and it isn't something particularly hard to get right either.=20
> What do you think?

We already have the core handling other timeouts.  We don't pass around
completions but rather have an API function that the driver has to call
when the operation completes, a similar pattern might work here.  Part
of the thing with those APIs which I'm missing here is that this will
just return -EOPNOTSUPP if the driver can't do the delay in hardware, I
think it would be cleaner if this API were similar and the core dealt
with doing the delay/poll on the CPU.  That way the users don't need to
repeat the handling for the offload/non-offload cases.

--ZPDwMsyfds7q4mrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCG74UACgkQJNaLcl1U
h9Dyowf8CzH/7Iek+gTyGiNrbGWj5sDMvDZCFrWHTBPWzk+uy+AkR59+SHcyZeNg
dkCOuag3vkLm1Pkyq9Ekgbeci3WPtcJSj22YEYwUt7WWFfpft86w8ew7ulp/TlgF
yr5GEyC+CU6Ak2nJA7r5mGNuFnOwQGnWpOQiWpd8yZKVRtwn5jJFz1u8SJUev1QB
P9CrhYkVB/3WvipJ9ZzT2gtJidoWSowghUeEc8sY2wLjaHOuHVWwRXSVCvhGEn7r
flQaJ5N5MXC27mnLnCNz6nRWDfbW/i3To+a7XN6TJhZjYaMxkTiuZfOgPtd03zlS
e2Nwye7CJB7jkfGGNZrVP6x5PGTDBA==
=rucd
-----END PGP SIGNATURE-----

--ZPDwMsyfds7q4mrK--

--===============7394538015572159576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7394538015572159576==--
