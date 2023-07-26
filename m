Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5155762B16
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 08:05:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66320C6A61A;
	Wed, 26 Jul 2023 06:05:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F9E6C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 06:05:09 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1qOXdY-0006Dv-Gs; Wed, 26 Jul 2023 08:04:40 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id B74FB1FAD7A;
 Wed, 26 Jul 2023 06:04:37 +0000 (UTC)
Date: Wed, 26 Jul 2023 08:04:37 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Richard Cochran <richardcochran@gmail.com>
Message-ID: <20230726-dreamboat-cornhusk-1bd71d19d0d4-mkl@pengutronix.de>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org>
 <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
MIME-Version: 1.0
In-Reply-To: <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Johannes Zink <j.zink@pengutronix.de>, kernel test robot <lkp@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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
Content-Type: multipart/mixed; boundary="===============1075963639113733079=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1075963639113733079==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnhwr73ip5umpg2f"
Content-Disposition: inline


--xnhwr73ip5umpg2f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 25.07.2023 20:22:53, Richard Cochran wrote:
> On Tue, Jul 25, 2023 at 08:06:06PM -0700, Jakub Kicinski wrote:
>=20
> > any opinion on this one?
>=20
> Yeah, I saw it, but I can't get excited about drivers trying to
> correct delays.  I don't think this can be done automatically in a
> reliable way,

At least the datasheet of the IP core tells to read the MAC delay from
the IP core (1), add the PHY delay (2) and the clock domain crossing
delay (3) and write it to the time stamp correction register.

(1) added in this patch
(2) future work
(3) already in the driver,
    though corrected manually when reading the timestamp

At least in our measurements the peer delay is better with this patch
(measured with ptp4linux) and the end-to-end delay (comparison of 2 PPS
signals on a scope) is also better.

> and so I expect that the few end users who are really
> getting into the microseconds and nanoseconds will calibrate their
> systems end to end, maybe even patching out this driver nonsense in
> their kernels.

What issues make you think this change/approach is counterproductive?

> Having said that, I won't stand in the way of such driver stuff.
> After all, who cares about a few microseconds time error one way or
> the other?

There are several companies that use or plan to use PTP in their
products and are striving to achieve sub-microsecond synchronization.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xnhwr73ip5umpg2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmTAt3IACgkQvlAcSiqK
BOh0DAgAqG6sHE3eeulbdXpyxVkjVIcKYjN/Hdv69xC9upUFvYFR+OQx4UoUbqCj
cDnLoipaxlcGfUob+Qr9QYUKjVI9TVqY82sU6LJ2DsbRAXdE7v7Pp/cINSatJ0Vq
Sb7Srv7RG2Xh+4oLChZ7fm2BGfoTehVQh0W3VpVXhIeMmGWeNFankax+sPOwYPfK
/OIQ/OYKRW0EI2Hrhbb/wnGv8cUCUSj5ZxQsc2rNJptWwQE1Ps/ljCOCyeyP8Alu
OOjGHjN1pjzZKg5hnOeKTKmmN9r5e5mD0EuSIm5PCtAQnCu2FOkQh1C+uyjNLx6m
jibMx4NFgoCRMo76PJp1y4m6hzEtkw==
=4iaa
-----END PGP SIGNATURE-----

--xnhwr73ip5umpg2f--

--===============1075963639113733079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1075963639113733079==--
