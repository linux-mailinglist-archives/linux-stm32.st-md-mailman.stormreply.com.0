Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14831636081
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 14:53:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBE8FC6506F;
	Wed, 23 Nov 2022 13:53:11 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FDDDC03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 13:53:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oxqBL-0000GM-HC; Wed, 23 Nov 2022 14:52:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oxqBJ-0063uu-5s; Wed, 23 Nov 2022 14:52:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oxqBJ-0011bN-B2; Wed, 23 Nov 2022 14:52:53 +0100
Date: Wed, 23 Nov 2022 14:52:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20221123135253.dcuxxuyqvqtdwz5b@pengutronix.de>
References: <20221123133652.465724-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20221123133652.465724-1-fabrice.gasnier@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32-lp: fix the check on arr and
 cmp registers update
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
Content-Type: multipart/mixed; boundary="===============7113692067137392101=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7113692067137392101==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvhlradggud6ocvy"
Content-Disposition: inline


--cvhlradggud6ocvy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 02:36:52PM +0100, Fabrice Gasnier wrote:
> The ARR (auto reload register) and CMP (compare) registers are
> successively written. The status bits to check the update of these
> registers are polled together with regmap_read_poll_timeout().
> The condition to end the loop may become true, even if one of the
> register isn't correctly updated.
> So ensure both status bits are set before clearing them.
>=20
> Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Looks reasonable

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cvhlradggud6ocvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN+JbIACgkQwfwUeK3K
7AnTrAf9H/ODBQF61mFT1V6ZbR5uR/JCsCZBHrsNck9itpnzc6LvJO8K68jaVEVj
2c58ekTJ7mhqz/UF7tk5fNdQlUDvLRPG8IX3LDWjrEDSQVaEH30nw4y0CBKU8lVh
5LcMu/oe7KtSAj/bxp1AdYViZ/YHMZPPDJgpqgrQPxAWWQAcZRj0aRsEgPdi0FTU
DD+wCZTfu5NgVgHvH2rEF+AqEE1L2dU1TU5FSLN2gUTWsBKgqJyQheebazCJkC6H
vR3vLWxSRtxhs59VZdXxdyJ5m+s4aWzsroclCFtu8A0ubijprskO5aAtef8MJhMy
wCymEGzXOGRdQNHgJ8RGfqo2acVpsg==
=LlXc
-----END PGP SIGNATURE-----

--cvhlradggud6ocvy--

--===============7113692067137392101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7113692067137392101==--
