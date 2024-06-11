Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC861904359
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 20:16:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BE3BC712A3;
	Tue, 11 Jun 2024 18:16:40 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CFBFC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 18:16:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0855CE0D07;
 Tue, 11 Jun 2024 18:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08239C2BD10;
 Tue, 11 Jun 2024 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718129789;
 bh=QhiccRUa8nUsNwUtkF0DHVHRaqAFjgzP5RrKB+6T1JY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pEPxnzB8t7dMfbQEPHmexKo0L4OWfieS9RXtZ4ZFc3/2fSzLcXqPQepAcvTrqtHLd
 swqvZEK56Eai0ZNq9HFFFks6VlBoARyn+FIZNySty+FPp2GocnCdVhAkdDnOqpDRQs
 wq1MUYKD6OWlM+vNeRH3hkV8OrzY7PU5ZVj/Ywnk0A2sbb0MsoC+LXX9uyoryiqRgg
 Z7HVuzfDTubzLDmHXjYRWFW5rqFEtNiHOB3Au83wdMtTIR7+7QxfqhxnmAGVN2GAp3
 A1lCO5FZvpfLxspUkn5zrF+iLAmcXC3F/AH7mhrHGwAAyu5UIKGM6C4/DfmLcDArhI
 NoX7FEHV+mhuA==
Date: Tue, 11 Jun 2024 19:16:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <20240611-sample-remold-a75d6f6515d8@spud>
References: <20240611161958.469209-1-valentin.caron@foss.st.com>
 <20240611161958.469209-2-valentin.caron@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240611161958.469209-2-valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: rtc: stm32: introduce
 new st, stm32mp25-rtc compatible
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
Content-Type: multipart/mixed; boundary="===============0632331800823344577=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0632331800823344577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KKwSS3olauYNtTau"
Content-Disposition: inline


--KKwSS3olauYNtTau
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 06:19:57PM +0200, Valentin Caron wrote:
> Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.
>=20
> Difference is that stm32mp25 SoC implements a triple protection on RTC
> registers:
> - Secure bit based protection
> - Privileged context based protection
> - Compartment ID filtering based protection
> This driver will now check theses configurations before probing to avoid
> exceptions and fake reads on register.
>=20
> Link: https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-=
advanced-armbased-3264bit-mpus-stmicroelectronics.pdf#page=3D4081
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Do=
cumentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> index 4703083d1f11f..65a8a93ef5753 100644
> --- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> @@ -15,6 +15,7 @@ properties:
>        - st,stm32-rtc
>        - st,stm32h7-rtc
>        - st,stm32mp1-rtc
> +      - st,stm32mp25-rtc
> =20
>    reg:
>      maxItems: 1
> @@ -90,7 +91,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: st,stm32mp1-rtc
> +            anyOf:
> +              - const: st,stm32mp1-rtc

anyOf:
  - const: foo
  - const: bar

is just the same as using
enum:
  - foo
  - bar

Thanks,
Conor.

> +              - const: st,stm32mp25-rtc
> =20
>      then:
>        properties:
> --=20
> 2.25.1
>=20

--KKwSS3olauYNtTau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmiUeAAKCRB4tDGHoIJi
0vaeAP40eEjU5fOjvpKKJDIRxVKhVBgtjG8rxLq1chsBTt6ukQEAoXjCusbWQHYQ
5OMNChI7TBH/+N8h7CaL9XazCcw9CwY=
=91pq
-----END PGP SIGNATURE-----

--KKwSS3olauYNtTau--

--===============0632331800823344577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0632331800823344577==--
