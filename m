Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F447B6896
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 14:09:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2597C6B478;
	Tue,  3 Oct 2023 12:09:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E660C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 12:09:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1qneCg-0007eJ-Ik; Tue, 03 Oct 2023 14:08:42 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mkl@pengutronix.de>)
 id 1qneCb-00Al6F-SV; Tue, 03 Oct 2023 14:08:37 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id D0B6422CC33;
 Tue,  3 Oct 2023 11:26:49 +0000 (UTC)
Date: Tue, 3 Oct 2023 13:26:49 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <20231003-struggle-lung-3d7c89eab00b-mkl@pengutronix.de>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-3-ansuelsmth@gmail.com>
 <20231003-living-seltzer-172ea6aec629-mkl@pengutronix.de>
 <651bf88c.050a0220.3a982.31fc@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <651bf88c.050a0220.3a982.31fc@mx.google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>,
 Rick Lindsley <ricklind@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>,
 Dany Madden <danymadden@us.ibm.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Zhengchao Shao <shaozhengchao@huawei.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>,
 Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Haren Myneni <haren@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Jose Abreu <joabreu@synopsys.com>, Alex Elder <elder@linaro.org>,
 linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>,
 Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bailey Forrest <bcf@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-can@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>,
 Krzysztof Halasa <khalasa@piap.pl>, Benjamin Berg <benjamin.berg@intel.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yuri Karpov <YKarpov@ispras.ru>,
 linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Zheng Zengkai <zhengzengkai@huawei.com>, netdev@vger.kernel.org,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Douglas Miller <dougmill@linux.ibm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Junfeng Guo <junfeng.guo@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next PATCH 3/4] netdev: replace
 napi_reschedule with napi_schedule
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
Content-Type: multipart/mixed; boundary="===============0925957110889954652=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0925957110889954652==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbzdaj4jqyp54e52"
Content-Disposition: inline


--zbzdaj4jqyp54e52
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03.10.2023 13:18:33, Christian Marangi wrote:
> On Tue, Oct 03, 2023 at 09:16:33AM +0200, Marc Kleine-Budde wrote:
> > On 02.10.2023 17:10:22, Christian Marangi wrote:
> > > Now that napi_schedule return a bool, we can drop napi_reschedule that
> > > does the same exact function. The function comes from a very old comm=
it
> > > bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of st=
ruct
> > > net_device") and the purpose is actually deprecated in favour of
> > > different logic.
> > >=20
> > > Convert every user of napi_reschedule to napi_schedule.
> > >=20
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
> > >  drivers/net/can/dev/rx-offload.c                       |  2 +-
> >=20
> > Acked-by: Marc Kleine-Budde # for can/dev/rx-offload.c
>=20
> Just to make sure can I use the correct tag: (you didn't include the
> mail)

Doh! Sure.

> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload=
=2Ec

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--zbzdaj4jqyp54e52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmUb+nYACgkQvlAcSiqK
BOgAwwf9HSZX1sxRgnOHWLXSBACCTpqNm26rDzNrIqPlybJQVie8rNauFCEQbSz+
cKDZD68pDokwEv+8WajpOBW0d/Zc27B2d7EZtYhlopNFjo0XIPYoYfA6QTXfZ6Qs
vi22lC87vHoyEwEi37X3yTPapJVY2GDgyGSD+8FsdOliNE679gautzYvZSWLPiRF
stXo71bRBm15AbVKwCuOqymieHGxKbooQ09lRIYUXdK6oF671CJLKUia6m9Qg42f
6Itf4TBPlF4XdxS0vqKrvTsg78XduHN1FmuI+RJIPdzULMx9CoUlr8BOSfGomsN3
eoH9v4s8IDrkLGQifa7oRIgxg9EkFw==
=72hV
-----END PGP SIGNATURE-----

--zbzdaj4jqyp54e52--

--===============0925957110889954652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0925957110889954652==--
