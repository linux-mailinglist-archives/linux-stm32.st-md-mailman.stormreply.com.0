Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 826DF9E98EB
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 15:31:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C8B0C71280;
	Mon,  9 Dec 2024 14:31:16 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA2DFC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 14:31:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1tKemm-00057P-43; Mon, 09 Dec 2024 15:30:56 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tKemk-002Wue-0q;
 Mon, 09 Dec 2024 15:30:55 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 8DD5C389BCE;
 Mon, 09 Dec 2024 14:30:54 +0000 (UTC)
Date: Mon, 9 Dec 2024 15:30:54 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20241209-magenta-boobook-of-respect-14ec68-mkl@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,
 2} boards and add gen3 board
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
Content-Type: multipart/mixed; boundary="===============5223104757458300337=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5223104757458300337==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zcg6nifetr3cb2sn"
Content-Disposition: inline


--zcg6nifetr3cb2sn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,2} boards and
 add gen3 board
MIME-Version: 1.0

Hello Alexandre,

On 19.11.2024 12:34:57, Marc Kleine-Budde wrote:
> Hello,
>=20
> this series fixes some problems found in the lxa-tac generation 1 and
> 2 boards and add support for the generation 3 board. It's based on an
> STM32MP153c, while the generation 1 and 2 are based on the
> STM32MP157c.
>=20
> regards,
> Marc
>=20
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> Leonard G=C3=B6hrs (6):
>       ARM: dts: stm32: lxa-tac: disable the real time clock
>       ARM: dts: stm32: lxa-tac: extend the alias table
>       ARM: dts: stm32: lxa-tac: adjust USB gadget fifo sizes for multi fu=
nction
>       dt-bindings: arm: stm32: add compatible strings for Linux Automatio=
n LXA TAC gen 3
>       ARM: dts: stm32: lxa-tac: move adc and gpio{e,g} to gen{1,2} boards
>       ARM: dts: stm32: lxa-tac: Add support for generation 3 devices
>=20
>  .../devicetree/bindings/arm/stm32/stm32.yaml       |   7 +
>  arch/arm/boot/dts/st/Makefile                      |   1 +
>  arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts  | 267 +++++++++++++++=
++++++
>  arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts  |  84 +++++++
>  arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts  |  84 +++++++
>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      | 100 +-------
>  6 files changed, 455 insertions(+), 88 deletions(-)

since the merge window is open, can you merge this series please.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--zcg6nifetr3cb2sn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdW/xoACgkQKDiiPnot
vG/URgf/dtYmL9iBc+SHfx64MvPmj6DNHBSLqZnmsOY7n3wqlr+iKYz+6cM33m7n
mixEvaSXRcmbC/LnORRf2tRwJKu5d7P13lS88jWSyOPXhyfzcSYfFzKDYURjmNux
UISMbF/3QA12/W11Kks7pl0FFzhSeuHSTek6BSFJ1CmTKYrIQnoZIYAV8MsytUej
4P+MFT0SXYEMgMKObA7uxcSxWlwSFVKv3Kw8Zl8gj3SDsLWmuxdT5f1k/n+EIFmZ
B4BTT4VKiI/aVicjk+Wfa/EE24YtsIZeg3RbR50o04xVlRWFRwzeIfOh2HwH5vmQ
9v692jmzaPq3TR3977WzO0Hkxo+H4A==
=P04U
-----END PGP SIGNATURE-----

--zcg6nifetr3cb2sn--

--===============5223104757458300337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5223104757458300337==--
