Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AD8AEDAAC
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 13:20:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1BE0C32E8F;
	Mon, 30 Jun 2025 11:20:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17C46C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 11:20:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 251675C4D32;
 Mon, 30 Jun 2025 11:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11475C4CEE3;
 Mon, 30 Jun 2025 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751282410;
 bh=9rBTDJ/Pce3XGAqMFO/6ZU1Cr+dyYVpm8N2+a5ACXSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D13f7Ub4BN4yAwB3RBgvRG4yQNNeXJL5AVLZDS0XwfD2u+9YTM+M/gSw6/hHyOL+v
 HN9NnVq06ERB/qjtlFmBvfcN5BqsZcZxEQfuffupcShL4D9iuO6VSB+xx+cqd/d0BY
 FdrGIeWdz9E3J4nDBNb+lFK/bwn1g16v3v+xariZJJuVBFQ5wptVP8G4+uaUrVRAth
 AXSKIw0IGxf/ffpaaEHxrMx+q4modao/UkAagb8HMogs4Paor4+v99PoqCdRuZG0sh
 pQ17AzhygtAUzwdIhM7esrNy5H71AO93MipDLxyYjptFNLXYOyhuqVvHA85GHN2ckr
 1xVTcfnkv2Mhg==
Date: Mon, 30 Jun 2025 12:20:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Message-ID: <192fb276-1e5a-4f69-8815-133f6bcd36b3@sirena.org.uk>
References: <20250630081253.17294-1-antonio@mandelbit.com>
 <5e61da51-cd02-41fd-9773-8bd776e1db62@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <5e61da51-cd02-41fd-9773-8bd776e1db62@foss.st.com>
X-Cookie: Say no, then negotiate.
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Antonio Quartulli <antonio@mandelbit.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: fix pointer-to-pointer
	variables usage
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
Content-Type: multipart/mixed; boundary="===============0885581361032455475=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0885581361032455475==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8ubtRjEq0eUrZSJ8"
Content-Disposition: inline


--8ubtRjEq0eUrZSJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 30, 2025 at 10:28:50AM +0200, Clement LE GOFFIC wrote:

> Thank you, LGTM
> You can add my Reviewed-by

If you want to add a Reviewed-by you should actually write it out in the
mail, people rely on tooling like b4 to pick them up.

--8ubtRjEq0eUrZSJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhicuUACgkQJNaLcl1U
h9Ab+Af/TLVz/Hq9TCf2YxneUgc7AN12JRozk2EqamXE2v+Yb6rTtIil8B8ebrzi
FfOaxYAzi5KJDeESYSTn3yPDx0Fx6BA0p2iJN81BglYrhweGnTRepTTxipockKR1
Rvdj2lJFlq1gG6wtmZWlVRxvLZgNMw9YedXUzDFBtpjZoWQiAeEw/zWioip11i+l
inR4ruch1/w48o7zh5Ays2lOQd3exzmLp1lAH/myowkR3v4qP6yzs7QLHmhAWOqy
BlNC5jVfocXWi7eWO+VC+etgczf5bINLcC8VYUM79z2WNJszOKx/1AMtCBqfVYyF
MFhM8P+Ykvqa6VXqRoBSlmT5PUYYpw==
=boE2
-----END PGP SIGNATURE-----

--8ubtRjEq0eUrZSJ8--

--===============0885581361032455475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0885581361032455475==--
