Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPvaH3RWA2qQ4wEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 18:33:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E5B524C51
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 18:33:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5213CC8F28E;
	Tue, 12 May 2026 16:33:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE4E2C8F287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 16:33:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9A8FC40132;
 Tue, 12 May 2026 16:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A860BC2BCB0;
 Tue, 12 May 2026 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778603631;
 bh=fXB28kVuTkDkMqgoAEx3TNG/xeQuDfpRTyYYR9Bcoz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GAWe0xzNZftlm2rMK+5z7ZTR1c1Rli62/A+p/enKDIBpmsZl+1QinD2bJbO74Ro4Z
 n8SKVqnizPk+bLAysFD6Hr8s418XdXmlokS2SNOwxbSyPg+3vlPQkr/XSrc0GbZ0jS
 sIWw2AzdbB033pjpSbNPrRd84l/npLvcxe4b4z94CK5AwQxviurnpvzAvzid4TAdjk
 VqErqbMz3jts81Hes8cytCOmlgh8UoH/6nPtt38KYMFsuKYhOmQHE1sKIVS7rc5JKH
 qDLyVNfAI8wv9Myc0fZq3Mj55rlDKkKvu+Nn22psb807paPdmLao0g8/PCF8xLTyKg
 qNEqAZSvSbBpw==
Date: Tue, 12 May 2026 17:33:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20260512-verbalize-nutty-137aedb43c81@spud>
References: <20260507094115.8355-1-minda.chen@starfivetech.com>
 <20260507094115.8355-4-minda.chen@starfivetech.com>
 <20260507-annotate-cleat-52614476a8f7@spud>
 <BJXPR01MB08559464A0F449365088B6ABE6392@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <BJXPR01MB08559464A0F449365088B6ABE6392@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
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
Content-Type: multipart/mixed; boundary="===============1794494989251175558=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 20E5B524C51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:minda.chen@starfivetech.com,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,lunn.ch,google.com,kernel.org,gmail.com,redhat.com,davemloft.net];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.440];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action


--===============1794494989251175558==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="soViVKHqocBr5BBm"
Content-Disposition: inline


--soViVKHqocBr5BBm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 11:11:20AM +0000, Minda Chen wrote:
>=20
>=20
> >=20
> > > +
> > > +        clock-names:
> > > +          oneOf:
> > > +            - items:
> > > +                - const: stmmaceth
> > > +                - const: pclk
> > > +                - const: ptp_ref
> > > +                - const: tx
> > > +                - const: gtx
> > > +            - items:
> > > +                - const: stmmaceth
> > > +                - const: pclk
> > > +                - const: ptp_ref
> > > +                - const: tx
> > > +                - const: gtx
> > > +                - const: sgmii_rx
> >=20
> > Can't you just leave this list outside the conditional section, and add=
 the extra
> > item to the end? The only difference appears to be the sgmii_rx clock, =
and it's at
> > the end.
> >=20
> > I'm also not really convinced that this flexibility is required, unless=
 there are
> > some controllers on the platform that do not support sgmii.
> >=20
> > pw-bot: changes-requested
> >=20
> > Cheers,
> > Conor.
> >=20
>=20
> Thanks. Yes, can do it more simple . I think change the clocks-names in p=
roperties like this is Okay.
>=20
>    clock-names:
> +    minItems: 5
>      items:
>        - const: stmmaceth
>        - const: pclk
>        - const: ptp_ref
>        - const: tx
>        - const: gtx
> +      - enum:
> +          - sgmii_rx

This can remain const, only need the enum if there are options.

>=20
> =20
> > >        if:
> > >          properties:
> > >            compatible:
> > > --
> > > 2.17.1
> > >

--soViVKHqocBr5BBm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNWZwAKCRB4tDGHoIJi
0szgAQCIwA7rp54f62xNDMF0ehEbgxoMB8c08droQhw01YHC6wEAtaCNcVpthUi1
0DMQYR7ZolpGRgfM73GccwFnlpXI8QA=
=TcYb
-----END PGP SIGNATURE-----

--soViVKHqocBr5BBm--

--===============1794494989251175558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1794494989251175558==--
