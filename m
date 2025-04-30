Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D568BAA5874
	for <lists+linux-stm32@lfdr.de>; Thu,  1 May 2025 01:06:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C5EEC78032;
	Wed, 30 Apr 2025 23:06:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28DCDC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 23:06:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78C655C3EED;
 Wed, 30 Apr 2025 23:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6411C4CEE7;
 Wed, 30 Apr 2025 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746054415;
 bh=DVe4AB4EflgrauQLf6RgNDVBTkAUO5bOQliQvYixnW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i6vCwD5Ku8V7NhwVQCWwREJPG9bpxTlnAjBWAPC7OHfxwEj5pw6WIXihyOM0y07Np
 oGmUoxS7a2mBs6MUYDOWJANfPTAeQlHn9gqi2vcfINyLnEW81ZfPWC6QWthwuCtwxe
 uoLvX5SGnjAG+PStaYDsa20ZdplK/V0lQK4PCJqUSbfhXhxpHZL6q0gCQafGRJ8FUK
 hqDUKKJknEElV5O81sILkYadirfxvvyLluuq2YvGg858QohSN+Ed8uOWekovraA+6T
 zR9PoOP6dKH91v49Su5iWlZzX6BSNRYJKxcj8ve7M8lRI8lYzvXNJ8d0sATFVxd9vn
 HbtwgGZde6m2A==
Date: Thu, 1 May 2025 08:06:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <aBKtC6ltm4hyQ3yW@finisterre.sirena.org.uk>
References: <20250430165210.321273-1-olivier.moysan@foss.st.com>
 <20250430165210.321273-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250430165210.321273-2-olivier.moysan@foss.st.com>
X-Cookie: Well begun is half done.
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] ASoC: stm32: sai: skip useless
 iterations on kernel rate loop
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
Content-Type: multipart/mixed; boundary="===============6907488325256514954=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6907488325256514954==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bPEVIUKDWml5O3Hc"
Content-Disposition: inline


--bPEVIUKDWml5O3Hc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 30, 2025 at 06:52:08PM +0200, Olivier Moysan wrote:

> Fixes: b1d2e4067dc6 ("ASoC: stm32: sai: add stm32mp25 support")

This commit isn't in mainline, I think you meant 2cfe1ff22555.

--bPEVIUKDWml5O3Hc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgSrQoACgkQJNaLcl1U
h9Ce4Qf+Kx6UyqHkHSI1stvCklQt/+Z4iVfBjGo3/P0vWUe9GgKN+LB/DPfzc/Ww
FwQqXWsx0/xp/XQcgCpQFBEzci6nEGWjdJ240fLzpSphVX/TX/sFNiiuqXCWAffR
jqABT5SrIZx+Oy0KfdzcfNbpaNdd4yRbjDWYi3TMH0DgmxLprzu+iy/65u+sZRtb
mQQ++AZCcMQ+E/a70aYRbffxxRZtrdMpfzQIyl+EU9I3cjCCxMwt+Bt14NZd0VWO
3j2T8f9vxbKM1etsdlP5X9THWTYcSjFZdi1lRGCtM4idZxRaKhYfHlAn+zx4ESdk
OeJLoGUFNDp0qhHDbI93je5/cCKcHw==
=jH7g
-----END PGP SIGNATURE-----

--bPEVIUKDWml5O3Hc--

--===============6907488325256514954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6907488325256514954==--
