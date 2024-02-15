Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14322856F07
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 22:03:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71D49C65E42;
	Thu, 15 Feb 2024 21:03:41 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C69F5C6410C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 21:03:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raitC-0000gM-7x; Thu, 15 Feb 2024 22:03:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rait9-000xGR-RU; Thu, 15 Feb 2024 22:03:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rait9-005eCw-2Q;
 Thu, 15 Feb 2024 22:03:23 +0100
Date: Thu, 15 Feb 2024 22:03:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <knhwqxhouaiehmnnz5oxaxibhq7usokefztae4pplqypwuzgye@mke2irokres4>
References: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, patches@opensource.cirrus.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 00/13] irqchip: Convert to platform remove
 callback returning void
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
Content-Type: multipart/mixed; boundary="===============1114708900828835167=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1114708900828835167==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="543tsvzhxgimotst"
Content-Disposition: inline


--543tsvzhxgimotst
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Fri, Dec 22, 2023 at 11:50:31PM +0100, Uwe Kleine-K=F6nig wrote:
> this series converts all drivers below drivers/irqchip to use
> .remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
> callback that returns no value") for an extended explanation and the
> eventual goal. The TL;DR; is to make it harder for driver authors to
> leak resources.
>=20
> The drivers touched here are all fine though and don't return early in
> .remove(). So all conversions in this series are trivial.

I'm still waiting for this series to go in (or get review feedback). Is
this still on your radar? You're the right maintainer to take this
series, aren't you?

The series still applies to today's next.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--543tsvzhxgimotst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXOfBoACgkQj4D7WH0S
/k52nAgArzzUUBfYS1wZr/tKGMqABl7rtsR1xpM2V3NdiROGvaYALX1/ROABy83V
lo8pk8XNMuVzDEYFoMOjFhWeoT9jJ8qGk+emLXFs2gr1HwIDzptSP5nW3jSLgv1m
Y/CnadQn2wbIyxPPxPxPglktJ6kPrVcg4pllVjhi6VrwuhIi8dItD9WDuf+qVaVe
J0rHGiTF2iZvhcuIgIulliMcR9+5npsA14ZxonEQdHJ7f4Ew0LTijz14X8+rNZ4b
3Fe8/jB2MGtwxlwK6eFGEfH5SWnWqltMR4yPzGVHNIqUHrSB3BVFWzDyNnW2EAfx
d+1GXz634dPtW4JEgQNJRXcgS//+JQ==
=O3pv
-----END PGP SIGNATURE-----

--543tsvzhxgimotst--

--===============1114708900828835167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1114708900828835167==--
