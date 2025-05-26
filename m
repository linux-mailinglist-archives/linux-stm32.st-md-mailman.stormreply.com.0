Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8EAC423A
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 17:26:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2120CC36B0F;
	Mon, 26 May 2025 15:26:49 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 356CCC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 15:26:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26E61A4F3EF;
 Mon, 26 May 2025 15:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AD3C4CEE7;
 Mon, 26 May 2025 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748273206;
 bh=nsp/2HkOhD1k7gQWCbEYjx8EfuOvRgrKZ0WPvzuYLDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uYfWPrzAEVq2xlMExqWyM3762HiaUr83TQBQg81yAEJLxq5Y86EUZbp988F7R3PQ0
 5eRwJWVAjhL8B9bY1rYS9RFpcCcay3JuXD7kfPb8HPMAloMKouQBVY6RssoGTiet6d
 pHEW/ImgJTHBiyMr5c43GSQ7go26yT+emTVkFSYoIzUuVrqw3Ug+XeSTqzTVD2WVNq
 4/iKQqMu5uV9lJWYYJ3kdn+h9QnboMlaXsvHl+EDMHXrSHzgdjKGTBBG5Y6oTHTuNK
 qcSK2eQGFnsHbrkQ4xxo4R8qu+dT2ZlZdxuUjRtFODQ4O3XEPYFgYkJ0yrSW/VMrhK
 MDRZin0taL5Pw==
Date: Mon, 26 May 2025 16:26:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Message-ID: <20250526-stir-deluxe-2fc29f181bb8@spud>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
 <20250524100319.22521-3-himanshu.bhavani@siliconsignals.io>
MIME-Version: 1.0
In-Reply-To: <20250524100319.22521-3-himanshu.bhavani@siliconsignals.io>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] dt-bindings: arm: stm32: add
 STM32MP157F-DK2 board compatible
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
Content-Type: multipart/mixed; boundary="===============8642174038765229253=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8642174038765229253==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tE7S4uh9hlKJ30MO"
Content-Disposition: inline


--tE7S4uh9hlKJ30MO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 03:33:14PM +0530, Himanshu Bhavani wrote:
> Add the "st,stm32mp157f-dk2" compatible string to the STM32 SoC
> bindings. The MP157F is functionally similar to the MP157C.
>=20
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--tE7S4uh9hlKJ30MO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSIMQAKCRB4tDGHoIJi
0hJeAQCHD74bR48utkhB7BQ3xyfSTl6/ulsrIxAPzd5sJjeKIgEAk9+YdBSEx6Bb
OvoijXGcEuzW5XduZqSczl3UDYGgpgo=
=VjKO
-----END PGP SIGNATURE-----

--tE7S4uh9hlKJ30MO--

--===============8642174038765229253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8642174038765229253==--
