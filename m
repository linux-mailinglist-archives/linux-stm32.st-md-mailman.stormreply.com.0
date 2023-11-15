Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB37ED530
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Nov 2023 22:02:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1292EC6C837;
	Wed, 15 Nov 2023 21:02:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9327C6B47D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 21:02:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r3N1J-0007II-KE; Wed, 15 Nov 2023 22:01:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r3N1I-009IlP-C8; Wed, 15 Nov 2023 22:01:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r3N1I-002BtI-2z; Wed, 15 Nov 2023 22:01:56 +0100
Date: Wed, 15 Nov 2023 22:01:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20231115210155.p6m5rbahpzusy6bc@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
 <20231019200658.1754190-12-u.kleine-koenig@pengutronix.de>
 <c2da3f60-595c-4938-809a-c5640388c13c@foss.st.com>
 <20231114212009.44r742f3xqosswod@pengutronix.de>
 <e7034e83-7c1a-4706-8382-536b260284eb@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <e7034e83-7c1a-4706-8382-536b260284eb@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] pwm: stm32: Fix enable count for clk
	in .probe()
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
Content-Type: multipart/mixed; boundary="===============1838126459977603085=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1838126459977603085==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vb7uxqoeywycjxjr"
Content-Disposition: inline


--vb7uxqoeywycjxjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Fabrice,

On Wed, Nov 15, 2023 at 10:02:20AM +0100, Fabrice Gasnier wrote:
> (with or without a Fixes tag) Could you add a check on global counter
> enable bit (TIM_CR1_CEN) both in the .get_state(), and in the
> stm32_pwm_detect_channels(), that counts the num_enabled channels ?

I'd address that separately, mostly because the patches forwarded here
are not mine.

> In case the TIM_CR1_CEN isn't set (but some of the TIM_CCER_CCXE are),
> the driver will report enabled channels. But physically, the pwm output
> will be inactive.

Huuu, that means if channel #0 is running and I start a capture on
channel #1 which results in unconditionally calling
regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN); (in
stm32_pwm_raw_capture()) channel #0 stops to toggle!

> That's more a robustness case... depending on what's been done possibly
> by bootloader. What to you think ?

I would assume that a bootloader that sets the CCXE bits also enables
TIM_CR1_CEN and so in practise Philipp's patch is fine. But I agree that
doing things properly would be better.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vb7uxqoeywycjxjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVVMcMACgkQj4D7WH0S
/k4msggAsie4pFsNw+ow1IXyxv/KRPfpDOJObWnoyIvHIfDZ8xFh3kFoig+ETspm
qoaQcVbsdaYthLrSRid85joui8quAXnLITqUABh0QU9vdspx0lhj9a1CArH5K7D8
pJ0zhrUJ/QjUuHw55a+mt2HzQEU0XhRm5uovN7Q6KwKnML51R3tz8rzig56lfZKU
FLEaFxPazm6ea9/AiGaJFTxzZq0SWa+pfi37JD1Ym9uGZKyQ4DQFue8Pzm29M3uo
MJ3yVbetp4Ys4PYyrPXvLECr0wkOq8ylm194Sf0QMmmyEp145nfb8aNQYNgsTusE
YWSgPPacfgdsiF4kTuE0unYZMlEeSg==
=5udC
-----END PGP SIGNATURE-----

--vb7uxqoeywycjxjr--

--===============1838126459977603085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1838126459977603085==--
