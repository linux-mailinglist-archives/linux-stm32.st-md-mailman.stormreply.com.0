Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2116D745966
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 11:54:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAB01C6B45A;
	Mon,  3 Jul 2023 09:53:59 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53A8DC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 09:53:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qGGFi-0000sj-6H; Mon, 03 Jul 2023 11:53:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qGGFW-00Blsj-7i; Mon, 03 Jul 2023 11:53:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qGGFV-001phL-C8; Mon, 03 Jul 2023 11:53:37 +0200
Date: Mon, 3 Jul 2023 11:53:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230703095337.27bhco7nkqtxr4me@pengutronix.de>
References: <20230627101215.58798-1-frank.li@vivo.com>
 <20230627110025.vgtplc6nluiiuvoh@pengutronix.de>
 <87h6qpyzkd.ffs@tglx>
 <690b12b7-5586-6ade-de83-99f463bc8397@vivo.com>
MIME-Version: 1.0
In-Reply-To: <690b12b7-5586-6ade-de83-99f463bc8397@vivo.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: heiko@sntech.de, hayashi.kunihiko@socionext.com, rafael@kernel.org,
 amitk@kernel.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 chi.minghao@zte.com.cn, srinivas.pandruvada@linux.intel.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 bchihi@baylibre.com, florian.fainelli@broadcom.com, daniel.lezcano@linaro.org,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com, wenst@chromium.org,
 rui.zhang@intel.com, thara.gopinath@gmail.com, mcoquelin.stm32@gmail.com,
 linux-pm@vger.kernel.org, miquel.raynal@bootlin.com,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-mediatek@lists.infradead.org, mmayer@broadcom.com,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 DLG-Adam.Ward.opensource@dm.renesas.com, johan+linaro@kernel.org,
 angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org,
 niklas.soderlund+renesas@ragnatech.se, andersson@kernel.org,
 linux-kernel@vger.kernel.org, shangxiaojing@huawei.com,
 konrad.dybcio@linaro.org, kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 01/15] genirq/devres: Add error
 information printing for devm_request_threaded_irq()
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
Content-Type: multipart/mixed; boundary="===============1558048813313278562=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1558048813313278562==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ifm6dkdtwbp3ztq"
Content-Disposition: inline


--4ifm6dkdtwbp3ztq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jul 03, 2023 at 05:13:29PM +0800, Yangtao Li wrote:
> [...] v3 has been sent.

Please make sure that you send a v3 patch series (at least) to the
people who gave you feedback for v2. If you skip people who had general
concerns about the whole series, this might help you in the short run
because they might miss to also criticise v3, but in the long run it
might result in a loss of trust in you.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4ifm6dkdtwbp3ztq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSimqAACgkQj4D7WH0S
/k6WAQgApvFvslry9NwR8H0z4aDKfgwg20hFIuR9LFKWPzquLmB7y1nBdA9z1Mpp
Ybkb+E4cxXIe/uFWnm7mr+SlHuHQdwR6b983iZQjHGYCLiqxcAcWzp0W+b/ZH8JZ
AYUipaQ9T6hm8Kqh+HgQN5VhXv7PM0fQH/yoBNeEF+CDsMwGMAoViefMhwHeZLx2
+yHExhGOQNgoN2ge6GgpvdryJJ1NSl5PXpcyCG+1ED6a1pGmueDK5ipp+dMaxOQg
l3/9ECPLYTDvPK4951UMlOuWdVG5qKqYw8q9Z8I5QGTav+lKoshXgpbAbQnHNpv+
44KmixTXlQmRdC4XP2f1Em3/fP/8Dw==
=4vu6
-----END PGP SIGNATURE-----

--4ifm6dkdtwbp3ztq--

--===============1558048813313278562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1558048813313278562==--
