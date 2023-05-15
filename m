Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD14E702862
	for <lists+linux-stm32@lfdr.de>; Mon, 15 May 2023 11:24:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F132C6A613;
	Mon, 15 May 2023 09:24:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B450C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 May 2023 09:24:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pyUNq-0004G7-84; Mon, 15 May 2023 11:20:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pyUNQ-000KQl-8J; Mon, 15 May 2023 11:20:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pyUNP-004cYH-B9; Mon, 15 May 2023 11:20:19 +0200
Date: Mon, 15 May 2023 11:20:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Inki Dae <daeinki@gmail.com>
Message-ID: <20230515092019.a3uwmofkkujo772g@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <CAAQKjZP5jhwFg9sNndpa6_7G6HoV76heQbt=knoOEZZskexrhg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQKjZP5jhwFg9sNndpa6_7G6HoV76heQbt=knoOEZZskexrhg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Rahul T R <r-ravikumar@ti.com>, Jani Nikula <jani.nikula@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org,
 Yuan Can <yuancan@huawei.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, Tian Tao <tiantao6@hisilicon.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>, Karol Herbst <kherbst@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stefan Agner <stefan@agner.ch>, Michal Simek <michal.simek@xilinx.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, John Stultz <jstultz@google.com>,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Sandy Huang <hjc@rock-chips.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Jayshri Pawar <jpawar@cadence.com>,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <linux@armlinux.org.uk>,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <mwen@igalia.com>, linux-mediatek@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Liu Ying <victor.liu@nxp.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 00/53] drm: Convert to platform remove
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
Content-Type: multipart/mixed; boundary="===============1254996350325065878=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1254996350325065878==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="suzv37z45wvm64m4"
Content-Disposition: inline


--suzv37z45wvm64m4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 04:50:57PM +0900, Inki Dae wrote:
> Hi,
>=20
> 2023=EB=85=84 5=EC=9B=94 8=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:32, =
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =
=EC=9E=91=EC=84=B1:
> >
> > Hello,
> >
> > this patch series adapts the platform drivers below drivers/gpu/drm
> > to use the .remove_new() callback. Compared to the traditional .remove()
> > callback .remove_new() returns no value. This is a good thing because
>=20
> First of all, I apologize for the delay in providing my review comments.
>=20
> Not related to this patch but seems that the "remove_new" callback
> naming implicitly implies that there is no need to return anything
> since its return type is void. To help users understand the intended
> behavior based on the callback name, how about considering a modified
> naming convention like "remove_no_return" or something similar?
>=20
> The relevant patch has already been merged as outlined below,
> author Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> 2022-12-09
> 16:09:14 +0100
> committer Greg Kroah-Hartman <gregkh@linuxfoundation.org> 2023-01-17
> 19:04:17 +0100
> commit 5c5a7680e67ba6fbbb5f4d79fa41485450c1985c (patch)
> tree 0b6dbc003a6bb4a3f7fb084d31326bbfa3ba3f7c
> parent 7bbb89b420d9e290cb34864832de8fcdf2c140dc (diff)
> download linux-5c5a7680e67ba6fbbb5f4d79fa41485450c1985c.tar.gz
> platform: Provide a remove callback that returns no value
>=20
> Maybe a trivial thing but how about renaming it? I think the postfix,
> 'new', is a very generic word. I think you could introduce another
> patch for it if you think it's reasonable.

=2Eremove_new is only a temporary name. Once all drivers are converted,
=2Eremove is changed to return void and then all drivers are converted
back. While "remove_new" might not be a brilliant name choice, touching
all already converted drivers again just to improve the temporary
measures doesn't sound right.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--suzv37z45wvm64m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRh+VIACgkQj4D7WH0S
/k7epggAlsMX1TbSjMAIV+LPNrZU/ErXl1QWJt2/nA/iQmxppFkkR19U334HeeZf
VXsu0FwIvUZpfndnO3hCw3pvEa4gQiTo7reQsd28ECZaLwTVQYvp6o/LceTtaOJ2
5+FeefPV0mHxQ6SiXZ7g7aA4gkkw2iJY9s7LaPHHXw0jpyOpcZHlNzJioLe4RHdT
eFYzR99DVhYH81tw8szT4fpAS3Vw2Eqq5PyQHDRT12PrJdM0Ig+3ei53DU4adRWh
w/kH6vGx2XBIbqNrXq5AcSjVnMvrKq7iKPRxMCz58JC4oCirfqT+7tGWbOgJLLEx
BCbOuZXZE9d8Thjrbo3cXVRujnhsLg==
=GMrP
-----END PGP SIGNATURE-----

--suzv37z45wvm64m4--

--===============1254996350325065878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1254996350325065878==--
