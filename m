Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB0DA08DFE
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 11:29:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42A4BC6DD6B;
	Fri, 10 Jan 2025 10:29:08 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B45F0C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 10:29:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1tWCG5-0008Ak-W6; Fri, 10 Jan 2025 11:28:54 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tWCG4-0008u5-2X;
 Fri, 10 Jan 2025 11:28:52 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 5B6953A44F2;
 Fri, 10 Jan 2025 10:28:52 +0000 (UTC)
Date: Fri, 10 Jan 2025 11:28:52 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20250110-horned-nebulous-condor-09243b-mkl@pengutronix.de>
References: <20241228150043.3926696-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20241228150043.3926696-1-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-can@vger.kernel.org,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: can: st, stm32-bxcan: fix st,
 gcan property type
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
Content-Type: multipart/mixed; boundary="===============1462317646642179133=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1462317646642179133==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="anwmo6ob52wfnpr4"
Content-Disposition: inline


--anwmo6ob52wfnpr4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: can: st,stm32-bxcan: fix st,gcan property
 type
MIME-Version: 1.0

On 28.12.2024 16:00:30, Dario Binacchi wrote:
> The SRAM memory shared pointed to by the st,gcan property is unique, so
> we don't need an array of phandles.
>=20
> Fixes: e43250c0ac81 ("dt-bindings: net: can: add STM32 bxcan DT bindings")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to linux-can-next.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--anwmo6ob52wfnpr4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmeA9mAACgkQKDiiPnot
vG9O5AgAlFntbK9yhpLpeCz1lm+o0dvDkJAg6SzSmwNVrDFP2y1ytnIzmcsZnIPS
63BnL7xaJhesheN4reHBf0rgtxgb3QaU+3niVWfl13XdQ79inx9PfZG8xo9TPj/V
xTTMdJWeskKObytetj+1ZLzr2WOsA8FVz6P4fuDgJhcVod21xoEj2UZIzveptxS0
EANnxs0pXr5vSubSDwg2R+1Z5uDEywNGKo9LsoJpugu7y4Sy+gfanoleRuJXsd2l
K2fSG+/XJbJXwnX32jvtWLaP9UIgdDtPdATlSPkdc95L3bVdCYoFx6fqr1MUsYBx
2bpswKMicMk4KQxSdPc3+7mipYOSfQ==
=xsOB
-----END PGP SIGNATURE-----

--anwmo6ob52wfnpr4--

--===============1462317646642179133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1462317646642179133==--
