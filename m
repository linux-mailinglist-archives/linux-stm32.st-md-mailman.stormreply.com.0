Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B243299315
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 17:57:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EC42C36B37;
	Mon, 26 Oct 2020 16:57:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6057AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 16:57:26 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 546452068D;
 Mon, 26 Oct 2020 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603731444;
 bh=XmX6A5dOrT7WqJQna3rzilmb9nV0XqwdxyjS4DZdXEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=spfUEF175Trz/DmMSvKaULQDVGy2BQTVfG/DiGwdAtV5LCKPP6cO5FUWcwAnwMZ4w
 9+fDwhbMOi3MRBrLCcAMAkH7s7FMjgHWv/oky0Oq2VVsX5FZdOiJ5ier7qwPh+2/td
 BbtxTnJ7dYJCCmEFvg0xITwAZpziohyiWEA1qBck=
Date: Mon, 26 Oct 2020 16:57:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20201026165720.GG7402@sirena.org.uk>
References: <20201020155709.2621-3-olivier.moysan@st.com>
MIME-Version: 1.0
In-Reply-To: <20201020155709.2621-3-olivier.moysan@st.com>
X-Cookie: Safety Third.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, robh@kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: stm32: dfsdm: remove
 stm32-adfsdm.txt binding
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
Content-Type: multipart/mixed; boundary="===============1763095001523585955=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1763095001523585955==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Content-Disposition: inline


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 05:57:09PM +0200, Olivier Moysan wrote:
> Device tree audio configuration for STM32 DFSDM is already
> covered in the following binding:
> Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> Remove stm32-adfsdm.txt obsolete binding.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+W/+8ACgkQJNaLcl1U
h9CPMgf+KTRCiGSyBxhUE1u/M2akejBvVr7Dx8sFslGtFFE8Iwr2D84zpI3/N+bF
0PYNahj9ur9gfNaKOLzQ+vH43Em59mjbdM5tL+ws97s5KvHDTQHtv4sWwceNG635
eTffbX/qd3MYwtRENfvGG+rMunPntaLfmCA/98Dm/c9NmyIwWL9VB8/HnYfEI/a6
YVTSsn+N6K9mLXTUD4N0CyhcQRxZDCvpgcbwsh2wtQO4xdx4vx174EDfyTT8HZF9
01x2ATDmoFoxsyEe75UQ2umKQ97hTgf0UDT17abwAZGFHTcH3DmvYRnenLxIyVmX
lmfhsylfvgLNnkypJT9lirXhrY7YZw==
=L9DH
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--

--===============1763095001523585955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1763095001523585955==--
