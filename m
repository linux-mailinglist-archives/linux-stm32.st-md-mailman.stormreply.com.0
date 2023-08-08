Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B657738A3
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 09:40:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EE48C6B469;
	Tue,  8 Aug 2023 07:40:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86805C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 07:40:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64D4F62420;
 Tue,  8 Aug 2023 07:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A0AC433C7;
 Tue,  8 Aug 2023 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691480403;
 bh=eeHnU9sbaREHfqMBo/78Xdyc8QmRfoP3LwM2oF3Vyok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z+hgCruQm2uu/S7DddPGDxVKQgZvYiSoMBPLPwLN1VBSNtr1u+085A9QUxiiQx+JK
 ihi46jANzuFJVh09X1hBEsF3bxP2GSt83pj3cuGRAyOe9h6LM9eXBxkutgo1IgrvDL
 f3yo2TgB2qyRua3/sXAXbwzhVMdhV8sqzKqIYPA1Xj8Or1oo37VODb2bCuePorzrNF
 34O/jZcESdCYCDASlx6PMDnfLROZAlprRs/E8YvlwqZEn0AIsxOIgA0BRAWg72/yUq
 jVSwW/JCR38PnZWOuHI+BA/nUboHh4EBAouw3W1ljvmg6T6MCcVWNqxKj3/kHuX5QR
 g9kS4Mu6EAj8A==
Date: Tue, 8 Aug 2023 08:39:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230808-clapper-corncob-0af7afa65752@spud>
References: <20230807164151.1130-1-jszhang@kernel.org>
 <20230807164151.1130-10-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230807164151.1130-10-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 09/10] dt-bindings: net: snps,
 dwmac: add per channel irq support
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
Content-Type: multipart/mixed; boundary="===============5685059668047826884=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5685059668047826884==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KvLkMguropyELtMw"
Content-Disposition: inline


--KvLkMguropyELtMw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 12:41:50AM +0800, Jisheng Zhang wrote:
> The IP supports per channel interrupt, add support for this usage case.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 5d81042f5634..5a63302ad200 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -109,6 +109,7 @@ properties:
>        - description: The interrupt that occurs when Rx exits the LPI sta=
te
>        - description: The interrupt that occurs when Safety Feature Corre=
ctible Errors happen
>        - description: The interrupt that occurs when Safety Feature Uncor=
rectible Errors happen
> +      - description: All of the rx/tx per-channel interrupts
> =20
>    interrupt-names:
>      minItems: 1
> @@ -118,6 +119,38 @@ properties:
>        - const: eth_lpi
>        - const: sfty_ce
>        - const: sfty_ue
> +      - const: rx0
> +      - const: rx1
> +      - const: rx2
> +      - const: rx3
> +      - const: rx4
> +      - const: rx5
> +      - const: rx6
> +      - const: rx7
> +      - const: rx8
> +      - const: rx9
> +      - const: rx10
> +      - const: rx11
> +      - const: rx12
> +      - const: rx13
> +      - const: rx14
> +      - const: rx15
> +      - const: tx0
> +      - const: tx1
> +      - const: tx2
> +      - const: tx3
> +      - const: tx4
> +      - const: tx5
> +      - const: tx6
> +      - const: tx7
> +      - const: tx8
> +      - const: tx9
> +      - const: tx10
> +      - const: tx11
> +      - const: tx12
> +      - const: tx13
> +      - const: tx14
> +      - const: tx15

I don't think Rob's comment about having added 2 interrupts but 32
interrupt names has been resolved.
Did you actually test putting this many interrupts into a node?
AFAICT, any more than 6 will cause complaints.

Thanks,
Conor.

--KvLkMguropyELtMw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNHxTgAKCRB4tDGHoIJi
0onpAPsG6snh0PH1bQ597oct8Uh4jQLMK5o7U0UogD2+jX8qKQD+Mew24QNaxdd5
CIffFZC7Y1NgpuTfzG6Dej4xrzYwBAU=
=WzEI
-----END PGP SIGNATURE-----

--KvLkMguropyELtMw--

--===============5685059668047826884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5685059668047826884==--
