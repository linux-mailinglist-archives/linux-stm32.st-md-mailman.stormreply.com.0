Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA17A773895
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 09:28:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81CF4C6B469;
	Tue,  8 Aug 2023 07:28:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E051C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 07:28:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 399E4623FE;
 Tue,  8 Aug 2023 07:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95548C433C8;
 Tue,  8 Aug 2023 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691479702;
 bh=RdAScwYlQbKFjCynaCzGyIqpOLXi5HTfM61jXRC5qNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SCaX5vfTNteeYwn0mRM/82W4iAZTVE0CK0WPc2s4D0/jQVxYDhjAXdCc9hlJ/Q1K/
 tTw9BwQ8fdS9SXQFjmL17IjhfNatxVIZ4STGwRiV6PZ6ccDfkMmFBaMewlLaBnJUeb
 QH/WiBN6a779Q6E2Dtsuao3G9JkMGPoIeojf9TPHx6qOjwcP/76JvCR79In2hbGAw1
 pltGnW0Mz2Y7Y8g41j1d/F2xrh5OKceWpuu2++vp0Wun9d0NA3f2IQ3pDptmCBACLT
 jMevdDnVSNqzO+RsmsQF2JNxrV9UyagzP6cDzvfUjwZI4n2IacakOdnIpCKLUfNy1I
 nDA7flO6HOVlA==
Date: Tue, 8 Aug 2023 08:28:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230808-guidance-propose-407154f8bff4@spud>
References: <20230807164151.1130-1-jszhang@kernel.org>
 <20230807164151.1130-8-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230807164151.1130-8-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 07/10] dt-bindings: net: snps,
 dwmac: add safety irq support
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
Content-Type: multipart/mixed; boundary="===============8579897366254705646=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8579897366254705646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CcVArbuGnTOxANs0"
Content-Disposition: inline


--CcVArbuGnTOxANs0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 12:41:48AM +0800, Jisheng Zhang wrote:
> The snps dwmac IP support safety features, and those Safety Feature
> Correctible Error and Uncorrectible Error irqs may be separate irqs.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index ddf9522a5dc2..5d81042f5634 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -107,6 +107,8 @@ properties:
>        - description: Combined signal for various interrupt events
>        - description: The interrupt to manage the remote wake-up packet d=
etection
>        - description: The interrupt that occurs when Rx exits the LPI sta=
te
> +      - description: The interrupt that occurs when Safety Feature Corre=
ctible Errors happen
> +      - description: The interrupt that occurs when Safety Feature Uncor=
rectible Errors happen
> =20
>    interrupt-names:
>      minItems: 1
> @@ -114,6 +116,8 @@ properties:
>        - const: macirq
>        - enum: [eth_wake_irq, eth_lpi]
>        - const: eth_lpi
> +      - const: sfty_ce
> +      - const: sfty_ue

Did I not already ack this?

--CcVArbuGnTOxANs0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNHukQAKCRB4tDGHoIJi
0q8sAQDdMaiGwRgtoaOMOSoYM8rEhQWRBaqsZ9Sqog8hWbs5CAEAyV2Y7L7++Dz6
xHP/9iGKo8Kh8UMNTMtcAUByYyRAXA0=
=0Pro
-----END PGP SIGNATURE-----

--CcVArbuGnTOxANs0--

--===============8579897366254705646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8579897366254705646==--
