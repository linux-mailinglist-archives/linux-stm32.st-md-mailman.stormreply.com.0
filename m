Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E458C6E42F7
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 10:54:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A149C6B454;
	Mon, 17 Apr 2023 08:54:38 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 510A0C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 08:54:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1poKd9-0004W9-9f; Mon, 17 Apr 2023 10:54:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1poKce-00Bpk9-B4; Mon, 17 Apr 2023 10:54:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1poKcd-00DrOr-K2; Mon, 17 Apr 2023 10:54:03 +0200
Date: Mon, 17 Apr 2023 10:54:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>
Message-ID: <20230417085403.sbk3k4qlpljbfqld@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
 <20230417061928.GD28551@pendragon.ideasonboard.com>
 <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
 <OS0PR01MB59221153A63F64BBAD3ED20D869C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB59221153A63F64BBAD3ED20D869C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Heiko Stuebner <heiko@sntech.de>, Eddie James <eajames@linux.ibm.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Robert Foss <rfoss@kernel.org>, Dafna Hirschfeld <dafna@fastmail.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Antti Palosaari <crope@iki.fi>,
 NXP Linux Team <linux-imx@nxp.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Tretter <m.tretter@pengutronix.de>,
 Moudy Ho <moudy.ho@mediatek.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Ming Qian <ming.qian@nxp.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Rory Liu <hellojacky0226@hotmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Dan Carpenter <error27@gmail.com>, Sean Young <sean@mess.org>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jacob Chen <jacob-chen@iotwrt.com>, Joel Stanley <joel@jms.id.au>,
 Yang Yingliang <yangyingliang@huawei.com>, Bin Liu <bin.liu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Qiheng Lin <linqiheng@huawei.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Scott Chao <scott_chao@wistron.corp-partner.google.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Andy Gross <agross@kernel.org>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Benoit Parrot <bparrot@ti.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Yong Deng <yong.deng@magewell.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [Linux-stm32] [PATCH 000/117] media: Convert to platform remove
 callback returning void
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
Content-Type: multipart/mixed; boundary="===============4760542850721830240=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4760542850721830240==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbine4cndaaohubi"
Content-Disposition: inline


--fbine4cndaaohubi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 07:57:57AM +0000, Biju Das wrote:
> Hi Uwe,
> > > I think the series got applied to the master branch of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git.
> > > It should thus appear in v6.4.
> >=20
> > I guess that linux-stable.git is a copy&paste failure (and it's not the=
re).
> > I don't see the series in the master branch of
> > git://linuxtv.org/media_tree.git either.
> >=20
> > .. a bit later ...
> >=20
> > ah, it's in git://linuxtv.org/mchehab/media-next.git
> >=20
> > I guess I was just to quick and probably the series will be included in
> > today's next.
>=20
> I believe patchwork <patchwork@linuxtv.org> will send notification to
> author and along with people who applied tags for that patch.

Indeed, I got such a notification on Apr 11. But even if I had that on
my radar when asking and considered such notifications reliable in
general, I would have asked, as the patches didn't apprear in next up to
now.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fbine4cndaaohubi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ9CSoACgkQj4D7WH0S
/k6ShQgAkiGsAbqnu5CIYl6vVltmySdbzFphOT5lae+k2iaPjP4KBQyey9E309bA
T8cWAHGmSzTAr3+xiHj0Vl3KS3KltR2ike2TLIupFKTW6gJIpAyseCA8SLtj625z
DYRY5/9pDFLtNe4MD6tpVn7ZPAzEb/DdC/F12elKbSP+3RLwwRhyo/EtmAbFc6f9
e/G2EuuAPaBs+wywWC9piaSjYWk57nSelhyJqSoWAJbpZM2hOiGsIeaiI2OI6l9X
sye5ayrw1sdGUVa70KExUaG9L0d1hFmhkfZz3m7I2ZosIc5Q3k5RCBDj41MxyvTC
7hFi24KnDnjHVL2gEWrM+oBRJZju9Q==
=h+pR
-----END PGP SIGNATURE-----

--fbine4cndaaohubi--

--===============4760542850721830240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4760542850721830240==--
