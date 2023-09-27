Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 368677B0774
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Sep 2023 16:59:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6FEBC6A60C;
	Wed, 27 Sep 2023 14:59:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6ABCC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 14:59:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 41D43618C5;
 Wed, 27 Sep 2023 14:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD49C433C8;
 Wed, 27 Sep 2023 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695826778;
 bh=J5WMHeQmOYa9DaNiL6kj1L9JZ8CZSajg8MxP1uoMKSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQmBq3PQj4PKvUzkHXkkFH9/JcpmiCxSZ2WWd1Rqwr/OIjrCqal+CfgHOkmWb/dEw
 z4+x6qdDG1mLyQF1GXNZslivHxCxIloJMsAzgePtAAQ8SoVJdqWbknQZMZEbb3v1l/
 MpGF3+38TNA9lMfj4wVNYQQGgW9CpoKVnB1yM9FGp+erUuI36ngPz0DaUb8+uaw7cm
 7dwzy7GrXYHz8q+qdee56LVDhvoAPsSEgmDWy6ruOMr/KQasD81JDXYCMqGed26LsW
 MP5UdZSko+ftXTax8zedAE2iRfR4+hQbZGEyw1CoAgRRWh/1MYXIsPmrizuO4uZDpg
 HI1KsWr0aDtwA==
Date: Wed, 27 Sep 2023 15:59:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <20230927-dense-scoundrel-22ede0e27973@spud>
References: <20230927122928.22033-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230927122928.22033-1-ansuelsmth@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Simon Horman <horms@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next PATCH 1/2] dt-bindings: net: snps,
 dwmac: DMA Arbitration scheme
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
Content-Type: multipart/mixed; boundary="===============7016525794487140890=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7016525794487140890==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="00CqfJ64cfG+S8hl"
Content-Disposition: inline


--00CqfJ64cfG+S8hl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 02:29:27PM +0200, Christian Marangi wrote:
> Document new binding snps,arbit to program the DMA to use Arbitration
> scheme. (Rx has priority over Tx)
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 5c2769dc689a..4499f221c29b 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -442,6 +442,12 @@ properties:
>      description:
>        Use Address-Aligned Beats
> =20
> +  snps,arbit:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Program the DMA to use Arbitration scheme.
> +      (Rx has priority over Tx)

Can you explain please what makes this a property of the hardware, or
otherwise makes it suitable for inclusion in DT?

> +
>    snps,fixed-burst:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> --=20
> 2.40.1
>=20

--00CqfJ64cfG+S8hl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRRDVAAKCRB4tDGHoIJi
0vXYAQD67f4By+s5MP5vlHvV6WZ1uTkpsDKRXlhwiGwhPFF9aAD8CRBHJ1ufdl98
4zTcZIm8hVr0NdUOXt28M5x1qXtgmgg=
=JEy+
-----END PGP SIGNATURE-----

--00CqfJ64cfG+S8hl--

--===============7016525794487140890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7016525794487140890==--
