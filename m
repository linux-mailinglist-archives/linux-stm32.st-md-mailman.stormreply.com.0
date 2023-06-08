Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1F7284E6
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jun 2023 18:26:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2252DC65E70;
	Thu,  8 Jun 2023 16:26:50 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9147BC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 16:26:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126033089000.35.openmobile.ne.jp
 [126.33.89.0])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD6FF7C;
 Thu,  8 Jun 2023 18:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686241579;
 bh=9rruNaQgl/oQBE2oLPlmpO6slCgdtIRvea2nyNzPSZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LLXEiASpvCS+K6TnETZR+gAVntREVUQlWqSFAEd8t5iunYhMtLxUDYZ7ZD4AjpFdD
 n9hRLmIFvh9Nfrccon6V6aV4cRl+tSQCd+S/RISk+hv5rWicoVYu0qcAItyObwwlvE
 dO+yQN68ltwo5R0MgrqYlmfk5q+3Kvczr50XtQSw=
Date: Thu, 8 Jun 2023 19:26:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20230608162642.GA23400@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
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
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Miaoqian Lin <linmq006@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Michal Simek <michal.simek@xilinx.com>, linux-tegra@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh@kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liu Shixin <liushixin2@huawei.com>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Yongqin Liu <yongqin.liu@linaro.org>, Jayshri Pawar <jpawar@cadence.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Clark <robdclark@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgRG91ZywKCk9uIFRodSwgSnVuIDA4LCAyMDIzIGF0IDA5OjA4OjE1QU0gLTA3MDAsIERvdWcg
QW5kZXJzb24gd3JvdGU6Cj4gT24gVGh1LCBKdW4gMSwgMjAyMyBhdCA4OjQw4oCvQU0gVXdlIEts
ZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiBPbiBTdW4sIE1heSAwNywgMjAyMyBhdCAwNjoyNToyM1BN
ICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gdGhpcyBwYXRjaCBzZXJpZXMg
YWRhcHRzIHRoZSBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRyaXZlcnMvZ3B1L2RybQo+ID4gPiB0
byB1c2UgdGhlIC5yZW1vdmVfbmV3KCkgY2FsbGJhY2suIENvbXBhcmVkIHRvIHRoZSB0cmFkaXRp
b25hbCAucmVtb3ZlKCkKPiA+ID4gY2FsbGJhY2sgLnJlbW92ZV9uZXcoKSByZXR1cm5zIG5vIHZh
bHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlCj4gPiA+IHRoZSBkcml2ZXIgY29yZSBk
b2Vzbid0IChhbmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMgZHVyaW5nIHJlbW92ZS4gVGhlCj4g
PiA+IG9ubHkgZWZmZWN0IG9mIGEgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGluIC5yZW1vdmUoKSBp
cyB0aGF0IHRoZSBkcml2ZXIKPiA+ID4gY29yZSBlbWl0cyBhIHdhcm5pbmcuIFRoZSBkZXZpY2Ug
aXMgcmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybgo+ID4gPiBmcm9tIC5yZW1vdmUo
KSB1c3VhbGx5IHlpZWxkcyBhIHJlc291cmNlIGxlYWsuCj4gPiA+Cj4gPiA+IEJ5IGNoYW5naW5n
IHRoZSByZW1vdmUgY2FsbGJhY2sgdG8gcmV0dXJuIHZvaWQgZHJpdmVyIGF1dGhvcnMgY2Fubm90
Cj4gPiA+IHJlYXNvbmFibHkgKGJ1dCB3cm9uZ2x5KSBhc3N1bWUgYW55IG1vcmUgdGhhdCB0aGVy
ZSBoYXBwZW5zIHNvbWUga2luZCBvZgo+ID4gPiBjbGVhbnVwIGxhdGVyLgo+ID4KPiA+IEkgd29u
ZGVyIGlmIHNvbWVvbmUgd291bGQgdm9sdW50ZWVyIHRvIGFkZCB0aGUgd2hvbGUgc2VyaWVzIHRv
Cj4gPiBkcm0tbWlzYy1uZXh0PyEKPiAKPiBJdCBsb29rcyBhcyBpZiBOZWlsIGFwcGxpZWQgcXVp
dGUgYSBmZXcgb2YgdGhlbSBhbHJlYWR5LCBzbyBJIGxvb2tlZAo+IGF0IHdoYXQgd2FzIGxlZnQu
Li4KPiAKPiBJJ20gYSBsaXR0bGUgaGVzaXRhbnQgdG8ganVzdCBhcHBseSB0aGUgd2hvbGUga2l0
LWFuZC1jYWJvb2RsZSB0bwo+IGRybS1taXNjLW5leHQgc2luY2UgdGhlcmUgYXJlIHNwZWNpZmlj
IERSTSB0cmVlcyBmb3IgYSBidW5jaCBvZiB0aGVtCj4gYW5kIGl0IHdvdWxkIGJlIGJldHRlciBp
ZiB0aGV5IGxhbmRlZCB0aGVyZS4gLi4uc28gSSB3ZW50IHRocm91Z2ggYWxsCj4gdGhlIHBhdGNo
ZXMgdGhhdCBzdGlsbCBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQsIHRoZW4gdXNlZAo+ICdzY3Jp
cHRzL2dldF9tYWludGFpbmVyLnBsIC0tc2NtJyB0byBjaGVjayBpZiB0aGV5IHdlcmUgbWFpbnRh
aW5lZAo+IHRocm91Z2ggZHJtLW1pc2MuIFRoYXQgc3RpbGwgbGVmdCBxdWl0ZSBhIGZldyBwYXRj
aGVzLiBJJ3ZlIGFwcGxpZWQKPiB0aG9zZSBvbmVzIGFuZCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4
dDoKPiAKPiA3MTcyMjY4NWNkMTcgZHJtL3hsbngvenlucW1wX2Rwc3ViOiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZQo+IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gMWVkNTRhMTlmM2IzIGRy
bS92YzQ6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lk
Cj4gYjk1NzgxMjgzOWY4IGRybS92M2Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCj4gZTJmZDMxOTJlMjY3IGRybS90dmUyMDA6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gODRlNmRhN2FkNTUzIGRy
bS90aW55OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAo+IDM0Y2RkMWY2OTFhZCBkcm0vdGlkc3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCj4gZDY2NWUzYzlkMzdhIGRybS9zdW40aTogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAwYzI1OWFiMTkxNDYg
ZHJtL3N0bTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKPiA5YTg2NWU0NTg4NGEgZHJtL3N0aTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAzYzg1NTYxMDg0MGUgZHJtL3JvY2tjaGlwOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+IGU0MTk3N2E4M2I3
MSBkcm0vcGFuZnJvc3Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCj4gY2VmMzc3NmQwYjVhIGRybS9wYW5lbDogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiBiZDI5NmE1OTRlODcgZHJtL214c2ZiOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+IDM4Y2Ey
ZDkzZDMyMyBkcm0vbWVzb246IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkCj4gZmQxNDU3ZDg0YmFlIGRybS9tY2RlOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+IDQxYTU2YTE4NjE1YyBkcm0vbG9naWN2
YzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA5
ODBlYzY0NDQzNzIgZHJtL2xpbWE6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCj4gODJhMmMwY2MxYTIyIGRybS9oaXNpbGljb246IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gYzNiMjhiMjlhYzBhIGRy
bS9mc2wtZGN1OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAo+IGExMThmYzZlNzFmOSBkcm0vYXRtZWwtaGxjZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gOWEzMmRkMzI0YzQ2IGRybS9hc3BlZWQ6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gMmM3
ZDI5MWM0OThjIGRybS9hcm0vbWFsaWRwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZAo+IGE5MjAwMjhkZjY3OSBkcm0vYXJtL2hkbGNkOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+IDFiZjNkNzZhN2Qx
NSBkcm0va29tZWRhOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAo+IAo+IFRoZSBmb2xsb3dpbmcgb25lcyBhcHBlYXJlZCB0byBhcHBseSB0byB0aGUg
dG9wIG9mIGRybS1taXNjLW5leHQsIGJ1dAo+IEkgZGlkbid0IGFwcGx5IHRoZW0gc2luY2UgZ2V0
X21haW50YWluZXIgZGlkbid0IHNheSB0aGV5IHdlcmUgcGFydCBvZgo+IGRybS1taXNjLW5leHQ6
Cj4gCj4gZHJtL3Rpbnk6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCj4gZHJtL3RpbGNkYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKPiBkcm0vc3ByZDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiBkcm0vc2htb2JpbGU6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gZHJtL3JjYXItZHU6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgpJZiB5b3UgZG9uJ3Qg
bWluZCwgY291bGQgeW91IHRha2UgdGhlIHJjYXItZHUgcGF0Y2ggdGhyb3VnaCBkcm0tbWlzYyB0
b28KPyBJIGRvbid0IHBsYW4gdG8gc2VuZCBhbm90aGVyIHB1bGwgcmVxdWVzdCBmb3IgdjYuNS4K
Cj4gZHJtL29tYXA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCgpUb21pLCBzaG91bGQgZHJtL29tYXAgbW92ZWQgdG8gYmVpbmcgbWFpbnRhaW5lZCB0
aHJvdWdoIGRybS1taXNjID8KCj4gZHJtL25vdXZlYXU6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gZHJtL21lZGlhdGVrOiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+IGRybS9rbWI6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gZHJtL2luZ2VuaWM6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gZHJt
L2lteC9pcHV2MzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQKPiBkcm0vaW14L2Rjc3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCj4gZHJtL2V0bmF2aXY6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gZHJtL2FybWFkYTogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQ
aW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
