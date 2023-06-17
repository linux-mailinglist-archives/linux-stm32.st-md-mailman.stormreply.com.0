Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0929F7342DA
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Jun 2023 20:03:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFCC8C6A615;
	Sat, 17 Jun 2023 18:03:50 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBD6EC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 18:03:49 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4f76a223ca5so2483682e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 11:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687025028; x=1689617028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sD3IWEzBGQZ8mcTerhCj4o67e1f5v1lsAPNkuhRyMbk=;
 b=iBgPuYdPcorv7dFfdn3hcfWGLorlWEP1M8M/opE7gMCnigYHlbnDFZEjF22exJ70Ne
 hRTL8wLDxdnYi181ohyya3r++87hv+XKPDdQweqm8xqfEOT1OOsaEbEI38tHcI+APpQY
 FrORCn/esesWebn1w4/TSncfJUm1QELIv/fXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687025028; x=1689617028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sD3IWEzBGQZ8mcTerhCj4o67e1f5v1lsAPNkuhRyMbk=;
 b=INxlU4rpIgl1LDSeNFN34P3s79nVNOM55EK8ZNfenRgJQP10ePsAE3fZlEgtOWhwzR
 3+zSX30+Qvz8OoqABoJ3scai5XO4Qrj3Nr/bsbegoXg6IuaAAYsJsJSXs44ydpL1EsPb
 6Y9e9KtG22j8t5RvDUqIm42NGYBbK/6vkjFDt9MmF0Q3CxYDfoJIwBit55ZALjjttsWe
 JY0QHMqJ+iXhYtwEgCh5iUe7Pbe4jma/83gObyQlUYGF+QEJ5jUM2b/oLDhFZWO/ril9
 HA4QxcAkEqROcDPdOyT5lXZ/ojOboBPOlFH2b5Eri+14sWSSff2Zmcn1oiiLordz+KZl
 x9ZQ==
X-Gm-Message-State: AC+VfDx1aBu2fAnP9q+t6u5Qbk2zLmYz9NS8iG+e+2WX7vV3aUZGW7Pr
 ilcOQPBURBVytAGgLkIu+jlAnn6kenO1bHAiA/MjRYVhUnw=
X-Google-Smtp-Source: ACHHUZ7bSbHjQggio6j8Sx6WgLwi9YiPBxNoSmCCXVAZKRDNTGW+Yw8u57syha2twnk5TFWPPCLyQA==
X-Received: by 2002:a19:f241:0:b0:4f6:5198:652c with SMTP id
 d1-20020a19f241000000b004f65198652cmr2859128lfk.62.1687025028474; 
 Sat, 17 Jun 2023 11:03:48 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 7-20020ac24847000000b004f4cabba7desm3526860lfy.74.2023.06.17.11.03.48
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jun 2023 11:03:48 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-4f58444a410so2030e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 11:03:48 -0700 (PDT)
X-Received: by 2002:a05:600c:444e:b0:3f4:2736:b5eb with SMTP id
 v14-20020a05600c444e00b003f42736b5ebmr491530wmn.1.1687024655682; Sat, 17 Jun
 2023 10:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
In-Reply-To: <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 17 Jun 2023 10:57:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
Message-ID: <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
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
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Liu Shixin <liushixin2@huawei.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgpPbiBTYXQsIEp1biAxNywgMjAyMyBhdCA5OjE14oCvQU0gVXdlIEtsZWluZS1Lw7ZuaWcK
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBbZXhwYW5kaW5nIHJl
Y2lwZW50cyBieSB0aGUgb3RoZXIgYWZmZWN0ZWQgcGVyc29uc10KPgo+IE9uIFRodSwgSnVuIDA4
LCAyMDIzIGF0IDA5OjA4OjE1QU0gLTA3MDAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gPiBPbiBU
aHUsIEp1biAxLCAyMDIzIGF0IDg6NDDigK9BTSBVd2UgS2xlaW5lLUvDtm5pZwo+ID4gPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhlbGxvLAo+ID4g
Pgo+ID4gPiBPbiBTdW4sIE1heSAwNywgMjAyMyBhdCAwNjoyNToyM1BNICswMjAwLCBVd2UgS2xl
aW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gPiB0aGlzIHBhdGNoIHNlcmllcyBhZGFwdHMgdGhlIHBs
YXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9ncHUvZHJtCj4gPiA+ID4gdG8gdXNlIHRoZSAu
cmVtb3ZlX25ldygpIGNhbGxiYWNrLiBDb21wYXJlZCB0byB0aGUgdHJhZGl0aW9uYWwgLnJlbW92
ZSgpCj4gPiA+ID4gY2FsbGJhY2sgLnJlbW92ZV9uZXcoKSByZXR1cm5zIG5vIHZhbHVlLiBUaGlz
IGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlCj4gPiA+ID4gdGhlIGRyaXZlciBjb3JlIGRvZXNuJ3Qg
KGFuZCBjYW5ub3QpIGNvcGUgZm9yIGVycm9ycyBkdXJpbmcgcmVtb3ZlLiBUaGUKPiA+ID4gPiBv
bmx5IGVmZmVjdCBvZiBhIG5vbi16ZXJvIHJldHVybiB2YWx1ZSBpbiAucmVtb3ZlKCkgaXMgdGhh
dCB0aGUgZHJpdmVyCj4gPiA+ID4gY29yZSBlbWl0cyBhIHdhcm5pbmcuIFRoZSBkZXZpY2UgaXMg
cmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybgo+ID4gPiA+IGZyb20gLnJlbW92ZSgp
IHVzdWFsbHkgeWllbGRzIGEgcmVzb3VyY2UgbGVhay4KPiA+ID4gPgo+ID4gPiA+IEJ5IGNoYW5n
aW5nIHRoZSByZW1vdmUgY2FsbGJhY2sgdG8gcmV0dXJuIHZvaWQgZHJpdmVyIGF1dGhvcnMgY2Fu
bm90Cj4gPiA+ID4gcmVhc29uYWJseSAoYnV0IHdyb25nbHkpIGFzc3VtZSBhbnkgbW9yZSB0aGF0
IHRoZXJlIGhhcHBlbnMgc29tZSBraW5kIG9mCj4gPiA+ID4gY2xlYW51cCBsYXRlci4KPiA+ID4K
PiA+ID4gSSB3b25kZXIgaWYgc29tZW9uZSB3b3VsZCB2b2x1bnRlZXIgdG8gYWRkIHRoZSB3aG9s
ZSBzZXJpZXMgdG8KPiA+ID4gZHJtLW1pc2MtbmV4dD8hCj4gPgo+ID4gSXQgbG9va3MgYXMgaWYg
TmVpbCBhcHBsaWVkIHF1aXRlIGEgZmV3IG9mIHRoZW0gYWxyZWFkeSwgc28gSSBsb29rZWQKPiA+
IGF0IHdoYXQgd2FzIGxlZnQuLi4KPiA+Cj4gPiBJJ20gYSBsaXR0bGUgaGVzaXRhbnQgdG8ganVz
dCBhcHBseSB0aGUgd2hvbGUga2l0LWFuZC1jYWJvb2RsZSB0bwo+ID4gZHJtLW1pc2MtbmV4dCBz
aW5jZSB0aGVyZSBhcmUgc3BlY2lmaWMgRFJNIHRyZWVzIGZvciBhIGJ1bmNoIG9mIHRoZW0KPiA+
IGFuZCBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhleSBsYW5kZWQgdGhlcmUuIC4uLnNvIEkgd2Vu
dCB0aHJvdWdoIGFsbAo+ID4gdGhlIHBhdGNoZXMgdGhhdCBzdGlsbCBhcHBsaWVkIHRvIGRybS1t
aXNjLW5leHQsIHRoZW4gdXNlZAo+ID4gJ3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLS1zY20n
IHRvIGNoZWNrIGlmIHRoZXkgd2VyZSBtYWludGFpbmVkCj4gPiB0aHJvdWdoIGRybS1taXNjLiBU
aGF0IHN0aWxsIGxlZnQgcXVpdGUgYSBmZXcgcGF0Y2hlcy4gSSd2ZSBhcHBsaWVkCj4gPiB0aG9z
ZSBvbmVzIGFuZCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dDoKPiA+Cj4gPiA3MTcyMjY4NWNkMTcg
ZHJtL3hsbngvenlucW1wX2Rwc3ViOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZQo+ID4gY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+IDFlZDU0YTE5ZjNiMyBkcm0vdmM0OiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4gYjk1NzgxMjgzOWY4
IGRybS92M2Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCj4gPiBlMmZkMzE5MmUyNjcgZHJtL3R2ZTIwMDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+IDg0ZTZkYTdhZDU1MyBkcm0vdGlueTogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+IDM0Y2Rk
MWY2OTFhZCBkcm0vdGlkc3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkCj4gPiBkNjY1ZTNjOWQzN2EgZHJtL3N1bjRpOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4gMGMyNTlhYjE5MTQ2IGRybS9z
dG06IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4g
PiA5YTg2NWU0NTg4NGEgZHJtL3N0aTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKPiA+IDNjODU1NjEwODQwZSBkcm0vcm9ja2NoaXA6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPiBlNDE5NzdhODNi
NzEgZHJtL3BhbmZyb3N0OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZAo+ID4gY2VmMzc3NmQwYjVhIGRybS9wYW5lbDogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+IGJkMjk2YTU5NGU4NyBkcm0vbXhz
ZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4g
PiAzOGNhMmQ5M2QzMjMgZHJtL21lc29uOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZAo+ID4gZmQxNDU3ZDg0YmFlIGRybS9tY2RlOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4gNDFhNTZhMTg2MTVj
IGRybS9sb2dpY3ZjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAo+ID4gOTgwZWM2NDQ0MzcyIGRybS9saW1hOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4gODJhMmMwY2MxYTIyIGRybS9oaXNpbGlj
b246IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4g
PiBjM2IyOGIyOWFjMGEgZHJtL2ZzbC1kY3U6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCj4gPiBhMTE4ZmM2ZTcxZjkgZHJtL2F0bWVsLWhsY2RjOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4gOWEz
MmRkMzI0YzQ2IGRybS9hc3BlZWQ6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCj4gPiAyYzdkMjkxYzQ5OGMgZHJtL2FybS9tYWxpZHA6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPiBhOTIwMDI4ZGY2
NzkgZHJtL2FybS9oZGxjZDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKPiA+IDFiZjNkNzZhN2QxNSBkcm0va29tZWRhOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+Cj4gVG9nZXRoZXIgd2l0aCB0aGUg
cGF0Y2hlcyB0aGF0IHdlcmUgYXBwbGllZCBsYXRlciB0aGUgdG9wbW9zdCBjb21taXQKPiBmcm9t
IHRoaXMgc2VyaWVzIGlzIGMyODA3ZWNiNTI5MCAoImRybS9vbWFwOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZQo+IGNhbGxiYWNrIHJldHVybmluZyB2b2lkIikuIFRoaXMgY29tbWl0IHdhcyBw
YXJ0IGZvciB0aGUgZm9sbG93aW5nIG5leHQKPiB0YWdzOgo+Cj4gICAgICAgICAkIGdpdCB0YWcg
LWwgLS1jb250YWlucyBjMjgwN2VjYjUyOTAKPiAgICAgICAgIG5leHQtMjAyMzA2MDkKPiAgICAg
ICAgIG5leHQtMjAyMzA2MTMKPiAgICAgICAgIG5leHQtMjAyMzA2MTQKPiAgICAgICAgIG5leHQt
MjAyMzA2MTUKPgo+IEhvd2V2ZXIgaW4gbmV4dC0yMDIzMDYxNiB0aGV5IGFyZSBtaXNzaW5nLiBJ
biBuZXh0LTIwMjMwNjE2Cj4gZHJtLW1pc2MvZm9yLWxpbnV4LW5leHQgd2FzIGNmNjgzZTg4NzBi
ZDRiZTBmZDZiOTg2MzkyODY3MDBhMzUwODg2NjAuCj4gQ29tcGFyZWQgdG8gYzI4MDdlY2I1Mjkw
IHRoaXMgYWRkcyAxMTQ5IHBhdGNoZXMgYnV0IGRyb3BzIDM3ICh0aGF0IGFyZQo+IGFsc28gbm90
IGluY2x1ZGVkIHdpdGggYSBkaWZmZXJlbnQgY29tbWl0IGlkKS4gVGhlIDM3IHBhdGNoZXMgZHJv
cHBlZAo+IGFyZSAxM2NkZDEyYTlmOTM0MTU4ZjRlYzgxN2NmMDQ4ZmNiNDM4NGFhOWRjLi5jMjgw
N2VjYjUyOTA6Cj4KPiAgICAgICAgICQgZ2l0IHNob3J0bG9nIC1zIDEzY2RkMTJhOWY5MzQxNThm
NGVjODE3Y2YwNDhmY2I0Mzg0YWE5ZGMuLmMyODA3ZWNiNTI5MAo+ICAgICAgICAgICAgICAxICBD
aHJpc3RvcGhlIEpBSUxMRVQKPiAgICAgICAgICAgICAgMiAgSmVzc2ljYSBaaGFuZwo+ICAgICAg
ICAgICAgICA1ICBLYXJvbCBXYWNob3dza2kKPiAgICAgICAgICAgICAgMSAgTGF1cmEgTmFvCj4g
ICAgICAgICAgICAgMjcgIFV3ZSBLbGVpbmUtS8O2bmlnCj4gICAgICAgICAgICAgIDEgIFdhbmcg
SmlhbnpoZW5nCj4KPgo+IEkgZ3Vlc3MgdGhpcyB3YXMgZG9uZSBieSBtaXN0YWtlIGJlY2F1c2Ug
bm9ib2R5IHRvbGQgbWUgYWJvdXQgZHJvcHBpbmcKPiBteS90aGVzZSBwYXRjaGVzPyBDYW4gYzI4
MDdlY2I1MjkwIHBsZWFzZSBiZSBtZXJnZWQgaW50byBkcm0tbWlzYy1uZXh0Cj4gYWdhaW4/CgpB
Y3R1YWxseSwgaXQgd2FzIHByb2JhYmx5IGEgbWlzdGFrZSB0aGF0IHRoZXNlIHBhdGNoZXMgZ290
IG1lcmdlZCB0bwpsaW51eG5leHQgZHVyaW5nIHRoZSA0IGRheXMgdGhhdCB5b3Ugbm90aWNlZC4g
SG93ZXZlciwgeW91ciBwYXRjaGVzCmFyZW4ndCBkcm9wcGVkIGFuZCBhcmUgc3RpbGwgcHJlc2Vu
dCBpbiBkcm0tbWlzYy1uZXh0LgoKZHJtLW1pc2MgaGFzIGEgYml0IG9mIGEgdW5pcXVlIG1vZGVs
IGFuZCBpdCdzIGRvY3VtZW50ZWQgZmFpcmx5IHdlbGwgaGVyZToKCmh0dHBzOi8vZHJtLnBhZ2Vz
LmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2RybS1taXNjLmh0bWwKClRoZSBrZXkg
aXMgdGhhdCBjb21taXR0ZXJzIGNhbiBjb21taXQgdG8gZHJtLW1pc2MtbmV4dCBfYXQgYW55IHRp
bWVfCnJlZ2FyZGxlc3Mgb2YgdGhlIG1lcmdlIHdpbmRvdy4gVGhlIGRybS1taXNjIG1lcmdlIHN0
cmF0ZWd5IG1ha2VzIHRoaXMKT0suIFNwZWNpZmljYWxseSwgd2hlbiBpdCdzIGxhdGUgaW4gdGhl
IGxpbnV4IGN5Y2xlIHRoZW4gZHJtLW1pc2MtbmV4dAppcyBzdXBwb3NlZCB0byBzdG9wIG1lcmdp
bmcgdG8gbGludXhuZXh0LiBUaGVuLCBzaG9ydGx5IGFmdGVyIHRoZQptZXJnZSB3aW5kb3cgY2xv
c2VzLCBwYXRjaGVzIHdpbGwgc3RhcnQgZmxvd2luZyBhZ2Fpbi4KClNvIGJhc2ljYWxseSB5b3Vy
IHBhdGNoZXMgYXJlIGxhbmRlZCBhbmQgc2hvdWxkIGV2ZW4ga2VlcCB0aGUgc2FtZSBnaXQKaGFz
aGVzIHdoZW4gdGhleSBldmVudHVhbGx5IG1ha2UgaXQgdG8gTGludXguIFRoZXkganVzdCB3b24n
dCBsYW5kIGZvcgphbm90aGVyIHJlbGVhc2UgY3ljbGUgb2YgTGludXguCgpIb3BlIHRoYXQgbWFr
ZXMgc2Vuc2UhCgotRG91ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
