Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313373425C
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Jun 2023 18:59:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFFC9C6A610;
	Sat, 17 Jun 2023 16:59:44 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E5CBC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 16:59:43 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2b45b6adffbso22118901fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 09:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687021182; x=1689613182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IIAlmExRE6EbIYR/X1OU/hkRy+rZ5PC7Pr91ssHegm8=;
 b=TAjunu1siTnyyfzaiJAU94sufiP5SEJ+8kouzpEUW+ulNwi1T+If/JXo0W+s6iEm/i
 DJGFbjCHC8iJa30O+ETffd0Kf9EcYsVyAtgOKUan1uggxL0BuPshd/4o+VnNhSuiFmig
 jyHbIxnGprKqnXlY+gHLR7HFrYjzEeFAvX3W8MQXoJHN1+Q/Mjum7CLHOCl0UoV5FlBD
 +8CTHPPkIHOsyYqp0l8JW1NT9uPNFEKc+dLA/UHoQRDCxzJzv2x1YVTbaUT31tZXxp+a
 hshmAOeguVqahNGutC1ZTclgozqlOFD0t5APNWXzwd2xmYoFby48XvdIC1lDrIh9CtwA
 vE6w==
X-Gm-Message-State: AC+VfDzHEl2UrwEYErHlTHsHKPrxsJnK0lb4DmQSLtIW7MdMNhuri3oF
 F8pnoGRc/wrCYljNKayPY6NUNPyQ9duuVivVc5c=
X-Google-Smtp-Source: ACHHUZ7XLXdoMaZnZhhFBbFhsjbzH778mXDrsbaLX+2HmENOJFrXp3RF3YFgkuzaNjMH5X8p4E2TNA==
X-Received: by 2002:a2e:9789:0:b0:2b4:5b65:c904 with SMTP id
 y9-20020a2e9789000000b002b45b65c904mr2908388lji.52.1687021182073; 
 Sat, 17 Jun 2023 09:59:42 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 y5-20020a2e95c5000000b002b3204fdd78sm3363823ljh.140.2023.06.17.09.59.41
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jun 2023 09:59:41 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2b45b6adffbso22118681fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 09:59:41 -0700 (PDT)
X-Received: by 2002:a2e:9896:0:b0:2ad:8380:770d with SMTP id
 b22-20020a2e9896000000b002ad8380770dmr3881903ljj.21.1687020704207; Sat, 17
 Jun 2023 09:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
In-Reply-To: <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Jun 2023 00:51:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v676WBuHeN5cLNZEF0FHRu=jsNhVxN50pnZCMbqGFPYmLw@mail.gmail.com>
Message-ID: <CAGb2v676WBuHeN5cLNZEF0FHRu=jsNhVxN50pnZCMbqGFPYmLw@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Raymond Tan <raymond.tan@intel.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>,
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
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Rahul T R <r-ravikumar@ti.com>, Jani Nikula <jani.nikula@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org,
 Yuan Can <yuancan@huawei.com>, Inki Dae <inki.dae@samsung.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Wang Jianzheng <wangjianzheng@vivo.com>, Maxime Ripard <mripard@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Brian Starkey <brian.starkey@arm.com>, Karol Herbst <kherbst@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stefan Agner <stefan@agner.ch>, Michal Simek <michal.simek@xilinx.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gU3VuLCBKdW4gMTgsIDIwMjMgYXQgMTI6MTPigK9BTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IFtleHBhbmRpbmcgcmVjaXBl
bnRzIGJ5IHRoZSBvdGhlciBhZmZlY3RlZCBwZXJzb25zXQo+Cj4gT24gVGh1LCBKdW4gMDgsIDIw
MjMgYXQgMDk6MDg6MTVBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3cm90ZToKPiA+IE9uIFRodSwg
SnVuIDEsIDIwMjMgYXQgODo0MOKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnCj4gPiA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ID4KPiA+ID4gSGVsbG8sCj4gPiA+Cj4g
PiA+IE9uIFN1biwgTWF5IDA3LCAyMDIzIGF0IDA2OjI1OjIzUE0gKzAyMDAsIFV3ZSBLbGVpbmUt
S8O2bmlnIHdyb3RlOgo+ID4gPiA+IHRoaXMgcGF0Y2ggc2VyaWVzIGFkYXB0cyB0aGUgcGxhdGZv
cm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL2dwdS9kcm0KPiA+ID4gPiB0byB1c2UgdGhlIC5yZW1v
dmVfbmV3KCkgY2FsbGJhY2suIENvbXBhcmVkIHRvIHRoZSB0cmFkaXRpb25hbCAucmVtb3ZlKCkK
PiA+ID4gPiBjYWxsYmFjayAucmVtb3ZlX25ldygpIHJldHVybnMgbm8gdmFsdWUuIFRoaXMgaXMg
YSBnb29kIHRoaW5nIGJlY2F1c2UKPiA+ID4gPiB0aGUgZHJpdmVyIGNvcmUgZG9lc24ndCAoYW5k
IGNhbm5vdCkgY29wZSBmb3IgZXJyb3JzIGR1cmluZyByZW1vdmUuIFRoZQo+ID4gPiA+IG9ubHkg
ZWZmZWN0IG9mIGEgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGluIC5yZW1vdmUoKSBpcyB0aGF0IHRo
ZSBkcml2ZXIKPiA+ID4gPiBjb3JlIGVtaXRzIGEgd2FybmluZy4gVGhlIGRldmljZSBpcyByZW1v
dmVkIGFueWhvdyBhbmQgYW4gZWFybHkgcmV0dXJuCj4gPiA+ID4gZnJvbSAucmVtb3ZlKCkgdXN1
YWxseSB5aWVsZHMgYSByZXNvdXJjZSBsZWFrLgo+ID4gPiA+Cj4gPiA+ID4gQnkgY2hhbmdpbmcg
dGhlIHJlbW92ZSBjYWxsYmFjayB0byByZXR1cm4gdm9pZCBkcml2ZXIgYXV0aG9ycyBjYW5ub3QK
PiA+ID4gPiByZWFzb25hYmx5IChidXQgd3JvbmdseSkgYXNzdW1lIGFueSBtb3JlIHRoYXQgdGhl
cmUgaGFwcGVucyBzb21lIGtpbmQgb2YKPiA+ID4gPiBjbGVhbnVwIGxhdGVyLgo+ID4gPgo+ID4g
PiBJIHdvbmRlciBpZiBzb21lb25lIHdvdWxkIHZvbHVudGVlciB0byBhZGQgdGhlIHdob2xlIHNl
cmllcyB0bwo+ID4gPiBkcm0tbWlzYy1uZXh0PyEKPiA+Cj4gPiBJdCBsb29rcyBhcyBpZiBOZWls
IGFwcGxpZWQgcXVpdGUgYSBmZXcgb2YgdGhlbSBhbHJlYWR5LCBzbyBJIGxvb2tlZAo+ID4gYXQg
d2hhdCB3YXMgbGVmdC4uLgo+ID4KPiA+IEknbSBhIGxpdHRsZSBoZXNpdGFudCB0byBqdXN0IGFw
cGx5IHRoZSB3aG9sZSBraXQtYW5kLWNhYm9vZGxlIHRvCj4gPiBkcm0tbWlzYy1uZXh0IHNpbmNl
IHRoZXJlIGFyZSBzcGVjaWZpYyBEUk0gdHJlZXMgZm9yIGEgYnVuY2ggb2YgdGhlbQo+ID4gYW5k
IGl0IHdvdWxkIGJlIGJldHRlciBpZiB0aGV5IGxhbmRlZCB0aGVyZS4gLi4uc28gSSB3ZW50IHRo
cm91Z2ggYWxsCj4gPiB0aGUgcGF0Y2hlcyB0aGF0IHN0aWxsIGFwcGxpZWQgdG8gZHJtLW1pc2Mt
bmV4dCwgdGhlbiB1c2VkCj4gPiAnc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtLXNjbScgdG8g
Y2hlY2sgaWYgdGhleSB3ZXJlIG1haW50YWluZWQKPiA+IHRocm91Z2ggZHJtLW1pc2MuIFRoYXQg
c3RpbGwgbGVmdCBxdWl0ZSBhIGZldyBwYXRjaGVzLiBJJ3ZlIGFwcGxpZWQKPiA+IHRob3NlIG9u
ZXMgYW5kIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0Ogo+ID4KPiA+IDcxNzIyNjg1Y2QxNyBkcm0v
eGxueC96eW5xbXBfZHBzdWI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlCj4gPiBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZAo+ID4gMWVkNTRhMTlmM2IzIGRybS92YzQ6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPiBiOTU3ODEyODM5ZjggZHJt
L3YzZDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQK
PiA+IGUyZmQzMTkyZTI2NyBkcm0vdHZlMjAwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4gODRlNmRhN2FkNTUzIGRybS90aW55OiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4gMzRjZGQxZjY5
MWFkIGRybS90aWRzczogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nIHZvaWQKPiA+IGQ2NjVlM2M5ZDM3YSBkcm0vc3VuNGk6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPiAwYzI1OWFiMTkxNDYgZHJtL3N0bTog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+IDlh
ODY1ZTQ1ODg0YSBkcm0vc3RpOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBy
ZXR1cm5pbmcgdm9pZAo+ID4gM2M4NTU2MTA4NDBlIGRybS9yb2NrY2hpcDogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+IGU0MTk3N2E4M2I3MSBk
cm0vcGFuZnJvc3Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCj4gPiBjZWYzNzc2ZDBiNWEgZHJtL3BhbmVsOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4gYmQyOTZhNTk0ZTg3IGRybS9teHNmYjog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+IDM4
Y2EyZDkzZDMyMyBkcm0vbWVzb246IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCj4gPiBmZDE0NTdkODRiYWUgZHJtL21jZGU6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPiA0MWE1NmExODYxNWMgZHJt
L2xvZ2ljdmM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCj4gPiA5ODBlYzY0NDQzNzIgZHJtL2xpbWE6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPiA4MmEyYzBjYzFhMjIgZHJtL2hpc2lsaWNvbjog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+IGMz
YjI4YjI5YWMwYSBkcm0vZnNsLWRjdTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKPiA+IGExMThmYzZlNzFmOSBkcm0vYXRtZWwtaGxjZGM6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPiA5YTMyZGQz
MjRjNDYgZHJtL2FzcGVlZDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKPiA+IDJjN2QyOTFjNDk4YyBkcm0vYXJtL21hbGlkcDogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+IGE5MjAwMjhkZjY3OSBk
cm0vYXJtL2hkbGNkOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAo+ID4gMWJmM2Q3NmE3ZDE1IGRybS9rb21lZGE6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4KPiBUb2dldGhlciB3aXRoIHRoZSBwYXRj
aGVzIHRoYXQgd2VyZSBhcHBsaWVkIGxhdGVyIHRoZSB0b3Btb3N0IGNvbW1pdAo+IGZyb20gdGhp
cyBzZXJpZXMgaXMgYzI4MDdlY2I1MjkwICgiZHJtL29tYXA6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlCj4gY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQiKS4gVGhpcyBjb21taXQgd2FzIHBhcnQg
Zm9yIHRoZSBmb2xsb3dpbmcgbmV4dAo+IHRhZ3M6Cj4KPiAgICAgICAgICQgZ2l0IHRhZyAtbCAt
LWNvbnRhaW5zIGMyODA3ZWNiNTI5MAo+ICAgICAgICAgbmV4dC0yMDIzMDYwOQo+ICAgICAgICAg
bmV4dC0yMDIzMDYxMwo+ICAgICAgICAgbmV4dC0yMDIzMDYxNAo+ICAgICAgICAgbmV4dC0yMDIz
MDYxNQo+Cj4gSG93ZXZlciBpbiBuZXh0LTIwMjMwNjE2IHRoZXkgYXJlIG1pc3NpbmcuIEluIG5l
eHQtMjAyMzA2MTYKPiBkcm0tbWlzYy9mb3ItbGludXgtbmV4dCB3YXMgY2Y2ODNlODg3MGJkNGJl
MGZkNmI5ODYzOTI4NjcwMGEzNTA4ODY2MC4KPiBDb21wYXJlZCB0byBjMjgwN2VjYjUyOTAgdGhp
cyBhZGRzIDExNDkgcGF0Y2hlcyBidXQgZHJvcHMgMzcgKHRoYXQgYXJlCj4gYWxzbyBub3QgaW5j
bHVkZWQgd2l0aCBhIGRpZmZlcmVudCBjb21taXQgaWQpLiBUaGUgMzcgcGF0Y2hlcyBkcm9wcGVk
Cj4gYXJlIDEzY2RkMTJhOWY5MzQxNThmNGVjODE3Y2YwNDhmY2I0Mzg0YWE5ZGMuLmMyODA3ZWNi
NTI5MDoKPgo+ICAgICAgICAgJCBnaXQgc2hvcnRsb2cgLXMgMTNjZGQxMmE5ZjkzNDE1OGY0ZWM4
MTdjZjA0OGZjYjQzODRhYTlkYy4uYzI4MDdlY2I1MjkwCj4gICAgICAgICAgICAgIDEgIENocmlz
dG9waGUgSkFJTExFVAo+ICAgICAgICAgICAgICAyICBKZXNzaWNhIFpoYW5nCj4gICAgICAgICAg
ICAgIDUgIEthcm9sIFdhY2hvd3NraQo+ICAgICAgICAgICAgICAxICBMYXVyYSBOYW8KPiAgICAg
ICAgICAgICAyNyAgVXdlIEtsZWluZS1Lw7ZuaWcKPiAgICAgICAgICAgICAgMSAgV2FuZyBKaWFu
emhlbmcKPgo+Cj4gSSBndWVzcyB0aGlzIHdhcyBkb25lIGJ5IG1pc3Rha2UgYmVjYXVzZSBub2Jv
ZHkgdG9sZCBtZSBhYm91dCBkcm9wcGluZwo+IG15L3RoZXNlIHBhdGNoZXM/IENhbiBjMjgwN2Vj
YjUyOTAgcGxlYXNlIGJlIG1lcmdlZCBpbnRvIGRybS1taXNjLW5leHQKPiBhZ2Fpbj8KCkFGQUlL
IGRybS1taXNjL2Zvci1saW51eC1uZXh0IGN1dHMgb2ZmIGF0IC1yYzYsIGF0IHdoaWNoIHBvaW50
IGFueSBwYXRjaGVzCm1lcmdlZCBnZXQgcXVldWVkIHVwIGZvciAtbmV4dC1uZXh0LiBJIHRoaW5r
IHRoYXQncyB3aGF0IGhhcHBlbmVkIHRvIHlvdXIKcGF0Y2hlcz8KCgpDaGVuWXUKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
