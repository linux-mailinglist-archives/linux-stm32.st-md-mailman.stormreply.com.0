Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2C776685
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Aug 2023 19:38:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06D67C6B472;
	Wed,  9 Aug 2023 17:38:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 879A3C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Aug 2023 17:38:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BDB56430D;
 Wed,  9 Aug 2023 17:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF67C433C7;
 Wed,  9 Aug 2023 17:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691602721;
 bh=JEJkyDA9mNcPNMW2BuJGF6PgKkgkGalfSfXFkQWZKhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tq1eoIkfdHy3ArOqTDn4u16YGaskMie+zV/Px2pdMO+p7mwSk2jIcXc84UbQ3naLy
 AZL/dX+Xl1TrhwZLNDXZbzjQgkouCcptFeZQlqWaIYf+4HY0hgy0PqKYxONzT3JbvU
 1YRJbD1aqnZZ/1vN97f7npFMQjU8q4HCvZfeLB38+JHNub2soLcZ+cnTuS0muSkMSA
 U5zu5gNFUdIx+ghF0n8KC7XLYXAT4xHnKhyFqB8gxeWJl9S/yD8YBTVzj6KGq8p1Xn
 TXJtNajuj2YmQ2342YfUNUZ/8RFSooDTJImjgBtyd0Z1MVGJEXXHdlZtriKkmMZPDx
 0j0mY4L9sRysQ==
Date: Wed, 9 Aug 2023 18:38:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230809-scabby-cobweb-bb825dffb309@spud>
References: <20230809165007.1439-1-jszhang@kernel.org>
 <20230809165007.1439-10-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230809165007.1439-10-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 09/10] dt-bindings: net: snps,
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
Content-Type: multipart/mixed; boundary="===============5301590331794040882=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5301590331794040882==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xjvlQWsUfSJ189eD"
Content-Disposition: inline


--xjvlQWsUfSJ189eD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 12:50:06AM +0800, Jisheng Zhang wrote:
> The IP supports per channel interrupt, add support for this usage case.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

I do not see a response to
<https://lore.kernel.org/all/20230808-clapper-corncob-0af7afa65752@spud/>
in my mailbox or on lore, nor is there any changes in v3 on this front.

Thanks,
Conor.

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
> =20
>    clocks:
>      minItems: 1
> --=20
> 2.40.1
>=20

--xjvlQWsUfSJ189eD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNPPHAAKCRB4tDGHoIJi
0uDFAP4qH8Xnk1lWdOwlIW0fWCJyaXgG1F8zPUQ2Gsb4MgpJXAD/aFtaJoIkYfZ/
21lPuNeab/ZdCafUEILwlmTgvCUFsw0=
=r6X8
-----END PGP SIGNATURE-----

--xjvlQWsUfSJ189eD--

--===============5301590331794040882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5301590331794040882==--
