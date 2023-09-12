Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD879CBA7
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 11:26:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05E7DC6B46F;
	Tue, 12 Sep 2023 09:26:48 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00ADFC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 09:26:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qfzfQ-0005gd-Gb; Tue, 12 Sep 2023 11:26:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qfzfO-005kKp-Vz; Tue, 12 Sep 2023 11:26:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qfzfO-001261-CY; Tue, 12 Sep 2023 11:26:42 +0200
Date: Tue, 12 Sep 2023 11:26:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230912092642.wivb4zn7kocp2kfn@pengutronix.de>
References: <20230717160630.1892-1-jszhang@kernel.org>
 <20230717160630.1892-3-jszhang@kernel.org>
 <20230911171102.cwieugrpthm7ywbm@pengutronix.de>
 <ZQAf9ArWfRkY/yPR@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZQAf9ArWfRkY/yPR@xhacker>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 kernel@pengutronix.de, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [REGRESSION] [PATCH net-next v5 2/2] net: stmmac:
 use per-queue 64 bit statistics where necessary
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
Content-Type: multipart/mixed; boundary="===============1228269464709321264=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1228269464709321264==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mojihote6ig6i45p"
Content-Disposition: inline


--mojihote6ig6i45p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 04:23:16PM +0800, Jisheng Zhang wrote:
> On Mon, Sep 11, 2023 at 07:11:02PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > this patch became commit 133466c3bbe171f826294161db203f7670bb30c8 and is
> > part of v6.6-rc1.
> >=20
> > On my arm/stm32mp157 based machine using NFS root this commit makes the
> > following appear in the kernel log:
> >=20
> > 	INFO: trying to register non-static key.
> > 	The code is fine but needs lockdep annotation, or maybe
> > 	you didn't initialize this object before use?
> > 	turning off the locking correctness validator.
> > 	CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc1-00449-g133466c3bbe=
1-dirty #21
>=20
> Hi,
>=20
> Which kernel version are you using? The latest linus tree? But why here
> say 6.5.0-rc1?

This is the kernel from the last bisection test. I.e.
133466c3bbe171f826294161db203f7670bb30c8 (plus some minor unrelated
changes to work around another problem). This commit is based on
6.5-rc1.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mojihote6ig6i45p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUALtEACgkQj4D7WH0S
/k5hnQf+OVXfgdZKMt4Ieq7lC/IAS3kt0AetAEO8DcU4KGCpivmEgY1+FazKg8bX
/9EVIMroVVS5m0isOSqo/mzGWIRTz3lB6zPm6UwwuLrphYd9TCZ9r7m5mi4CW1Oz
TAxEsmqiz8WG3Uj0Sjm1wX0UyCNLbwMX9s7g8LiZja5A6SEntlxhDS8u0+u+yB4P
fqriIaLSr4eM/9LaoKWbj0XglYi0K0tssYaN7qI7IwtoyDjVAjsKXBPN4U3ttzs3
OCVhg63Szx6LRdCdnYtcLUmZ8b4vS+5BnmrXH5xGeWF+46GS5yUk5ipJ9KTGQ+iL
lrui1dmkt2IprCaqSYCdABOo073omQ==
=mzlm
-----END PGP SIGNATURE-----

--mojihote6ig6i45p--

--===============1228269464709321264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1228269464709321264==--
