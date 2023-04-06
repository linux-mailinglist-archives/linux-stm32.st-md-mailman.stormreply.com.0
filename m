Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F506D9907
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 16:07:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 400C1C6B440;
	Thu,  6 Apr 2023 14:07:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7B1EC6A61B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 14:07:48 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pkQGi-0005t8-0J; Thu, 06 Apr 2023 16:07:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pkQGf-009P6h-7W; Thu, 06 Apr 2023 16:07:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pkQGe-00B4LC-Gz; Thu, 06 Apr 2023 16:07:12 +0200
Date: Thu, 6 Apr 2023 16:07:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <20230406140712.v73dyrxkbszxey5v@pengutronix.de>
References: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
 <0a42d419-7ec2-6d09-9b19-15aa25888625@linaro.org>
MIME-Version: 1.0
In-Reply-To: <0a42d419-7ec2-6d09-9b19-15aa25888625@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] clocksource: Convert to platform
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
Content-Type: multipart/mixed; boundary="===============3310202567564845368=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3310202567564845368==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xk57upxb6dtjlhaj"
Content-Disposition: inline


--xk57upxb6dtjlhaj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Daniel,

On Thu, Apr 06, 2023 at 03:54:11PM +0200, Daniel Lezcano wrote:
> On 13/03/2023 08:54, Uwe Kleine-K=F6nig wrote:
> > this patch series adapts the platform drivers below drivers/clk
> > to use the .remove_new() callback. Compared to the traditional .remove()
> > callback .remove_new() returns no value. This is a good thing because
> > the driver core doesn't (and cannot) cope for errors during remove. The
> > only effect of a non-zero return value in .remove() is that the driver
> > core emits a warning. The device is removed anyhow and an early return
> > from .remove() usually yields a resource leak.
> >=20
> > Most clocksource drivers are not supposed to be removed. Two drivers are
> > adapted here to actually prevent removal. One driver is fixed not to
> > return an error code in .remove() and then the two remaining drivers
> > with a remove callback are trivially converted to .remove_new().
> >=20
>=20
> Applied and fixed up patch #2

Great. Thank you.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xk57upxb6dtjlhaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQu0g8ACgkQj4D7WH0S
/k5gfAgAoMsAoS863CM3KocI1YpfLtjIOgiqNbEC/+aV8R+deWfCAZbI0Uyuvfum
EEtkYZN6LOJLQRBmrmax1DbJ/TmR41teaU2agD9317k5bFJp5iqTygjH8Qjvalj7
fdH7b88VwKTwH1g3m8IFCfNEKLGlhFa4QXUqZYtjUAdKqf7wrI6JLegYaaUErR3h
V5nSi7RzqLWNXLzjWAKL7qoryTpa4oCqOdhJ6W+cYSo3qzEI7t+aJPnSXulD0yUB
BeQ1ox/59XA+YkrTvX20K8TciphTFnqk+M4xq3SPaztFsSnshkQCHyvhGXOHGi5C
9LXqquRiJnSkq+febMXlI5KRXzKokQ==
=7ttN
-----END PGP SIGNATURE-----

--xk57upxb6dtjlhaj--

--===============3310202567564845368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3310202567564845368==--
