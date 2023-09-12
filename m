Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE9B79CB9D
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 11:24:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2826C6B46F;
	Tue, 12 Sep 2023 09:24:41 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C72BC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 09:24:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qfzd1-00051C-8F; Tue, 12 Sep 2023 11:24:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qfzcy-005kKY-Ir; Tue, 12 Sep 2023 11:24:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qfzcx-00123X-Sb; Tue, 12 Sep 2023 11:24:11 +0200
Date: Tue, 12 Sep 2023 11:24:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>,
	Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230912092411.pprnpvrbxwz77x6a@pengutronix.de>
References: <20230717160630.1892-1-jszhang@kernel.org>
 <20230717160630.1892-3-jszhang@kernel.org>
 <20230911171102.cwieugrpthm7ywbm@pengutronix.de>
 <ZQAa3277GC4c9W1D@xhacker>
 <99695befef06b025de2c457ea5f861aa81a0883c.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <99695befef06b025de2c457ea5f861aa81a0883c.camel@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Paolo Abeni <pabeni@redhat.com>, kernel@pengutronix.de,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Johannes Berg <johannes@sipsolutions.net>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
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
Content-Type: multipart/mixed; boundary="===============5592099088641082753=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5592099088641082753==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="izhmnabaedjwyx73"
Content-Disposition: inline


--izhmnabaedjwyx73
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Sep 12, 2023 at 11:04:16AM +0200, Lucas Stach wrote:
> Am Dienstag, dem 12.09.2023 um 16:01 +0800 schrieb Jisheng Zhang:
> > On Mon, Sep 11, 2023 at 07:11:02PM +0200, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > >=20
> > > this patch became commit 133466c3bbe171f826294161db203f7670bb30c8 and=
 is
> > > part of v6.6-rc1.
> > >=20
> > > On my arm/stm32mp157 based machine using NFS root this commit makes t=
he
> > > following appear in the kernel log:
> > >=20
> > > 	INFO: trying to register non-static key.
> > > 	The code is fine but needs lockdep annotation, or maybe
> > > 	you didn't initialize this object before use?
> > > 	turning off the locking correctness validator.
> > > 	CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc1-00449-g133466c3b=
be1-dirty #21
> > > 	Hardware name: STM32 (Device Tree Support)
> > > 	 unwind_backtrace from show_stack+0x18/0x1c
> > > 	 show_stack from dump_stack_lvl+0x60/0x90
> > > 	 dump_stack_lvl from register_lock_class+0x98c/0x99c
> > > 	 register_lock_class from __lock_acquire+0x74/0x293c
> > > 	 __lock_acquire from lock_acquire+0x134/0x398
> > > 	 lock_acquire from stmmac_get_stats64+0x2ac/0x2fc
> > > 	 stmmac_get_stats64 from dev_get_stats+0x44/0x130
> > > 	 dev_get_stats from rtnl_fill_stats+0x38/0x120
> > > 	 rtnl_fill_stats from rtnl_fill_ifinfo+0x834/0x17f4
> > > 	 rtnl_fill_ifinfo from rtmsg_ifinfo_build_skb+0xc0/0x144
> > > 	 rtmsg_ifinfo_build_skb from rtmsg_ifinfo+0x50/0x88
> > > 	 rtmsg_ifinfo from __dev_notify_flags+0xc0/0xec
> > > 	 __dev_notify_flags from dev_change_flags+0x50/0x5c
> > > 	 dev_change_flags from ip_auto_config+0x2f4/0x1260
> > > 	 ip_auto_config from do_one_initcall+0x70/0x35c
> > > 	 do_one_initcall from kernel_init_freeable+0x2ac/0x308
> > > 	 kernel_init_freeable from kernel_init+0x1c/0x138
> > > 	 kernel_init from ret_from_fork+0x14/0x2c
> > > 	Exception stack(0xe0815fb0 to 0xe0815ff8)
> > > 	5fa0:                                     00000000 00000000 00000000=
 00000000
> > > 	5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000=
 00000000
> > > 	5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > > 	dwc2 49000000.usb-otg: new device is high-speed
> > >=20
> > > I didn't try understand this problem, it's too close to quitting time
> > > :-)
> >=20
> > Thanks for the bug report, I'm checking the code.
>=20
> The newly added "struct u64_stats_sync syncp" uses a seqlock
> internally, which is broken into multiple words on 32bit machines, and
> needs to be initialized properly. You need to call u64_stats_init on
> syncp before first usage.

This is done. The problematic thing is that in stmmac_open() ->
__stmmac_open() the syncp initialized before is overwritten by

	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));

Do I need to point out that this is ugly?

Together with Johannes Berg I debugged that in #netdev and we came up
with:

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac_main.c
index 9a3182b9e767..a3481b48c77f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3893,7 +3893,7 @@ static int stmmac_open(struct net_device *dev)
 {
 	struct stmmac_priv *priv =3D netdev_priv(dev);
 	struct stmmac_dma_conf *dma_conf;
-	int ret;
+	int ret, i;
=20
 	dma_conf =3D stmmac_setup_dma_desc(priv, dev->mtu);
 	if (IS_ERR(dma_conf))
@@ -3904,6 +3904,13 @@ static int stmmac_open(struct net_device *dev)
 		free_dma_desc_resources(priv, dma_conf);
=20
 	kfree(dma_conf);
+
+	dma_conf =3D &priv->dma_conf;
+	for (i =3D 0; i < MTL_MAX_RX_QUEUES; i++)
+		u64_stats_init(&dma_conf->rx_queue[i].rxq_stats.syncp);
+	for (i =3D 0; i < MTL_MAX_TX_QUEUES; i++)
+		u64_stats_init(&dma_conf->tx_queue[i].txq_stats.syncp);
+
 	return ret;
 }
=20
which works around the problem. Note however that the u64_stats_init()
calls must not be deleted from stmmac_dvr_probe() because it's used
there once before __stmmac_open() overwrites it.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--izhmnabaedjwyx73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUALjsACgkQj4D7WH0S
/k72JAf+LYM1CkJhOhJS/1kV0hkKafHhVe1lKd95/Zz/LUAsKlW0e9mBrZt3me/f
4yWOpzSpDcQ5+foH8JSQQPkVcxn0pz54Gd1nZFxbAJ4zeK/n/TrTmT4p7NZLPsvS
0OFmRm1w8GX0NH66fB+NcL+bH9JFJr6TTP/bPjJSZRmtUHMsFAh3nRp0/6NmsAnz
6CsQ0mFfqeXwu9aPaZLADQxkR2sjEyJLLSs0nC/8Y2Uc1CwhQvbkx8p7uHq6JofB
AtH1Kv9A8c4IdGuOOPe59LwZgKLFg566o0GV2VLgpLHubvIXwhmuE/RBIAiMewNb
oiQEaXy5c8ei526q5NisU4+4ttrYwA==
=5UuB
-----END PGP SIGNATURE-----

--izhmnabaedjwyx73--

--===============5592099088641082753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5592099088641082753==--
