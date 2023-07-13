Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08160768DAF
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2D59C6C82B;
	Mon, 31 Jul 2023 07:17:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7829DC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689261347; x=1720797347;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FdV+ihBB75TX4OJUKwPysdCuraDJ8JqOsAXrG1NV6Qw=;
 b=XdGzFJhISwDiDbnWBAYeUC4zJhZMbuZfQYsgCs3V8XtGKbcbkDzg+upH
 txq/U57jv5mpjolZu18qryVqA916tu/0TXOCShnci127EuC4+BRL70Fp7
 d0Acc92wVR9HsFcQ5YHhzYoK3W3EooSCdF56SKXOlL6Bjh9vWgZsuYmog
 YaNwg8iU7PQGml94JycoI+kr74eyStfrO1xJnHdZ1yiVU9M31ZkNOsv4E
 ezj2G69i6yChQSzMru2O9eSvUmv2FSadzvlYJjNB71dremcK92v8P+SUD
 gJ9FT02JXZx2yFsR4MNlOtWaUB9/xERDqf/t7dlte8lrIN/8nCMYE0Zhv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="350089230"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="350089230"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968656199"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="968656199"
Received: from apaulaux-mobl.ger.corp.intel.com (HELO [10.213.206.56])
 ([10.213.206.56])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:14:58 -0700
Message-ID: <d6160aeb-6344-b272-775a-cb665dca46ac@linux.intel.com>
Date: Thu, 13 Jul 2023 16:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul
 <seanpaul@chromium.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
 <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
 <78be52b8-5ffb-601a-84b2-ead2894973a6@suse.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <78be52b8-5ffb-601a-84b2-ead2894973a6@suse.de>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Mika Kahola <mika.kahola@intel.com>, Leo Li <sunpeng.li@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Dave Airlie <airlied@redhat.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin <zackr@vmware.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Aaron Liu <aaron.liu@amd.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-rockchip@lists.infradead.org,
 Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Tian Tao <tiantao6@hisilicon.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Swati Sharma <swati2.sharma@intel.com>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, Emma Anholt <emma@anholt.net>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
 Alan Liu <haoping.liu@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mikko Perttunen <mperttunen@nvidia.com>,
 Yifan Zhang <yifan1.zhang@amd.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 John Stultz <jstultz@google.com>, Roman Li <roman.li@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sam Ravnborg <sam@ravnborg.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, David Airlie <airlied@gmail.com>,
 Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 amd-gfx@lists.freedesktop.org, Lang Yu <Lang.Yu@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Drew Davenport <ddavenport@chromium.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename
 struct drm_crtc::dev to drm_dev
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

Ck9uIDEzLzA3LzIwMjMgMTY6MDksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+IEhpCj4gCj4g
QW0gMTMuMDcuMjMgdW0gMTY6NDEgc2NocmllYiBTZWFuIFBhdWw6Cj4+IE9uIFRodSwgSnVsIDEz
LCAyMDIzIGF0IDk6MDTigK9BTSBVd2UgS2xlaW5lLUvDtm5pZwo+PiA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPj4+Cj4+PiBoZWxsbyBTZWFuLAo+Pj4KPj4+IE9uIFdl
ZCwgSnVsIDEyLCAyMDIzIGF0IDAyOjMxOjAyUE0gLTA0MDAsIFNlYW4gUGF1bCB3cm90ZToKPj4+
PiBJJ2QgcmVhbGx5IHByZWZlciB0aGlzIHBhdGNoIChzZXJpZXMgb3Igc2luZ2xlKSBpcyBub3Qg
YWNjZXB0ZWQuIFRoaXMKPj4+PiB3aWxsIGNhdXNlIHByb2JsZW1zIGZvciBldmVyeW9uZSBjaGVy
cnktcGlja2luZyBwYXRjaGVzIHRvIGEKPj4+PiBkb3duc3RyZWFtIGtlcm5lbCAoTFRTIG9yIGRp
c3RybyB0cmVlKS4gSSB1c3VhbGx5IHdvdWxkbid0IGV4cGVjdAo+Pj4+IHN5bXBhdGh5IGhlcmUs
IGJ1dCB0aGUgcXVlc3Rpb25hYmxlIGJlbmVmaXQgZG9lcyBub3Qgb3V0d2VpZ2ggdGhlIGNvc3QK
Pj4+PiBJTVtiaWFzZWRdTy4KPj4+Cj4+PiBJIGFncmVlIHRoYXQgZm9yIGJhY2twb3J0cyB0aGlz
IGlzbid0IHNvIG5pY2UuIEhvd2V2ZXIgd2l0aCB0aGUgc3BsaXQKPj4+IGFwcHJvYWNoICh0aGF0
IHdhcyBhcmd1bWVudGVkIGFnYWluc3QgaGVyZSkgaXQncyBub3Qgc29vIGJhZC4gUGF0Y2ggIzEK
Pj4+IChhbmQgc2ltaWxhciBjaGFuZ2VzIGZvciB0aGUgb3RoZXIgYWZmZWN0ZWQgc3RydWN0dXJl
cykgY291bGQgYmUKPj4+IHRyaXZpYWxseSBiYWNrcG9ydGVkIGFuZCB3aXRoIHRoYXQgaXQgZG9l
c24ndCBtYXR0ZXIgaWYgeW91IHdyaXRlIGRldiBvcgo+Pj4gZHJtIChvciB3aGF0ZXZlciBuYW1l
IGlzIGNob3NlbiBpbiB0aGUgZW5kKTsgYm90aCB3b3JrIGluIHRoZSBzYW1lIHdheS4KPj4KPj4g
UGF0Y2ggIzEgYXZvaWRzIHRoZSBuZWVkIHRvIGJhY2twb3J0IHRoZSBlbnRpcmUgc2V0LCBob3dl
dmVyIGV2ZXJ5Cj4+IGNoYW5nZSBvY2N1cmluZyBhZnRlciB0aGUgcmVuYW1lIHBhdGNoZXMgd2ls
bCBjYXVzZSBjb25mbGljdHMgb24KPj4gZnV0dXJlIGNoZXJyeS1waWNrcy4gRG93bnN0cmVhbSBr
ZXJuZWxzIHdpbGwgaGF2ZSB0byBiYWNrcG9ydCB0aGUKPj4gd2hvbGUgc2V0LiBCYWNrcG9ydGlu
ZyB0aGUgZW50aXJlIHNldCB3aWxsIGNyZWF0ZSBhbiBlcG9jaCBpbgo+PiBkb3duc3RyZWFtIGtl
cm5lbHMgd2hlcmUgY2hlcnJ5LXBpY2tpbmcgcGF0Y2hlcyBwcmVjZWRpbmcgdGhpcyBzZXQKPj4g
d2lsbCBuZWVkIHRvIHVuZGVyZ28gY29uZmxpY3QgcmVzb2x1dGlvbiBhcyB3ZWxsLiBBcyBtZW50
aW9uZWQgaW4gbXkKPj4gcHJldmlvdXMgZW1haWwsIEkgZG9uJ3QgZXhwZWN0IHN5bXBhdGh5IGhl
cmUsIGl0J3MgcGFydCBvZiBtYWludGFpbmluZwo+PiBhIGRvd25zdHJlYW0ga2VybmVsLCBidXQg
dGhlcmUgaXMgYSByZWFsIGNvc3QgdG8ga2VybmVsIGNvbnN1bWVycy4KPj4KPj4+Cj4+PiBCdXQg
ZXZlbiB3aXRoIHRoZSBvbmUtcGF0Y2gtcGVyLXJlbmFtZSBhcHByb2FjaCBJJ2QgY29uc2lkZXIg
dGhlCj4+PiByZW5hbWluZyBhIG5ldCB3aW4sIGJlY2F1c2UgZWFzZSBvZiB1bmRlcnN0YW5kaW5n
IGNvZGUgaGFzIGEgYmlnIHZhbHVlLgo+Pj4gSXQncyB2YWx1ZSBpcyBub3Qgc28gZWFzeSBtZWFz
dXJhYmxlIGFzICJjb25mbGljdHMgd2hlbiBiYWNrcG9ydGluZyIsCj4+PiBidXQgaXQgYWxzbyBt
YXR0ZXJzIGluIHNheSB0d28geWVhcnMgZnJvbSBub3csIHdoaWxlIGJhY2twb3J0aW5nCj4+PiBz
aG91bGRuJ3QgYmUgYW4gaXNzdWUgdGhlbiBhbnkgbW9yZS4KPj4KPj4gWW91J3ZlIHJpZ2h0bHkg
aWRlbnRpZmllZCB0aGUgY29uamVjdHVyZSBpbiB5b3VyIHN0YXRlbWVudC4gSSd2ZSBiZWVuCj4+
IG9uIGJvdGggc2lkZXMgb2YgdGhlIGFyZ3VtZW50LCBoYXZpbmcgd3JpdHRlbi9tYWludGFpbmVk
IGRybSBjb2RlCj4+IHVwc3RyZWFtIGFuZCBjaGVycnktcGlja2VkIGNoYW5nZXMgdG8gYSBkb3du
c3RyZWFtIGtlcm5lbC4gUGVyaGFwcwo+PiBpdCdzIGJlY2F1c2UgZHJtJ3MgZGVmaW5pdGlvbiBv
ZiBkZXYgaXMgaW5ncmFpbmVkIGluIG15IG11c2NsZSBtZW1vcnksCj4+IG9yIG1heWJlIGl0J3Mg
YmVjYXVzZSBJIGRvbid0IGRvIGEgbG90IG9mIHVwc3RyZWFtIGRldmVsb3BtZW50IHRoZXNlCj4+
IGRheXMsIGJ1dCBJIGp1c3QgaGF2ZSBhIGhhcmQgdGltZSBzZWVpbmcgdGhlIGJlbmVmaXQgaGVy
ZS4KPiAKPiBJIGNhbiBvbmx5IHNlY29uZCB3aGF0IFNlYW4gd3JpdGVzLiBJJ3ZlIGRvbmUgcXVp
dGUgYSBiaXQgb2YgYmFja3BvcnRpbmcgCj4gb2YgRFJNIGNvZGUuIEl0J3MgaGFyZCBhbHJlYWR5
LiBBbmQgdGhpcyBraW5kIG9mIGNoYW5nZSBpcyBnb2luZyB0byB0byAKPiBhZmZlY3QgYWxtb3N0
IGV2ZXJ5IGJhY2twb3J0ZWQgRFJNIHBhdGNoIGluIHRoZSBjb21pbmcgeWVhcnMuIE5vdCBqdXN0
IAo+IGZvciBkaXN0cmlidXRpb24ga2VybmVscywgYnV0IGFsc28gZm9yIHVwc3RyZWFtJ3Mgc3Rh
YmxlIHNlcmllcy4gSXQncyAKPiByZWFsbHkgb25seSBwb3NzaWJsZSB0byBkbyB0aGlzIGNoYW5n
ZSBvdmVyIG1hbnkgcmVsZWFzZXMgd2hpbGUga2VlcGluZyAKPiBjb21wYXRpYmxlIHdpdGggdGhl
IG9sZCBuYW1lLiBTbyB0aGUgbW9yZSBJIHRoaW5rIGFib3V0IGl0LCB0aGUgbGVzcyBJIAo+IGxp
a2UgdGhpcyBjaGFuZ2UuCgpJJ3ZlIGRvbmUgbXkgc2hhcmUgb2YgYmFja3BvcnRpbmcsIGFuZCBz
dGlsbCBhbSBkb2luZyBpdCwgc28gSSBjYW4gc2F5IEkgCmRpc2xpa2UgaXQgYXMgbXVjaCBhcyBh
bnlvbmUsIGhvd2V2ZXIuLiBJcyB0aGlzIGFuIGFyZ3VtZW50IHdoaWNoIHRoZSAKa2VybmVsIGFz
IGEgd2lkZXIgZW50aXR5IHR5cGljYWxseSBhY2NlcHRzPyBJZiBub3QgY291bGQgaXQgYmUgYSAK
c2xpcHBlcnkgc2xvcGUgdG8gc3RhcnQgYSBwcmVjZWRlbnQ/CgpJdCBpcyBhIGhvbmVzdCBxdWVz
dGlvbiAtIEkgYW0gbm90IGZhbWlsaWFyIGlmIHRoZXJlIHdlcmUgb3Igd2VyZSBub3QgCmFueSBz
aW1pbGFyIGRpc2N1c3Npb25zIGluIHRoZSBwYXN0LgoKTXkgZ3V0IGZlZWxpbmcgaXMgdGhhdCAq
aWYqIHRoZXJlIGlzIGEgY29uc2Vuc3VzIHRoYXQgc29tZXRoaW5nIApfaW1wcm92ZXNfIHRoZSBj
b2RlIGJhc2Ugc2lnbmlmaWNhbnRseSwgYmFja3BvcnRpbmcgcGFpbnMgc2hvdWxkIApwcm9iYWJs
eSBub3QgYmUgd2VpZ2h0ZWQgdmVyeSBoZWF2aWx5IGFzIGEgY29udHJhIGFyZ3VtZW50LgoKUmVn
YXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
