Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2138851CBF
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 19:30:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91157C6C83D;
	Mon, 12 Feb 2024 18:30:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48F68C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 18:30:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0EB1E60FFD;
 Mon, 12 Feb 2024 18:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368B8C433C7;
 Mon, 12 Feb 2024 18:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707762633;
 bh=6WiiTc2GDFm9N1l5HMkfYx0/LzGK7veAUDVvhiMnnQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dNk7OdK5j2JejmjY9K8x1whAEoB5vmQrby/sMV5spd00ZhEXp7xVF0m2KWdQNIxR7
 l2lXc1+Z0nR8cKLHDq4xzDm3UqMCMjKJUF+YDCGMtAs5smjS11kutL4/fYZrB/MFK+
 bgNJiHV2J/hgl92rZhVaX72PXhSh/EgrDnMzSREznDqgVo34Zy4QT15p5zRqhrYQCD
 ZGm0fk4+iNwUY48q+rAHyXhwF9S6lgavloXRGpAZDpJ/eDTviPmXHR5AbyRvy3VWk/
 otKMRaSHE4y/cRuOz3UNZOH6NcbdBObq0hmGPrgQW69qRNTnkpHsVqhDCc/xC+OXiu
 TDnxKbNBufdUg==
Date: Mon, 12 Feb 2024 18:30:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20240212-dial-strangle-0b6861b35ec9@spud>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-2-christophe.kerello@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240212174822.77734-2-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 01/12] dt-bindings: memory-controller: st,
 stm32: add MP25 support
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
Content-Type: multipart/mixed; boundary="===============5468757927843398981=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5468757927843398981==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YkxopxwhiToMlaYp"
Content-Disposition: inline


--YkxopxwhiToMlaYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 06:48:11PM +0100, Christophe Kerello wrote:
> Add a new compatible string to support MP25 SOC.

You're missing an explanation here as to why this mp25 is not compatible
with the mp1.

Cheers,
Conor.

>=20
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm3=
2-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,s=
tm32-fmc2-ebi.yaml
> index 14f1833d37c9..12e6afeceffd 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> @@ -23,7 +23,9 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: st,stm32mp1-fmc2-ebi
> +    enum:
> +      - st,stm32mp1-fmc2-ebi
> +      - st,stm32mp25-fmc2-ebi
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.25.1
>=20

--YkxopxwhiToMlaYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcpjxAAKCRB4tDGHoIJi
0jlEAP40gxiapecNCdq4bMYSWey8hRA2SHHEVuZiljTNDaCr1gD+PirbU2q0jSAQ
dUblhSmGOo/z/tonrLaHyqgGbMx3ng0=
=i0Rq
-----END PGP SIGNATURE-----

--YkxopxwhiToMlaYp--

--===============5468757927843398981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5468757927843398981==--
