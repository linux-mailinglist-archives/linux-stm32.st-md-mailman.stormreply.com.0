Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 135A5A1A788
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2025 17:05:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EBABC78F86;
	Thu, 23 Jan 2025 16:05:43 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F01D9C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 16:05:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1tazht-00084o-JU; Thu, 23 Jan 2025 17:05:25 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tazhs-001UE9-22;
 Thu, 23 Jan 2025 17:05:24 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 49E273AF8C5;
 Thu, 23 Jan 2025 16:05:24 +0000 (UTC)
Date: Thu, 23 Jan 2025 17:05:23 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <20250123-urban-belligerent-bullfinch-2fa9e6-mkl@pengutronix.de>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
 <173764775141.3793586.6690578690442295161.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <173764775141.3793586.6690578690442295161.robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH stm32-next v3 0/2] ARM: dts: stm32:
 lxa-fairytux2: add gen{1, 2} boards
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
Content-Type: multipart/mixed; boundary="===============8064403716967744314=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8064403716967744314==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5glw5y5axtjwbyh2"
Content-Disposition: inline


--5glw5y5axtjwbyh2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH stm32-next v3 0/2] ARM: dts: stm32: lxa-fairytux2: add
 gen{1,2} boards
MIME-Version: 1.0

On 23.01.2025 09:57:47, Rob Herring (Arm) wrote:
>=20
> On Tue, 21 Jan 2025 12:14:04 +0100, Marc Kleine-Budde wrote:
> > Hello,
> >=20
> > this series adds support for the Linux Automation GmbH FairyTux2
> > boards generation 1 and 2.
> >=20
> > The FairyTux2 is a small Linux device based on an Octavo Systems
> > OSD32MP153c SiP, that occupies just two slots on a DIN rail.
> >=20
> > regards,
> > Marc
> >=20
> > Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > ---
> > Changes in v3:
> > - 2/2: fix use generic node names for external GPIO and USB Type-C cont=
roller (thanks Krzysztof)
> > - 2/2: LEDs: replace label by color and function property (thanks Krzys=
ztof)
> > - 2/2: gen2: sort nodes of i2c1 by address (thanks Krzysztof)
> > - Link to v2: https://patch.msgid.link/20250120-lxa-fairytux-v2-0-95f4a=
0eaa44d@pengutronix.de
> >=20
> > Changes in v2:
> > - 1/2: Added Krzysztof's Acked-by
> > - 2/2: fix alignment for gpio-line-names (thanks Krzysztof)
> > - 2/2: only use color:function for LED labels (thanks Krzysztof)
> > - 2/2: use generic node names for external GPIO and USB Type-C controll=
er
> > - Link to v1: https://patch.msgid.link/20241210-lxa-fairytux-v1-0-9aea0=
1cdb83e@pengutronix.de
> >=20
> > ---
> > Leonard G=C3=B6hrs (2):
> >       dt-bindings: arm: stm32: add compatible strings for Linux Automat=
ion GmbH LXA FairyTux 2
> >       ARM: dts: stm32: lxa-fairytux2: add Linux Automation GmbH FairyTu=
x 2
> >=20
> >  .../devicetree/bindings/arm/stm32/stm32.yaml       |   2 +
> >  arch/arm/boot/dts/st/Makefile                      |   2 +
> >  .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts | 103 ++++++
> >  .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts | 147 ++++++++
> >  .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 397 +++++++++++++=
++++++++
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.

This patch doesn't touch the offending file "ste-hrefv60plus-tvk.dtb".
Might be a new warning, but not due to this patch, could this be a false
positive?

> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/st/' for =
20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de:
>=20
> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@a03fe000: compatible:0=
: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq=
5-gpio']
> 	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml#

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--5glw5y5axtjwbyh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmeSaMAACgkQKDiiPnot
vG/PZwf/UagrJM7N/hgPOTZ1djtmzSaapwvYjGPyTLOK6TTo/jrr3LvDrzJYcviB
aAbkB/qbQJ3E5ljfdlxycABDeDhUfJfmI9eCVrqWmhr2U1ldilqqG0al8CXX5JFK
VbiAkm+2Vt1iNGo/HVXkKVb/1ixmmpNWM2/pQ6/CWtJRali3JWrXXSb3fqX9l/yW
Hae5rzVkAzO6L99vVhlhj0qhvAwPNB1yhRHbxsm+hmrVfho8uW+af5v2UKRDzwhW
ZLioeRjMJPOIO7x0oSijwDTbuKxoo2FIsJBq2oBqtUCAhgWnLKv73hedohOJiIPi
6YPte1AsanWYVLsYmodY2B6/iWFUBA==
=brpD
-----END PGP SIGNATURE-----

--5glw5y5axtjwbyh2--

--===============8064403716967744314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8064403716967744314==--
