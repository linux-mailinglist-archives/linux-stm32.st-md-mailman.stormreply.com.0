Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F898194BE
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Dec 2023 00:48:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEBF8C6B44D;
	Tue, 19 Dec 2023 23:48:58 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6926CC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 23:48:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BAECACE1B02;
 Tue, 19 Dec 2023 23:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17142C433C7;
 Tue, 19 Dec 2023 23:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703029735;
 bh=6Awxn5V8AF848/sL+nni2y6BxV7vYA7baRCKnw14y/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1BE4kY9mKQ+gismCY/LJfkXQmNsCT6872ehEHdX++U0c1AgqKeDNv2A97UOnMu3m
 6nixw/ZlAgr08kVBigelDw6ZCQHHhBXywVX/aSdNOQmSz8dUOxPsVRQxC+eIEUExMb
 efywyJg0/FkooDguWnKhF55ooRvX13ghr7mTplfw9K81OxwSPUTMpeej27ux245DWB
 vaD7KlF99H+rILYxj/ZzcHBrHXm3YMUheb06bVcETyQ3D0kkTK3N7A1AhnF2yodeAU
 RfavRNEeiWIkOW56sRLWvf0F47gLdGFmRjXu7cN/R4uLWgfOV8NPtl6cGsWwC1H4L1
 GMe+D68ejKvrQ==
Date: Tue, 19 Dec 2023 23:48:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <20231219-green-footwear-e81d37f9c63c@spud>
References: <20231219231040.2459358-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20231219231040.2459358-1-cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/1] StarFive DWMAC support for JH7100
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
Content-Type: multipart/mixed; boundary="===============6325049190974580062=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6325049190974580062==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oh06CCJkLIxcVNXN"
Content-Disposition: inline


--oh06CCJkLIxcVNXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 01:10:38AM +0200, Cristian Ciocaltea wrote:
> This is just a subset of the initial patch series [1] adding networking
> support for StarFive JH7100 SoC.
>=20
> [1]: https://lore.kernel.org/lkml/20231218214451.2345691-1-cristian.cioca=
ltea@collabora.com/

You need to send the binding patch alongside the driver, unless that has
been applied already.

Cheers,
Conor.

--oh06CCJkLIxcVNXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYIr4QAKCRB4tDGHoIJi
0h8IAQCS86wYpq5Hrwpt9eYpD/kbb3OmnLoYFWKbzhsIywOcwgD+NDOhb/Qneu3B
kkjU++IJXvuRpPCfETXRhcCGaxFrXQ8=
=7Klu
-----END PGP SIGNATURE-----

--oh06CCJkLIxcVNXN--

--===============6325049190974580062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6325049190974580062==--
