Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DB2755002
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Jul 2023 19:08:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E779C6A603;
	Sun, 16 Jul 2023 17:08:25 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D05BC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Jul 2023 17:08:23 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1qL5EI-0006nk-3h; Sun, 16 Jul 2023 19:08:18 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id D858F1F1E4D;
 Sun, 16 Jul 2023 17:08:14 +0000 (UTC)
Date: Sun, 16 Jul 2023 19:08:13 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230716-rippling-wafer-1c986e593fc5-mkl@pengutronix.de>
References: <20230714174841.4061919-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230714174841.4061919-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, devicetree@vger.kernel.org,
 Al Cooper <alcooperx@gmail.com>, dri-devel@lists.freedesktop.org,
 Justin Chen <justin.chen@broadcom.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Alban Bedel <albeu@free.fr>,
 Alim Akhtar <alim.akhtar@samsung.com>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-phy@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Yu Chen <chenyu56@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-can@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, JC Kuo <jckuo@nvidia.com>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-usb@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [Linux-stm32] [PATCH] phy: Explicitly include correct DT
	includes
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
Content-Type: multipart/mixed; boundary="===============2409697643960315658=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2409697643960315658==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nbfpe5avx7koqgt4"
Content-Disposition: inline


--nbfpe5avx7koqgt4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14.07.2023 11:48:35, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/phy/phy-can-transceiver.c                     | 1 +

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for drivers/phy/phy-can-=
transceiver.c

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--nbfpe5avx7koqgt4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmS0I/oACgkQvlAcSiqK
BOjjrwgArExbry3lxXJ0IU/QstoPtXDWo1kq+VrGdKo90TUKc6zRFxqvnUNRrjBk
9aVhw60wUadmaqmq+5XBpVPES7N6/lzVGQxqKvMo90pMkksfG+isH43EGgJKSCGW
50aecO37i/0V2xhrIoHdcChv/8G2ND7TCQRoREFPHZZAZCY8ounBXRoNZD0XmC8y
SxL3qs9NG4rSdKSzQuXZ9tNqThZ5R+dU+jXGeBYK2/yhaiBr9bLokg9qS4ZA2Keh
OIbgZeiYE8RrbwcPL1CrMYM/mY1MEyVqOTrWb6xzJZYYzJENZi11xoPi5nB+x2zP
F5frwLP70qIiMDMihQLMvpd/SRkwEA==
=Qdmr
-----END PGP SIGNATURE-----

--nbfpe5avx7koqgt4--

--===============2409697643960315658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2409697643960315658==--
