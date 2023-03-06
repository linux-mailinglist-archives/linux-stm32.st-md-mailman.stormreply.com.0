Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BAC6AD2D5
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Mar 2023 00:32:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D22EC65E73;
	Mon,  6 Mar 2023 23:32:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16B84C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 23:32:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A54F6117F;
 Mon,  6 Mar 2023 23:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21C3C433EF;
 Mon,  6 Mar 2023 23:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678145562;
 bh=ZGUTtquGzXTLF7VGJydoXmWIUDYMJ/fi4dkrB65U3c0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m/f0fTlj6dXMj8VsjZ3Inkr6iRTv+kJUf6iG24bvoD3PBZ5m4w3tfafylbVEPd/Wt
 FQWpgyinzhzUIyyY6ZJjEZiOINzjC9L0Tfv5xGjb55Iynfju+p8UwfUtoNYlPKRzxH
 obJ3+1qor+bbvps6HyUwOR2DNk98Sk8BinXZPGRUpkgFxm2xPQtLiJ0KLDoNmNE2VJ
 2dNAPGMucj9ba1PcF5hKktSp9smySVQmtsSvEfQfzT6tpK/FX4jp3W0UTki7X1Rc6t
 XIXoByLPblr3FjCFLzLrMPEspEOqGZOcZsZ1Ih3Ob7B94DIbRV8H+Kft5WKqfQXL1q
 U6sg+ycRV51qA==
Date: Mon, 6 Mar 2023 23:32:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <b969cf86-d5df-462a-982b-c5b67f97c3d6@spud>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-4-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230211031821.976408-4-cristian.ciocaltea@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 03/12] soc: sifive: ccache: Add StarFive
	JH7100 support
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
Content-Type: multipart/mixed; boundary="===============1099044563951324765=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1099044563951324765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sWezJbPTi7EG0f2m"
Content-Disposition: inline


--sWezJbPTi7EG0f2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2023 at 05:18:12AM +0200, Cristian Ciocaltea wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> This adds support for the StarFive JH7100 SoC which also feature this
> SiFive cache controller.
>=20
> Unfortunately the interrupt for uncorrected data is broken on the JH7100
> and fires continuously, so add a quirk to not register a handler for it.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> [drop JH7110, rework Kconfig]
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

This driver doesn't really do very much of anything as things stand, so
I don't see really see all that much value in picking it up right now,
since the non-coherent bits aren't usable yet.

> ---
>  drivers/soc/sifive/Kconfig         |  1 +
>  drivers/soc/sifive/sifive_ccache.c | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index e86870be34c9..867cf16273a4 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -4,6 +4,7 @@ if SOC_SIFIVE || SOC_STARFIVE
> =20
>  config SIFIVE_CCACHE
>  	bool "Sifive Composable Cache controller"
> +	default SOC_STARFIVE

I don't think this should have a default set w/ the support that this
patch brings in. Perhaps later we should be doing defaulting, but not at
this point in the series.
Other than that, this is fine by me:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--sWezJbPTi7EG0f2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZ4EgAKCRB4tDGHoIJi
0qcEAP4r1H1KunxSPvzOIQ+psBjZf0GhVcU5HUKo2au2azIMUQD9H6CCIImWvFF5
+IBbmg9ik+sYw9HE7cIE67qmG8f03wQ=
=jWnP
-----END PGP SIGNATURE-----

--sWezJbPTi7EG0f2m--

--===============1099044563951324765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1099044563951324765==--
