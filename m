Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A429C620FA7
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Nov 2022 12:59:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46475C6504B;
	Tue,  8 Nov 2022 11:59:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D208CC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Nov 2022 11:59:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1osNGB-0005Z5-PF; Tue, 08 Nov 2022 12:59:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1osNG8-0032oU-5I; Tue, 08 Nov 2022 12:59:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1osNG8-00FAop-B0; Tue, 08 Nov 2022 12:59:16 +0100
Date: Tue, 8 Nov 2022 12:59:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <20221108115916.hlmbvyrnmkxymeed@pengutronix.de>
References: <20220203171114.10888-1-erwan.leray@foss.st.com>
 <cc7633c5-de5f-0abf-4ac8-64a74633dfcc@pengutronix.de>
 <f5aec360-c33c-0145-6596-541003e305b2@foss.st.com>
 <98823363-710c-6286-8e63-ba8e5dcadeba@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <98823363-710c-6286-8e63-ba8e5dcadeba@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/16] STM32 configure UART nodes for DMA
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
Content-Type: multipart/mixed; boundary="===============6750092283174368209=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6750092283174368209==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7xl74gxbk272rwu"
Content-Disposition: inline


--c7xl74gxbk272rwu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 04, 2022 at 04:41:55PM +0100, Erwan LE RAY wrote:
> On 2/4/22 2:22 PM, Alexandre TORGUE wrote:
> > Hi Ahmad
> >=20
> > On 2/3/22 18:25, Ahmad Fatoum wrote:
> > > Hello Erwan,
> > >=20
> > > On 03.02.22 18:10, Erwan Le Ray wrote:
> > > > Add DMA configuration to UART nodes in stm32mp15x (SOC level) and
> > > > remove it at board level to keep current PIO behavior when needed.
> > > > For stm32-ed1 and stm32-dkx boards, UART4 (console) and UART7
> > > > (no HW flow control pin available) are kept in PIO mode, while USAR=
T3
> > > > is now configured in DMA mode.
> > > > UART4 (console UART) has to be kept in irq mode, as DMA support for
> > > > console has been removed from the driver by commit e359b4411c28
> > > > ("serial: stm32: fix threaded interrupt handling").
> > >=20
> > > Do I understand correctly that your first patch breaks consoles of
> > > most/all boards, because they will briefly use DMA, which is refused
> > > by the stm32-usart driver and then you add a patch for each board
> > > to fix that breakage?
> >=20
> > We have two solutions and both have pro/drawbacks. The first one (Erwan
> > ones, can break the boot if the patch is taken "alone". Your proposition
> > avoids this breakage but deletes a non define property (which is a bit
> > weird). However I prefer to keep a functional behavior, and keep Ahmad
> > proposition. Ahmad, just one question, dt-bindings check doesn't
> > complain about it ?
> >=20
> > Cheers
> > Alex
> >=20
> > >=20
> > > Such intermittent breakage makes bisection a hassle. /delete-property/
> > > is a no-op when the property doesn't exist, so you could move the fir=
st
> > > patch to the very end to avoid intermittent breakage.
> > >=20
> > > I also think that the driver's behavior is a bit harsh. I think it wo=
uld
> > > be better for the UART driver to print a warning and fall back to
> > > PIO for console instead of outright refusing and rendering the system
> > > silent. That's not mutually exclusive with your patch series here,
> > > of course.
> > >=20
> > > Cheers,
> > > Ahmad
> > >=20
>=20
> The driver implementation will consider the request to probe the UART
> console in DMA mode as an error (-ENODEV), and will fallback this UART pr=
obe
> in irq mode.

> Whatever the patch ordering, the boot will never be broken. The board dt
> patches aim to get a "proper" implementation, but from functional
> perspective the driver will manage a request to probe an UART console in =
DMA
> mode as an error and fall it back in irq mode.

I didn't debug this further yet, but my machine (with an out-of-tree
dts) fails to boot 6.1-rc4 without removing the dma properties from the
console UART. This is a bug isn't it? The same dts created a working
setup with stm32mp157.dtsi from 5.15 + kernel 5.15.

I can debug this further, but maybe you know off-hand what the problem
is?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--c7xl74gxbk272rwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNqRJEACgkQwfwUeK3K
7AlviAf/aWq+f5jZ43D9mr3TUb0MZkP1KLvPgtrpBfPs15Bp8S74wsXD2uMZcX82
CtouQO0Y39ByPVDx1rWTJt5PUIGObQsAuQe9J9jVj2dKecRqa5amu8OueqZX0rMs
VrLueFarS1+Jj95JwpTXaDMWmD7u7Mzh643Xr1aIQ2RPajOkMtaeGuSwqAHhGPTw
Du5FdhPlIPpetKNn3L+TLHJ3sXWHyQa/BL/wqHjvg575tSiLFLCXGjnYNs9Wqk4h
BJcHXwFi0hkE37vCKHT6chnyRwF93xR7ZWCJI49KenTK7AC0tSqVZHdFFFD/wV1m
/g8RuN7EB/xJFEYSrPbtnhILSKTC/Q==
=yKut
-----END PGP SIGNATURE-----

--c7xl74gxbk272rwu--

--===============6750092283174368209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6750092283174368209==--
