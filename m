Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C17F6539
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 18:20:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16A28C6B476;
	Thu, 23 Nov 2023 17:20:57 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE1A0C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 17:20:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 38886B82EB1;
 Thu, 23 Nov 2023 17:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC74C433C8;
 Thu, 23 Nov 2023 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700760054;
 bh=HZ2it2SDpc8JXOsPY263SXF+iKCLC0kpnH0sDhz3fiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TauTI7yXz/EXK19sGpqXQIgeQSXWk/7tN1aZXr8i97YqI4fGEAFMoL4QD4jgJgLoO
 BDUnxt6Ty380NwBjw6btK2JI8oU/fWfEX1mIDN9xTa1IPdYpmJ0BEVFJfSZEb+Szsz
 sDhkyR8NQ+YMweQNFJrrr+0qSqt6YT5eU43vEWKLq/Dh10SFwUCLj4vuBn10U8gCAV
 lWPwy2WeOTnTOTGnz+33/XXlDlx7vLbna1/0ygieyz62GwgVJWnST9zalRgrdKMkXR
 RN0+I4MdzkOTOVf8sO+xANqjUk0MqpAGi98RRZrv5bWgbwRZwJh4dB2XXDjfaNOgIq
 KWjPCPfKAm2jw==
Date: Thu, 23 Nov 2023 17:20:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Message-ID: <20231123-operable-frustrate-6c71ab0dafbf@spud>
References: <20231123-dwmac-rk_phy_wol-v1-0-bf4e718081b9@wolfvision.net>
 <20231123-dwmac-rk_phy_wol-v1-1-bf4e718081b9@wolfvision.net>
MIME-Version: 1.0
In-Reply-To: <20231123-dwmac-rk_phy_wol-v1-1-bf4e718081b9@wolfvision.net>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC WIP 1/2] dt-bindings: net:
 rockchip-dwmac: add rockchip, phy-wol property
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
Content-Type: multipart/mixed; boundary="===============7092841783231784412=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7092841783231784412==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bTHzhB7hdNw7bvKU"
Content-Disposition: inline


--bTHzhB7hdNw7bvKU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 01:14:13PM +0100, Javier Carrasco wrote:
> This property defines if PHY WOL is preferred. If it is not defined, MAC
> WOL will be preferred instead.
>=20
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/=
Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 70bbc4220e2a..fc4b02a5a375 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -91,6 +91,12 @@ properties:
>        The phandle of the syscon node for the peripheral general register=
 file.
>      $ref: /schemas/types.yaml#/definitions/phandle
> =20
> +  rockchip,phy-wol:
> +    type: boolean
> +    description:
> +      If present, indicates that PHY WOL is preferred. MAC WOL is prefer=
red
> +      otherwise.

Although I suspect this isn't, it sounds like software policy. What
attribute of the hardware determines which is preferred?

--bTHzhB7hdNw7bvKU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+J8AAKCRB4tDGHoIJi
0myVAQCJk+QzYHl+/O3ThabjS9+O5WSkS3WxXLaSPMYQlO5sSAEA4U1Db0x5jGIy
glMeVXSf9fk0MYLSsWmvHvpZkUexmwI=
=CSe+
-----END PGP SIGNATURE-----

--bTHzhB7hdNw7bvKU--

--===============7092841783231784412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7092841783231784412==--
