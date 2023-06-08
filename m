Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B50257284AF
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jun 2023 18:16:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D54EC65E70;
	Thu,  8 Jun 2023 16:16:00 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9754C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 16:15:58 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-33b22221da6so2603555ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jun 2023 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686240957; x=1688832957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZrPvXOaXEQPKsXtUpbfz4WhJ7pTJywi1kpaIctsmkU=;
 b=Jwnu1zHUW25+BPvG8UKxWKTCz3xdfoIHMuBXTnR35O153JJBCyf3d5IEak8kiE+PNq
 oTCTuFFIvYlNb5ABsNXrW5A3yNQbWkaEHZCiOhyLaXTTGdDGzTL8WABH7ziFRpRIRkn+
 JlAgkQAY6YVrOSEX3snd3g5IueZZ93M+/GDZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686240957; x=1688832957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZrPvXOaXEQPKsXtUpbfz4WhJ7pTJywi1kpaIctsmkU=;
 b=b8bFdofwL2+tUbcM1AVidU1i+TUOxtL8uAS2PIZsazHpKofR0N8mB69NN0kULJuDiH
 sqEmHXrd0qzcYYTTryUhiQiBHtDuyl6vHx2Z1/c2u10EHlPnpQ6LvQQFJGB2LWR0tYlM
 BvMUL/F/nAYPyP/pAzgkML8rj3TU5PL+zG0MbkXzxEbT5Us4GiK/fQKTeuXrvfXsx0/f
 smLZCmqm1bV17dXZ4lzAlY17qWYiTV1G3ej5Dr/xV7NN6RpttNjnTc9PRSzbAHVw7Shl
 Wv9lcdwcgXn8eDDFQr2/Do/pISsVoVfdWWlixhsJaJmofmRiZY+eQGVCTTUgyzDodkgp
 H0wg==
X-Gm-Message-State: AC+VfDwWtI92biBc66wNDs+CfkLqOfYc6wwW+wC+XRlp+dLIYn/KqZm8
 fJ8uzmI13xUmyTH3uhf8NK9tNne1L7IH2ZzCvK6eoA==
X-Google-Smtp-Source: ACHHUZ6og0lFG1PAhz1hINdHNoGmPz691mIgHimZbC+rHg4Xa+8IAFAJL6ypFGxrtGeRHwutw3XRug==
X-Received: by 2002:a05:6e02:810:b0:33b:1da8:a7d0 with SMTP id
 u16-20020a056e02081000b0033b1da8a7d0mr10538950ilm.29.1686240957192; 
 Thu, 08 Jun 2023 09:15:57 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175]) by smtp.gmail.com with ESMTPSA id
 j8-20020a056e02014800b00333760c865asm502769ilr.10.2023.06.08.09.15.56
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 09:15:57 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-33d928a268eso139535ab.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jun 2023 09:15:56 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a22:b0:330:af65:de3d with SMTP id
 g2-20020a056e021a2200b00330af65de3dmr115540ile.11.1686240508041; Thu, 08 Jun
 2023 09:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
In-Reply-To: <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 09:08:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
Message-ID: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Rahul T R <r-ravikumar@ti.com>, Jani Nikula <jani.nikula@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org,
 Yuan Can <yuancan@huawei.com>, Inki Dae <inki.dae@samsung.com>,
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

SGksCgpPbiBUaHUsIEp1biAxLCAyMDIzIGF0IDg6NDDigK9BTSBVd2UgS2xlaW5lLUvDtm5pZwo8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gT24g
U3VuLCBNYXkgMDcsIDIwMjMgYXQgMDY6MjU6MjNQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcg
d3JvdGU6Cj4gPiB0aGlzIHBhdGNoIHNlcmllcyBhZGFwdHMgdGhlIHBsYXRmb3JtIGRyaXZlcnMg
YmVsb3cgZHJpdmVycy9ncHUvZHJtCj4gPiB0byB1c2UgdGhlIC5yZW1vdmVfbmV3KCkgY2FsbGJh
Y2suIENvbXBhcmVkIHRvIHRoZSB0cmFkaXRpb25hbCAucmVtb3ZlKCkKPiA+IGNhbGxiYWNrIC5y
ZW1vdmVfbmV3KCkgcmV0dXJucyBubyB2YWx1ZS4gVGhpcyBpcyBhIGdvb2QgdGhpbmcgYmVjYXVz
ZQo+ID4gdGhlIGRyaXZlciBjb3JlIGRvZXNuJ3QgKGFuZCBjYW5ub3QpIGNvcGUgZm9yIGVycm9y
cyBkdXJpbmcgcmVtb3ZlLiBUaGUKPiA+IG9ubHkgZWZmZWN0IG9mIGEgbm9uLXplcm8gcmV0dXJu
IHZhbHVlIGluIC5yZW1vdmUoKSBpcyB0aGF0IHRoZSBkcml2ZXIKPiA+IGNvcmUgZW1pdHMgYSB3
YXJuaW5nLiBUaGUgZGV2aWNlIGlzIHJlbW92ZWQgYW55aG93IGFuZCBhbiBlYXJseSByZXR1cm4K
PiA+IGZyb20gLnJlbW92ZSgpIHVzdWFsbHkgeWllbGRzIGEgcmVzb3VyY2UgbGVhay4KPiA+Cj4g
PiBCeSBjaGFuZ2luZyB0aGUgcmVtb3ZlIGNhbGxiYWNrIHRvIHJldHVybiB2b2lkIGRyaXZlciBh
dXRob3JzIGNhbm5vdAo+ID4gcmVhc29uYWJseSAoYnV0IHdyb25nbHkpIGFzc3VtZSBhbnkgbW9y
ZSB0aGF0IHRoZXJlIGhhcHBlbnMgc29tZSBraW5kIG9mCj4gPiBjbGVhbnVwIGxhdGVyLgo+Cj4g
SSB3b25kZXIgaWYgc29tZW9uZSB3b3VsZCB2b2x1bnRlZXIgdG8gYWRkIHRoZSB3aG9sZSBzZXJp
ZXMgdG8KPiBkcm0tbWlzYy1uZXh0PyEKCkl0IGxvb2tzIGFzIGlmIE5laWwgYXBwbGllZCBxdWl0
ZSBhIGZldyBvZiB0aGVtIGFscmVhZHksIHNvIEkgbG9va2VkCmF0IHdoYXQgd2FzIGxlZnQuLi4K
CkknbSBhIGxpdHRsZSBoZXNpdGFudCB0byBqdXN0IGFwcGx5IHRoZSB3aG9sZSBraXQtYW5kLWNh
Ym9vZGxlIHRvCmRybS1taXNjLW5leHQgc2luY2UgdGhlcmUgYXJlIHNwZWNpZmljIERSTSB0cmVl
cyBmb3IgYSBidW5jaCBvZiB0aGVtCmFuZCBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhleSBsYW5k
ZWQgdGhlcmUuIC4uLnNvIEkgd2VudCB0aHJvdWdoIGFsbAp0aGUgcGF0Y2hlcyB0aGF0IHN0aWxs
IGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCwgdGhlbiB1c2VkCidzY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsIC0tc2NtJyB0byBjaGVjayBpZiB0aGV5IHdlcmUgbWFpbnRhaW5lZAp0aHJvdWdoIGRy
bS1taXNjLiBUaGF0IHN0aWxsIGxlZnQgcXVpdGUgYSBmZXcgcGF0Y2hlcy4gSSd2ZSBhcHBsaWVk
CnRob3NlIG9uZXMgYW5kIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0OgoKNzE3MjI2ODVjZDE3IGRy
bS94bG54L3p5bnFtcF9kcHN1YjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUKY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKMWVkNTRhMTlmM2IzIGRybS92YzQ6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCmI5NTc4MTI4MzlmOCBkcm0vdjNkOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAplMmZkMzE5MmUy
NjcgZHJtL3R2ZTIwMDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nIHZvaWQKODRlNmRhN2FkNTUzIGRybS90aW55OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAozNGNkZDFmNjkxYWQgZHJtL3RpZHNzOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZApkNjY1ZTNjOWQzN2Eg
ZHJtL3N1bjRpOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAowYzI1OWFiMTkxNDYgZHJtL3N0bTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKOWE4NjVlNDU4ODRhIGRybS9zdGk6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCjNjODU1NjEwODQwZSBkcm0vcm9j
a2NoaXA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lk
CmU0MTk3N2E4M2I3MSBkcm0vcGFuZnJvc3Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCmNlZjM3NzZkMGI1YSBkcm0vcGFuZWw6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCmJkMjk2YTU5NGU4NyBkcm0v
bXhzZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lk
CjM4Y2EyZDkzZDMyMyBkcm0vbWVzb246IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCmZkMTQ1N2Q4NGJhZSBkcm0vbWNkZTogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKNDFhNTZhMTg2MTVjIGRybS9sb2dp
Y3ZjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo5
ODBlYzY0NDQzNzIgZHJtL2xpbWE6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCjgyYTJjMGNjMWEyMiBkcm0vaGlzaWxpY29uOiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZApjM2IyOGIyOWFjMGEgZHJtL2Zz
bC1kY3U6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lk
CmExMThmYzZlNzFmOSBkcm0vYXRtZWwtaGxjZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCjlhMzJkZDMyNGM0NiBkcm0vYXNwZWVkOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAoyYzdkMjkxYzQ5OGMg
ZHJtL2FybS9tYWxpZHA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCmE5MjAwMjhkZjY3OSBkcm0vYXJtL2hkbGNkOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAoxYmYzZDc2YTdkMTUgZHJtL2tvbWVkYTog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKClRoZSBm
b2xsb3dpbmcgb25lcyBhcHBlYXJlZCB0byBhcHBseSB0byB0aGUgdG9wIG9mIGRybS1taXNjLW5l
eHQsIGJ1dApJIGRpZG4ndCBhcHBseSB0aGVtIHNpbmNlIGdldF9tYWludGFpbmVyIGRpZG4ndCBz
YXkgdGhleSB3ZXJlIHBhcnQgb2YKZHJtLW1pc2MtbmV4dDoKCmRybS90aW55OiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZApkcm0vdGlsY2RjOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZApkcm0vc3ByZDog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKZHJtL3No
bW9iaWxlOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZApkcm0vcmNhci1kdTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nIHZvaWQKZHJtL29tYXA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkCmRybS9ub3V2ZWF1OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZApkcm0vbWVkaWF0ZWs6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCmRybS9rbWI6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCmRybS9pbmdlbmljOiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZApkcm0vaW14L2lwdXYzOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZApkcm0vaW14L2Rj
c3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCmRy
bS9ldG5hdml2OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZApkcm0vYXJtYWRhOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZAoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
