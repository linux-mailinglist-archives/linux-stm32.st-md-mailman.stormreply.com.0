Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2C57346FD
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Jun 2023 18:32:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FB6AC6A606;
	Sun, 18 Jun 2023 16:32:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C690BC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jun 2023 16:32:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qAvIE-0007iI-Ow; Sun, 18 Jun 2023 18:30:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qAvHk-008Jb7-8Z; Sun, 18 Jun 2023 18:29:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qAvHi-00FKRv-H8; Sun, 18 Jun 2023 18:29:50 +0200
Date: Sun, 18 Jun 2023 18:29:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <20230618162950.6th2yo66baqay5mv@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
MIME-Version: 1.0
In-Reply-To: <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Raymond Tan <raymond.tan@intel.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>,
 Inki Dae <inki.dae@samsung.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Wang Jianzheng <wangjianzheng@vivo.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Brian Starkey <brian.starkey@arm.com>, Karol Herbst <kherbst@redhat.com>,
 Miaoqian Lin <linmq006@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Michal Simek <michal.simek@xilinx.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh@kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Doug Anderson <dianders@chromium.org>, Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laura Nao <laura.nao@collabora.com>, David Airlie <airlied@gmail.com>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Yongqin Liu <yongqin.liu@linaro.org>, Jayshri Pawar <jpawar@cadence.com>,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <linux@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <mwen@igalia.com>, linux-mediatek@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] patches dropped from drm-misc-next [Was: Re:
 [PATCH 00/53] drm: Convert to platform remove callback returning] void
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
Content-Type: multipart/mixed; boundary="===============4831051228471725839=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4831051228471725839==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56squ37ki3ucgp5d"
Content-Disposition: inline


--56squ37ki3ucgp5d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Maxime,

On Sun, Jun 18, 2023 at 04:32:55PM +0200, Maxime Ripard wrote:
> On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wrote:
> > > On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > Together with the patches that were applied later the topmost commit
> > > > from this series is c2807ecb5290 ("drm/omap: Convert to platform re=
move
> > > > callback returning void"). This commit was part for the following n=
ext
> > > > tags:
> > > >
> > > >         $ git tag -l --contains c2807ecb5290
> > > >         next-20230609
> > > >         next-20230613
> > > >         next-20230614
> > > >         next-20230615
> > > >
> > > > However in next-20230616 they are missing. In next-20230616
> > > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a3508866=
0.
> > > > Compared to c2807ecb5290 this adds 1149 patches but drops 37 (that =
are
> > > > also not included with a different commit id). The 37 patches dropp=
ed
> > > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
> > > >
> > > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa9dc.=
=2Ec2807ecb5290
> > > >              1  Christophe JAILLET
> > > >              2  Jessica Zhang
> > > >              5  Karol Wachowski
> > > >              1  Laura Nao
> > > >             27  Uwe Kleine-K=C3=B6nig
> > > >              1  Wang Jianzheng
> > > >
> > > >
> > > > I guess this was done by mistake because nobody told me about dropp=
ing
> > > > my/these patches? Can c2807ecb5290 please be merged into drm-misc-n=
ext
> > > > again?
> > >=20
> > > Actually, it was probably a mistake that these patches got merged to
> > > linuxnext during the 4 days that you noticed. However, your patches
> > > aren't dropped and are still present in drm-misc-next.
> > >=20
> > > drm-misc has a bit of a unique model and it's documented fairly well =
here:
> > >=20
> > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> >=20
> > Is there a flaw then in this unique model (or its implementation) when
> > drm-misc/for-linux-next moves in a non-fast-forward manner? This isn't
> > expected, is it?
>=20
> There's no expectation afaik. Any tree merged in linux-next can be
> rebased, drop a patch, amend one, etc. without any concern.

I agree that there are no rules broken for a tree that is included in
next and a maintainer is free to rewrite their tree independant of the
tree being included in next.

Still I think that shouldn't be used as an excuse. For me, if a
maintainer puts some patch into next that's a statement saying
(approximately) "I think this patch is fine and I intend to send it to
Linus during the next merge window.". So my expectation is that if a
patch is dropped again from next, there was a problem and it would be
fair if the maintainer tells the author/submitter about this problem and
that the patch was dropped.

So my concern is not about rule breaking, but about the strange signal
that is sent to contributors by including their work in next for some
time and then dropping it again without comment.

> It's also why linux-next is rebuilt entirely every day.
>=20
> > > The key is that committers can commit to drm-misc-next _at any time_
> > > regardless of the merge window. The drm-misc merge strategy makes this
> > > OK. Specifically, when it's late in the linux cycle then drm-misc-next
> > > is supposed to stop merging to linuxnext. Then, shortly after the
> > > merge window closes, patches will start flowing again.
> > >=20
> > > So basically your patches are landed and should even keep the same git
> > > hashes when they eventually make it to Linux. They just won't land for
> > > another release cycle of Linux.
> >=20
> > OK, c2807ecb5290 is still included in drm-misc-next. So while I don't
> > understand the whole model, the patches at least seem to be scheduled to
> > go in during the next merge window.
>=20
> It's not that complicated.
>=20
> drm-misc-next is always open, and we start targeting release X + 2 when
> X-rc6 is released.
>=20
> This is due to Linus wanting all the commits sent as part of the PR in
> linux-next for two weeks.
>=20
> In order to converge towards (X + 1)-rc1 in linux-next, as soon as X-rc6
> is released, we remove drm-misc-next from the linux-next branch. All the
> patches in drm-misc-next that were targetting X + 1 are in drm/next by
> then, so it's not a concern.

So if I were a maintainer of drm-misc, I'd want that no commit from
drm-misc-next migrates to next after -rc6.

Also note that the branch head in question (i.e. c2807ecb5290) was
included in next-20230609, while v6.4-rc6 was tagged on Jun 11. So
according to the rules you described c2807ecb5290 could have been
qualified to go into v6.5-rc1?!

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--56squ37ki3ucgp5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSPMP0ACgkQj4D7WH0S
/k5slQf/QGa59eGA08Ft03sMAU0WPOe2pro9UKpdc0k/xBm24fC7BCSdOSlR7bXI
Yk6FDfiYpZII3/lP8R+rQrHLhbqjpimjuGjXcKbGq60shljeQf3zOEMwL5Q4yUgD
Rd/FHwMdOLAtsOPYEYABK+DXld46QIlTPcKncCp4HXgsTSP4hL68rUM1rBHehmwQ
V9Au18gv810TLMbgaBZ32xzFXKId31Myw7Nya2Rhuv9iuardyCfKxfrh95WUVM2N
iihFikVUtNTP0rOe0qJHF65A6l0wvexZ4OuL5fc3DZonv3/D6RNu5Jl/Tm4h2RgE
EPFxcFKuIo9eFOU4Yvtn2yIKvB6YWQ==
=ov7F
-----END PGP SIGNATURE-----

--56squ37ki3ucgp5d--

--===============4831051228471725839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4831051228471725839==--
