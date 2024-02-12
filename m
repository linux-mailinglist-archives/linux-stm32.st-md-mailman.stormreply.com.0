Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD0E851CD3
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 19:33:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8904C6C83D;
	Mon, 12 Feb 2024 18:33:18 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F146C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 18:33:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5972CCE13B7;
 Mon, 12 Feb 2024 18:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052C8C433C7;
 Mon, 12 Feb 2024 18:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707762794;
 bh=DTRybV3KMIhH9nFsPr7JEPKWMu1YNivRlPVO0kxFIiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WWcM4sGbpiBnCAUBh2PddGbGin4HS+JBNofityp2fupukmpyHsOs7EiAa+B8FaxoX
 umxolyJDbeqDhf0mToD38sZ/Pof6zsgMByK1YBv5MxdJznwH8T5wGKTbb5ln5TMjgo
 D0octNIsY6GRkNtS7TFkPdY6NZhiV+nwR+WAtBPmVwOZgm8J5XaNnqE9sxh4JLWgUS
 m+gNn47PiYAgVwl/gYwF5CIq4OrjuYrgmgtdeqed3+Rm/9aDDrzgNj9tIDj9alXKIJ
 o35hE/mqajrE7UxjmxYgZ7dPgskafzSutk1vYx7F+sM1QaLRuAp0irh2bA2bSYnH/0
 StDyTiQv8O6OA==
Date: Mon, 12 Feb 2024 18:33:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20240212-chemicals-skinny-18eda1cfe781@spud>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-3-christophe.kerello@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240212174822.77734-3-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 02/12] dt-bindings: memory-controller: st,
 stm32: add 'power-domains' property
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
Content-Type: multipart/mixed; boundary="===============1002911175480654621=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1002911175480654621==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j0T5UxTZF6zrutiv"
Content-Disposition: inline


--j0T5UxTZF6zrutiv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 06:48:12PM +0100, Christophe Kerello wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>=20
> On STM32MP25 SOC, STM32 FMC2 memory controller is in a power domain.
> Allow a single 'power-domains' entry for STM32 FMC2.

This should be squashed with patch 1, since they both modify the same
file and this power-domain is part of the addition of mp25 support.

If the mp1 doesn't have power domains, shouldn't you constrain the
property to mp25 only?

Cheers,
Conor.

>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm3=
2-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,s=
tm32-fmc2-ebi.yaml
> index 12e6afeceffd..84ac6f50a6fc 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> @@ -36,6 +36,9 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  power-domains:
> +    maxItems: 1
> +
>    "#address-cells":
>      const: 2
> =20
> --=20
> 2.25.1
>=20

--j0T5UxTZF6zrutiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcpkZQAKCRB4tDGHoIJi
0tdKAQDHXMMk62WtYxljI4EYVK5zcDC6VAMJ9PBRjLb5XKG6fAD9FkStE7CE4iEM
IAf7Cd+5U9DpPVQ7o7X7sfH21yTKLAk=
=tk2s
-----END PGP SIGNATURE-----

--j0T5UxTZF6zrutiv--

--===============1002911175480654621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1002911175480654621==--
