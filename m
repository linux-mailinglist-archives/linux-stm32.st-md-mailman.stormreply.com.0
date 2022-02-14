Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE64B59D3
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 19:23:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56202C5F1F2;
	Mon, 14 Feb 2022 18:23:41 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0BEFC5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 18:23:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJg0S-00063J-6p; Mon, 14 Feb 2022 19:23:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJg0K-00GbDc-9H; Mon, 14 Feb 2022 19:23:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJg0I-003BDB-Qj; Mon, 14 Feb 2022 19:23:14 +0100
Date: Mon, 14 Feb 2022 19:23:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <20220214182311.xaxkdgw5x66vubvv@pengutronix.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
 <20220213222737.15709-2-LinoSanfilippo@gmx.de>
 <20220214070622.rz5cv6yy3aarvrjv@pengutronix.de>
 <edbb9e1d-bed4-0850-08f4-029c4fcbfd5c@gmx.de>
MIME-Version: 1.0
In-Reply-To: <edbb9e1d-bed4-0850-08f4-029c4fcbfd5c@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 jirislaby@kernel.org, richard.genoud@gmail.com, gregkh@linuxfoundation.org,
 s.hauer@pengutronix.de, nicolas.ferre@microchip.com,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/9] serial: core: move RS485
 configuration tasks from drivers into core
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
Content-Type: multipart/mixed; boundary="===============5125982562365144682=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5125982562365144682==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5yzygnvea2gsyqvu"
Content-Disposition: inline


--5yzygnvea2gsyqvu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lino,

On Mon, Feb 14, 2022 at 04:09:53PM +0100, Lino Sanfilippo wrote:
> On 14.02.22 at 08:06, Uwe Kleine-K=F6nig wrote:
> > I was only Cc:d for the imx patch (patch #7) and tried to verify the
> > claim there that "the serial core already assigns the passed
> > configuration to the uart port". That failed when I looked at my kernel
> > tree.
> >
> > So it would be great, if you sent dependencies (or at least a cover
> > letter) to all recipients of a given patch to ease review. Also I want
> > to suggest to mention uart_set_rs485_config() in the commit log of the
> > imx patch (and probably the others) to simplify verifying the claim
> > there.
>=20
> Thanks for the review, I will correct the typos in the next version.
> I will also cc you directly for the next version if you dont mind.

I don't mind. I get so many patches by mail, I'm good at ignoring them
;-)

> get_maintainers only spit out "Pengutronix Kernel Team" so I used that
> address for the whole series (including the cover letter).

That's why I eventually found the whole series and could reply to patch
#1.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5yzygnvea2gsyqvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIKngwACgkQwfwUeK3K
7An98wf/bBKlqhAAMwMSKVu53e8nF1ZTSQ/QjAhBecE3mD4HgqyKTzgmzkKeHYFj
KFZpNW2T05fcPMre0otOoR+7X1a2jOMv9lg2c11F6zor06DU6+RrIbtgMuzCFKJW
tpM9//kD8f+OcUSESal/ZRzAS683pu+nO0x2N06+h4kRiUVfb6y2UToQhiCniQjO
PtPtboM3S+ZistvDYzuo2sVXaYA7C8pTcGVbY8fO2dhWqvbwb//kIQt3ZsFvDnhj
g8xi+7QVAJvKcQy9FpB0SKAcCpIx/gy+AnoezVMbbshQejDbrVQ+SYPq7wtka2PB
L9NSe4gLIQM2kMMxpd8Fprm67oy+Rw==
=KXKx
-----END PGP SIGNATURE-----

--5yzygnvea2gsyqvu--

--===============5125982562365144682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5125982562365144682==--
