Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E868691A5E5
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 13:58:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AA38C71282;
	Thu, 27 Jun 2024 11:58:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A96AC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 11:58:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 74310CE2E79;
 Thu, 27 Jun 2024 11:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5A7C2BBFC;
 Thu, 27 Jun 2024 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719489494;
 bh=bsdKZ7FH+cF7ZRJHnYvsPuep+j4/x6xeM+rw6kh7mwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FdG5USaawH1QsUeF2Sr4FzLiX0rqAx4tDdwlTk9AzK6jloq7xqptYqhrGjxRElDlT
 3XOk1flWQWt+enajVvssDn+HSznBFmPSU1HB5JmFIehpe39aXkjFcqMUUbTHj5UmZo
 z2KLAoZhhsSjsYVfH26Gn+G0ENYU5h1ayy5BStqW+wvqHR1GZR8Pf/cE+q7Xs5o24q
 RXveEK68AfpH/RNHL1GEFagzD3tmwiVz0nQqGWbKNLM/Vt+gv4MDxeBFMcpoELc1uZ
 Zx7GN9a1c7bplTCeN0k/cRNIav7QEhZipytDw7gMK3N0/eb4wFp0bpVY1BbPBuPwUK
 t3ycuu0wcWzMA==
Date: Thu, 27 Jun 2024 12:58:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <3b262c42-30ef-4221-aeba-e6fc5d9549b9@sirena.org.uk>
References: <20240627084917.327592-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240627084917.327592-1-christophe.roullier@foss.st.com>
X-Cookie: I just had a NOSE JOB!!
Cc: Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
	PATCH 0/2] Fixes for stm32-dwmac driver fails to probe
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
Content-Type: multipart/mixed; boundary="===============0774206001986968939=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0774206001986968939==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uyMFrReHwMXWhVba"
Content-Disposition: inline


--uyMFrReHwMXWhVba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 10:49:15AM +0200, Christophe Roullier wrote:
> Mark Brown found issue during stm32-dwmac probe:
>=20
> For the past few days networking has been broken on the Avenger 96, a
> stm32mp157a based platform.  The stm32-dwmac driver fails to probe:

These patches resolve the boot issue I'm seeing on this platform:

Tested-by: Mark Brown <broonie@kernel.org>

--uyMFrReHwMXWhVba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9U88ACgkQJNaLcl1U
h9DnYAf+MRtkI/wgcbZL/MOrZDaxdLzL+NYaZF8qlPgsW2i1ddZHbLEce94FVywY
8JdeXXr6OLRprSR8iGoL+3AZ5IFD01V6LAI/s4q3S260J5TkrUcVOjI9nWrBA7+Q
63wPVnM/EA1qu7hvTyrgICtF26O/NypA+dQYCS0FBryEMYE4wL8DGP7PjexzkDTV
V3AbcEPa5meIo6livs5Sb4mryq9e7fWMKGv0qCNo3nrPdhylbzIhKd0qHdbVo3sF
tPQdTIc76WPvY1RJ1sLNw+fyoNeZ5elLRGMzRFF0VhdnhUjMY6TFoVQ1/P5pSbUw
8Kpx6Ap1305I4Do8kQf38/r9OvNEpg==
=OIp5
-----END PGP SIGNATURE-----

--uyMFrReHwMXWhVba--

--===============0774206001986968939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0774206001986968939==--
