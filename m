Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WARAMTKPDGpCjAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 18:26:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783C5824FD
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 18:26:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D12EC8F294;
	Tue, 19 May 2026 16:26:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEE43C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 16:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6A02042AD5;
 Tue, 19 May 2026 16:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FDCC2BCB3;
 Tue, 19 May 2026 16:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1779207983;
 bh=Qy8QoqcoKmC+wIgqZfA1zyTVHnYh+FOeAPm5arCsYp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cRinJTw+v12QFhn920KBVhuNR6fkaX0Oedb+lxn663iShQNZAzFOzLkkWuZfxFrKq
 GnnlaBL5vrv1ULvSS3lNSEGO7412CrOfWcmkbwq3QX8DnR7TgZEU4j/EVkvUbtt3z/
 rrp5ZJ3p8vH/3H5drTsTq/MDcqk8dgvc5OltqScXp8UQfPTfethD9A+SZ7HqJt42Sl
 +pzjKx7hWynYsu+UV9Rrp3+A1PubnedhgK0hbJt2avrrIyIpSsjoroyVx7xyvspaFd
 JlpYnUJxJOuMtiF8e3qjHyTwKt+Yfwc1a68k655NbkKVO0Xfug555iTIJDCntq0xNF
 1uqsJppbYkNXw==
Date: Tue, 19 May 2026 17:26:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20260519-darn-defile-a3d944c0dba3@spud>
References: <20260519101436.111476-1-minda.chen@starfivetech.com>
 <20260519101436.111476-3-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260519101436.111476-3-minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v4 2/5] dt-bindings: net: starfive,
 jh7110-dwmac: Add jhb100 support
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
Content-Type: multipart/mixed; boundary="===============7517840014726753372=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:minda.chen@starfivetech.com,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,lunn.ch,google.com,kernel.org,gmail.com,redhat.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,microchip.com:email]
X-Rspamd-Queue-Id: 6783C5824FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============7517840014726753372==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HT5hQBTU+Tnwer0i"
Content-Disposition: inline


--HT5hQBTU+Tnwer0i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 06:14:33PM +0800, Minda Chen wrote:
> The jhb100 GMAC still using Synopsys designware GMAC core.
> hardware features are similar with jh7100.
> Add jhb100 GMAC compatible and reset, interrupts features.
> jhb100 dwmac has only one reset signal and one interrupt
> line.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 51 ++++++++++++++-----
>  1 file changed, 37 insertions(+), 14 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.=
yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index 0d1962980f57..06aeaa0f6f00 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -30,6 +30,10 @@ properties:
>        - items:
>            - const: starfive,jh7110-dwmac
>            - const: snps,dwmac-5.20
> +      - items:
> +          - const: starfive,jhb100-dwmac
> +          - const: starfive,jh7110-dwmac
> +          - const: snps,dwmac-5.20
> =20
>    reg:
>      maxItems: 1
> @@ -107,20 +111,39 @@ allOf:
>            contains:
>              const: starfive,jh7110-dwmac
>      then:
> -      properties:
> -        interrupts:
> -          minItems: 3
> -          maxItems: 3
> -
> -        interrupt-names:
> -          minItems: 3
> -          maxItems: 3
> -
> -        resets:
> -          minItems: 2
> -
> -        reset-names:
> -          minItems: 2
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              const: starfive,jhb100-dwmac
> +      then:
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          interrupt-names:
> +            const: macirq
> +
> +          resets:
> +            maxItems: 1
> +
> +          reset-names:
> +            const: stmmaceth
> +      else:
> +        properties:
> +          interrupts:
> +            minItems: 3
> +            maxItems: 3
> +
> +          interrupt-names:
> +            minItems: 3
> +            maxItems: 3
> +
> +          resets:
> +            minItems: 2
> +
> +          reset-names:
> +            minItems: 2
> =20
>  unevaluatedProperties: false
> =20
> --=20
> 2.17.1
>=20
>=20

--HT5hQBTU+Tnwer0i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagyPKgAKCRB4tDGHoIJi
0sJbAP9qcQjjYmdzs3mA7s2jgBwSRmbrpPIutubexecBL2+LAQD/Tubz2r6RkcOF
8ENzU9A2gnZrpCSUsB7rCh4vpTVEMAw=
=w5ur
-----END PGP SIGNATURE-----

--HT5hQBTU+Tnwer0i--

--===============7517840014726753372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7517840014726753372==--
