Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B35336AC934
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 18:06:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 659ACC65E73;
	Mon,  6 Mar 2023 17:06:31 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E790CC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 17:06:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZEHO-0003z0-4j; Mon, 06 Mar 2023 18:05:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZEHH-002If9-91; Mon, 06 Mar 2023 18:05:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZEHG-002kzA-Js; Mon, 06 Mar 2023 18:05:34 +0100
Date: Mon, 6 Mar 2023 18:05:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Doug Anderson <dianders@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20230306170534.vap4z24rbexbjj76@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
 patches@opensource.cirrus.com,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, kernel@pengutronix.de,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/34] watchdog: Convert to platform
 remove callback returning void
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
Content-Type: multipart/mixed; boundary="===============6443992646702260007=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6443992646702260007==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6lk6n3hldynfzkpt"
Content-Disposition: inline


--6lk6n3hldynfzkpt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[dropping Leela Krishna Amudala from the list of recipents as their
email address bounces]

On Fri, Mar 03, 2023 at 10:36:42PM +0100, Uwe Kleine-K=F6nig wrote:
> this patch series adapts the platform drivers below drivers/watchdog to
> use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak. One driver suffering from
> this problem (s3c2410) is fixed by the first patch.
>=20
> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
>=20
> All watchdog drivers but the above mentioned one returned zero
> unconditionally in their remove callback, so they could all be converted
> trivially to .remove_new().
>=20
> Note that this series depends on commit 5c5a7680e67b ("platform: Provide
> a remove callback that returns no value") that is already in Linus' tree
> but not yet included in a tagged version.

This is fixed now, v6.3-rc1 is suitable as a base for this series.

Guenter pointed out that for some drivers it is possible to make use of
devm_watchdog_register_device() and drop the remove callback completely.
Also there is an alternative series that gets rid of s3c2410's remove
callback.

I'll send out a series converting the three drivers to
devm_watchdog_register_device() as Guenter suggested. To apply the
remainder of this series you might want to do:

	b4 am -l -P 2-7,9-25,27,29-33 20230303213716.2123717-1-u.kleine-koenig@pen=
gutronix.de

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6lk6n3hldynfzkpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQGHVsACgkQwfwUeK3K
7AkjxAf/ay58zUveg62ekFfp2EWzQLcZ/rgoftXI9IlMaCupCSIn7RrN1sCI2ujw
TDxuC3JhS4wWOpkmRc0b0cRTdYXZdMxY5YSCbDJ63J94pr5mJmh0fXstr9pEfhmP
gLtcIM3I5Dv18X6tMBAu6KxEOgBq2ABiOpkLatLDNFsAsES2hDN1RSmFsozuIBsS
XlP4wsQvCAxsa0zpQx+lZ58NR0ySwwaWTRNlpm0vR6aOJworSQu0PuPizK2z6dET
L7OFiZJG82Og1Jq+nv8MZ3Wmw+6V4XupfkeCNetqQSJz1cq6fOTJmWCfBzWZPkjj
3v78LA8gRjJblfMeJ1VBaFfkIwMuEA==
=qlX8
-----END PGP SIGNATURE-----

--6lk6n3hldynfzkpt--

--===============6443992646702260007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6443992646702260007==--
