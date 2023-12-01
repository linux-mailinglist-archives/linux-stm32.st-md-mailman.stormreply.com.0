Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F98015BD
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 22:50:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C4B8C6B479;
	Fri,  1 Dec 2023 21:50:40 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D6C5C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 21:50:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D8DE5B82CFB;
 Fri,  1 Dec 2023 21:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFBCC433C8;
 Fri,  1 Dec 2023 21:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701467438;
 bh=+unD+pWX96Y1kdDVAxBZ7bMp1TVUj6jkcNw1BaPS65Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lD7i61BrsR1vum22JMye1cgGgyHzYmTPfQgHiyBM+gWmfRFwW5q4QNEuKih7ppXrp
 uEZ6w8Sn/aCMbOHCzDjYS61GrI00spwsDarF8QwEtg6ZcNvTOhnQEJ4Am+0VGTm74d
 OI8i8fRZAhvc0g2o6LowV9lww1QBS9cNuCYrbuJwM+c2un3x5YTnYd7lB6GCFHXNGB
 2XyJ61IK/iXVBazsTItz+/BzxQvCh3hKqmJ0NiOI/MXtJLozgAvXE6OwtsDs7VpMYz
 hfsajJSfby98g4SFgALiefSNMRCjoUSj3/T6XnG/Cmktrixx0Hzbal9bN4/Sc8YAg6
 W8wGYYNldYDZQ==
Date: Fri, 1 Dec 2023 21:50:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <b070eb2a-05d7-4e6a-8de9-15179045d192@sirena.org.uk>
References: <20231201214014.2539031-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
In-Reply-To: <20231201214014.2539031-1-ben.wolsieffer@hefring.com>
X-Cookie: The early worm gets the late bird.
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: enable controller before
	asserting CS
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
Content-Type: multipart/mixed; boundary="===============6450924428148002915=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6450924428148002915==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YmrIJOCZ+Tf3khLq"
Content-Disposition: inline


--YmrIJOCZ+Tf3khLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 01, 2023 at 04:40:14PM -0500, Ben Wolsieffer wrote:

> This patch fixes the bug by enabling the controller in prepare_message()
> and disabling it in unprepare_message(), which are called while CS is
> not asserted.

This feels like it'd be a good fit for moving to runtime PM - that way
we avoid bouncing the controller on and off between messages which is
probably better anyway.  The driver already does pinctrl management for
the device there.

> Note that bug is likely not present on the STM32H7, because it supports
> the AFCNTR bit (and this driver sets it), which keeps the SPI pins
> driven even while the controller is disabled.

It also occurs to me that this isn't going to work for devices which
chip select inverted - for them we can't stop driving chip select at all
since they need it held high when idle.  There aren't that many such
devices and it'd loose us the PM which is rather awkward...  I guess
that's an incremental issue with a more invasive fix though.

--YmrIJOCZ+Tf3khLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVqVSgACgkQJNaLcl1U
h9BFLQf/UOjz4Pr4wbrh+8Ck/3QreTFHhHy4MfusQ1TVF32f4jX9Nw4JQA/rFs4S
21ni5xP33d8D9cAiNUWJK+a7rYML9TyFbSsHJXso/CMk2OwuFNoUVIs/5NG/e643
Xv8oxmLSchOs7/Es9eBewWXyoyOx44UJZ6Xkm3nTTDFdLcIWO7JXfeB63cI7+Rpe
UrehMBhcaftJmv2P3VCwNCYqz4zkKwJa0f8kBSMN/ypYzA/Q0xCoKEJw5rYQW6CW
yE6AU3uob0Hgs9UT7xONC7GQ1KEnEfrPrSAtSs3ZFNSvV5vmaVubMZklllhGU3cZ
laUraJqW1OZlhresrLnzhF/z4SCtgA==
=1M3S
-----END PGP SIGNATURE-----

--YmrIJOCZ+Tf3khLq--

--===============6450924428148002915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6450924428148002915==--
