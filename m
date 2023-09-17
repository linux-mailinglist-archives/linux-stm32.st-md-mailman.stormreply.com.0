Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D01D07A3B9D
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Sep 2023 22:20:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76BB6C6B477;
	Sun, 17 Sep 2023 20:20:27 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49674C6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Sep 2023 20:20:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qhyFF-0008UD-3j; Sun, 17 Sep 2023 22:19:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qhyFB-0073yw-4k; Sun, 17 Sep 2023 22:19:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qhyFA-002Q2Y-R4; Sun, 17 Sep 2023 22:19:48 +0200
Date: Sun, 17 Sep 2023 22:19:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230917201946.5z5y2qn4ydpwppse@pengutronix.de>
References: <20230917165328.3403-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230917165328.3403-1-jszhang@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, johannes@sipsolutions.net,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix incorrect
	rxq|txq_stats reference
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
Content-Type: multipart/mixed; boundary="===============0571127070889616725=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0571127070889616725==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z7mb6j7jc652k2fi"
Content-Disposition: inline


--z7mb6j7jc652k2fi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 12:53:28AM +0800, Jisheng Zhang wrote:
> commit 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics
> where necessary") caused one regression as found by Uwe, the backtrace
> looks like:
>=20
> 	INFO: trying to register non-static key.
> 	The code is fine but needs lockdep annotation, or maybe
> 	you didn't initialize this object before use?
> 	turning off the locking correctness validator.
> 	CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc1-00449-g133466c3bbe1-=
dirty #21
> 	Hardware name: STM32 (Device Tree Support)
> 	 unwind_backtrace from show_stack+0x18/0x1c
> 	 show_stack from dump_stack_lvl+0x60/0x90
> 	 dump_stack_lvl from register_lock_class+0x98c/0x99c
> 	 register_lock_class from __lock_acquire+0x74/0x293c
> 	 __lock_acquire from lock_acquire+0x134/0x398
> 	 lock_acquire from stmmac_get_stats64+0x2ac/0x2fc
> 	 stmmac_get_stats64 from dev_get_stats+0x44/0x130
> 	 dev_get_stats from rtnl_fill_stats+0x38/0x120
> 	 rtnl_fill_stats from rtnl_fill_ifinfo+0x834/0x17f4
> 	 rtnl_fill_ifinfo from rtmsg_ifinfo_build_skb+0xc0/0x144
> 	 rtmsg_ifinfo_build_skb from rtmsg_ifinfo+0x50/0x88
> 	 rtmsg_ifinfo from __dev_notify_flags+0xc0/0xec
> 	 __dev_notify_flags from dev_change_flags+0x50/0x5c
> 	 dev_change_flags from ip_auto_config+0x2f4/0x1260
> 	 ip_auto_config from do_one_initcall+0x70/0x35c
> 	 do_one_initcall from kernel_init_freeable+0x2ac/0x308
> 	 kernel_init_freeable from kernel_init+0x1c/0x138
> 	 kernel_init from ret_from_fork+0x14/0x2c
>=20
> The reason is the rxq|txq_stats structures are not what expected
> because stmmac_open() -> __stmmac_open() the structure is overwritten
> by "memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));"
> This causes the well initialized syncp member of rxq|txq_stats is
> overwritten unexpectedly as pointed out by Johannes and Uwe.
>=20
> Fix this issue by moving rxq|txq_stats back to stmmac_extra_stats. For
> SMP cache friendly, we also mark stmmac_txq_stats and stmmac_rxq_stats
> as ____cacheline_aligned_in_smp.
>=20
> Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics where =
necessary")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reported-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I didn't look at the patch, but it makes the splat go away for me.
Thanks \o/

Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--z7mb6j7jc652k2fi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUHX2EACgkQj4D7WH0S
/k5snggAu813qfU1WKakoC+H/WXhJwN4cXPPgMXgDZA6nrYzT6bBacs0CwmyDpWt
QnNFTF3trjFkTqqD+OIn3o+sSBzDLWcePKsvaaAJwCnhdUwKN0NCS8wFsj1EUS6K
NlRGAoXKAMJ2GxBz/cjG3SH5crrX5JaWQ1Z300jnDyLuissdrE8e1p4FMkx7+u2U
tNQoaDlzrO7/Yyu252ydShGf/7BcPQ0ORHt+J3nwlnia8wEjsyhiuGBEdvNW+lgo
h4zST1Qthn8dzmTg8U4bqG9C1UWJSOC+jliAqn9m3wjguxxlozI1wp9EoAtnQhSy
eJazAhMpOnqwixpWYHL9dJV8Uuaxkw==
=c2ks
-----END PGP SIGNATURE-----

--z7mb6j7jc652k2fi--

--===============0571127070889616725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0571127070889616725==--
