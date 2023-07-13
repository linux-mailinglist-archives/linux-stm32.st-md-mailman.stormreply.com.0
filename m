Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89F768DAD
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41523C6C822;
	Mon, 31 Jul 2023 07:17:12 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D6ECC6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689239041; x=1720775041;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wpe6dsOBfDPS7D7Sq/hiKhbMpNSn/Y2A1D02VMmRxgw=;
 b=lkFxK+tpXwTNe78L4C5LDzLxuYjpFcop4p9GBUlDQOIfya3llxOCGS2V
 5Yr9GPgy0ZM8ofDg8ZOSU17oCPh6bp4uDzcW5ePqlg3++5wxgUgzDZSqN
 JLKWgB/SoM/mrY68nBb2zRy+62KmqnJfcVnTtJynt4vaDEiDLHxgm5+UM
 E0+teZpShTv9qpz4YK5GyXuAqUoELuu/JleoD9OSRddM6L90HwHJ+O6cG
 inNZ+B3Ya/5SpHUR9HkQfDQatbGqvOYSwWcD24SjlHDhbRp4ctjN8QmK9
 kvFQcHwa86StFF9RiQ7PvwKlxsQ65tyUF3/3GzOMxpwAvxXCHlVWGsuzz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395935084"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="395935084"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="715882508"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="715882508"
Received: from atadj-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.50.30])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:03:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230712161025.22op3gtzgujrhytb@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <20230712161025.22op3gtzgujrhytb@pengutronix.de>
Date: Thu, 13 Jul 2023 12:03:05 +0300
Message-ID: <878rbkgp4m.fsf@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
 =?utf-8?Q?A?= =?utf-8?Q?ndr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Aaron Liu <aaron.liu@amd.com>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
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
 Karol Herbst <kherbst@redhat.com>, linux-hyperv@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, Emma Anholt <emma@anholt.net>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Alan Liu <haoping.liu@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 John Stultz <jstultz@google.com>, Roman Li <roman.li@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sam Ravnborg <sam@ravnborg.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Liu Shixin <liushixin2@huawei.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Uma Shankar <uma.shankar@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 =?utf-8?Q?Joaqu=C3=ADn?= Ignacio =?utf-8?Q?Aramend=C3=ADa?=
 <samsagax@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 amd-gfx@lists.freedesktop.org, Lang Yu <Lang.Yu@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Drew Davenport <ddavenport@chromium.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCAxMiBKdWwgMjAyMywgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gSGVsbG8gSmFuaSwKPgo+IE9uIFdlZCwgSnVsIDEyLCAy
MDIzIGF0IDA1OjM0OjI4UE0gKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOgo+PiBPbiBXZWQsIDEy
IEp1bCAyMDIzLCBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPiB3cm90ZToKPj4gPiBIZWxsbywKPj4gPgo+PiA+IHdoaWxlIEkgZGVidWdnZWQgYW4gaXNz
dWUgaW4gdGhlIGlteC1sY2RjIGRyaXZlciBJIHdhcyBjb25zdGFudGx5Cj4+ID4gaXJyaXRhdGVk
IGFib3V0IHN0cnVjdCBkcm1fZGV2aWNlIHBvaW50ZXIgdmFyaWFibGVzIGJlaW5nIG5hbWVkICJk
ZXYiCj4+ID4gYmVjYXVzZSB3aXRoIHRoYXQgbmFtZSBJIHVzdWFsbHkgZXhwZWN0IGEgc3RydWN0
IGRldmljZSBwb2ludGVyLgo+PiA+Cj4+ID4gSSB0aGluayB0aGVyZSBpcyBhIGJpZyBiZW5lZml0
IHdoZW4gdGhlc2UgYXJlIGFsbCByZW5hbWVkIHRvICJkcm1fZGV2Ii4KPj4gPiBJIGhhdmUgbm8g
c3Ryb25nIHByZWZlcmVuY2UgaGVyZSB0aG91Z2gsIHNvICJkcm1kZXYiIG9yICJkcm0iIGFyZSBm
aW5lCj4+ID4gZm9yIG1lLCB0b28uIExldCB0aGUgYmlrZXNoZWRpbmcgYmVnaW4hCj4+ID4KPj4g
PiBTb21lIHN0YXRpc3RpY3M6Cj4+ID4KPj4gPiAkIGdpdCBncmVwIC1vaEUgJ3N0cnVjdCBkcm1f
ZGV2aWNlICpcKiAqW14gKCksO10qJyB2Ni41LXJjMSB8IHNvcnQgfCB1bmlxIC1jIHwgc29ydCAt
bgo+PiA+ICAgICAgIDEgc3RydWN0IGRybV9kZXZpY2UgKmFkZXZfdG9fZHJtCj4+ID4gICAgICAg
MSBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtXwo+PiA+ICAgICAgIDEgc3RydWN0IGRybV9kZXZpY2Ug
ICAgICAgICAgKmRybV9kZXYKPj4gPiAgICAgICAxIHN0cnVjdCBkcm1fZGV2aWNlICAgICAgICAq
ZHJtX2Rldgo+PiA+ICAgICAgIDEgc3RydWN0IGRybV9kZXZpY2UgKnBkZXYKPj4gPiAgICAgICAx
IHN0cnVjdCBkcm1fZGV2aWNlICpyZGV2Cj4+ID4gICAgICAgMSBzdHJ1Y3QgZHJtX2RldmljZSAq
dmRldgo+PiA+ICAgICAgIDIgc3RydWN0IGRybV9kZXZpY2UgKmRjc3NfZHJ2X2Rldl90b19kcm0K
Pj4gPiAgICAgICAyIHN0cnVjdCBkcm1fZGV2aWNlICoqZGRldgo+PiA+ICAgICAgIDIgc3RydWN0
IGRybV9kZXZpY2UgKmRybV9kZXZfYWxsb2MKPj4gPiAgICAgICAyIHN0cnVjdCBkcm1fZGV2aWNl
ICptb2NrCj4+ID4gICAgICAgMiBzdHJ1Y3QgZHJtX2RldmljZSAqcF9kZGV2Cj4+ID4gICAgICAg
NSBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2aWNlCj4+ID4gICAgICAgOSBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqIGRldgo+PiA+ICAgICAgMjUgc3RydWN0IGRybV9kZXZpY2UgKmQKPj4gPiAgICAgIDk1IHN0
cnVjdCBkcm1fZGV2aWNlICoKPj4gPiAgICAgMjE2IHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2Cj4+
ID4gICAgIDIzNCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2Rldgo+PiA+ICAgICA2MTEgc3RydWN0
IGRybV9kZXZpY2UgKmRybQo+PiA+ICAgIDQxOTAgc3RydWN0IGRybV9kZXZpY2UgKmRldgo+PiA+
Cj4+ID4gVGhpcyBzZXJpZXMgc3RhcnRzIHdpdGggcmVuYW1pbmcgc3RydWN0IGRybV9jcnRjOjpk
ZXYgdG8gZHJtX2Rldi4gSWYKPj4gPiBpdCdzIG5vdCBvbmx5IG1lIGFuZCBvdGhlcnMgbGlrZSB0
aGUgcmVzdWx0IG9mIHRoaXMgZWZmb3J0IGl0IHNob3VsZCBiZQo+PiA+IGZvbGxvd2VkIHVwIGJ5
IGFkYXB0aW5nIHRoZSBvdGhlciBzdHJ1Y3RzIGFuZCB0aGUgaW5kaXZpZHVhbCB1c2FnZXMgaW4K
Pj4gPiB0aGUgZGlmZmVyZW50IGRyaXZlcnMuCj4+IAo+PiBJIHRoaW5rIHRoaXMgaXMgYW4gdW5u
ZWNlc3NhcnkgY2hhbmdlLiBJbiBkcm0sIGEgZGV2IGlzIHVzdWFsbHkgYSBkcm0KPj4gZGV2aWNl
LCBpLmUuIHN0cnVjdCBkcm1fZGV2aWNlICouCj4KPiBXZWxsLCB1bmxlc3MgaXQncyBub3QuIFBy
b21pbmVudGx5IHRoZXJlIGlzCj4KPiAJc3RydWN0IGRybV9kZXZpY2Ugewo+IAkJLi4uCj4gCQlz
dHJ1Y3QgZGV2aWNlICpkZXY7Cj4gCQkuLi4KPiAJfTsKPgo+IHdoaWNoIHlpZWxkcyBxdWl0ZSBh
IGZldyBjb2RlIGxvY2F0aW9ucyB1c2luZyBkZXYtPmRldiB3aGljaCBpcwo+IElNSE8gdW5uZWNl
c3NhcnkgaXJyaXRhdGluZzoKPgo+IAkkIGdpdCBncmVwICdcPGRldi0+ZGV2JyB2Ni41LXJjMSBk
cml2ZXJzL2dwdS9kcm0gfCB3YyAtbAo+IAkxNjMzCj4KPiBBbHNvIHRoZSBmdW5jdGlvbnMgdGhh
dCBkZWFsIHdpdGggYm90aCBhIHN0cnVjdCBkZXZpY2UgYW5kIGEgc3RydWN0Cj4gZHJtX2Rldmlj
ZSBvZnRlbiB1c2UgImRldiIgZm9yIHRoZSBzdHJ1Y3QgZGV2aWNlIGFuZCB0aGVuICJkZGV2IiBm
b3IKPiB0aGUgZHJtX2RldmljZSAoc2VlIGZvciBleGFtcGxlIGFtZGdwdV9kZXZpY2VfZ2V0X3Bj
aWVfcmVwbGF5X2NvdW50KCkpLgoKV2h5IGlzIHNwZWNpZmljYWxseSBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2IHNvIGlycml0YXRpbmcgdG8geW91PwoKWW91IGxlYWQgdXMgdG8gYmVsaWV2ZSBpdCdz
IGFuIG91dGxpZXIgaW4ga2VybmVsLCBzb21ldGhpbmcgdGhhdCBnb2VzCmFnYWluc3QgY29tbW9u
IGtlcm5lbCBzdHlsZSwgYnV0IGl0J3MgcmVhbGx5IG5vdDoKCiQgZ2l0IGdyZXAgLWhvdyAic3Ry
dWN0IFtBLVphLXowLTlfXVwrIFwqZGV2IiB8IHNvcnQgfCB1bmlxIC1jIHwgc29ydCAtcm4gfCBo
ZWFkIC0yMAogIDM4NDk0IHN0cnVjdCBkZXZpY2UgKmRldgogIDE2Mzg4IHN0cnVjdCBuZXRfZGV2
aWNlICpkZXYKICAgNDE4NCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2CiAgIDI3ODAgc3RydWN0IHBj
aV9kZXYgKmRldgogICAxOTE2IHN0cnVjdCBjb21lZGlfZGV2aWNlICpkZXYKICAgMTUxMCBzdHJ1
Y3QgbWx4NV9jb3JlX2RldiAqZGV2CiAgIDEwNTcgc3RydWN0IG1seDRfZGV2ICpkZXYKICAgIDg5
NCBzdHJ1Y3QgYjQzX3dsZGV2ICpkZXYKICAgIDc2MiBzdHJ1Y3QgaW5wdXRfZGV2ICpkZXYKICAg
IDYyMyBzdHJ1Y3QgdXNibmV0ICpkZXYKICAgIDU2MSBzdHJ1Y3QgbWx4NV9pYl9kZXYgKmRldgog
ICAgNTI1IHN0cnVjdCBtdDc2X2RldiAqZGV2CiAgICA0NjUgc3RydWN0IG10NzZ4MDJfZGV2ICpk
ZXYKICAgIDQzNSBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYKICAgIDQzMSBzdHJ1Y3QgdXNi
X2RldmljZSAqZGV2CiAgICA0MTEgc3RydWN0IG10NzkxNV9kZXYgKmRldgogICAgMzk4IHN0cnVj
dCBjeDIzMXh4ICpkZXYKICAgIDM3OCBzdHJ1Y3QgbWVpX2RldmljZSAqZGV2CiAgICAzNjMgc3Ry
dWN0IGtzel9kZXZpY2UgKmRldgogICAgMzU5IHN0cnVjdCBtdGhjYV9kZXYgKmRldgoKQSBnb29k
IHBvcnRpb24gb2YgdGhlIGFib3ZlIGFsc28gaGF2ZSBhIGRldiBtZW1iZXIuCgpBcmUgeW91IHBs
YW5uaW5nIG9uIGNoYW5naW5nIGFsbCBvZiB0aGUgYWJvdmUgdG9vLCBvciBhcmUgeW91IG9ubHkK
YW5ub3llZCBieSBkcm0/CgpJJ20gcmVhbGx5IG5vdCBjb252aW5jZWQgYXQgYWxsLgoKCkJSLApK
YW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
