Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C57B0CDF
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Sep 2023 21:45:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD83AC6A60C;
	Wed, 27 Sep 2023 19:45:27 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 712EAC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 19:45:26 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-57bf04841ccso490364eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 12:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695843925; x=1696448725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZdrldCq/11jLKtSHJnC0CV3/MzVWic6Gg0opWfLdlIY=;
 b=jFJm3fmlfbWL9pVCzv6K9h+JJ191rfPSb/j0VsEGxrcM6+tR5cZ/duORJueN/wzi3N
 EDnGUwqgPy4gtLZAKaViRFRFQ4ZKIWhF0SMpPXMXPLwsGCKbrgqP8mmTZXQfgQERa9Cv
 G/0w4pvAhdGCh8iZpZgUWcWrhmf7bPtzMOuISnIilbQLb6y7sGjbRhA9dkQTLhQ38NNh
 FP9yF8S15F575LsdFbhO09w/eymxPtaNsQFR6gsEinJy3cjr1DKuT3oPcXE+oa62dox6
 vF3W1wbKHUJ9bPShdPSzrpac9e8MT05yDbiB/T8+MQCNzug3ZZW5VgPUYTZPBAkF+ckX
 bcMg==
X-Gm-Message-State: AOJu0YzhEWx+k2GPHp4cEBTbp98+OhXOahHlJzJnmgPRT2wJ9cRrx20o
 eg81ERRIjTBpNbodLhOeFN8d8Ud1U1l7qjeN97k=
X-Google-Smtp-Source: AGHT+IGMlW6Putl8V3MXq3RkAqHyCPJSNsGyuWiCwQkEk43f5FSeBHFESqXka7uzLRnNc/5oUKZ3iepgewdBHpsbPHk=
X-Received: by 2002:a4a:e704:0:b0:57b:94b7:c6ba with SMTP id
 y4-20020a4ae704000000b0057b94b7c6bamr3501682oou.0.1695843925125; Wed, 27 Sep
 2023 12:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 27 Sep 2023 21:45:14 +0200
Message-ID: <CAJZ5v0guyQ-SpNHXYBG2F_WyCSvgjXocGBy61Ep1Cy5-H-MOsQ@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Balsam CHIHI <bchihi@baylibre.com>, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Johan Hovold <johan+linaro@kernel.org>,
 Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 Rob Herring <robh@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-pm@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Eduardo Valentin <edubezval@gmail.com>, Chen Jiahao <chenjiahao16@huawei.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, Keerthy <j-keerthy@ti.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, kernel@pengutronix.de,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/31] thermal: Convert to platform remove
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

SGksCgpPbiBXZWQsIFNlcCAyNywgMjAyMyBhdCA5OjM44oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcK
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IHRo
aXMgc2VyaWVzIGNvbnZlcnRzIGFsbCBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRyaXZlcnMvdGhl
cm1hbCB0byB1c2UKPiAucmVtb3ZlX25ldygpLiBUaGUgbW90aXZhdGlvbiBpcyB0byBnZXQgcmlk
IG9mIGFuIGludGVnZXIgcmV0dXJuIGNvZGUKPiB0aGF0IGlzIChtb3N0bHkpIGlnbm9yZWQgYnkg
dGhlIHBsYXRmb3JtIGRyaXZlciBjb3JlIGFuZCBlcnJvciBwcm9uZSBvbgo+IHRoZSBkcml2ZXIg
c2lkZS4KPgo+IFNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06IFByb3ZpZGUgYSBy
ZW1vdmUgY2FsbGJhY2sgdGhhdAo+IHJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQg
ZXhwbGFuYXRpb24gYW5kIHRoZSBldmVudHVhbCBnb2FsLgo+Cj4gVGhlcmUgYXJlIG5vIGludGVy
ZGVwZW5kZW5jaWVzIGJldHdlZW4gdGhlIHBhdGNoZXMuIEFzIHRoZXJlIGFyZSBzdGlsbAo+IHF1
aXRlIGEgZmV3IGRyaXZlcnMgdG8gY29udmVydCwgSSdtIGhhcHB5IGFib3V0IGV2ZXJ5IHBhdGNo
IHRoYXQgbWFrZXMKPiBpdCBpbi4gU28gZXZlbiBpZiB0aGVyZSBpcyBhIG1lcmdlIGNvbmZsaWN0
IHdpdGggb25lIHBhdGNoIHVudGlsIHlvdQo+IGFwcGx5IG9yIGEgc3ViamVjdCBwcmVmaXggaXMg
c3Vib3B0aW1hbCwgcGxlYXNlIGFwcGx5IHRoZSByZW1haW5kZXIgb2YKPiB0aGlzIHNlcmllcyBh
bnlob3cuCgpJIHRoaW5rIEknbGwgZ28gYWhlYWQgYW5kIGFwcGx5IGFsbCBvZiB0aGlzIGluIG9u
ZSBnbyAoZm9yIDYuNykuCgpEYW5pZWwsIGFueSBvYmplY3Rpb25zPwoKCj4gVXdlIEtsZWluZS1L
w7ZuaWcgKDMxKToKPiAgIHRoZXJtYWw6IGFtbG9naWM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICB0aGVybWFsOiBhcm1hZGE6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICB0aGVybWFsOiBi
Y20yODM1OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAo+ICAgdGhlcm1hbDogbnM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkCj4gICB0aGVybWFsOiBkYTkwNjI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICB0aGVybWFsOiBkb3ZlOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ICAgdGhlcm1hbDogaGlz
aTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAg
IHRoZXJtYWw6IGlteDhtbTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKPiAgIHRoZXJtYWw6IGlteDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIHRoZXJtYWw6IGludDM0MDA6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICB0aGVybWFsOiBpbnQz
NDAxOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+
ICAgdGhlcm1hbDogaW50MzQwMjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKPiAgIHRoZXJtYWw6IGludDM0MDM6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICB0aGVybWFsOiBpbnQzNDA2OiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ICAgdGhlcm1h
bDogazNfYmFuZGdhcDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nIHZvaWQKPiAgIHRoZXJtYWw6IGszX2o3Mnh4X2JhbmRnYXA6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICB0aGVybWFsOiBraXJrd29vZDog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIHRo
ZXJtYWw6IGx2dHM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCj4gICB0aGVybWFsOiB0c2VuczogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIHRoZXJtYWw6IHJjYXJfZ2VuMzogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIHRoZXJtYWw6IHJjYXI6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICB0
aGVybWFsOiByb2NrY2hpcDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKPiAgIHRoZXJtYWw6IHJ6ZzJsOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ICAgdGhlcm1hbDogZXh5bm9zX3RtdTogQ29udmVy
dCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIHRoZXJtYWw6
IHNwZWFyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAo+ICAgdGhlcm1hbDogc3ByZDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKPiAgIHRoZXJtYWw6IHN0bTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIHRoZXJtYWw6IHNvY3RoZXJtOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ICAgdGhlcm1hbDog
dGVncmEtYnBtcDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQKPiAgIHRoZXJtYWw6IHRpLWJhbmRnYXA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICB0aGVybWFsOiB1bmlwaGllcjogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPgo+ICBkcml2ZXJzL3Ro
ZXJtYWwvYW1sb2dpY190aGVybWFsLmMgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKystLS0t
LS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9hcm1hZGFfdGhlcm1hbC5jICAgICAgICAgICAgICAgICAg
ICAgfCAgNiArKy0tLS0KPiAgZHJpdmVycy90aGVybWFsL2Jyb2FkY29tL2JjbTI4MzVfdGhlcm1h
bC5jICAgICAgICAgICB8ICA2ICsrLS0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvYnJvYWRjb20vbnMt
dGhlcm1hbC5jICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9k
YTkwNjItdGhlcm1hbC5jICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0tLQo+ICBkcml2ZXJz
L3RoZXJtYWwvZG92ZV90aGVybWFsLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKystLS0t
Cj4gIGRyaXZlcnMvdGhlcm1hbC9oaXNpX3RoZXJtYWwuYyAgICAgICAgICAgICAgICAgICAgICAg
fCAgNiArKy0tLS0KPiAgZHJpdmVycy90aGVybWFsL2lteDhtbV90aGVybWFsLmMgICAgICAgICAg
ICAgICAgICAgICB8ICA2ICsrLS0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvaW14X3RoZXJtYWwuYyAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCj4gIC4uLi90aGVybWFsL2ludGVsL2lu
dDM0MHhfdGhlcm1hbC9pbnQzNDAwX3RoZXJtYWwuYyAgfCAgNSArKy0tLQo+ICAuLi4vdGhlcm1h
bC9pbnRlbC9pbnQzNDB4X3RoZXJtYWwvaW50MzQwMV90aGVybWFsLmMgIHwgIDYgKystLS0tCj4g
IC4uLi90aGVybWFsL2ludGVsL2ludDM0MHhfdGhlcm1hbC9pbnQzNDAyX3RoZXJtYWwuYyAgfCAg
NiArKy0tLS0KPiAgLi4uL3RoZXJtYWwvaW50ZWwvaW50MzQweF90aGVybWFsL2ludDM0MDNfdGhl
cm1hbC5jICB8ICA2ICsrLS0tLQo+ICAuLi4vdGhlcm1hbC9pbnRlbC9pbnQzNDB4X3RoZXJtYWwv
aW50MzQwNl90aGVybWFsLmMgIHwgIDUgKystLS0KPiAgZHJpdmVycy90aGVybWFsL2szX2JhbmRn
YXAuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQo+ICBkcml2ZXJzL3RoZXJt
YWwvazNfajcyeHhfYmFuZGdhcC5jICAgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCj4gIGRy
aXZlcnMvdGhlcm1hbC9raXJrd29vZF90aGVybWFsLmMgICAgICAgICAgICAgICAgICAgfCAgNiAr
Ky0tLS0KPiAgZHJpdmVycy90aGVybWFsL21lZGlhdGVrL2x2dHNfdGhlcm1hbC5jICAgICAgICAg
ICAgICB8ICA2ICsrLS0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvcWNvbS90c2Vucy5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9yY2FyX2dlbjNf
dGhlcm1hbC5jICAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0KPiAgZHJpdmVycy90aGVybWFs
L3JjYXJfdGhlcm1hbC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQo+ICBkcml2
ZXJzL3RoZXJtYWwvcm9ja2NoaXBfdGhlcm1hbC5jICAgICAgICAgICAgICAgICAgIHwgIDYgKyst
LS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9yemcybF90aGVybWFsLmMgICAgICAgICAgICAgICAgICAg
ICAgfCAgNiArKy0tLS0KPiAgZHJpdmVycy90aGVybWFsL3NhbXN1bmcvZXh5bm9zX3RtdS5jICAg
ICAgICAgICAgICAgICB8ICA2ICsrLS0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvc3BlYXJfdGhlcm1h
bC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9z
cHJkX3RoZXJtYWwuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0tLQo+ICBkcml2ZXJz
L3RoZXJtYWwvc3Qvc3RtX3RoZXJtYWwuYyAgICAgICAgICAgICAgICAgICAgIHwgIDYgKystLS0t
Cj4gIGRyaXZlcnMvdGhlcm1hbC90ZWdyYS9zb2N0aGVybS5jICAgICAgICAgICAgICAgICAgICAg
fCAgNiArKy0tLS0KPiAgZHJpdmVycy90aGVybWFsL3RlZ3JhL3RlZ3JhLWJwbXAtdGhlcm1hbC5j
ICAgICAgICAgICB8ICA2ICsrLS0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvdGktc29jLXRoZXJtYWwv
dGktYmFuZGdhcC5jICAgICAgICAgIHwgIDYgKystLS0tCj4gIGRyaXZlcnMvdGhlcm1hbC91bmlw
aGllcl90aGVybWFsLmMgICAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0KPiAgMzEgZmlsZXMg
Y2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgMTIzIGRlbGV0aW9ucygtKQo+Cj4gYmFzZS1jb21t
aXQ6IDE4MDMwMjI2YTQ4ZGUxZmJmYWJmNGFlMTZhYWEyNjk1YTQ4NDI1NGYKPiAtLQo+IDIuNDAu
MQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
