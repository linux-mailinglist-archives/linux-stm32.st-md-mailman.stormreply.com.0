Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCE1728689
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jun 2023 19:45:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01493C65E70;
	Thu,  8 Jun 2023 17:45:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11BD2C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 17:45:24 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-652a6bf4e6aso664835b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jun 2023 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686246323; x=1688838323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PeA6Fr7MyJEEh+PxA+wsyF1Cp1tipvwi/ySisRbvhVk=;
 b=nOhqGtnqODFtU7Nky1cATdNNx0tKEonqO2BOGMX/J8lcqT0F8Nmhqtwqqj7vMNVW2M
 n28hp01BzvdFqHFFFmkNQq13e36pOoJoMF7/Zc2jrxd/GGWZ3nbsAbcYNaSWYgW2wroL
 d1eIxOO70JfvKDPWZxgDXJe1e3gZ8xnTzEhZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686246323; x=1688838323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PeA6Fr7MyJEEh+PxA+wsyF1Cp1tipvwi/ySisRbvhVk=;
 b=KergoidEPzmzVrYr7b+1ulEVJgBvyUt/udVWpp4vcO2k2x04xGDDpOVAjM9E4fRO6j
 tVlrqTT7Cp2ZJaYm9VGEdc3SRJ0s+GXfUwPs0pN+BScmCxfzzJBBbnV8PVdPgwCEx/Dk
 zRx9z883kGcS2eioNYNnxm/nIpeX7wOs1wk7CwYt+HZBgEql3+XUZiOB1ad68Y+s52UQ
 dSyLT0eOJQqLvRWZUcMl1LJD70nPX/rR/6G+A3q/R+OrxDGRII5kaErUuIAIfEFXH9hv
 Gfl+IoFtypcyZed+LkWUCEyU4KMK+DxurAIsu5CPJzfhRn1XE6ry3oeZRii3+RVlv8IS
 1ESA==
X-Gm-Message-State: AC+VfDxfCrTIq1nD6ouKJu5d4OiaghRLBSo3bhg1UWaGH0I9wUrVeJbn
 QEJye8/QzIPkc3DXI7ncCaezoco/MQ6xI4FOmj8HRQ==
X-Google-Smtp-Source: ACHHUZ7I58TqsjFRIJ4o35ceITSARV9BnlJKKfpNBnPgo3zNY8fb5dhacAVLyxaG9qPMN88fCiwjTg==
X-Received: by 2002:a05:6a00:2e01:b0:64d:123d:cc74 with SMTP id
 fc1-20020a056a002e0100b0064d123dcc74mr7036711pfb.4.1686246323044; 
 Thu, 08 Jun 2023 10:45:23 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com.
 [209.85.214.175]) by smtp.gmail.com with ESMTPSA id
 i15-20020aa7908f000000b00660d80087a0sm1341091pfa.199.2023.06.08.10.45.22
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 10:45:22 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1b1b51ec3e9so218345ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jun 2023 10:45:22 -0700 (PDT)
X-Received: by 2002:a05:6e02:188a:b0:33e:6b65:6f78 with SMTP id
 o10-20020a056e02188a00b0033e6b656f78mr167838ilu.27.1686245934574; Thu, 08 Jun
 2023 10:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230608162642.GA23400@pendragon.ideasonboard.com>
 <2b8ccac8-2828-1279-93aa-a601d8d72e43@ideasonboard.com>
In-Reply-To: <2b8ccac8-2828-1279-93aa-a601d8d72e43@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 10:38:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V6YuP4ojsFSVSMFaGGDCVvzEQFTKm66pRTwD7Ry=_Kaw@mail.gmail.com>
Message-ID: <CAD=FV=V6YuP4ojsFSVSMFaGGDCVvzEQFTKm66pRTwD7Ry=_Kaw@mail.gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgpPbiBUaHUsIEp1biA4LCAyMDIzIGF0IDEwOjE54oCvQU0gVG9taSBWYWxrZWluZW4KPHRv
bWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gT24gMDgvMDYvMjAyMyAx
OToyNiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+IEhpIERvdWcsCj4gPgo+ID4gT24gVGh1
LCBKdW4gMDgsIDIwMjMgYXQgMDk6MDg6MTVBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3cm90ZToK
PiA+PiBPbiBUaHUsIEp1biAxLCAyMDIzIGF0IDg6NDDigK9BTSBVd2UgS2xlaW5lLUvDtm5pZyB3
cm90ZToKPiA+Pj4gT24gU3VuLCBNYXkgMDcsIDIwMjMgYXQgMDY6MjU6MjNQTSArMDIwMCwgVXdl
IEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPj4+PiB0aGlzIHBhdGNoIHNlcmllcyBhZGFwdHMgdGhl
IHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9ncHUvZHJtCj4gPj4+PiB0byB1c2UgdGhl
IC5yZW1vdmVfbmV3KCkgY2FsbGJhY2suIENvbXBhcmVkIHRvIHRoZSB0cmFkaXRpb25hbCAucmVt
b3ZlKCkKPiA+Pj4+IGNhbGxiYWNrIC5yZW1vdmVfbmV3KCkgcmV0dXJucyBubyB2YWx1ZS4gVGhp
cyBpcyBhIGdvb2QgdGhpbmcgYmVjYXVzZQo+ID4+Pj4gdGhlIGRyaXZlciBjb3JlIGRvZXNuJ3Qg
KGFuZCBjYW5ub3QpIGNvcGUgZm9yIGVycm9ycyBkdXJpbmcgcmVtb3ZlLiBUaGUKPiA+Pj4+IG9u
bHkgZWZmZWN0IG9mIGEgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGluIC5yZW1vdmUoKSBpcyB0aGF0
IHRoZSBkcml2ZXIKPiA+Pj4+IGNvcmUgZW1pdHMgYSB3YXJuaW5nLiBUaGUgZGV2aWNlIGlzIHJl
bW92ZWQgYW55aG93IGFuZCBhbiBlYXJseSByZXR1cm4KPiA+Pj4+IGZyb20gLnJlbW92ZSgpIHVz
dWFsbHkgeWllbGRzIGEgcmVzb3VyY2UgbGVhay4KPiA+Pj4+Cj4gPj4+PiBCeSBjaGFuZ2luZyB0
aGUgcmVtb3ZlIGNhbGxiYWNrIHRvIHJldHVybiB2b2lkIGRyaXZlciBhdXRob3JzIGNhbm5vdAo+
ID4+Pj4gcmVhc29uYWJseSAoYnV0IHdyb25nbHkpIGFzc3VtZSBhbnkgbW9yZSB0aGF0IHRoZXJl
IGhhcHBlbnMgc29tZSBraW5kIG9mCj4gPj4+PiBjbGVhbnVwIGxhdGVyLgo+ID4+Pgo+ID4+PiBJ
IHdvbmRlciBpZiBzb21lb25lIHdvdWxkIHZvbHVudGVlciB0byBhZGQgdGhlIHdob2xlIHNlcmll
cyB0bwo+ID4+PiBkcm0tbWlzYy1uZXh0PyEKPiA+Pgo+ID4+IEl0IGxvb2tzIGFzIGlmIE5laWwg
YXBwbGllZCBxdWl0ZSBhIGZldyBvZiB0aGVtIGFscmVhZHksIHNvIEkgbG9va2VkCj4gPj4gYXQg
d2hhdCB3YXMgbGVmdC4uLgo+ID4+Cj4gPj4gSSdtIGEgbGl0dGxlIGhlc2l0YW50IHRvIGp1c3Qg
YXBwbHkgdGhlIHdob2xlIGtpdC1hbmQtY2Fib29kbGUgdG8KPiA+PiBkcm0tbWlzYy1uZXh0IHNp
bmNlIHRoZXJlIGFyZSBzcGVjaWZpYyBEUk0gdHJlZXMgZm9yIGEgYnVuY2ggb2YgdGhlbQo+ID4+
IGFuZCBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhleSBsYW5kZWQgdGhlcmUuIC4uLnNvIEkgd2Vu
dCB0aHJvdWdoIGFsbAo+ID4+IHRoZSBwYXRjaGVzIHRoYXQgc3RpbGwgYXBwbGllZCB0byBkcm0t
bWlzYy1uZXh0LCB0aGVuIHVzZWQKPiA+PiAnc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtLXNj
bScgdG8gY2hlY2sgaWYgdGhleSB3ZXJlIG1haW50YWluZWQKPiA+PiB0aHJvdWdoIGRybS1taXNj
LiBUaGF0IHN0aWxsIGxlZnQgcXVpdGUgYSBmZXcgcGF0Y2hlcy4gSSd2ZSBhcHBsaWVkCj4gPj4g
dGhvc2Ugb25lcyBhbmQgcHVzaGVkIHRvIGRybS1taXNjLW5leHQ6Cj4gPj4KPiA+PiA3MTcyMjY4
NWNkMTcgZHJtL3hsbngvenlucW1wX2Rwc3ViOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZQo+
ID4+IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gMWVkNTRhMTlmM2IzIGRybS92YzQ6IENv
bnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gYjk1
NzgxMjgzOWY4IGRybS92M2Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkCj4gPj4gZTJmZDMxOTJlMjY3IGRybS90dmUyMDA6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gODRlNmRhN2FkNTUzIGRy
bS90aW55OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAo+ID4+IDM0Y2RkMWY2OTFhZCBkcm0vdGlkc3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gZDY2NWUzYzlkMzdhIGRybS9zdW40aTogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+PiAwYzI1
OWFiMTkxNDYgZHJtL3N0bTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKPiA+PiA5YTg2NWU0NTg4NGEgZHJtL3N0aTogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+PiAzYzg1NTYxMDg0MGUgZHJtL3Jv
Y2tjaGlwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAo+ID4+IGU0MTk3N2E4M2I3MSBkcm0vcGFuZnJvc3Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gY2VmMzc3NmQwYjVhIGRybS9wYW5lbDog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+PiBi
ZDI5NmE1OTRlODcgZHJtL214c2ZiOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZAo+ID4+IDM4Y2EyZDkzZDMyMyBkcm0vbWVzb246IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gZmQxNDU3ZDg0YmFl
IGRybS9tY2RlOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAo+ID4+IDQxYTU2YTE4NjE1YyBkcm0vbG9naWN2YzogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiA+PiA5ODBlYzY0NDQzNzIgZHJtL2xpbWE6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4g
ODJhMmMwY2MxYTIyIGRybS9oaXNpbGljb246IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gYzNiMjhiMjlhYzBhIGRybS9mc2wtZGN1OiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4+IGExMThm
YzZlNzFmOSBkcm0vYXRtZWwtaGxjZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCj4gPj4gOWEzMmRkMzI0YzQ2IGRybS9hc3BlZWQ6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gMmM3ZDI5MWM0
OThjIGRybS9hcm0vbWFsaWRwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBy
ZXR1cm5pbmcgdm9pZAo+ID4+IGE5MjAwMjhkZjY3OSBkcm0vYXJtL2hkbGNkOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4+IDFiZjNkNzZhN2Qx
NSBkcm0va29tZWRhOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAo+ID4+Cj4gPj4gVGhlIGZvbGxvd2luZyBvbmVzIGFwcGVhcmVkIHRvIGFwcGx5IHRv
IHRoZSB0b3Agb2YgZHJtLW1pc2MtbmV4dCwgYnV0Cj4gPj4gSSBkaWRuJ3QgYXBwbHkgdGhlbSBz
aW5jZSBnZXRfbWFpbnRhaW5lciBkaWRuJ3Qgc2F5IHRoZXkgd2VyZSBwYXJ0IG9mCj4gPj4gZHJt
LW1pc2MtbmV4dDoKPiA+Pgo+ID4+IGRybS90aW55OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ID4+IGRybS90aWxjZGM6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gZHJtL3NwcmQ6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPj4gZHJtL3No
bW9iaWxlOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAo+ID4+IGRybS9yY2FyLWR1OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBy
ZXR1cm5pbmcgdm9pZAo+ID4KPiA+IElmIHlvdSBkb24ndCBtaW5kLCBjb3VsZCB5b3UgdGFrZSB0
aGUgcmNhci1kdSBwYXRjaCB0aHJvdWdoIGRybS1taXNjIHRvbwo+ID4gPyBJIGRvbid0IHBsYW4g
dG8gc2VuZCBhbm90aGVyIHB1bGwgcmVxdWVzdCBmb3IgdjYuNS4KPiA+Cj4gPj4gZHJtL29tYXA6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gPgo+
ID4gVG9taSwgc2hvdWxkIGRybS9vbWFwIG1vdmVkIHRvIGJlaW5nIG1haW50YWluZWQgdGhyb3Vn
aCBkcm0tbWlzYyA/Cj4KPiBZZXMuIHRpbGNkYywgdGlkc3MgYW5kIG9tYXBkcm0gYXJlIGFsbCBt
YWludGFpbmVkIHRocm91Z2ggZHJtLW1pc2MuCgp0aWRzcyB3YXMgYWxyZWFkeSBpbiBteSBsaXN0
IG9mIGFwcGxpZWQgcGF0Y2hlcy4KCkkndmUgYXBwbGllZCB0aGUgb3RoZXIgdHdvIGFuZCBwdXNo
ZWQ6CgpjMjgwN2VjYjUyOTAgZHJtL29tYXA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCmU1MmQxMjgyZjkxOSBkcm0vdGlsY2RjOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAoKCj4gQnV0Cj4gSSBndWVz
cyBJIG5lZWQgdG8gYWRkIHNvbWV0aGluZyB0byB0aGUgTUFJTlRBSU5FUlMgdG8gbWFrZSB0aGlz
IGNsZWFyLgo+IEknbGwgbG9vayBhdCBpdC4KClRoZSBrZXkgSSB3YXMgbG9va2luZyBmb3Igd2Fz
OgoKVDogICAgICBnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNj
CgotRG91ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
