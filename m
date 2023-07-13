Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E912D768DAE
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7F2EC6C825;
	Mon, 31 Jul 2023 07:17:16 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D47EBC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 15:14:33 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-6b9aadde448so722750a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689261272; x=1691853272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKItIj72hAMISxrHuiptAazhKs3+4zy1JRueUjGy5Ew=;
 b=d38fvK+XeDCZfue3qT+F9QEysr52HSAtz3y92pukWantq1VvkJR4PXsKl2L/DPR5Zt
 PYx9VprxPD93yCy1JFT5ECU4riLb8KU4bJWB6Rylkd6GlO84jPe70EAmfuBAFfKmwo7n
 mzrWUPHtq78h4EVlIsWDwwYQHOkjXWgdmG4Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689261272; x=1691853272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKItIj72hAMISxrHuiptAazhKs3+4zy1JRueUjGy5Ew=;
 b=c5YhcmGkVPkLytihGZFE5hg3DobsqTfiy9/+M/N7/uGH9tmVLG1RQIc+T5nT7D1HG8
 /zGqa0MqWYXg5aZLHSvSU9mNNSv7Zj3XDSsJ2E/d8AsjS7peZR5HaGe5HLcilfCjvUwt
 xthPO0Bpq47WV4dU5/KwRi59fi+UZZSxQkGIYnU1c9qMmoXD14R+RsV2EDH90uO9slhr
 j9OGAxKVsC0mN7q7kgGQszCjISMC4vl3IBlnnC4Zjv2qjPauFMU7FzlGujGXO42SdXJb
 XO+RttW4B0lZiX56XT7qRqriw1/REkkiX9zwI1Cv0/cfhqUhMWqdzO0FneGstA6xcTKh
 dF9Q==
X-Gm-Message-State: ABy/qLYFxea4WRbnC6Qvx/naNmk6Db0x12/IOVmxOuUUuMxBVSSAsUWB
 EgJIUWFykHxKLlfn+Igs/3bSqdTqKTmLCajByGBpku7J
X-Google-Smtp-Source: APBJJlHR/EOh0twlS7oJuAz1GFUKbWW38a9Nfr7Rh8TRBkkU69dPyXKgXCkq6k4m8RrsOBwf9h4IcA==
X-Received: by 2002:a05:6830:20c1:b0:6b9:9cc0:4854 with SMTP id
 z1-20020a05683020c100b006b99cc04854mr2179648otq.32.1689261272274; 
 Thu, 13 Jul 2023 08:14:32 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com.
 [209.85.167.176]) by smtp.gmail.com with ESMTPSA id
 i3-20020a9d68c3000000b006b94a14b52asm2955633oto.9.2023.07.13.08.14.31
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 08:14:32 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-38e04d1b2b4so701344b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 08:14:31 -0700 (PDT)
X-Received: by 2002:a05:6902:211:b0:c8b:3:e399 with SMTP id
 j17-20020a056902021100b00c8b0003e399mr1398441ybs.44.1689259342555; Thu, 13
 Jul 2023 07:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
In-Reply-To: <20230713130337.fd2l67r23g2irifx@pengutronix.de>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 13 Jul 2023 10:41:45 -0400
X-Gmail-Original-Message-ID: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
Message-ID: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Dave Airlie <airlied@redhat.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin <zackr@vmware.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
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
 =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
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
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sam Ravnborg <sam@ravnborg.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, David Airlie <airlied@gmail.com>,
 Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Lang Yu <Lang.Yu@amd.com>, xen-devel@lists.xenproject.org,
 Guchun Chen <guchun.chen@amd.com>,
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
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgOTowNOKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gaGVsbG8gU2VhbiwKPgo+IE9u
IFdlZCwgSnVsIDEyLCAyMDIzIGF0IDAyOjMxOjAyUE0gLTA0MDAsIFNlYW4gUGF1bCB3cm90ZToK
PiA+IEknZCByZWFsbHkgcHJlZmVyIHRoaXMgcGF0Y2ggKHNlcmllcyBvciBzaW5nbGUpIGlzIG5v
dCBhY2NlcHRlZC4gVGhpcwo+ID4gd2lsbCBjYXVzZSBwcm9ibGVtcyBmb3IgZXZlcnlvbmUgY2hl
cnJ5LXBpY2tpbmcgcGF0Y2hlcyB0byBhCj4gPiBkb3duc3RyZWFtIGtlcm5lbCAoTFRTIG9yIGRp
c3RybyB0cmVlKS4gSSB1c3VhbGx5IHdvdWxkbid0IGV4cGVjdAo+ID4gc3ltcGF0aHkgaGVyZSwg
YnV0IHRoZSBxdWVzdGlvbmFibGUgYmVuZWZpdCBkb2VzIG5vdCBvdXR3ZWlnaCB0aGUgY29zdAo+
ID4gSU1bYmlhc2VkXU8uCj4KPiBJIGFncmVlIHRoYXQgZm9yIGJhY2twb3J0cyB0aGlzIGlzbid0
IHNvIG5pY2UuIEhvd2V2ZXIgd2l0aCB0aGUgc3BsaXQKPiBhcHByb2FjaCAodGhhdCB3YXMgYXJn
dW1lbnRlZCBhZ2FpbnN0IGhlcmUpIGl0J3Mgbm90IHNvbyBiYWQuIFBhdGNoICMxCj4gKGFuZCBz
aW1pbGFyIGNoYW5nZXMgZm9yIHRoZSBvdGhlciBhZmZlY3RlZCBzdHJ1Y3R1cmVzKSBjb3VsZCBi
ZQo+IHRyaXZpYWxseSBiYWNrcG9ydGVkIGFuZCB3aXRoIHRoYXQgaXQgZG9lc24ndCBtYXR0ZXIg
aWYgeW91IHdyaXRlIGRldiBvcgo+IGRybSAob3Igd2hhdGV2ZXIgbmFtZSBpcyBjaG9zZW4gaW4g
dGhlIGVuZCk7IGJvdGggd29yayBpbiB0aGUgc2FtZSB3YXkuCgpQYXRjaCAjMSBhdm9pZHMgdGhl
IG5lZWQgdG8gYmFja3BvcnQgdGhlIGVudGlyZSBzZXQsIGhvd2V2ZXIgZXZlcnkKY2hhbmdlIG9j
Y3VyaW5nIGFmdGVyIHRoZSByZW5hbWUgcGF0Y2hlcyB3aWxsIGNhdXNlIGNvbmZsaWN0cyBvbgpm
dXR1cmUgY2hlcnJ5LXBpY2tzLiBEb3duc3RyZWFtIGtlcm5lbHMgd2lsbCBoYXZlIHRvIGJhY2tw
b3J0IHRoZQp3aG9sZSBzZXQuIEJhY2twb3J0aW5nIHRoZSBlbnRpcmUgc2V0IHdpbGwgY3JlYXRl
IGFuIGVwb2NoIGluCmRvd25zdHJlYW0ga2VybmVscyB3aGVyZSBjaGVycnktcGlja2luZyBwYXRj
aGVzIHByZWNlZGluZyB0aGlzIHNldAp3aWxsIG5lZWQgdG8gdW5kZXJnbyBjb25mbGljdCByZXNv
bHV0aW9uIGFzIHdlbGwuIEFzIG1lbnRpb25lZCBpbiBteQpwcmV2aW91cyBlbWFpbCwgSSBkb24n
dCBleHBlY3Qgc3ltcGF0aHkgaGVyZSwgaXQncyBwYXJ0IG9mIG1haW50YWluaW5nCmEgZG93bnN0
cmVhbSBrZXJuZWwsIGJ1dCB0aGVyZSBpcyBhIHJlYWwgY29zdCB0byBrZXJuZWwgY29uc3VtZXJz
LgoKPgo+IEJ1dCBldmVuIHdpdGggdGhlIG9uZS1wYXRjaC1wZXItcmVuYW1lIGFwcHJvYWNoIEkn
ZCBjb25zaWRlciB0aGUKPiByZW5hbWluZyBhIG5ldCB3aW4sIGJlY2F1c2UgZWFzZSBvZiB1bmRl
cnN0YW5kaW5nIGNvZGUgaGFzIGEgYmlnIHZhbHVlLgo+IEl0J3MgdmFsdWUgaXMgbm90IHNvIGVh
c3kgbWVhc3VyYWJsZSBhcyAiY29uZmxpY3RzIHdoZW4gYmFja3BvcnRpbmciLAo+IGJ1dCBpdCBh
bHNvIG1hdHRlcnMgaW4gc2F5IHR3byB5ZWFycyBmcm9tIG5vdywgd2hpbGUgYmFja3BvcnRpbmcK
PiBzaG91bGRuJ3QgYmUgYW4gaXNzdWUgdGhlbiBhbnkgbW9yZS4KCllvdSd2ZSByaWdodGx5IGlk
ZW50aWZpZWQgdGhlIGNvbmplY3R1cmUgaW4geW91ciBzdGF0ZW1lbnQuIEkndmUgYmVlbgpvbiBi
b3RoIHNpZGVzIG9mIHRoZSBhcmd1bWVudCwgaGF2aW5nIHdyaXR0ZW4vbWFpbnRhaW5lZCBkcm0g
Y29kZQp1cHN0cmVhbSBhbmQgY2hlcnJ5LXBpY2tlZCBjaGFuZ2VzIHRvIGEgZG93bnN0cmVhbSBr
ZXJuZWwuIFBlcmhhcHMKaXQncyBiZWNhdXNlIGRybSdzIGRlZmluaXRpb24gb2YgZGV2IGlzIGlu
Z3JhaW5lZCBpbiBteSBtdXNjbGUgbWVtb3J5LApvciBtYXliZSBpdCdzIGJlY2F1c2UgSSBkb24n
dCBkbyBhIGxvdCBvZiB1cHN0cmVhbSBkZXZlbG9wbWVudCB0aGVzZQpkYXlzLCBidXQgSSBqdXN0
IGhhdmUgYSBoYXJkIHRpbWUgc2VlaW5nIHRoZSBiZW5lZml0IGhlcmUuCgpJIGFwcHJlY2lhdGUg
eW91ciBlbmdhZ2VtZW50IG9uIHRoZSB0b3BpYywgdGhhbmsgeW91IQoKU2VhbgoKPgo+IFRoYW5r
cyBmb3IgeW91ciBpbnB1dCwgYmVzdCByZWdhcmRzCj4gVXdlCj4KPiAtLQo+IFBlbmd1dHJvbml4
IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2bmlnICAgICAg
ICAgICAgfAo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAgICAgICAgICAgICB8IGh0
dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
