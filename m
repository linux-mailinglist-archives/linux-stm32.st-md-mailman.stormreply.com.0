Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0DC57B193
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jul 2022 09:18:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAC61C640F4;
	Wed, 20 Jul 2022 07:18:54 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C9BAC03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jul 2022 07:18:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oE3yp-0001cx-Bh; Wed, 20 Jul 2022 09:18:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oE3yl-0024QQ-TS; Wed, 20 Jul 2022 09:18:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oE3yk-006KrZ-UB; Wed, 20 Jul 2022 09:18:42 +0200
Date: Wed, 20 Jul 2022 09:18:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Message-ID: <20220720071834.augn2mtytqzqcixo@pengutronix.de>
References: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
 <20220519162838.695404-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220519162838.695404-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/2] ARM: dts: stm32mp15x: Add timer
	interrupts
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
Content-Type: multipart/mixed; boundary="===============0743334208929840492=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0743334208929840492==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ltqjj27tuoy3n3jq"
Content-Disposition: inline


--ltqjj27tuoy3n3jq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 19, 2022 at 06:28:38PM +0200, Uwe Kleine-K=F6nig wrote:
> The timer units in the stm32mp15x CPUs have interrupts, depending on the
> timer flavour either one "global" or four dedicated ones. Add the irqs
> to the timer units on stm32mp15x.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

This patch wasn't picked up yet (at least nobody told to have done it
and it's not in next). Is there a problem other than no maintainer time?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ltqjj27tuoy3n3jq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLXrEcACgkQwfwUeK3K
7Ang7gf/Rd5W5Jg4hMwhnAke3rNUDJnYzTaAWUL1IKCO8ZYgddNv1gojlRjoTSm6
GVti+ACsAd+34xDdLQ9GDJ1JgvM4nlrg5HvGjmtMe9SIM/fVQNzlezA3bp5Q0zW9
US94zB9DlTEGY1T1YEPrUw6//gJ/IQ7wZPlIe8dsZbsze7AIWOcbLlPYRZE4GUBo
MjjC23hL0+GPVDrRF8sxIybxAlq7szjqICgCsmemw7KH1ooF9tFLMOh5jgg0JxJE
5RCjaJTVinzp3Ysuxx8m8hnxgBbkXMsfmw5rwqK1mGZZJMxUk8NRQEaGj+4HFSxH
CCoxbujOBFCCCw047z8X2MIB2PDnFg==
=ijww
-----END PGP SIGNATURE-----

--ltqjj27tuoy3n3jq--

--===============0743334208929840492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0743334208929840492==--
