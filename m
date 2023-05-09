Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE676FC671
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 14:33:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 287DFC6A608;
	Tue,  9 May 2023 12:33:56 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59288C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 12:33:54 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1pwMXF-0007bU-NH; Tue, 09 May 2023 14:33:41 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 123EA1C0ED2;
 Tue,  9 May 2023 12:33:39 +0000 (UTC)
Date: Tue, 9 May 2023 14:33:38 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230509-catering-haphazard-069d7e07dd1f-mkl@pengutronix.de>
References: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
 <20230427-retaining-deeply-fcff70098e7e-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230427-retaining-deeply-fcff70098e7e-mkl@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/5] can: bxcan: add support for single
 peripheral configuration
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
Content-Type: multipart/mixed; boundary="===============8342237859726634808=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8342237859726634808==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z2tkty3mos6fytzk"
Content-Disposition: inline


--z2tkty3mos6fytzk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27.04.2023 23:08:57, Marc Kleine-Budde wrote:
> On 27.04.2023 22:45:35, Dario Binacchi wrote:
> >=20
> > The series adds support for managing bxCAN controllers in single periph=
eral
> > configuration.
> > Unlike stm32f4 SOCs, where bxCAN controllers are only in dual peripheral
> > configuration, stm32f7 SOCs contain three CAN peripherals, CAN1 and CAN2
> > in dual peripheral configuration and CAN3 in single peripheral
> > configuration:
> > - Dual CAN peripheral configuration:
> >  * CAN1: Primary bxCAN for managing the communication between a seconda=
ry
> >    bxCAN and the 512-byte SRAM memory.
> >  * CAN2: Secondary bxCAN with no direct access to the SRAM memory.
> >    This means that the two bxCAN cells share the 512-byte SRAM memory a=
nd
> >    CAN2 can't be used without enabling CAN1.
> > - Single CAN peripheral configuration:
> >  * CAN3: Primary bxCAN with dedicated Memory Access Controller unit and
> >    512-byte SRAM memory.
>=20
> This really looks good! Great work! Who takes the DT changes? I can take
> the whole series.

I've upstreamed the DT changes for the first bxCAN driver, so I'll take
them this time, too.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--z2tkty3mos6fytzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmRaPaAACgkQvlAcSiqK
BOhJDggAiHTwavVOD9cujYG2SgwoOLLgpy8Ylvw9/eeUQEH1Qg6N2ilNwzkHyEAE
Q6L0lhNcBy3VO0LyM12q68h/bIu4XmAQT2QxL402O/59g24vXkR2kdsZv1teTTgB
sRGMukvTADU+KOLNu2VtfYoLVraeGDk+Z6OfYznFlpilwK0QDNjVtItDP/vFUEjF
ejc0RZ4SoWPH43twlO6t5ggNZkKuQYEj4kUe9JP6QgxElkvsaaipOOnAkcXlN64g
O9WXHOfZuDiMwRJRwQ/OxVyN8Ra5ZkuLdAM7r1vzjYSQISh7tvpCjH/byB0pQMBW
8cZztkEv3Kzx69WmUDssu7VvwXTUqA==
=nqSC
-----END PGP SIGNATURE-----

--z2tkty3mos6fytzk--

--===============8342237859726634808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8342237859726634808==--
