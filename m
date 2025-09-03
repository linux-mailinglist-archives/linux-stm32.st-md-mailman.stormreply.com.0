Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20464B424CD
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 17:17:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6000C36B2E;
	Wed,  3 Sep 2025 15:17:10 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C61CC36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 15:17:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1utpEB-0006Li-Pb; Wed, 03 Sep 2025 17:16:51 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1utpE9-003a6L-2s;
 Wed, 03 Sep 2025 17:16:49 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 79C52465B63;
 Wed, 03 Sep 2025 15:16:49 +0000 (UTC)
Date: Wed, 3 Sep 2025 17:16:48 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <20250903-uncovered-magnetic-marmot-dd7c37-mkl@pengutronix.de>
References: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
 <20250807-stm32mp15-m_can-add-reset-v2-2-f69ebbfced1f@pengutronix.de>
 <59f25804-d310-4492-b95f-19c42cf3cd42@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <59f25804-d310-4492-b95f-19c42cf3cd42@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] ARM: dts: stm32: add resets
 property to m_can nodes in the stm32mp153
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
Content-Type: multipart/mixed; boundary="===============5795402169561427579=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5795402169561427579==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="drmik7hqv5i24xa5"
Content-Disposition: inline


--drmik7hqv5i24xa5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] ARM: dts: stm32: add resets property to m_can
 nodes in the stm32mp153
MIME-Version: 1.0

On 03.09.2025 15:10:42, Alexandre TORGUE wrote:
> Hi Marc
>=20
> On 8/7/25 08:09, Marc Kleine-Budde wrote:
> > On the STM32MP153 the m_cam IP cores (a.k.a. FDCAN) have an external
> > shared reset in the RCC. Add the reset to both m_can nodes.
> >=20
> > Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > ---
> >   arch/arm/boot/dts/st/stm32mp153.dtsi | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/s=
t/stm32mp153.dtsi
> > index 4640dafb1598..92794b942ab2 100644
> > --- a/arch/arm/boot/dts/st/stm32mp153.dtsi
> > +++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
> > @@ -40,6 +40,7 @@ m_can1: can@4400e000 {
> >   		interrupt-names =3D "int0", "int1";
> >   		clocks =3D <&rcc CK_HSE>, <&rcc FDCAN_K>;
> >   		clock-names =3D "hclk", "cclk";
> > +		resets =3D <&rcc FDCAN_R>;
> >   		bosch,mram-cfg =3D <0x0 0 0 32 0 0 2 2>;
> >   		access-controllers =3D <&etzpc 62>;
> >   		status =3D "disabled";
> > @@ -54,6 +55,7 @@ m_can2: can@4400f000 {
> >   		interrupt-names =3D "int0", "int1";
> >   		clocks =3D <&rcc CK_HSE>, <&rcc FDCAN_K>;
> >   		clock-names =3D "hclk", "cclk";
> > +		resets =3D <&rcc FDCAN_R>;
> >   		bosch,mram-cfg =3D <0x1400 0 0 32 0 0 2 2>;
> >   		access-controllers =3D <&etzpc 62>;
> >   		status =3D "disabled";
> >=20
>=20
> How those reset are handled at driver side ?

I've created a patch that adds a shared reset to the m_can driver:

| https://lore.kernel.org/all/20250812-m_can-fix-state-handling-v1-7-b739e0=
6c0a3b@pengutronix.de/

The reset is de-asserted during probe and when the interface does up,
otherwise it asserted. This way the IP gets reset only when both
interfaces are down.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--drmik7hqv5i24xa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmi4W90ACgkQDHRl3/mQ
kZw7OQf+IAk77vePmsl5sa2RCJ64dVjof83jSrEidTOll5/fyIaPux6Y/xW/WlOl
r7Jiw9c8rTb66LdAl7QxlV9SthVj3iaD8qIRt3jFOTHtLOVOjuOh6UPP3rdoSSQS
rE/eve4ZibgRYje/9Uzey2lJ2Mybq/qDtexmqzygOngruvvWLe+4BdKHykjQPBXu
TnGA+vSAVZ7Gd0vmbSeL7OWBMLD4i6i5L0SW1O2L5vLVGr7eHSqHp+TAP4Qwd2ls
oJwojmqYInUMNjCsZyDpX+/O60KsA0wlWnp5JCoIM4JwuzDSruI6mBTeChvRdQc4
S2srAIKWU7ZOpyhRiJ0Sq0Jw2hY9Xg==
=u+QD
-----END PGP SIGNATURE-----

--drmik7hqv5i24xa5--

--===============5795402169561427579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5795402169561427579==--
