Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7175104D
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 20:10:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13496C6B443;
	Wed, 12 Jul 2023 18:10:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0062FC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 18:10:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E159E618A8;
 Wed, 12 Jul 2023 18:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD66C433C8;
 Wed, 12 Jul 2023 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689185410;
 bh=Memgf9GzvMAFY5lRq6V3EGilVkjuiQ+UqIuIcVYoRyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nACLBqgy2+0iE6VajuxT2NGv0Fbt6dazbiBuiISdDf2Sj9Q79EpBpd4dIJtPb9Unw
 3l8uk2phOE7OlSsNYg8jraXExFO8jDnIgZAdx1mNneMiBTQgS7P92bz3aG9y4Fosvx
 doeANFH8S2rYeXeNV2TpsvMMMBZuKpP9ByE0ZhuDem4Ac1L1YR+Lh9Vjel5vM7AqdG
 nvPiErKmxdtp9HImBNYFJ3m3xJnByso01/enDqUNWXY3T72s+i/NStZEv07Gd0Z7yD
 PgLLn6TDPsFl5+A+FFB6frvbL4U7QI5OqWBYbARV31cTFvzK7QyHfzvqEttOfvOE2q
 Oe47fn21BDp6w==
Date: Wed, 12 Jul 2023 19:10:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20230712-purge-untangled-b7b333c69c0c@spud>
References: <20230712124248.2400862-1-sean@geanix.com>
 <20230712124248.2400862-8-sean@geanix.com>
MIME-Version: 1.0
In-Reply-To: <20230712124248.2400862-8-sean@geanix.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dantuguf14105@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 l.goehrs@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 8/9] dt-bindings: arm: stm32: add extra
 SiP compatible for oct, stm32mp157c-osd32-red
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
Content-Type: multipart/mixed; boundary="===============9091210750666379279=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============9091210750666379279==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DFDDwRwhxkcH4vx8"
Content-Disposition: inline


--DFDDwRwhxkcH4vx8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 02:42:46PM +0200, Sean Nyekjaer wrote:
> Add binding support for the Octavo OSD32MP1-RED development board.
>=20
> General features:
>  - STM32MP157C
>  - 512MB DDR3
>  - CAN-FD
>  - HDMI
>  - USB-C OTG
>  - UART
>=20
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--DFDDwRwhxkcH4vx8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7sfAAKCRB4tDGHoIJi
0qKLAP4rpJCjMYjqTCHRUmXdQpHseHtotcoK9EOzKAYk8HxXxgD/U+fZlV7lWQqn
K/FMuttJ7rGWrP0k6Ljtzj972RqJBwQ=
=1dgn
-----END PGP SIGNATURE-----

--DFDDwRwhxkcH4vx8--

--===============9091210750666379279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9091210750666379279==--
