Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F54A31409
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 19:25:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6217AC78006;
	Tue, 11 Feb 2025 18:25:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7851AC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 18:25:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF5F05C4C90;
 Tue, 11 Feb 2025 18:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4FDC4CEDD;
 Tue, 11 Feb 2025 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739298334;
 bh=m2wqFcz+v1UAQgc1YqCV1MB5c8CjM8VI4vZEBEicwuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gcZ6MW66T4mSGkn1IwJAlhhTn3L0yjP+6Z7DRxfw3s4YqIlseachoNLve9XqrtKST
 O7kakKZ94Sd2Yu78QMBC3Dr/WdRoJ2so2S1L41JELSj/ACMf/mxOI+bHnylY1jVKcc
 dMsuMXlnGRzwoWfJoZi1/TrpfhzmANqViCcdJIzbF6JggwgSSxJK+oEL00vmrdL5KS
 RSieRcUqvmt7CZ1wVrCkKeRR63k36qyRQ1krBypUtiXLRZXTfTWGxHfDHARbLFjQgS
 9heWZK/oLn9k+37SuiRtcCnmN6i6/DQvs1xS+yOr2Wvwj9Nc0R2FUl627260njtMvP
 UzFpNQsC+PHyw==
Date: Tue, 11 Feb 2025 18:25:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20250211-labrador-spotter-27df2d2bbe02@spud>
References: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
 <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: media: st,
 stmipid02: correct lane-polarities maxItems
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
Content-Type: multipart/mixed; boundary="===============7487807862760257729=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7487807862760257729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hFoqtL9VL6EAg4Q/"
Content-Disposition: inline


--hFoqtL9VL6EAg4Q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:04:31AM +0100, Alain Volmat wrote:
> The MIPID02 can use up to 2 data lanes which leads to having a maximum
> item number of 3 for the lane-polarities since this also contains the
> clock lane.
>=20
> CC: stable@vger.kernel.org
> Fixes: c2741cbe7f8a ("dt-bindings: media: st,stmipid02: Convert the text =
bindings to YAML")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.ya=
ml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> index b68141264c0e9fe0e530ce3b06fa3434fa712b38..4d40e75b4e1efff673647dff7=
bf984c89abca4cf 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> @@ -71,7 +71,7 @@ properties:
>                  description:
>                    Any lane can be inverted or not.
>                  minItems: 1
> -                maxItems: 2
> +                maxItems: 3
> =20
>              required:
>                - data-lanes
>=20
> --=20
> 2.34.1
>=20

--hFoqtL9VL6EAg4Q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uWGAAKCRB4tDGHoIJi
0vx+AP42lFkGgFbVvjv8uVhpy2pgbgrr0qVFB5kRBVK83SQAOQEA+V9bGwFArr3m
dzI4HLmfDst/Jxk9UYibYgg4vtsczA0=
=Rwgi
-----END PGP SIGNATURE-----

--hFoqtL9VL6EAg4Q/--

--===============7487807862760257729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7487807862760257729==--
