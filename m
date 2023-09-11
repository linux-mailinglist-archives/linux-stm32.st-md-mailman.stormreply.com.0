Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7B79AA78
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 19:11:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B7A1C6B46F;
	Mon, 11 Sep 2023 17:11:33 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD920C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 17:11:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qfkRH-0003Ky-31; Mon, 11 Sep 2023 19:11:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qfkRD-005bHv-Av; Mon, 11 Sep 2023 19:11:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qfkRC-000kQa-Gf; Mon, 11 Sep 2023 19:11:02 +0200
Date: Mon, 11 Sep 2023 19:11:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230911171102.cwieugrpthm7ywbm@pengutronix.de>
References: <20230717160630.1892-1-jszhang@kernel.org>
 <20230717160630.1892-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230717160630.1892-3-jszhang@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [REGRESSION] [PATCH net-next v5 2/2] net: stmmac: use
 per-queue 64 bit statistics where necessary
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
Content-Type: multipart/mixed; boundary="===============1457789398619028671=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1457789398619028671==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="evb7p5evmmj2tflh"
Content-Disposition: inline


--evb7p5evmmj2tflh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

this patch became commit 133466c3bbe171f826294161db203f7670bb30c8 and is
part of v6.6-rc1.

On my arm/stm32mp157 based machine using NFS root this commit makes the
following appear in the kernel log:

	INFO: trying to register non-static key.
	The code is fine but needs lockdep annotation, or maybe
	you didn't initialize this object before use?
	turning off the locking correctness validator.
	CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc1-00449-g133466c3bbe1-di=
rty #21
	Hardware name: STM32 (Device Tree Support)
	 unwind_backtrace from show_stack+0x18/0x1c
	 show_stack from dump_stack_lvl+0x60/0x90
	 dump_stack_lvl from register_lock_class+0x98c/0x99c
	 register_lock_class from __lock_acquire+0x74/0x293c
	 __lock_acquire from lock_acquire+0x134/0x398
	 lock_acquire from stmmac_get_stats64+0x2ac/0x2fc
	 stmmac_get_stats64 from dev_get_stats+0x44/0x130
	 dev_get_stats from rtnl_fill_stats+0x38/0x120
	 rtnl_fill_stats from rtnl_fill_ifinfo+0x834/0x17f4
	 rtnl_fill_ifinfo from rtmsg_ifinfo_build_skb+0xc0/0x144
	 rtmsg_ifinfo_build_skb from rtmsg_ifinfo+0x50/0x88
	 rtmsg_ifinfo from __dev_notify_flags+0xc0/0xec
	 __dev_notify_flags from dev_change_flags+0x50/0x5c
	 dev_change_flags from ip_auto_config+0x2f4/0x1260
	 ip_auto_config from do_one_initcall+0x70/0x35c
	 do_one_initcall from kernel_init_freeable+0x2ac/0x308
	 kernel_init_freeable from kernel_init+0x1c/0x138
	 kernel_init from ret_from_fork+0x14/0x2c
	Exception stack(0xe0815fb0 to 0xe0815ff8)
	5fa0:                                     00000000 00000000 00000000 00000=
000
	5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000=
000
	5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
	dwc2 49000000.usb-otg: new device is high-speed

I didn't try understand this problem, it's too close to quitting time
:-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--evb7p5evmmj2tflh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmT/SiUACgkQj4D7WH0S
/k78iQf9FpYUT9EfyS7lnyhzUcBL/Xc3LHD8G07QANkglzeoMPSsfuql1xkWv+8r
A+OuA6vE48ibhtXi1Pla+3q0omeModLRjte6BkAbQI8dDjetVvUXwOBak9TAaVOS
b1xE9+nmR/xIGE8FOLiNQYqEmNTYN2cM8zxz1gj52zS0GdNe9Lc8f6Yl1Iv5lxo2
xSwSpQgr1wCPP7Fd/Esdi54i3hzx4NbongmBjQPyUiU9Hq5Ej/GDE8F26xH5C1Vg
B3mwCe5pdcUu5Z2u5RKfgTZYhjjRmSMT2LEsPklZ7XQGAjD8ab6lpwHRp6eMzuon
53IvuCgXCMctliVXrpYu8vvrhljHtA==
=2RjK
-----END PGP SIGNATURE-----

--evb7p5evmmj2tflh--

--===============1457789398619028671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1457789398619028671==--
