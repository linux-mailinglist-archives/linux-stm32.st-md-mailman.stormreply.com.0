Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8137358A9
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 15:33:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 120A6C6A60D;
	Mon, 19 Jun 2023 13:33:32 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F4FBC6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 13:33:29 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-54fdf8c79a3so1539895a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 06:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687181608; x=1689773608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEGefi/onIC0eCyepJlH8hSgTT8IMaedG+S+Kvs9SIU=;
 b=KVETq1OcR/4/TKW+8BXoL28G6ChHXuw8DNfR2BJrwsN6b7keI7lzt3ml8xVkth7iIq
 OwuzI6Sa7HqX+47+K5ay6666OhbwhLvmrcV1QAWIiqjqVNpxH9tbHDB1qqoxT3vEpnm0
 1JlQFy1Ay4BPFpB7gbGrch/cX5eMWx8KAXYdtHTyyTRorRDP/SViNkQiQIrLS5kfHSw4
 nbVbLXAYBgSRHTHao8lmOAAbMAI7o/bWF4BIQfHsNhHxuh10Ba6fJt1HzX0/eZT4rr7p
 S4/ZH+S+BJKcrfliyZJMz0KySRhNsU6XOlzCrynpub/eFw0WXhhILhfv1mybFPNBoAcK
 1ISA==
X-Gm-Message-State: AC+VfDz91L7EKUL/YAaO0tGLk816Lq4S2bLzx4Nqfp+0Y7aVclS3nOMZ
 9VM2xtNIrOdQyCsrDislBQLkhS9HzQhqv77l
X-Google-Smtp-Source: ACHHUZ4KrOTy6MvNvXPIEO8RanyO3H+5gTyD+PORclKHcHZf0FuXj11iZQdUEZSPLy+5GL16N3Z+uw==
X-Received: by 2002:a05:6a20:7f84:b0:10f:f672:6e6b with SMTP id
 d4-20020a056a207f8400b0010ff6726e6bmr957585pzj.5.1687181608093; 
 Mon, 19 Jun 2023 06:33:28 -0700 (PDT)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com.
 [209.85.216.46]) by smtp.gmail.com with ESMTPSA id
 jc2-20020a17090325c200b001b1a2bf5274sm9237724plb.22.2023.06.19.06.33.27
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 06:33:27 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-25eb817b92fso1270881a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 06:33:27 -0700 (PDT)
X-Received: by 2002:a25:cb88:0:b0:bc6:5d71:f820 with SMTP id
 b130-20020a25cb88000000b00bc65d71f820mr932905ybg.55.1687181141903; Mon, 19
 Jun 2023 06:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de>
 <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de>
 <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
In-Reply-To: <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jun 2023 15:25:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com>
Message-ID: <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Raymond Tan <raymond.tan@intel.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 Miaoqian Lin <linmq006@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Jani Nikula <jani.nikula@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Inki Dae <inki.dae@samsung.com>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, lima@lists.freedesktop.org,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Ben Skeggs <bskeggs@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-mips@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
 Wang Jianzheng <wangjianzheng@vivo.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Brian Starkey <brian.starkey@arm.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yuan Can <yuancan@huawei.com>, Stefan Agner <stefan@agner.ch>,
 Michal Simek <michal.simek@xilinx.com>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liu Shixin <liushixin2@huawei.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Liviu Dudau <liviu.dudau@arm.com>, Doug Anderson <dianders@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, Laura Nao <laura.nao@collabora.com>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>,
 Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <linux@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTWF4aW1lLAoKQ0Mgc2ZyCgpPbiBNb24sIEp1biAxOSwgMjAyMyBhdCAyOjUx4oCvUE0gTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPiB3cm90ZToKPiBPbiBNb24sIEp1biAxOSwg
MjAyMyBhdCAxMjo1Mzo0MlBNICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+IE9u
IE1vbiwgSnVuIDE5LCAyMDIzIGF0IDExOjQ1OjM3QU0gKzAyMDAsIE1heGltZSBSaXBhcmQgd3Jv
dGU6Cj4gPiA+IE9uIFN1biwgSnVuIDE4LCAyMDIzIGF0IDA2OjI5OjUwUE0gKzAyMDAsIFV3ZSBL
bGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gPiA+IE9uIFN1biwgSnVuIDE4LCAyMDIzIGF0IDA0OjMy
OjU1UE0gKzAyMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gPiA+ID4gPiBPbiBTdW4sIEp1biAx
OCwgMjAyMyBhdCAwMjozOToxNVBNICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+
ID4gPiA+ID4gT24gU2F0LCBKdW4gMTcsIDIwMjMgYXQgMTA6NTc6MjNBTSAtMDcwMCwgRG91ZyBB
bmRlcnNvbiB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBTYXQsIEp1biAxNywgMjAyMyBhdCA5OjE1
4oCvQU0gVXdlIEtsZWluZS1Lw7ZuaWcKPiA+ID4gPiA+ID4gPiA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IFRvZ2V0aGVyIHdpdGggdGhlIHBh
dGNoZXMgdGhhdCB3ZXJlIGFwcGxpZWQgbGF0ZXIgdGhlIHRvcG1vc3QgY29tbWl0Cj4gPiA+ID4g
PiA+ID4gPiBmcm9tIHRoaXMgc2VyaWVzIGlzIGMyODA3ZWNiNTI5MCAoImRybS9vbWFwOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZQo+ID4gPiA+ID4gPiA+ID4gY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQiKS4gVGhpcyBjb21taXQgd2FzIHBhcnQgZm9yIHRoZSBmb2xsb3dpbmcgbmV4dAo+ID4g
PiA+ID4gPiA+ID4gdGFnczoKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAg
ICQgZ2l0IHRhZyAtbCAtLWNvbnRhaW5zIGMyODA3ZWNiNTI5MAo+ID4gPiA+ID4gPiA+ID4gICAg
ICAgICBuZXh0LTIwMjMwNjA5Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIG5leHQtMjAyMzA2MTMK
PiA+ID4gPiA+ID4gPiA+ICAgICAgICAgbmV4dC0yMDIzMDYxNAo+ID4gPiA+ID4gPiA+ID4gICAg
ICAgICBuZXh0LTIwMjMwNjE1Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSG93ZXZl
ciBpbiBuZXh0LTIwMjMwNjE2IHRoZXkgYXJlIG1pc3NpbmcuIEluIG5leHQtMjAyMzA2MTYKPiA+
ID4gPiA+ID4gPiA+IGRybS1taXNjL2Zvci1saW51eC1uZXh0IHdhcyBjZjY4M2U4ODcwYmQ0YmUw
ZmQ2Yjk4NjM5Mjg2NzAwYTM1MDg4NjYwLgo+ID4gPiA+ID4gPiA+ID4gQ29tcGFyZWQgdG8gYzI4
MDdlY2I1MjkwIHRoaXMgYWRkcyAxMTQ5IHBhdGNoZXMgYnV0IGRyb3BzIDM3ICh0aGF0IGFyZQo+
ID4gPiA+ID4gPiA+ID4gYWxzbyBub3QgaW5jbHVkZWQgd2l0aCBhIGRpZmZlcmVudCBjb21taXQg
aWQpLiBUaGUgMzcgcGF0Y2hlcyBkcm9wcGVkCj4gPiA+ID4gPiA+ID4gPiBhcmUgMTNjZGQxMmE5
ZjkzNDE1OGY0ZWM4MTdjZjA0OGZjYjQzODRhYTlkYy4uYzI4MDdlY2I1MjkwOgo+ID4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgJCBnaXQgc2hvcnRsb2cgLXMgMTNjZGQxMmE5
ZjkzNDE1OGY0ZWM4MTdjZjA0OGZjYjQzODRhYTlkYy4uYzI4MDdlY2I1MjkwCj4gPiA+ID4gPiA+
ID4gPiAgICAgICAgICAgICAgMSAgQ2hyaXN0b3BoZSBKQUlMTEVUCj4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgMiAgSmVzc2ljYSBaaGFuZwo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAg
IDUgIEthcm9sIFdhY2hvd3NraQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgIDEgIExhdXJh
IE5hbwo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgMjcgIFV3ZSBLbGVpbmUtS8O2bmlnCj4g
PiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgMSAgV2FuZyBKaWFuemhlbmcKPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSSBndWVzcyB0aGlzIHdhcyBkb25l
IGJ5IG1pc3Rha2UgYmVjYXVzZSBub2JvZHkgdG9sZCBtZSBhYm91dCBkcm9wcGluZwo+ID4gPiA+
ID4gPiA+ID4gbXkvdGhlc2UgcGF0Y2hlcz8gQ2FuIGMyODA3ZWNiNTI5MCBwbGVhc2UgYmUgbWVy
Z2VkIGludG8gZHJtLW1pc2MtbmV4dAo+ID4gPiA+ID4gPiA+ID4gYWdhaW4/Cj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBBY3R1YWxseSwgaXQgd2FzIHByb2JhYmx5IGEgbWlzdGFrZSB0aGF0
IHRoZXNlIHBhdGNoZXMgZ290IG1lcmdlZCB0bwo+ID4gPiA+ID4gPiA+IGxpbnV4bmV4dCBkdXJp
bmcgdGhlIDQgZGF5cyB0aGF0IHlvdSBub3RpY2VkLiBIb3dldmVyLCB5b3VyIHBhdGNoZXMKPiA+
ID4gPiA+ID4gPiBhcmVuJ3QgZHJvcHBlZCBhbmQgYXJlIHN0aWxsIHByZXNlbnQgaW4gZHJtLW1p
c2MtbmV4dC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IGRybS1taXNjIGhhcyBhIGJpdCBv
ZiBhIHVuaXF1ZSBtb2RlbCBhbmQgaXQncyBkb2N1bWVudGVkIGZhaXJseSB3ZWxsIGhlcmU6Cj4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5v
cmcvbWFpbnRhaW5lci10b29scy9kcm0tbWlzYy5odG1sCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IElzIHRoZXJlIGEgZmxhdyB0aGVuIGluIHRoaXMgdW5pcXVlIG1vZGVsIChvciBpdHMgaW1wbGVt
ZW50YXRpb24pIHdoZW4KPiA+ID4gPiA+ID4gZHJtLW1pc2MvZm9yLWxpbnV4LW5leHQgbW92ZXMg
aW4gYSBub24tZmFzdC1mb3J3YXJkIG1hbm5lcj8gVGhpcyBpc24ndAo+ID4gPiA+ID4gPiBleHBl
Y3RlZCwgaXMgaXQ/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlcmUncyBubyBleHBlY3RhdGlvbiBh
ZmFpay4gQW55IHRyZWUgbWVyZ2VkIGluIGxpbnV4LW5leHQgY2FuIGJlCj4gPiA+ID4gPiByZWJh
c2VkLCBkcm9wIGEgcGF0Y2gsIGFtZW5kIG9uZSwgZXRjLiB3aXRob3V0IGFueSBjb25jZXJuLgo+
ID4gPiA+Cj4gPiA+ID4gSSBhZ3JlZSB0aGF0IHRoZXJlIGFyZSBubyBydWxlcyBicm9rZW4gZm9y
IGEgdHJlZSB0aGF0IGlzIGluY2x1ZGVkIGluCj4gPiA+ID4gbmV4dCBhbmQgYSBtYWludGFpbmVy
IGlzIGZyZWUgdG8gcmV3cml0ZSB0aGVpciB0cmVlIGluZGVwZW5kYW50IG9mIHRoZQo+ID4gPiA+
IHRyZWUgYmVpbmcgaW5jbHVkZWQgaW4gbmV4dC4KPiA+ID4gPgo+ID4gPiA+IFN0aWxsIEkgdGhp
bmsgdGhhdCBzaG91bGRuJ3QgYmUgdXNlZCBhcyBhbiBleGN1c2UuCj4gPiA+Cj4gPiA+IEFzIGFu
IGV4Y3VzZSBmb3Igd2hhdD8KPiA+Cj4gPiBKdXN0IGJlY2F1c2UgdGhlIHJ1bGVzIGZvciB0cmVl
cyBpbiBuZXh0IGFsbG93IHRoZSBtZXJnZWQgYnJhbmNoIHRvIGJlCj4gPiByZXdyaXR0ZW4sIHNo
b3VsZG4ndCBiZSB1c2VkIHRvIGp1c3RpZnkgcmV3cml0aW5nIHRoZSBicmFuY2guCj4gPgo+ID4g
SU1ITyB5b3Ugc3RpbGwgc2hvdWxkIGVuc3VyZSB0aGF0IG9ubHkgY29tbWl0cyBtYWtlIGl0IGlu
dG8gYW55IG5leHQKPiA+IHNuYXBzaG90IHZpYSB5b3VyIHRyZWUgYmVmb3JlIFgtcmMxIGZvciBz
b21lIFggKGUuZy4gdjYuNSkgdGhhdCB5b3UKPiA+IGludGVuZCB0byBiZSBpbmNsdWRlZCBpbiBY
LXJjMS4KPgo+IFRoYXQncyBuZXZlciBiZWVuIGEgbmV4dCBydWxlIGVpdGhlci4gUnVzdCBzdXBw
b3J0IGhhcyBiZWVuIGluIG5leHQgZm9yCj4gYWxtb3N0IGEgeWVhciB3aXRob3V0IGJlaW5nIHNl
bnQgYXMgYSBQUiBmb3IgZXhhbXBsZS4KCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzLzIuUHJvY2Vzcy5yc3QjTDI5NwoK
ICAgIlRoZSBsaW51eC1uZXh0IHRyZWUgaXMsIGJ5IGRlc2lnbiwgYSBzbmFwc2hvdCBvZiB3aGF0
IHRoZSBtYWlubGluZQogICAgaXMgZXhwZWN0ZWQgdG8gbG9vayBsaWtlIGFmdGVyIHRoZSBuZXh0
IG1lcmdlIHdpbmRvdyBjbG9zZXMuIgoKVGhlIGdlbmVyYWwgcnVsZSBmb3IgbGludXgtbmV4dCBp
cyB0aGF0IGl0cyBjb250ZW50cyBhcmUgaW50ZW5kZWQgdG8gZW5kCnVwIGluIHRoZSBuZXh0IGtl
cm5lbCByZWxlYXNlLCBhbmQgdGhhdCBpdCBzaG91bGQgbm90IGNvbnRhaW4gY29tbWl0cwp0aGF0
IGFyZSBpbnRlbmRlZCBmb3IgdGhlIG5leHQtbmV4dCByZWxlYXNlLCBjZnIuIHdoYXQgU3RlcGhl
biBzZW5kcwpvdXQgdG8gbmV3IHRyZWVzOgoKICAgIllvdSB3aWxsIG5lZWQgdG8gZW5zdXJlIHRo
YXQgdGhlIHBhdGNoZXMvY29tbWl0cyBpbiB5b3VyIHRyZWUvc2VyaWVzIGhhdmUKICAgIGJlZW46
CiAgICAgICAgICAgIFsuLi5dCiAgICAgICAgICogZGVzdGluZWQgZm9yIHRoZSBjdXJyZW50IG9y
IG5leHQgTGludXggbWVyZ2Ugd2luZG93LiIKCmFuZCB3aGF0IGhlIHJlcXVlc3RzIHJlZ3VsYXJs
eSBpbiBoaXMgYW5ub3VuY2VzLCBlLmcuOgoKICAgIlBsZWFzZSBkbyBub3QgYWRkIGFueSB2Ni40
IHJlbGF0ZWQgY29tbWl0cyB0byB5b3VyIGxpbnV4LW5leHQgaW5jbHVkZWQKICAgIGJyYW5jaGVz
IHVudGlsIGFmdGVyIHY2LjMtcmMxIGhhcyBiZWVuIHJlbGVhc2VkLiIKCkFGQUlVLCB0aGUgZXhj
ZXB0aW9uIHRvIHRoZSBydWxlIGlzIG5ldywgc2VsZi1jb250YWluZWQsIGFuZCBzb21ldGltZXMK
Y29udHJvdmVyc2lhbCBkZXZlbG9wbWVudCwgd2hpY2ggbWF5IGhhdmUgdG8gY29vayBmb3IgYSBm
ZXcgbW9yZSBjeWNsZXMsCmlmIGl0IGVuZHMgdXAgaW4gYSBQUiBhdCBhbGwuCgo+ID4gPiA+IEZv
ciBtZSwgaWYgYSBtYWludGFpbmVyIHB1dHMgc29tZSBwYXRjaCBpbnRvIG5leHQgdGhhdCdzIGEg
c3RhdGVtZW50Cj4gPiA+ID4gc2F5aW5nIChhcHByb3hpbWF0ZWx5KSAiSSB0aGluayB0aGlzIHBh
dGNoIGlzIGZpbmUgYW5kIEkgaW50ZW5kIHRvCj4gPiA+ID4gc2VuZCBpdCB0byBMaW51cyBkdXJp
bmcgdGhlIG5leHQgbWVyZ2Ugd2luZG93LiIuCj4gPiA+Cj4gPiA+IEkgbWVhbiwgdGhhdCdzIHdo
YXQgd2UncmUgc2F5aW5nIGFuZCBkb2luZz8KPiA+Cj4gPiBObywgb24gMjAyMy0wNi0wOSBJIGFz
c3VtZWQgdGhhdCBteSBwYXRjaGVzIHdpbGwgZ28gaW50byB2Ni41LXJjMSAoYXMgaXQKPiA+IHdh
cyBwYXJ0IG9mIG5leHQtMjAyMzA2MDkpLiBBIGZldyBkYXlzIGxhdGVyIGhvd2V2ZXIgdGhlIHBh
dGNoZXMgd2VyZQo+ID4gZHJvcHBlZC4KPiA+Cj4gPiBUaGUgdHdvIG9wdGlvbnMgdGhhdCB3b3Vs
ZCBoYXZlIG1hZGUgdGhlIGV4cGVyaWVuY2Ugc21vb3RoZXIgZm9yIG1lIGFyZToKPiA+Cj4gPiAg
YSkga2VlcCBjMjgwN2VjYjUyOTAgaW4gbmV4dCBhbmQgc2VuZCBpdCBmb3IgdjYuNS1yYzE7IG9y
Cj4KPiBUaGF0J3Mgbm90IGFuIG9wdGlvbi4gWW91IHdlcmUgc2ltcGx5IHRvbyBsYXRlIGZvciB2
Ni41LXJjMSwgdW5sZXNzIHlvdQo+IGV4cGVjdCB1cyB0byBnZXQgcmlkIG9mIHRpbWV6b25lcyBh
bmQgd29yayBvbiB3ZWVrLWVuZHMuIEJ1dCBzdXJlbHkgeW91Cj4gZG9uJ3QuCgpJIGRvbid0IHRo
aW5rIGFueW9uZSBleHBlY3RzIHlvdSB0byBkbyB0aGF0Li4uCgo+ID4gIGIpIGtlZXAgYzI4MDdl
Y2I1MjkwIGluIGEgYnJhbmNoIHRoYXQgZG9lc24ndCByZXN1bHQgaXQgZW50ZXJpbmcgbmV4dAo+
ID4gICAgIGJlZm9yZSB2Ni41LXJjMS4KPgo+IEFsbCB0aGUgZHJtLW1pc2MgY29tbWl0dGVycyB1
c2UgZGltLiBJZiB0aGF0J3MgYSBjb25jZXJuIGZvciB5b3UsIGZlZWwKPiBmcmVlIHRvIHNlbmQg
YSBwYXRjaCBhZGRyZXNzaW5nIHRoaXMgdG8gZGltLgoKU28geW91IHNheSB0aGlzIGlzIGFuIGlz
c3VlIHdpdGggdGhlIHRvb2xpbmc/IDstKQpJZiB0aGUgdG9vbGluZyBicmVha3MgdGhlIHJ1bGVz
LCBwZXJoYXBzIHRoZSB0b29saW5nIHNob3VsZCBiZSBmaXhlZD8KCj4gPiA+ID4gU28gbXkgZXhw
ZWN0YXRpb24gaXMgdGhhdCBpZiBhIHBhdGNoIGlzIGRyb3BwZWQgYWdhaW4gZnJvbSBuZXh0LCB0
aGVyZQo+ID4gPiA+IHdhcyBhIHByb2JsZW0gYW5kIGl0IHdvdWxkIGJlIGZhaXIgaWYgdGhlIG1h
aW50YWluZXIgdGVsbHMgdGhlCj4gPiA+ID4gYXV0aG9yL3N1Ym1pdHRlciBhYm91dCB0aGlzIHBy
b2JsZW0gYW5kIHRoYXQgdGhlIHBhdGNoIHdhcyBkcm9wcGVkLgo+ID4gPgo+ID4gPiBCdXQgaXQg
d2Fzbid0IGRyb3BwZWQsCj4gPgo+ID4gRnJvbSBteSBQT1YgaXQgd2FzIGRyb3BwZWQgZnJvbSBu
ZXh0IGFzIGl0IHdhcyBwYXJ0IG9mIG5leHQgYmV0d2Vlbgo+ID4gbmV4dC0yMDIzMDYwOSBhbmQg
bmV4dC0yMDIzMDYxNSBidXQgbm90IGFueSBtb3JlIHNpbmNlIG5leHQtMjAyMzA2MTYuCj4gPiBZ
b3UgdGFsayBhYm91dCAobm90KSBiZWluZyBkcm9wcGVkIGZyb20gc29tZSBicmFuY2ggaW4gZHJt
LW1pc2MsIHRoYXQncwo+ID4gaXJyZWxldmFudCBmb3IgdGhlIHRoaW5nIEknbSBjb21wbGFpbmlu
ZyBhYm91dC4KPgo+IFlvdSB3ZXJlIG5ldmVyIHRvbGQgdGhhdCB0aGV5IHdlcmUgbWVyZ2VkIGlu
IGxpbnV4LW5leHQsIGJ1dCBpbgo+IGRybS1taXNjLW5leHQuIElmIHRoZXkgZGlkLCBpdCdzIG1v
c3RseSBhbiB1bmZvcnR1bmF0ZSBhcnRpZmFjdC4KPgo+IFdlIGhhdmUgYSBkb2N1bWVudGF0aW9u
IHRoYXQgZXhwbGFpbnMgdGhlIHByb2Nlc3MgYW5kIGhvdyBkcm0tbWlzYy1uZXh0Cj4gd29ya3Mu
IElmIHRoYXQncyBzdGlsbCBjb25mdXNpbmcgc29tZWhvdywgZmVlbCBmcmVlIHRvIGFtZW5kIGl0
IHRvIG1ha2UKPiBpdCBjbGVhcmVyLgoKV2h5IHRoYXQgZG9jdW1lbnQgbWF5IGFwcGx5IHRvIGRy
bS1taXNjLW5leHQsIGV2ZXJ5dGhpbmcgdGhhdCBhcHBlYXJzCmluIGxpbnV4LW5leHQgc2hvdWxk
IGZvbGxvdyB0aGUgbGludXgtbmV4dCBwcm9jZXNzCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzLzIuUHJvY2Vzcy5yc3Qj
TDI1NgoKPiA+ID4gaXQncyBzdGlsbCB2ZXJ5IG11Y2ggdG8gYmUgc2VudCB0byBMaW51cyBkdXJp
bmcgdGhlIG5leHQgbWVyZ2Ugd2luZG93Lgo+ID4KPiA+ICJuZXh0IG1lcmdlIHdpbmRvdyIgYXMg
aW4gdGhlIG9uZSBsZWFkaW5nIHRvIDYuNS1yYzE/IEVpdGhlciB3ZSBtZWFuCj4gPiBkaWZmZXJl
bnQgdGhpbmdzIHdoZW4gd2Ugc2F5ICJuZXh0IG1lcmdlIHdpbmRvdyIsIG9yIHRoZXJlIGlzIGEK
PiA+IG1pc3VuZGVyc3RhbmRpbmcgSSBkb24ndCBzZWUgeWV0Lgo+Cj4gTGludXMgZG9lc24ndCB3
YW50IHRvIHJlY2VpdmUgaW4gYSBQUiBwYXRjaGVzIHRoYXQgaGF2ZW4ndCBiZWVuIGluCj4gbGlu
dXgtbmV4dCBmb3IgYXQgbGVhc3QgdHdvIHdlZWtzLiBJbiBtb3N0IGNhc2VzIHRoYXQncyByYzYs
IHdoaWNoIG1lYW5zCj4gdGhhdCBieSB0aGUgdGltZSB3ZSBzZW5kIG91ciBsYXN0IFBSIGJlZm9y
ZSByYzYsIHRoZQo+IG5leHQtbWVyZ2Utd2luZG93LXdoaWxlLXN0aWxsLW1lZXRpbmctTGludXMt
cmVxdWlyZW1lbnRzIGlzIDYuNi4KPgo+IFRoZSBydWxlIGFwcGxpZXMgdG8gYWxsIHRyZWVzLCBh
bmQgaXQncyB3aHkgdGhlIHNvYyB0cmVlIGFsc28gcmVxdWlyZXMKPiBpdHMgc3VibWFpbnRhaW5l
cnMgdG8gc3VibWl0IHRoZWlyIFBSIGJlZm9yZSAtcmM2LgoKVW5sZXNzIHRoZXJlJ3MgYSB2ZXJ5
IGdvb2QgcmVhc29uIHRvIGRldmlhdGUgZnJvbSB0aGF0IChlLmcuIGEgYnVnIGZpeCkuCgo+IFNv
IHllYWgsIHNvcnJ5IGlmIGl0IHdhcyBjb25mdXNpbmcuIEF0IHRoZSBlbmQgb2YgdGhlIGRheSwg
aXQncyBhCj4gY29tcHJvbWlzZSwgYW5kIEkgY2FuJ3QgZmluZCBhIGJldHRlciBvbmUgZm9yIGV2
ZXJ5b25lIGludm9sdmVkCj4gKG1haW50YWluZXJzLCBjb250cmlidXRvcnMgYW5kIGNvbW1pdHRl
cnMgYWxpa2UpIG9mZiB0aGUgdG9wIG9mIG15IGhlYWQuCgpBcyBJIHVuZGVyc3RhbmQsIHRoZSBt
YWluIGlzc3VlIFV3ZSBpcyBvYmplY3RpbmcgdG8sIGlzIHRoYXQgaGlzCnBhdGNoZXMgZW5kZWQg
dXAgaW4gbGludXgtbmV4dCBmaXJzdCwgb25seSB0byBiZSBkcm9wcGVkIGFnYWluIGZyb20KbGlu
dXgtbmV4dCBsYXRlciwgYW5kIHRoYXQgdGhlcmUgd2FzIG5vIGNvbW11bmljYXRpb24gYWJvdXQg
dGhlCmxhdHRlci4KCklmIHlvdSdyZSBub3QgY29uc3RhbnRseSB3b3JraW5nIG9uIGEgc3Vic3lz
dGVtLCBpdCBjYW4gYmUgdmVyeSBoYXJkCnRvIGtlZXAgdHJhY2sgb2YgdGhlIHN0YXR1cyBvZiB5
b3VyIG93biBkcml2ZS1ieSBwYXRjaGVzLiBXaGVuIHBhdGNoZXMKZ2V0IGFwcGxpZWQsIGFwcGVh
ciBpbiBsaW51eC1uZXh0LCBhbmQgZGlzYXBwZWFyIGZyb20gbGludXgtbmV4dCBhZ2FpbgpsYXRl
ciwgaXQncyB3b3JzZS4uLgoKVGhhbmtzIGZvciB5b3VyIHVuZGVyc3RhbmRpbmchCgpHcntvZXRq
ZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
