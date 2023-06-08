Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E0728623
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jun 2023 19:19:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D58CC65E70;
	Thu,  8 Jun 2023 17:19:19 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28FB3C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 17:19:18 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 869151424;
 Thu,  8 Jun 2023 19:18:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686244727;
 bh=QCp8g9xbRRzi5prPR0P8JsS2fOCtTw24NgdzRtNAQkA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ivurqXuacySqj7S5bBj29CW1kOJEhzPVX1wUbbe7JjGtmaeDnNDrp9ES7xz5sou7/
 9SxWEvF253nRIvAd0xO3RIxe1NHh8UBjYsr6TpHlRJXbv0I3E64FJ/IqZp0bSQeO4O
 iBcyUJnbVzHVylvQf0/AKIbigSnsRT2cigQiHQWY=
Message-ID: <2b8ccac8-2828-1279-93aa-a601d8d72e43@ideasonboard.com>
Date: Thu, 8 Jun 2023 20:19:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Doug Anderson <dianders@chromium.org>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230608162642.GA23400@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230608162642.GA23400@pendragon.ideasonboard.com>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
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
 Orson Zhai <orsonzhai@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Guo Zhengkui <guozhengkui@vivo.com>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDgvMDYvMjAyMyAxOToyNiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBEb3VnLAo+
IAo+IE9uIFRodSwgSnVuIDA4LCAyMDIzIGF0IDA5OjA4OjE1QU0gLTA3MDAsIERvdWcgQW5kZXJz
b24gd3JvdGU6Cj4+IE9uIFRodSwgSnVuIDEsIDIwMjMgYXQgODo0MOKAr0FNIFV3ZSBLbGVpbmUt
S8O2bmlnIHdyb3RlOgo+Pj4gT24gU3VuLCBNYXkgMDcsIDIwMjMgYXQgMDY6MjU6MjNQTSArMDIw
MCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+Pj4gdGhpcyBwYXRjaCBzZXJpZXMgYWRhcHRz
IHRoZSBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRyaXZlcnMvZ3B1L2RybQo+Pj4+IHRvIHVzZSB0
aGUgLnJlbW92ZV9uZXcoKSBjYWxsYmFjay4gQ29tcGFyZWQgdG8gdGhlIHRyYWRpdGlvbmFsIC5y
ZW1vdmUoKQo+Pj4+IGNhbGxiYWNrIC5yZW1vdmVfbmV3KCkgcmV0dXJucyBubyB2YWx1ZS4gVGhp
cyBpcyBhIGdvb2QgdGhpbmcgYmVjYXVzZQo+Pj4+IHRoZSBkcml2ZXIgY29yZSBkb2Vzbid0IChh
bmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMgZHVyaW5nIHJlbW92ZS4gVGhlCj4+Pj4gb25seSBl
ZmZlY3Qgb2YgYSBub24temVybyByZXR1cm4gdmFsdWUgaW4gLnJlbW92ZSgpIGlzIHRoYXQgdGhl
IGRyaXZlcgo+Pj4+IGNvcmUgZW1pdHMgYSB3YXJuaW5nLiBUaGUgZGV2aWNlIGlzIHJlbW92ZWQg
YW55aG93IGFuZCBhbiBlYXJseSByZXR1cm4KPj4+PiBmcm9tIC5yZW1vdmUoKSB1c3VhbGx5IHlp
ZWxkcyBhIHJlc291cmNlIGxlYWsuCj4+Pj4KPj4+PiBCeSBjaGFuZ2luZyB0aGUgcmVtb3ZlIGNh
bGxiYWNrIHRvIHJldHVybiB2b2lkIGRyaXZlciBhdXRob3JzIGNhbm5vdAo+Pj4+IHJlYXNvbmFi
bHkgKGJ1dCB3cm9uZ2x5KSBhc3N1bWUgYW55IG1vcmUgdGhhdCB0aGVyZSBoYXBwZW5zIHNvbWUg
a2luZCBvZgo+Pj4+IGNsZWFudXAgbGF0ZXIuCj4+Pgo+Pj4gSSB3b25kZXIgaWYgc29tZW9uZSB3
b3VsZCB2b2x1bnRlZXIgdG8gYWRkIHRoZSB3aG9sZSBzZXJpZXMgdG8KPj4+IGRybS1taXNjLW5l
eHQ/IQo+Pgo+PiBJdCBsb29rcyBhcyBpZiBOZWlsIGFwcGxpZWQgcXVpdGUgYSBmZXcgb2YgdGhl
bSBhbHJlYWR5LCBzbyBJIGxvb2tlZAo+PiBhdCB3aGF0IHdhcyBsZWZ0Li4uCj4+Cj4+IEknbSBh
IGxpdHRsZSBoZXNpdGFudCB0byBqdXN0IGFwcGx5IHRoZSB3aG9sZSBraXQtYW5kLWNhYm9vZGxl
IHRvCj4+IGRybS1taXNjLW5leHQgc2luY2UgdGhlcmUgYXJlIHNwZWNpZmljIERSTSB0cmVlcyBm
b3IgYSBidW5jaCBvZiB0aGVtCj4+IGFuZCBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhleSBsYW5k
ZWQgdGhlcmUuIC4uLnNvIEkgd2VudCB0aHJvdWdoIGFsbAo+PiB0aGUgcGF0Y2hlcyB0aGF0IHN0
aWxsIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCwgdGhlbiB1c2VkCj4+ICdzY3JpcHRzL2dldF9t
YWludGFpbmVyLnBsIC0tc2NtJyB0byBjaGVjayBpZiB0aGV5IHdlcmUgbWFpbnRhaW5lZAo+PiB0
aHJvdWdoIGRybS1taXNjLiBUaGF0IHN0aWxsIGxlZnQgcXVpdGUgYSBmZXcgcGF0Y2hlcy4gSSd2
ZSBhcHBsaWVkCj4+IHRob3NlIG9uZXMgYW5kIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0Ogo+Pgo+
PiA3MTcyMjY4NWNkMTcgZHJtL3hsbngvenlucW1wX2Rwc3ViOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZQo+PiBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+PiAxZWQ1NGExOWYzYjMgZHJtL3Zj
NDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPj4g
Yjk1NzgxMjgzOWY4IGRybS92M2Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCj4+IGUyZmQzMTkyZTI2NyBkcm0vdHZlMjAwOiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+PiA4NGU2ZGE3YWQ1NTMgZHJt
L3Rpbnk6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lk
Cj4+IDM0Y2RkMWY2OTFhZCBkcm0vdGlkc3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCj4+IGQ2NjVlM2M5ZDM3YSBkcm0vc3VuNGk6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4+IDBjMjU5YWIxOTE0
NiBkcm0vc3RtOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAo+PiA5YTg2NWU0NTg4NGEgZHJtL3N0aTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPj4gM2M4NTU2MTA4NDBlIGRybS9yb2NrY2hpcDogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPj4gZTQxOTc3
YTgzYjcxIGRybS9wYW5mcm9zdDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKPj4gY2VmMzc3NmQwYjVhIGRybS9wYW5lbDogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPj4gYmQyOTZhNTk0ZTg3IGRybS9t
eHNmYjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQK
Pj4gMzhjYTJkOTNkMzIzIGRybS9tZXNvbjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKPj4gZmQxNDU3ZDg0YmFlIGRybS9tY2RlOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+PiA0MWE1NmExODYxNWMg
ZHJtL2xvZ2ljdmM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCj4+IDk4MGVjNjQ0NDM3MiBkcm0vbGltYTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPj4gODJhMmMwY2MxYTIyIGRybS9oaXNpbGljb246
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4+IGMz
YjI4YjI5YWMwYSBkcm0vZnNsLWRjdTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKPj4gYTExOGZjNmU3MWY5IGRybS9hdG1lbC1obGNkYzogQ29udmVy
dCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPj4gOWEzMmRkMzI0
YzQ2IGRybS9hc3BlZWQ6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCj4+IDJjN2QyOTFjNDk4YyBkcm0vYXJtL21hbGlkcDogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPj4gYTkyMDAyOGRmNjc5IGRybS9h
cm0vaGRsY2Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCj4+IDFiZjNkNzZhN2QxNSBkcm0va29tZWRhOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+Pgo+PiBUaGUgZm9sbG93aW5nIG9uZXMgYXBwZWFy
ZWQgdG8gYXBwbHkgdG8gdGhlIHRvcCBvZiBkcm0tbWlzYy1uZXh0LCBidXQKPj4gSSBkaWRuJ3Qg
YXBwbHkgdGhlbSBzaW5jZSBnZXRfbWFpbnRhaW5lciBkaWRuJ3Qgc2F5IHRoZXkgd2VyZSBwYXJ0
IG9mCj4+IGRybS1taXNjLW5leHQ6Cj4+Cj4+IGRybS90aW55OiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+PiBkcm0vdGlsY2RjOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+PiBkcm0vc3ByZDogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPj4gZHJtL3No
bW9iaWxlOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAo+PiBkcm0vcmNhci1kdTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKPiAKPiBJZiB5b3UgZG9uJ3QgbWluZCwgY291bGQgeW91IHRha2UgdGhlIHJj
YXItZHUgcGF0Y2ggdGhyb3VnaCBkcm0tbWlzYyB0b28KPiA/IEkgZG9uJ3QgcGxhbiB0byBzZW5k
IGFub3RoZXIgcHVsbCByZXF1ZXN0IGZvciB2Ni41Lgo+IAo+PiBkcm0vb21hcDogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAKPiBUb21pLCBzaG91
bGQgZHJtL29tYXAgbW92ZWQgdG8gYmVpbmcgbWFpbnRhaW5lZCB0aHJvdWdoIGRybS1taXNjID8K
Clllcy4gdGlsY2RjLCB0aWRzcyBhbmQgb21hcGRybSBhcmUgYWxsIG1haW50YWluZWQgdGhyb3Vn
aCBkcm0tbWlzYy4gQnV0IApJIGd1ZXNzIEkgbmVlZCB0byBhZGQgc29tZXRoaW5nIHRvIHRoZSBN
QUlOVEFJTkVSUyB0byBtYWtlIHRoaXMgY2xlYXIuIApJJ2xsIGxvb2sgYXQgaXQuCgogIFRvbWkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
