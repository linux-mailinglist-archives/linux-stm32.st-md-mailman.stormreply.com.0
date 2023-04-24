Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2613E6E4106
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 09:31:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7003C6B455;
	Mon, 17 Apr 2023 07:31:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D27CC6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 07:31:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1poJKU-0007L0-4Y; Mon, 17 Apr 2023 09:31:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1poJK6-00Bp12-OV; Mon, 17 Apr 2023 09:30:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1poJK5-00DpzA-RD; Mon, 17 Apr 2023 09:30:49 +0200
Date: Mon, 17 Apr 2023 09:30:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
 <20230417061928.GD28551@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20230417061928.GD28551@pendragon.ideasonboard.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Heiko Stuebner <heiko@sntech.de>, Eddie James <eajames@linux.ibm.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Sean Young <sean@mess.org>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Antti Palosaari <crope@iki.fi>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Tretter <m.tretter@pengutronix.de>, Benoit Parrot <bparrot@ti.com>,
 Moudy Ho <moudy.ho@mediatek.com>, kernel@pengutronix.de,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Ming Qian <ming.qian@nxp.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-aspeed@lists.ozlabs.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Colin Ian King <colin.i.king@gmail.com>, linux-media@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Rory Liu <hellojacky0226@hotmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Dan Carpenter <error27@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jacob Chen <jacob-chen@iotwrt.com>, Joel Stanley <joel@jms.id.au>,
 Yang Yingliang <yangyingliang@huawei.com>, Bin Liu <bin.liu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>,
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
 linux-renesas-soc@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 openbmc@lists.ozlabs.org, Andy Gross <agross@kernel.org>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Eduardo Valentin <edubezval@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 linux-mediatek@lists.infradead.org, Yong Deng <yong.deng@magewell.com>,
 linux-tegra@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
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
Content-Type: multipart/mixed; boundary="===============3406669859922885479=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3406669859922885479==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="enjtn2rx24tdhzqa"
Content-Disposition: inline


--enjtn2rx24tdhzqa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

On Mon, Apr 17, 2023 at 09:19:28AM +0300, Laurent Pinchart wrote:
> On Mon, Apr 17, 2023 at 08:02:03AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Sun, Mar 26, 2023 at 04:30:25PM +0200, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > >=20
> > > this series adapts the platform drivers below drivers/pci to use the
> >=20
> > copy&paste failure here: s/pci/media/ of course.
> >=20
> > > .remove_new() callback. Compared to the traditional .remove() callback
> > > .remove_new() returns no value. This is a good thing because the driv=
er core
> > > doesn't (and cannot) cope for errors during remove. The only effect o=
f a
> > > non-zero return value in .remove() is that the driver core emits a wa=
rning. The
> > > device is removed anyhow and an early return from .remove() usually y=
ields a
> > > resource leak.
> > >=20
> > > By changing the remove callback to return void driver authors cannot
> > > reasonably assume any more that there is some kind of cleanup later.
> > >=20
> > > Only three drivers needed some preparation first to make sure they
> > > return 0 unconditionally in their remove callback. Then all drivers
> > > could be trivially converted without side effects to .remove_new().
> > >=20
> > > The changes to the individual drivers are all orthogonal. If I need to
> > > resend some patches because of some review feedback, I'd like to only
> > > send the patches that actually needed changes, so please pick up the
> > > remaining patches that don't need changing to reduce the amount of ma=
il.
> >=20
> > I didn't hear anything back about application of this series. Is there a
> > blocker somewhere?
>=20
> I think the series got applied to the master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git.
> It should thus appear in v6.4.

I guess that linux-stable.git is a copy&paste failure (and it's not
there). I don't see the series in the master branch of
git://linuxtv.org/media_tree.git either.

=2E. a bit later ...

ah, it's in git://linuxtv.org/mchehab/media-next.git

I guess I was just to quick and probably the series will be included in
today's next.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--enjtn2rx24tdhzqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ89agACgkQj4D7WH0S
/k4s4ggArN93FA4J2SsWoxIGdtsLlazayNtSo5PW6O/QoaJlVadcVzXLyWFbOYBA
HognJPhOuPdPgaG4joVLMnL4IurY2Xd7+V7furLfSXnvFTqR9fyRieSzpj2zHHa8
uvvsD23g59Zmp7adY7VSmMpjYFyJsftQw/M7wPGXRdBhXR3IFXLhcUj9m2zzFYA5
/iO9j+CBw4KVF6pwz/qeOaZzA3JzREoHi8DMAn/CsKVmuykddnS2gaXdV/fId10f
PfyO+KMvCVH3+F1m60IRVQtpj1/Oss3/xSLE3VZZ7cGB1CPCFtAaSMUIUUDUWuMR
pIARu6BSUoL5anKyR34AryZO1vG9lA==
=f/6G
-----END PGP SIGNATURE-----

--enjtn2rx24tdhzqa--

--===============3406669859922885479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3406669859922885479==--
