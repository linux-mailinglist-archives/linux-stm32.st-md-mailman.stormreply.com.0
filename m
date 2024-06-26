Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE51917E4D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 12:39:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0932C7128F;
	Wed, 26 Jun 2024 10:39:15 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 509BBC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 10:39:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5AD3ACE20FE;
 Wed, 26 Jun 2024 10:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C369CC2BD10;
 Wed, 26 Jun 2024 10:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719398344;
 bh=uXUtR1lw1Q8bbbvkSe1QTPqgXYBuKxKOObcsywhWxbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bqXvXjUPEBzqpnCDjC6Yo+nzbhkmLatElGz7oAEaXttTbf5TaPPaEemU8CkXTcyX1
 nT9lNVxKSvi8KQWC2eP68MEaSMHte0kPgE3+qgOQDPxKIYTq7y8eiiOP5NPBEzq7Lk
 ZbBoK+avtgIZKDCtiKp1oG6Si06OdQk++5X4/GO7JmG11Vsc5n0wNxkvbPjBuCRyV/
 LKyhfVaXPvuNtlovFzwoslfug5cMVvYQ6eTz/jAqkf+/iZjDRLh5jSDYx3AiJpt2Kd
 50G1ZdyEVfsajdIolwuIWXm75PNuUZiR7KTB5YCFmiAcJ/y4/FmpEHacAlGc8A4tJA
 tfa5rvdFOtoeg==
Date: Wed, 26 Jun 2024 11:38:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <755275e3-b95a-44c0-941e-beb5dde65982@sirena.org.uk>
References: <20240611083606.733453-1-christophe.roullier@foss.st.com>
 <20240611083606.733453-3-christophe.roullier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240611083606.733453-3-christophe.roullier@foss.st.com>
X-Cookie: Many a family tree needs trimming.
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
 PATCH v7 2/8] net: stmmac: dwmac-stm32: Separate out external clock
 rate validation
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
Content-Type: multipart/mixed; boundary="===============1127144582962612755=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1127144582962612755==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5VPZsyVafG4kC2P8"
Content-Disposition: inline


--5VPZsyVafG4kC2P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 10:36:00AM +0200, Christophe Roullier wrote:
> From: Marek Vasut <marex@denx.de>
>=20
> Pull the external clock frequency validation into a separate function,
> to avoid conflating it with external clock DT property decoding and
> clock mux register configuration. This should make the code easier to
> read and understand.

For the past few days networking has been broken on the Avenger 96, a
stm32mp157a based platform.  The stm32-dwmac driver fails to probe:

<6>[    1.894271] stm32-dwmac 5800a000.ethernet: IRQ eth_wake_irq not found
<6>[    1.899694] stm32-dwmac 5800a000.ethernet: IRQ eth_lpi not found
<6>[    1.905849] stm32-dwmac 5800a000.ethernet: IRQ sfty not found
<3>[    1.912304] stm32-dwmac 5800a000.ethernet: Unable to parse OF data
<3>[    1.918393] stm32-dwmac 5800a000.ethernet: probe with driver stm32-dw=
mac failed with error -75

which looks a bit odd given the commit contents but I didn't look at the
driver code at all.

Full boot log here:

   https://lava.sirena.org.uk/scheduler/job/467150

A working equivalent is here:

   https://lava.sirena.org.uk/scheduler/job/466518

A bisection identified this commit as being responsible, log below:

git bisect start
# status: waiting for both good and bad commits
# bad: [0fc4bfab2cd45f9acb86c4f04b5191e114e901ed] Add linux-next specific f=
iles for 20240625
git bisect bad 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
# status: waiting for good commit(s), bad commit known
# good: [3d9217c41c07b72af3a5c147cb82c75f757f4200] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect good 3d9217c41c07b72af3a5c147cb82c75f757f4200
# bad: [5699faecf4e2347f81eea62db0455feb4d794537] Merge branch 'master' of =
git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect bad 5699faecf4e2347f81eea62db0455feb4d794537
# good: [ba73da675606373565868962ad8c615f175662ed] Merge branch 'fs-next' o=
f linux-next
git bisect good ba73da675606373565868962ad8c615f175662ed
# bad: [7e7c714a36a5b10e391168e7e8145060e041ea12] Merge branch 'af_unix-rem=
ove-spin_lock_nested-and-convert-to-lock_cmp_fn'
git bisect bad 7e7c714a36a5b10e391168e7e8145060e041ea12
# good: [93d4e8bb3f137e8037a65ea96f175f81c25c50e5] Merge tag 'wireless-next=
-2024-06-07' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wire=
less-next
git bisect good 93d4e8bb3f137e8037a65ea96f175f81c25c50e5
# bad: [4314175af49668ab20c0d60d7d7657986e1d0c7c] Merge branch 'net-smc-IPP=
ROTO_SMC'
git bisect bad 4314175af49668ab20c0d60d7d7657986e1d0c7c
# good: [811efc06e5f30a57030451b2d1998aa81273baf8] net/tcp: Move tcp_inboun=
d_hash() from headers
git bisect good 811efc06e5f30a57030451b2d1998aa81273baf8
# good: [5f703ce5c981ee02c00e210d5b155bbbfbf11263] net: hsr: Send superviso=
ry frames to HSR network with ProxyNodeTable data
git bisect good 5f703ce5c981ee02c00e210d5b155bbbfbf11263
# bad: [6c3282a6b296385bee2c383442c39f507b0d51dd] net: stmmac: add select_p=
cs() platform method
git bisect bad 6c3282a6b296385bee2c383442c39f507b0d51dd
# bad: [404dbd26322f50c8123bf5bff9a409356889035f] net: qrtr: ns: Ignore ENO=
DEV failures in ns
git bisect bad 404dbd26322f50c8123bf5bff9a409356889035f
# bad: [c60a54b52026bd2c9a88ae00f2aac7a67fed8e38] net: stmmac: dwmac-stm32:=
 Clean up the debug prints
git bisect bad c60a54b52026bd2c9a88ae00f2aac7a67fed8e38
# bad: [582ac134963e2d5cf6c45db027e156fcfb7f7678] net: stmmac: dwmac-stm32:=
 Separate out external clock rate validation
git bisect bad 582ac134963e2d5cf6c45db027e156fcfb7f7678
# good: [8a9044e5169bab7a8edadb4ceb748391657f0d7f] dt-bindings: net: add ST=
M32MP13 compatible in documentation for stm32
git bisect good 8a9044e5169bab7a8edadb4ceb748391657f0d7f
# first bad commit: [582ac134963e2d5cf6c45db027e156fcfb7f7678] net: stmmac:=
 dwmac-stm32: Separate out external clock rate validation

--5VPZsyVafG4kC2P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ778EACgkQJNaLcl1U
h9ApQgf/eYGmuq6nGIDNbNykExuz3/YU9CjXnBZJCLyUoHxI/mxSZPa584xjxF0z
+0lz32f4hLSUwSrA3K/zdI1JkJLrExE1l2JrvqFWojtpIF29Trxdf4wgYQVqGvEs
b4bf9vn4DoxvboLXQzVJtr5OJHPYJfWbZOGXqblBmQYiCTKHT+P+dI8Wn4dmiQH5
7OH9jJ37JKuyOOTJQNtY8mZCSze+Po+sHCXKoOnwONT8PhoyXC5solI8/OxTlPYV
LXwbpIsSu9jc3siubqUvW3LmzPn1TrCT8hD79IIye3g3aLaCYAqVfZgdsH/ahziU
fAViHxwJVN/1dK25wZ9rERUrutFHxg==
=B+gE
-----END PGP SIGNATURE-----

--5VPZsyVafG4kC2P8--

--===============1127144582962612755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1127144582962612755==--
