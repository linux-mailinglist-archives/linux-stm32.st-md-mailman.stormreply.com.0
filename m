Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A16735960
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 16:20:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42F65C6A61E;
	Mon, 19 Jun 2023 14:20:54 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFFF0C6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 14:20:51 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so1585666a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 07:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687184450; x=1689776450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jFntx4YXgadpDVJ2Ga1nOHhwiQ9Nxhf2XabKx8SJuMo=;
 b=K6wxIxnanE0V/bcUoTqZbAYMf8lWTGTrd1hup3xJkgyu8DcDYQf1DvVrc7TngcBg93
 v+wmrnd7605t+jJP84zS/PVqsh9G74gbdmpqK15H+RVvyWxDOQQWunQHhGYuMj4h+poe
 lp7m/z4hnfB6QyH7hpVhddIUdrsLgvN+KznFpkruIrOfjqCS3wfQVXurCqIdpTSih26z
 3jeXvig6e7kLsBYzNLuMxGhjH2DbEo+VcptzxY9cMy19qDt7rKebCe2Spn2vRZvt+hRk
 MLeFT8BbwM1crqeNmVwv+UNrH/In2So5hl9rs7HW4XUEp7ElxJYNBPCF5vielELwIKlD
 Xsgg==
X-Gm-Message-State: AC+VfDzFRoH5Kh4TGx+ZJsNYtMlWd0fzQjWSXB5gNuNbZj/2aL/j3CyZ
 1/wMuFX43ytCWAoZaXbGjUtFU0QrydlhjThJ
X-Google-Smtp-Source: ACHHUZ57DkAXo/yiTvz1exKjhBhgoDe1LCB47F2g+L4fEl1Z6wDRtiG2Kk1Hy9jw07Fzu2EaNrPXtQ==
X-Received: by 2002:a17:902:db05:b0:1b2:499f:672c with SMTP id
 m5-20020a170902db0500b001b2499f672cmr1003840plx.33.1687184450077; 
 Mon, 19 Jun 2023 07:20:50 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com.
 [209.85.210.178]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170902690b00b001b03842ab78sm20590131plk.89.2023.06.19.07.20.48
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 07:20:48 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-668689ce13fso664345b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 07:20:48 -0700 (PDT)
X-Received: by 2002:a5b:88e:0:b0:ba8:33d9:b583 with SMTP id
 e14-20020a5b088e000000b00ba833d9b583mr987140ybq.13.1687184427316; Mon, 19 Jun
 2023 07:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de>
 <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de>
 <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
 <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com>
 <vegkiv4puxederjvonyyqsg4j5swpi2h7ttg7ng6gq2tibk4gy@afa5vexshp7q>
In-Reply-To: <vegkiv4puxederjvonyyqsg4j5swpi2h7ttg7ng6gq2tibk4gy@afa5vexshp7q>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jun 2023 16:20:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXf5Pao+Fjf42iRV_iMFEcb+F=s09NG+mudB-L5wWF_OA@mail.gmail.com>
Message-ID: <CAMuHMdXf5Pao+Fjf42iRV_iMFEcb+F=s09NG+mudB-L5wWF_OA@mail.gmail.com>
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

SGkgTWF4aW1lLAoKT24gTW9uLCBKdW4gMTksIDIwMjMgYXQgNDowMuKAr1BNIE1heGltZSBSaXBh
cmQgPG1yaXBhcmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBKdW4gMTksIDIwMjMgYXQg
MDM6MjU6MjhQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gTW9uLCBK
dW4gMTksIDIwMjMgYXQgMjo1MeKAr1BNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSnVuIDE5LCAyMDIzIGF0IDEyOjUzOjQyUE0gKzAyMDAs
IFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgSnVuIDE5LCAyMDIzIGF0
IDExOjQ1OjM3QU0gKzAyMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gPiA+ID4gPiBPbiBTdW4s
IEp1biAxOCwgMjAyMyBhdCAwNjoyOTo1MFBNICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPiA+ID4gPiA+ID4gT24gU3VuLCBKdW4gMTgsIDIwMjMgYXQgMDQ6MzI6NTVQTSArMDIwMCwg
TWF4aW1lIFJpcGFyZCB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBTdW4sIEp1biAxOCwgMjAyMyBh
dCAwMjozOToxNVBNICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gPiA+ID4g
PiA+IE9uIFNhdCwgSnVuIDE3LCAyMDIzIGF0IDEwOjU3OjIzQU0gLTA3MDAsIERvdWcgQW5kZXJz
b24gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIFNhdCwgSnVuIDE3LCAyMDIzIGF0IDk6MTXi
gK9BTSBVd2UgS2xlaW5lLUvDtm5pZwo+ID4gPiA+ID4gPiA+ID4gPiA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiBUb2dldGhlciB3aXRo
IHRoZSBwYXRjaGVzIHRoYXQgd2VyZSBhcHBsaWVkIGxhdGVyIHRoZSB0b3Btb3N0IGNvbW1pdAo+
ID4gPiA+ID4gPiA+ID4gPiA+IGZyb20gdGhpcyBzZXJpZXMgaXMgYzI4MDdlY2I1MjkwICgiZHJt
L29tYXA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlCj4gPiA+ID4gPiA+ID4gPiA+ID4gY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQiKS4gVGhpcyBjb21taXQgd2FzIHBhcnQgZm9yIHRoZSBmb2xs
b3dpbmcgbmV4dAo+ID4gPiA+ID4gPiA+ID4gPiA+IHRhZ3M6Cj4gPiA+ID4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICQgZ2l0IHRhZyAtbCAtLWNvbnRhaW5zIGMyODA3
ZWNiNTI5MAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgbmV4dC0yMDIzMDYwOQo+ID4gPiA+
ID4gPiA+ID4gPiA+ICAgICAgICAgbmV4dC0yMDIzMDYxMwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAg
ICAgICAgbmV4dC0yMDIzMDYxNAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgbmV4dC0yMDIz
MDYxNQo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gSG93ZXZlciBpbiBu
ZXh0LTIwMjMwNjE2IHRoZXkgYXJlIG1pc3NpbmcuIEluIG5leHQtMjAyMzA2MTYKPiA+ID4gPiA+
ID4gPiA+ID4gPiBkcm0tbWlzYy9mb3ItbGludXgtbmV4dCB3YXMgY2Y2ODNlODg3MGJkNGJlMGZk
NmI5ODYzOTI4NjcwMGEzNTA4ODY2MC4KPiA+ID4gPiA+ID4gPiA+ID4gPiBDb21wYXJlZCB0byBj
MjgwN2VjYjUyOTAgdGhpcyBhZGRzIDExNDkgcGF0Y2hlcyBidXQgZHJvcHMgMzcgKHRoYXQgYXJl
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gYWxzbyBub3QgaW5jbHVkZWQgd2l0aCBhIGRpZmZlcmVudCBj
b21taXQgaWQpLiBUaGUgMzcgcGF0Y2hlcyBkcm9wcGVkCj4gPiA+ID4gPiA+ID4gPiA+ID4gYXJl
IDEzY2RkMTJhOWY5MzQxNThmNGVjODE3Y2YwNDhmY2I0Mzg0YWE5ZGMuLmMyODA3ZWNiNTI5MDoK
PiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgJCBnaXQgc2hv
cnRsb2cgLXMgMTNjZGQxMmE5ZjkzNDE1OGY0ZWM4MTdjZjA0OGZjYjQzODRhYTlkYy4uYzI4MDdl
Y2I1MjkwCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgIDEgIENocmlzdG9waGUgSkFJ
TExFVAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAyICBKZXNzaWNhIFpoYW5nCj4g
PiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgIDUgIEthcm9sIFdhY2hvd3NraQo+ID4gPiA+
ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAxICBMYXVyYSBOYW8KPiA+ID4gPiA+ID4gPiA+ID4g
PiAgICAgICAgICAgICAyNyAgVXdlIEtsZWluZS1Lw7ZuaWcKPiA+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgMSAgV2FuZyBKaWFuemhlbmcKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gSSBndWVzcyB0aGlzIHdhcyBkb25lIGJ5
IG1pc3Rha2UgYmVjYXVzZSBub2JvZHkgdG9sZCBtZSBhYm91dCBkcm9wcGluZwo+ID4gPiA+ID4g
PiA+ID4gPiA+IG15L3RoZXNlIHBhdGNoZXM/IENhbiBjMjgwN2VjYjUyOTAgcGxlYXNlIGJlIG1l
cmdlZCBpbnRvIGRybS1taXNjLW5leHQKPiA+ID4gPiA+ID4gPiA+ID4gPiBhZ2Fpbj8KPiA+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gQWN0dWFsbHksIGl0IHdhcyBwcm9iYWJseSBh
IG1pc3Rha2UgdGhhdCB0aGVzZSBwYXRjaGVzIGdvdCBtZXJnZWQgdG8KPiA+ID4gPiA+ID4gPiA+
ID4gbGludXhuZXh0IGR1cmluZyB0aGUgNCBkYXlzIHRoYXQgeW91IG5vdGljZWQuIEhvd2V2ZXIs
IHlvdXIgcGF0Y2hlcwo+ID4gPiA+ID4gPiA+ID4gPiBhcmVuJ3QgZHJvcHBlZCBhbmQgYXJlIHN0
aWxsIHByZXNlbnQgaW4gZHJtLW1pc2MtbmV4dC4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gZHJtLW1pc2MgaGFzIGEgYml0IG9mIGEgdW5pcXVlIG1vZGVsIGFuZCBpdCdzIGRv
Y3VtZW50ZWQgZmFpcmx5IHdlbGwgaGVyZToKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+ID4gaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMv
ZHJtLW1pc2MuaHRtbAo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IElzIHRoZXJlIGEg
ZmxhdyB0aGVuIGluIHRoaXMgdW5pcXVlIG1vZGVsIChvciBpdHMgaW1wbGVtZW50YXRpb24pIHdo
ZW4KPiA+ID4gPiA+ID4gPiA+IGRybS1taXNjL2Zvci1saW51eC1uZXh0IG1vdmVzIGluIGEgbm9u
LWZhc3QtZm9yd2FyZCBtYW5uZXI/IFRoaXMgaXNuJ3QKPiA+ID4gPiA+ID4gPiA+IGV4cGVjdGVk
LCBpcyBpdD8KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoZXJlJ3Mgbm8gZXhwZWN0YXRp
b24gYWZhaWsuIEFueSB0cmVlIG1lcmdlZCBpbiBsaW51eC1uZXh0IGNhbiBiZQo+ID4gPiA+ID4g
PiA+IHJlYmFzZWQsIGRyb3AgYSBwYXRjaCwgYW1lbmQgb25lLCBldGMuIHdpdGhvdXQgYW55IGNv
bmNlcm4uCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkgYWdyZWUgdGhhdCB0aGVyZSBhcmUgbm8g
cnVsZXMgYnJva2VuIGZvciBhIHRyZWUgdGhhdCBpcyBpbmNsdWRlZCBpbgo+ID4gPiA+ID4gPiBu
ZXh0IGFuZCBhIG1haW50YWluZXIgaXMgZnJlZSB0byByZXdyaXRlIHRoZWlyIHRyZWUgaW5kZXBl
bmRhbnQgb2YgdGhlCj4gPiA+ID4gPiA+IHRyZWUgYmVpbmcgaW5jbHVkZWQgaW4gbmV4dC4KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gU3RpbGwgSSB0aGluayB0aGF0IHNob3VsZG4ndCBiZSB1c2Vk
IGFzIGFuIGV4Y3VzZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBcyBhbiBleGN1c2UgZm9yIHdoYXQ/
Cj4gPiA+ID4KPiA+ID4gPiBKdXN0IGJlY2F1c2UgdGhlIHJ1bGVzIGZvciB0cmVlcyBpbiBuZXh0
IGFsbG93IHRoZSBtZXJnZWQgYnJhbmNoIHRvIGJlCj4gPiA+ID4gcmV3cml0dGVuLCBzaG91bGRu
J3QgYmUgdXNlZCB0byBqdXN0aWZ5IHJld3JpdGluZyB0aGUgYnJhbmNoLgo+ID4gPiA+Cj4gPiA+
ID4gSU1ITyB5b3Ugc3RpbGwgc2hvdWxkIGVuc3VyZSB0aGF0IG9ubHkgY29tbWl0cyBtYWtlIGl0
IGludG8gYW55IG5leHQKPiA+ID4gPiBzbmFwc2hvdCB2aWEgeW91ciB0cmVlIGJlZm9yZSBYLXJj
MSBmb3Igc29tZSBYIChlLmcuIHY2LjUpIHRoYXQgeW91Cj4gPiA+ID4gaW50ZW5kIHRvIGJlIGlu
Y2x1ZGVkIGluIFgtcmMxLgo+ID4gPgo+ID4gPiBUaGF0J3MgbmV2ZXIgYmVlbiBhIG5leHQgcnVs
ZSBlaXRoZXIuIFJ1c3Qgc3VwcG9ydCBoYXMgYmVlbiBpbiBuZXh0IGZvcgo+ID4gPiBhbG1vc3Qg
YSB5ZWFyIHdpdGhvdXQgYmVpbmcgc2VudCBhcyBhIFBSIGZvciBleGFtcGxlLgo+ID4KPiA+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlv
bi9wcm9jZXNzLzIuUHJvY2Vzcy5yc3QjTDI5Nwo+ID4KPiA+ICAgICJUaGUgbGludXgtbmV4dCB0
cmVlIGlzLCBieSBkZXNpZ24sIGEgc25hcHNob3Qgb2Ygd2hhdCB0aGUgbWFpbmxpbmUKPiA+ICAg
ICBpcyBleHBlY3RlZCB0byBsb29rIGxpa2UgYWZ0ZXIgdGhlIG5leHQgbWVyZ2Ugd2luZG93IGNs
b3Nlcy4iCj4gPgo+ID4gVGhlIGdlbmVyYWwgcnVsZSBmb3IgbGludXgtbmV4dCBpcyB0aGF0IGl0
cyBjb250ZW50cyBhcmUgaW50ZW5kZWQgdG8gZW5kCj4gPiB1cCBpbiB0aGUgbmV4dCBrZXJuZWwg
cmVsZWFzZSwgYW5kIHRoYXQgaXQgc2hvdWxkIG5vdCBjb250YWluIGNvbW1pdHMKPiA+IHRoYXQg
YXJlIGludGVuZGVkIGZvciB0aGUgbmV4dC1uZXh0IHJlbGVhc2UsIGNmci4gd2hhdCBTdGVwaGVu
IHNlbmRzCj4gPiBvdXQgdG8gbmV3IHRyZWVzOgo+ID4KPiA+ICAgICJZb3Ugd2lsbCBuZWVkIHRv
IGVuc3VyZSB0aGF0IHRoZSBwYXRjaGVzL2NvbW1pdHMgaW4geW91ciB0cmVlL3NlcmllcyBoYXZl
Cj4gPiAgICAgYmVlbjoKPiA+ICAgICAgICAgICAgIFsuLi5dCj4gPiAgICAgICAgICAqIGRlc3Rp
bmVkIGZvciB0aGUgY3VycmVudCBvciBuZXh0IExpbnV4IG1lcmdlIHdpbmRvdy4iCj4gPgo+ID4g
YW5kIHdoYXQgaGUgcmVxdWVzdHMgcmVndWxhcmx5IGluIGhpcyBhbm5vdW5jZXMsIGUuZy46Cj4g
Pgo+ID4gICAgIlBsZWFzZSBkbyBub3QgYWRkIGFueSB2Ni40IHJlbGF0ZWQgY29tbWl0cyB0byB5
b3VyIGxpbnV4LW5leHQgaW5jbHVkZWQKPiA+ICAgICBicmFuY2hlcyB1bnRpbCBhZnRlciB2Ni4z
LXJjMSBoYXMgYmVlbiByZWxlYXNlZC4iCj4KPiBXaGljaCBpcyB3aHkgdGhvc2UgcGF0Y2hlcyBh
cmVuJ3QgaW4gbmV4dCBhbnltb3JlLgoKU28gd2h5IHdlcmUgdGhleSBpbiBsaW51eC1uZXh0IGJl
Zm9yZT8KV2FzIHRoaXMgYSBnZW51aW5lIG1pc3Rha2UgKHRoaW5ncyBoYXBwZW4pLCBvciBpcyB0
aGVyZSBwcm9jZXNzCm9yIHRvb2xpbmcgdG8gaW1wcm92ZT8KCj4gPiBBRkFJVSwgdGhlIGV4Y2Vw
dGlvbiB0byB0aGUgcnVsZSBpcyBuZXcsIHNlbGYtY29udGFpbmVkLCBhbmQgc29tZXRpbWVzCj4g
PiBjb250cm92ZXJzaWFsIGRldmVsb3BtZW50LCB3aGljaCBtYXkgaGF2ZSB0byBjb29rIGZvciBh
IGZldyBtb3JlIGN5Y2xlcywKPiA+IGlmIGl0IGVuZHMgdXAgaW4gYSBQUiBhdCBhbGwuCj4gPgo+
ID4gPiA+ID4gPiBGb3IgbWUsIGlmIGEgbWFpbnRhaW5lciBwdXRzIHNvbWUgcGF0Y2ggaW50byBu
ZXh0IHRoYXQncyBhIHN0YXRlbWVudAo+ID4gPiA+ID4gPiBzYXlpbmcgKGFwcHJveGltYXRlbHkp
ICJJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgZmluZSBhbmQgSSBpbnRlbmQgdG8KPiA+ID4gPiA+ID4g
c2VuZCBpdCB0byBMaW51cyBkdXJpbmcgdGhlIG5leHQgbWVyZ2Ugd2luZG93LiIuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gSSBtZWFuLCB0aGF0J3Mgd2hhdCB3ZSdyZSBzYXlpbmcgYW5kIGRvaW5nPwo+
ID4gPiA+Cj4gPiA+ID4gTm8sIG9uIDIwMjMtMDYtMDkgSSBhc3N1bWVkIHRoYXQgbXkgcGF0Y2hl
cyB3aWxsIGdvIGludG8gdjYuNS1yYzEgKGFzIGl0Cj4gPiA+ID4gd2FzIHBhcnQgb2YgbmV4dC0y
MDIzMDYwOSkuIEEgZmV3IGRheXMgbGF0ZXIgaG93ZXZlciB0aGUgcGF0Y2hlcyB3ZXJlCj4gPiA+
ID4gZHJvcHBlZC4KPiA+ID4gPgo+ID4gPiA+IFRoZSB0d28gb3B0aW9ucyB0aGF0IHdvdWxkIGhh
dmUgbWFkZSB0aGUgZXhwZXJpZW5jZSBzbW9vdGhlciBmb3IgbWUgYXJlOgo+ID4gPiA+Cj4gPiA+
ID4gIGEpIGtlZXAgYzI4MDdlY2I1MjkwIGluIG5leHQgYW5kIHNlbmQgaXQgZm9yIHY2LjUtcmMx
OyBvcgo+ID4gPgo+ID4gPiBUaGF0J3Mgbm90IGFuIG9wdGlvbi4gWW91IHdlcmUgc2ltcGx5IHRv
byBsYXRlIGZvciB2Ni41LXJjMSwgdW5sZXNzIHlvdQo+ID4gPiBleHBlY3QgdXMgdG8gZ2V0IHJp
ZCBvZiB0aW1lem9uZXMgYW5kIHdvcmsgb24gd2Vlay1lbmRzLiBCdXQgc3VyZWx5IHlvdQo+ID4g
PiBkb24ndC4KPiA+Cj4gPiBJIGRvbid0IHRoaW5rIGFueW9uZSBleHBlY3RzIHlvdSB0byBkbyB0
aGF0Li4uCj4gPgo+ID4gPiA+ICBiKSBrZWVwIGMyODA3ZWNiNTI5MCBpbiBhIGJyYW5jaCB0aGF0
IGRvZXNuJ3QgcmVzdWx0IGl0IGVudGVyaW5nIG5leHQKPiA+ID4gPiAgICAgYmVmb3JlIHY2LjUt
cmMxLgo+ID4gPgo+ID4gPiBBbGwgdGhlIGRybS1taXNjIGNvbW1pdHRlcnMgdXNlIGRpbS4gSWYg
dGhhdCdzIGEgY29uY2VybiBmb3IgeW91LCBmZWVsCj4gPiA+IGZyZWUgdG8gc2VuZCBhIHBhdGNo
IGFkZHJlc3NpbmcgdGhpcyB0byBkaW0uCj4gPgo+ID4gU28geW91IHNheSB0aGlzIGlzIGFuIGlz
c3VlIHdpdGggdGhlIHRvb2xpbmc/IDstKQo+ID4gSWYgdGhlIHRvb2xpbmcgYnJlYWtzIHRoZSBy
dWxlcywgcGVyaGFwcyB0aGUgdG9vbGluZyBzaG91bGQgYmUgZml4ZWQ/Cj4KPiBXZSd2ZSBiZWVu
IHVzaW5nIGRpbSBmb3IgbW9yZSB0aGFuIDUgeWVhcnMuIEl0IGRvZXNuJ3Qgc2VlbSB0byB3b3Jr
IHRvbyBiYWQ/CgpJIGRvbid0IGtub3cgYW55dGhpbmcgYWJvdXQgZGltLCBzbyBJIGNhbm5vdCBj
b21taXQgb24gdGhhdC4KCj4gQW5kIGl0IGRvZXMgZmVlbCBsaWtlIHRoZSBnb2FscG9zdHMgYXJl
IG1vdmluZyB0aGVyZTogdGhlIGRpc2N1c3Npb24KPiBzdGFydGVkIGJ5ICJ5b3Ugc2hvdWxkbid0
IHJlYmFzZSBhIHRyZWUiIGFuZCBpcyBub3cgYXQgInBhdGNoZXMgc2hvdWxkCj4gbmV2ZXIgYmUg
aW4gYSBuZXh0IGJyYW5jaCBpZiB0aGV5IGNhbid0IHJlYWNoIHRoZSBuZXh0IG1lcmdlIHdpbmRv
dywKPiBldmVuIHRob3VnaCBpdCdzIG5vdCBhcHBhcmVudCB5ZXQiCgpUaGVyZSBpcyBubyBzdWNo
IGFudGktcmViYXNpbmcgcnVsZSBmb3IgbGludXgtbmV4dC4KU29tZSBicmFuY2hlcyBhbmQgc29t
ZSBzdWJzeXN0ZW1zIGRvIGhhdmUgYSBub24tcmViYXNpbmcgcnVsZSwKYnV0IHRoYXQncyBub3Qg
YXBwbGljYWJsZSBoZXJlLCBBRkFJVS4KCkJlc2lkZXMsIHdvbid0IHlvdSBoYXZlIHRvIHJlYmFz
ZSB0aGUgcmVtYWluaW5nIGNvbW1pdHMgZnJvbQpkcm0tbWlzYy1uZXh0IG9uIHRvcCBvZiB2Ni41
LXJjMSBhbnl3YXkgbGF0ZXI/Cgo+IEJ1dCB5ZWFoLCBJIG5vdyB0aGF0IGNvbXBsYWluaW5nIGFi
b3V0IGhvdyBtdWNoIGRybS1taXNjIHN1Y2tzIGlzIGZ1bgo+IGFuZCBhbGwsIGJ1dCBpdCdzIHN0
aWxsIG5vdCBjbGVhciB0byBtZSB3aGF0IGEgcG90ZW50aWFsIHNvbHV0aW9uIHRvCj4gdGhpcyB3
b3VsZCBiZT8KCkknbSBzbyBnbGFkIEknbSBub3QgdGhlIG9uZSBtYWtpbmcgcGVyc29uYWwgYXR0
YWNrcyBvbiBkcm0tbWlzYyA7LSkKCj4gS25vd2luZyB0aGF0IHdlIGNhbid0IHJlYmFzZSBvciBj
bG9zZSBkcm0tbWlzYy1uZXh0LCBhbmQgdGhhdCBpdCBzaG91bGQKPiBiZSBhdXRvbWF0ZWQgaW4g
ZGltIHNvbWVob3csIHdoYXQgd291bGQgdGhhdCBmaXggYmU/CgpBZ2FpbiwgSSBkb24ndCBrbm93
IHdoYXQgZGltIGRvZXMuCkJ1dCBJIHRoaW5rIHRoZSBzb2x1dGlvbiBpbnZvbHZlcyBub3QgbWVy
Z2luZyBhbnl0aGluZyBpbiBkcm0tbmV4dAppZiB0aGVyZSBpcyByZWFzb24gdG8gYmVsaWV2ZSBp
dCB3b24ndCBtYWtlIHRoZSBuZXh0IG1lcmdlIHdpbmRvdwooaW4gdGhpcyBjYXNlOiB3aGVuIGl0
IGlzIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCBhZnRlciB0aGUgY3V0LW9mZiBwb2ludCkuCgpQ
ZXJzb25hbGx5LCBJIHVzZSBmb28tZm9yLXZYLlkgYnJhbmNoZXMuICBEZXNwaXRlIHNvbWUgb2Yg
bXkKZm9vLWZvci12Ni42IGJyYW5jaGVzIGFscmVhZHkgaGF2aW5nIG5ldyBjb21taXRzLCBJIGp1
c3QgaG9sZCBvZmYKbWVyZ2luZyBhbnkgb2YgdGhlbSBpbiBhIGZvci1uZXh0IGJyYW5jaCB1bnRp
bCBhZnRlciB2Ni41LXJjMS4KClRoYW5rcyEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
