Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD12851CEC
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 19:38:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40F2BC6C83D;
	Mon, 12 Feb 2024 18:38:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A816C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 18:38:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D9A4961062;
 Mon, 12 Feb 2024 18:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B78EC433C7;
 Mon, 12 Feb 2024 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707763104;
 bh=DB+QxJu9d3ZS9rmjqca4J9xEJVvpvRrU2w7NHJpSp2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EMUyCia9MG/ccuDFUpmDHiaLgC+igJvueSb2uGUiW+TWBq+vBFJgv8cUhmQuvL+pz
 5iUT2b3vi+tdzkMXYYrc1B47l5j0QmWiB9PXCy926EZDb90ffrj4N8HGa+6ELm+baa
 d1O2E1uY04FIGeZwOqJkdmUtPJLY5anr/dqnPnvxGLeRiKmLD0fwaP48UDg+6JQpGI
 kmvpJ2wegkC+GvoCO932G8UHkEkGm1sJGgCoev1AUcQOsunK5XzdWaUaXPYSOGUYqp
 p9S5u9N0bEQx6QB8D9+o/mABVRhhIOFXR2yemqFi5EEwnKE1jChO2G6vNh5tKdRLgQ
 16/DAqRwQIcPg==
Date: Mon, 12 Feb 2024 18:38:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20240212-squeak-mortality-5a53a4d1039c@spud>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-9-christophe.kerello@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240212174822.77734-9-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 08/12] dt-bindings: mtd: st,
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
Content-Type: multipart/mixed; boundary="===============6425095952986376718=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6425095952986376718==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5x9qetWChxMtvEey"
Content-Disposition: inline


--5x9qetWChxMtvEey
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 06:48:18PM +0100, Christophe Kerello wrote:
> Add 2 new compatible strings to support MP25 SOC.
> MP25 SOC supports up to 4 chip select.

Again, please explain why the new device is not compatible with the
existing ones. Also, please explain why two compatibles are required for
the mp25.

Thanks,
Conor.

>=20
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  .../bindings/mtd/st,stm32-fmc2-nand.yaml      | 58 ++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yam=
l b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> index e72cb5bacaf0..33a753c8877b 100644
> --- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> @@ -14,10 +14,12 @@ properties:
>      enum:
>        - st,stm32mp15-fmc2
>        - st,stm32mp1-fmc2-nfc
> +      - st,stm32mp25-fmc2
> +      - st,stm32mp25-fmc2-nfc
> =20
>    reg:
>      minItems: 6
> -    maxItems: 7
> +    maxItems: 13
> =20
>    interrupts:
>      maxItems: 1
> @@ -92,6 +94,60 @@ allOf:
>              - description: Chip select 1 command
>              - description: Chip select 1 address space
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp25-fmc2
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Registers
> +            - description: Chip select 0 data
> +            - description: Chip select 0 command
> +            - description: Chip select 0 address space
> +            - description: Chip select 1 data
> +            - description: Chip select 1 command
> +            - description: Chip select 1 address space
> +            - description: Chip select 2 data
> +            - description: Chip select 2 command
> +            - description: Chip select 2 address space
> +            - description: Chip select 3 data
> +            - description: Chip select 3 command
> +            - description: Chip select 3 address space
> +
> +        clocks:
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +      required:
> +        - clocks
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp25-fmc2-nfc
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Chip select 0 data
> +            - description: Chip select 0 command
> +            - description: Chip select 0 address space
> +            - description: Chip select 1 data
> +            - description: Chip select 1 command
> +            - description: Chip select 1 address space
> +            - description: Chip select 2 data
> +            - description: Chip select 2 command
> +            - description: Chip select 2 address space
> +            - description: Chip select 3 data
> +            - description: Chip select 3 command
> +            - description: Chip select 3 address space
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.25.1
>=20

--5x9qetWChxMtvEey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcplmwAKCRB4tDGHoIJi
0qEaAQC6FzMEWUZon7Rbw9b51wIt52mF6FLV+DfSgClzOalRFAEAiDB3FOanV76n
XJT9NErVw/coKCkhHjtRx02Cv9xOtQI=
=9ijQ
-----END PGP SIGNATURE-----

--5x9qetWChxMtvEey--

--===============6425095952986376718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6425095952986376718==--
