Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F033775936
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Aug 2023 12:58:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6601C6B472;
	Wed,  9 Aug 2023 10:58:35 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBB5FC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Aug 2023 10:58:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qTgtW-0006mz-0e; Wed, 09 Aug 2023 12:58:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qTgtQ-002Btt-Vi; Wed, 09 Aug 2023 12:58:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qTgtQ-00Benj-6W; Wed, 09 Aug 2023 12:58:20 +0200
Date: Wed, 9 Aug 2023 12:58:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
Message-ID: <20230809105820.5yp3jzv4spe47qb4@pengutronix.de>
References: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
 <20230731165456.799784-2-u.kleine-koenig@pengutronix.de>
 <f9ddac2f-28c0-1804-a1de-b8c8e9972638@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <f9ddac2f-28c0-1804-a1de-b8c8e9972638@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Herbert Xu <herbert@gondor.apana.org.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] crypto: stm32/hash - Properly handle
 pm_runtime_get failing
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
Content-Type: multipart/mixed; boundary="===============1141541384287384600=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1141541384287384600==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qnbrkttfbi4cwbot"
Content-Disposition: inline


--qnbrkttfbi4cwbot
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Aug 09, 2023 at 09:44:30AM +0200, Thomas BOURGOIN wrote:
> Thanks for the modification.
> This should be applied for fixes/stable.
> Please add Cc: stable@vger.kernel.org in your commit message.

I usually let maintainers decide if they want this Cc line and in
practise the Fixes: line seems to be enough for the stable team to pick
up a commit for backporting.

If your mail means I should resend the patch just to add the Cc: line,
please tell me again. Should I resent patches 2 and 3 then, too?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qnbrkttfbi4cwbot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTTcUsACgkQj4D7WH0S
/k4PvAf+NtyM4693UO7qpqnYA6x60QAg/Awzi4N9QfoT8iWI23vi8dSDyXDE5+iy
ReRoSY5fCiP+cJA7NBIx/Vnt7PRvfwXHYqNffsXFkhc9fg4cOZ4iAKtohB5ZkxXz
+YknmR6hUmJVfSvKOacTAGVWCt7axVXCBO2srn+QAN2QdYB8e1zSLE9Eb9jtIMq8
tm/akmS6Wqx1qcba2lrVtLmnSbp9leBtCWX9A8nZzHKD/mTjsAiASu4mvL2iLiPa
eJNSmmklJ2/nRFty2vRA46dNQaGEdbvRFqHeyKlsmh39MBQqUK4s8RgVziNzAUa+
ixIGXyq03yhMu2e3EOpTuV+yw1713Q==
=eSvF
-----END PGP SIGNATURE-----

--qnbrkttfbi4cwbot--

--===============1141541384287384600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1141541384287384600==--
