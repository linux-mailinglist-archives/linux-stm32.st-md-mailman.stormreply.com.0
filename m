Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CC9768D96
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:16:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 999C8C6A613;
	Mon, 31 Jul 2023 07:16:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E521AC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689160485; x=1720696485;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pa2Bj6VqT5cElyyhfEvI8AxkZz4IX9juc4rRJw0HbBE=;
 b=hFYg/N22Sh9CfxaftH8T5xpVegf2lB1XDELWh8aWRe23i4sHP1idMeX/
 ZNTeJ8EwlFlVb0jtLfJfoxFbqAQKLwJUl5Z7KAeBWro6MaWe0l7DOmtMu
 9p56+g98xyXcP+yo7vREKzlNHJMO7Bhjrt2YVPh8JjWFrsfvVdtKoYN6j
 jnPHTGE+oCIawcNeF0atihkCmqCA3+cWV9JWs8ADXE9ZnFoOrYgNTjuyM
 rEBakjD4CkOf6TPuMrn2ozKAbgIOqti63kiZ0enkc3WQM8nF/09yrw3wi
 IRn9tDWTTI86UplLNhiwI5rCsankuzs/RZyfRETT2g6G4zkMRDJ3CLpv+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="368396114"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="368396114"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="1052148842"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="1052148842"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.31.249])
 ([10.213.31.249])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:13:48 -0700
Message-ID: <60a183df-9776-1f10-bbd7-248531921888@intel.com>
Date: Wed, 12 Jul 2023 13:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <94eb6e4d-9384-152f-351b-ebb217411da9@amd.com>
 <20230712110253.paoyrmcbvlhpfxbf@pengutronix.de>
 <acd7913-3c42-7354-434-a826b6c8718@inria.fr>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <acd7913-3c42-7354-434-a826b6c8718@inria.fr>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:17 +0000
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Liu Shixin <liushixin2@huawei.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin <zackr@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Lechner <david@lechnology.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 David Francis <David.Francis@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-rockchip@lists.infradead.org,
 Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Swati Sharma <swati2.sharma@intel.com>, John Stultz <jstultz@google.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Drew Davenport <ddavenport@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Likun Gao <Likun.Gao@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alan Liu <haoping.liu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, Lyude Paul <lyude@redhat.com>,
 intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Roman Li <roman.li@amd.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Clark <robdclark@gmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, David Airlie <airlied@gmail.com>,
 Marek Vasut <marex@denx.de>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Leo Li <sunpeng.li@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, amd-gfx@lists.freedesktop.org,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMi4wNy4yMDIzIDEzOjA3LCBKdWxpYSBMYXdhbGwgd3JvdGU6Cj4KPiBPbiBXZWQsIDEy
IEp1bCAyMDIzLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPgo+PiBPbiBXZWQsIEp1bCAxMiwg
MjAyMyBhdCAxMjo0NjozM1BNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0g
MTIuMDcuMjMgdW0gMTE6NDYgc2NocmllYiBVd2UgS2xlaW5lLUvDtm5pZzoKPj4+PiBIZWxsbywK
Pj4+Pgo+Pj4+IHdoaWxlIEkgZGVidWdnZWQgYW4gaXNzdWUgaW4gdGhlIGlteC1sY2RjIGRyaXZl
ciBJIHdhcyBjb25zdGFudGx5Cj4+Pj4gaXJyaXRhdGVkIGFib3V0IHN0cnVjdCBkcm1fZGV2aWNl
IHBvaW50ZXIgdmFyaWFibGVzIGJlaW5nIG5hbWVkICJkZXYiCj4+Pj4gYmVjYXVzZSB3aXRoIHRo
YXQgbmFtZSBJIHVzdWFsbHkgZXhwZWN0IGEgc3RydWN0IGRldmljZSBwb2ludGVyLgo+Pj4+Cj4+
Pj4gSSB0aGluayB0aGVyZSBpcyBhIGJpZyBiZW5lZml0IHdoZW4gdGhlc2UgYXJlIGFsbCByZW5h
bWVkIHRvICJkcm1fZGV2Ii4KPj4+PiBJIGhhdmUgbm8gc3Ryb25nIHByZWZlcmVuY2UgaGVyZSB0
aG91Z2gsIHNvICJkcm1kZXYiIG9yICJkcm0iIGFyZSBmaW5lCj4+Pj4gZm9yIG1lLCB0b28uIExl
dCB0aGUgYmlrZXNoZWRpbmcgYmVnaW4hCj4+Pj4KPj4+PiBTb21lIHN0YXRpc3RpY3M6Cj4+Pj4K
Pj4+PiAkIGdpdCBncmVwIC1vaEUgJ3N0cnVjdCBkcm1fZGV2aWNlICpcKiAqW14gKCksO10qJyB2
Ni41LXJjMSB8IHNvcnQgfCB1bmlxIC1jIHwgc29ydCAtbgo+Pj4+ICAgICAgICAgMSBzdHJ1Y3Qg
ZHJtX2RldmljZSAqYWRldl90b19kcm0KPj4+PiAgICAgICAgIDEgc3RydWN0IGRybV9kZXZpY2Ug
KmRybV8KPj4+PiAgICAgICAgIDEgc3RydWN0IGRybV9kZXZpY2UgICAgICAgICAgKmRybV9kZXYK
Pj4+PiAgICAgICAgIDEgc3RydWN0IGRybV9kZXZpY2UgICAgICAgICpkcm1fZGV2Cj4+Pj4gICAg
ICAgICAxIHN0cnVjdCBkcm1fZGV2aWNlICpwZGV2Cj4+Pj4gICAgICAgICAxIHN0cnVjdCBkcm1f
ZGV2aWNlICpyZGV2Cj4+Pj4gICAgICAgICAxIHN0cnVjdCBkcm1fZGV2aWNlICp2ZGV2Cj4+Pj4g
ICAgICAgICAyIHN0cnVjdCBkcm1fZGV2aWNlICpkY3NzX2Rydl9kZXZfdG9fZHJtCj4+Pj4gICAg
ICAgICAyIHN0cnVjdCBkcm1fZGV2aWNlICoqZGRldgo+Pj4+ICAgICAgICAgMiBzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtX2Rldl9hbGxvYwo+Pj4+ICAgICAgICAgMiBzdHJ1Y3QgZHJtX2RldmljZSAq
bW9jawo+Pj4+ICAgICAgICAgMiBzdHJ1Y3QgZHJtX2RldmljZSAqcF9kZGV2Cj4+Pj4gICAgICAg
ICA1IHN0cnVjdCBkcm1fZGV2aWNlICpkZXZpY2UKPj4+PiAgICAgICAgIDkgc3RydWN0IGRybV9k
ZXZpY2UgKiBkZXYKPj4+PiAgICAgICAgMjUgc3RydWN0IGRybV9kZXZpY2UgKmQKPj4+PiAgICAg
ICAgOTUgc3RydWN0IGRybV9kZXZpY2UgKgo+Pj4+ICAgICAgIDIxNiBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGRldgo+Pj4+ICAgICAgIDIzNCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2Rldgo+Pj4+ICAg
ICAgIDYxMSBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtCj4+Pj4gICAgICA0MTkwIHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYKPj4+Pgo+Pj4+IFRoaXMgc2VyaWVzIHN0YXJ0cyB3aXRoIHJlbmFtaW5nIHN0
cnVjdCBkcm1fY3J0Yzo6ZGV2IHRvIGRybV9kZXYuIElmCj4+Pj4gaXQncyBub3Qgb25seSBtZSBh
bmQgb3RoZXJzIGxpa2UgdGhlIHJlc3VsdCBvZiB0aGlzIGVmZm9ydCBpdCBzaG91bGQgYmUKPj4+
PiBmb2xsb3dlZCB1cCBieSBhZGFwdGluZyB0aGUgb3RoZXIgc3RydWN0cyBhbmQgdGhlIGluZGl2
aWR1YWwgdXNhZ2VzIGluCj4+Pj4gdGhlIGRpZmZlcmVudCBkcml2ZXJzLgo+Pj4+Cj4+Pj4gVG8g
bWFrZSB0aGlzIHNlcmllcyBhIGJpdCBlYXNpZXIgaGFuZGxlYWJsZSwgSSBmaXJzdCBhZGRlZCBh
biBhbGlhcyBmb3IKPj4+PiBkcm1fY3J0Yzo6ZGV2LCB0aGVuIGNvbnZlcnRlZCB0aGUgZHJpdmVy
cyBvbmUgYWZ0ZXIgYW5vdGhlciBhbmQgdGhlIGxhc3QKPj4+PiBwYXRjaCBkcm9wcyB0aGUgImRl
diIgbmFtZS4gVGhpcyBoYXMgdGhlIGFkdmFudGFnZSBvZiBiZWluZyBlYXNpZXIgdG8KPj4+PiBy
ZXZpZXcsIGFuZCBpZiBJIHNob3VsZCBoYXZlIG1pc3NlZCBhbiBpbnN0YW5jZSBvbmx5IHRoZSBs
YXN0IHBhdGNoIG11c3QKPj4+PiBiZSBkcm9wcGVkL3JldmVydGVkLiBBbHNvIHRoaXMgc2VyaWVz
IG1pZ2h0IGNvbmZsaWN0IHdpdGggb3RoZXIgcGF0Y2hlcywKPj4+PiBpbiB0aGlzIGNhc2UgdGhl
IHJlbWFpbmluZyBwYXRjaGVzIGNhbiBzdGlsbCBnbyBpbiAoYXBhcnQgZnJvbSB0aGUgbGFzdAo+
Pj4+IG9uZSBvZiBjb3Vyc2UpLiBNYXliZSBpdCBhbHNvIG1ha2VzIHNlbnNlIHRvIGRlbGF5IGFw
cGx5aW5nIHRoZSBsYXN0Cj4+Pj4gcGF0Y2ggYnkgb25lIGRldmVsb3BtZW50IGN5Y2xlPwo+Pj4g
V2hlbiB5b3UgYXV0b21hdGljYWxseSBnZW5lcmF0ZSB0aGUgcGF0Y2ggKHdpdGggY29jY2kgZm9y
IGV4YW1wbGUpIEkgdXN1YWxseQo+Pj4gcHJlZmVyIGEgc2luZ2xlIHBhdGNoIGluc3RlYWQuCj4+
IE1heWJlIEknbSB0b28gc3R1cGlkLCBidXQgb25seSBwYXJ0cyBvZiB0aGlzIHBhdGNoIHdlcmUg
Y3JlYXRlZCBieQo+PiBjb2NjaW5lbGxlLiBJIGZhaWxlZCB0byBjb252ZXJ0IGNvZGUgbGlrZQo+
Pgo+PiAtICAgICAgIHNwaW5fbG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7Cj4+ICsg
ICAgICAgc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZHJtX2Rldi0+ZXZlbnRfbG9jayk7Cj4+Cj4+IEFk
ZGVkIEp1bGlhIHRvIENjLCBtYXliZSBzaGUgaGFzIGEgaGludD8hCj4gQSBwcmlvcmksIEkgc2Vl
IG5vIHJlYXNvbiB3aHkgdGhlIHJ1bGUgYmVsb3cgc2hvdWxkIG5vdCBhcHBseSB0byB0aGUgYWJv
dmUKPiBjb2RlLiAgSXMgdGhlcmUgYSBwYXJzaW5nIHByb2JsZW0gaW4gdGhlIGNvbnRhaW5pbmcg
ZnVuY3Rpb24/ICBZb3UgY2FuIHJ1bgo+Cj4gc3BhdGNoIC0tcGFyc2UtYyBmaWxlLmMKPgo+IElm
IHRoZXJlIGlzIGEgcGFyaW5nIHByb2JsZW0sIHBsZWFzZSBsZXQgbWUga25vdyBhbmQgaSB3aWxs
IHRyeSB0byBmaXggaXQKPiBzbyB0aGUgd2hpbGUgdGhpbmcgY2FuIGJlIGRvbmUgYXV0b21hdGlj
YWxseS4KCkkgZ3Vlc3Mgc29tZSBjbGV2ZXIgbWFjcm9zIGNhbiBmb29sIHNwYXRjaCwgYXQgbGVh
c3QgSSBvYnNlcnZlIHN1Y2ggCnRoaW5ncyBpbiBpOTE1IHdoaWNoIG9mdGVuIHVzZXMgY3VzdG9t
IGl0ZXJhdG9ycy4KClJlZ2FyZHMKQW5kcnplagoKPgo+IGp1bGlhCj4KPj4gKFVwIHRvIG5vdyBp
dCdzIG9ubHkKPj4KPj4gQEAKPj4gc3RydWN0IGRybV9jcnRjICpjcnRjOwo+PiBAQAo+PiAtY3J0
Yy0+ZGV2Cj4+ICtjcnRjLT5kcm1fZGV2Cj4+Cj4+ICkKPj4KPj4+IEJhY2tncm91bmQgaXMgdGhh
dCB0aGlzIG1ha2VzIG1lcmdlIGNvbmZsaWN0cyBlYXNpZXIgdG8gaGFuZGxlIGFuZCBkZXRlY3Qu
Cj4+IFJlYWxseT8gRWFjaCBmaWxlIChhcGFydCBmcm9tIGluY2x1ZGUvZHJtL2RybV9jcnRjLmgp
IGlzIG9ubHkgdG91Y2hlZAo+PiBvbmNlLiBTbyB1bmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5n
IHlvdSBkb24ndCBnZXQgbGVzcyBvciBlYXNpZXIKPj4gY29uZmxpY3RzIGJ5IGRvaW5nIGl0IGFs
bCBpbiBhIHNpbmdsZSBwYXRjaC4gQnV0IHlvdSBnYWluIHRoZSBmcmVlZG9tIHRvCj4+IGRyb3Ag
YSBwYXRjaCBmb3Igb25lIGRyaXZlciB3aXRob3V0IGhhdmluZyB0byBkcm9wIHRoZSByZXN0IHdp
dGggaXQuIFNvCj4+IEkgc3RpbGwgbGlrZSB0aGUgc3BsaXQgdmVyc2lvbiBiZXR0ZXIsIGJ1dCBJ
J20gb3BlbiB0byBhIG1vcmUgdmVyYm9zZQo+PiByZWFzb25pbmcgZnJvbSB5b3VyIHNpZGUuCj4+
Cj4+PiBXaGVuIHlvdSBoYXZlIG11bHRpcGxlIHBhdGNoZXMgYW5kIGEgbWVyZ2UgY29uZmxpY3Qg
YmVjYXVzZSBvZiBzb21lIGFkZGVkCj4+PiBsaW5lcyB1c2luZyB0aGUgb2xkIGZpZWxkIHRoZSBi
dWlsZCBicmVha3Mgb25seSBvbiB0aGUgbGFzdCBwYXRjaCB3aGljaAo+Pj4gcmVtb3ZlcyB0aGUg
b2xkIGZpZWxkLgo+PiBUaGVuIHlvdSBjYW4gcmV2ZXJ0L2Ryb3AgdGhlIGxhc3QgcGF0Y2ggd2l0
aG91dCBoYXZpbmcgdG8gcmVzcGluIHRoZQo+PiB3aG9sZSBzaW5nbGUgcGF0Y2ggYW5kIHRodXMg
Y2FyaW5nIGZvciBzdGlsbCBtb3JlIGNvbmZsaWN0cyB0aGF0IGFyaXNlCj4+IHVudGlsIHRoZSBu
ZXcgdmVyc2lvbiBpcyBzZW50Lgo+Pgo+PiBCZXN0IHJlZ2FyZHMKPj4gVXdlCj4+Cj4+IC0tCj4+
IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUt
S8O2bmlnICAgICAgICAgICAgfAo+PiBJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAg
ICAgICAgICAgfCBodHRwczovL3d3dy5wZW5ndXRyb25peC5kZS8gfAo+ID4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
