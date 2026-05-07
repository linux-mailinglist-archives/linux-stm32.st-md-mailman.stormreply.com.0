Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CITCASjP/GlhTwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 19:43:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8064ED01F
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 19:43:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3073AC8F289;
	Thu,  7 May 2026 17:43:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 464E8C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 17:43:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E3C0241791;
 Thu,  7 May 2026 17:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02438C2BCC4;
 Thu,  7 May 2026 17:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778175779;
 bh=Hdn4fgFuvQvR+BcNGi93NiwRUkK+Dd4Y63XEjaXRKw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gkv6slKm5dDmlFDare54WePGajFEFla4RICXDY9tA7CbCdkZr1K9DDGNZzizOPhkQ
 xw+dnscnNv8ATDBpxd60UsgJnAfhyhldBfBayLDyw+XEKyJqFvH3Ihp5+CPpwASXt/
 AC0x+hkl5PlY96HEC3JpQZ4FC2Uxh+jLe2xeM7Ny+zPeh1RrddlHWJBtalL38NXjNe
 +2NzmCWIcoaMNPdkevFW2hMoF99WjNw7PNHMn+JJ6ejP5n7jgNuwfY2a61wfJ3GdL7
 RUhwTBpO8lDWeLgMFCJH85fEdtt9z6OVvFMyvN22+NvZ20vCcYuNv6j78B2+bWJFYv
 aGVPmvjdQKW5A==
Date: Thu, 7 May 2026 18:42:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20260507-annotate-cleat-52614476a8f7@spud>
References: <20260507094115.8355-1-minda.chen@starfivetech.com>
 <20260507094115.8355-4-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260507094115.8355-4-minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v3 3/5] dt-bindings: net: starfive,
 jh7110-dwmac: Add jhb100 sgmii rx clk
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
Content-Type: multipart/mixed; boundary="===============5208419619180842788=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 9D8064ED01F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:minda.chen@starfivetech.com,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,lunn.ch,google.com,kernel.org,gmail.com,redhat.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.661];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,starfivetech.com:email]
X-Rspamd-Action: no action


--===============5208419619180842788==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="emyOGXNpEJM9Td6n"
Content-Disposition: inline


--emyOGXNpEJM9Td6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 05:41:13PM +0800, Minda Chen wrote:
> jhb100 SGMII interface tx/rx mac clock is split and require to
> set clock rate in 10M/100M/1000M speed. So dts need to add a
> new rx clock in code, dts and dt binding doc.
> So in jhb100 SGMII interface contain 6 clocks, RMII/RGMII
> interface still contail 5 clocks.

Why is this not being done in the commit adding the jhb100 in the first
place?

>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 42 ++++++++++++++++---
>  1 file changed, 36 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.=
yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index 06aeaa0f6f00..af160a8dedb8 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -39,20 +39,18 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> +    minItems: 5
>      items:
>        - description: GMAC main clock
>        - description: GMAC AHB clock
>        - description: PTP clock
>        - description: TX clock
>        - description: GTX clock
> +      - description: SGMII RX clock
> =20
>    clock-names:
> -    items:
> -      - const: stmmaceth
> -      - const: pclk
> -      - const: ptp_ref
> -      - const: tx
> -      - const: gtx
> +    minItems: 5
> +    maxItems: 6
> =20
>    starfive,tx-use-rgmii-clk:
>      description:
> @@ -99,6 +97,18 @@ allOf:
>            minItems: 2
>            maxItems: 2
> =20
> +        clocks:
> +          minItems: 5
> +          maxItems: 5

This can just be "maxItems: 5", since minItems is set outside the
conditional to 5.

> +
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: pclk
> +            - const: ptp_ref
> +            - const: tx
> +            - const: gtx
> +
>          resets:
>            maxItems: 1
> =20
> @@ -111,6 +121,26 @@ allOf:
>            contains:
>              const: starfive,jh7110-dwmac
>      then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 6

Remove these constraints, since they don't do anything more than the
outside ones do.

> +
> +        clock-names:
> +          oneOf:
> +            - items:
> +                - const: stmmaceth
> +                - const: pclk
> +                - const: ptp_ref
> +                - const: tx
> +                - const: gtx
> +            - items:
> +                - const: stmmaceth
> +                - const: pclk
> +                - const: ptp_ref
> +                - const: tx
> +                - const: gtx
> +                - const: sgmii_rx

Can't you just leave this list outside the conditional section, and add
the extra item to the end? The only difference appears to be the
sgmii_rx clock, and it's at the end.

I'm also not really convinced that this flexibility is required, unless
there are some controllers on the platform that do not support sgmii.

pw-bot: changes-requested

Cheers,
Conor.

>        if:
>          properties:
>            compatible:
> --=20
> 2.17.1
>=20

--emyOGXNpEJM9Td6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzPHgAKCRB4tDGHoIJi
0qWPAP48Jg7iBluYVxnNt04nxXmKXO247a10w2+hLujxSn9HWgEA9gbP8K+wMHbv
4T0T79bjT/5vtx7DKuvOy2+uUcAKtAE=
=2Yti
-----END PGP SIGNATURE-----

--emyOGXNpEJM9Td6n--

--===============5208419619180842788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5208419619180842788==--
