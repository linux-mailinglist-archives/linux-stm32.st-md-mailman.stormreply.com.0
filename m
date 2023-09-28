Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D397B137D
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 09:05:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70104C6A60C;
	Thu, 28 Sep 2023 07:05:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0733C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 07:05:23 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3231d6504e1so8692249f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 00:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695884723; x=1696489523;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JK5FKcmSKFk/poFkH6WaIiPHJq3+6nK77MGlhBlv5xc=;
 b=ZyNhnPdL8qyqUJcrVnRBqkZGLqsYlHqZUuP9zP4GBgKBPscq4PvgpWOHirYV10dRXC
 AimiNzZbRyTYUdEp0FOGRCznZpYYhW0YuSWdJc+qSRxlc+VEUtNJT8o//A9Fc5uOmVNG
 8MHZAFDS3pU3SU5coJHAsR2DBKcFwG9SLKhDYzxKIlkg3HtcFXEOduFD4HUyfiXM4V9o
 G+Nk0XtaKBcQubGMSHjNYxQ2r20GkXtca5VLWHsDVCLid+qLYmPGoGwFA5SFiGmeh/nK
 wdzuZYwuaH5aqwTN3OoDCwPl3ZoOMEVVC/hgn863rIdAUVGeN6ePlKNgaZmUPvbbA5aD
 hqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695884723; x=1696489523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JK5FKcmSKFk/poFkH6WaIiPHJq3+6nK77MGlhBlv5xc=;
 b=RXtQnXwHxc6vYisy/q7eK7ZDsFMOJvNVpVhyeUazi/NTLsbTbhdPE5MHOpn6Gc0bdT
 T5sFHrXobbjmp9NbRkzV6WXUOokIw96mg3IIsrKVO+ISNg5OZw0ZCNhR1Keo4AbG3hvE
 HCqvpcSlJrZXdgjdXOz53mDC1lpnB3oXVJKncuUxeEDQYVr7QPwBalLQQ50bVyjkYCZ+
 +SF/S3gOCnolTzo8KFuD3QgpayUYf753E45YGXZmEp7qm5WS/cnlr0Q3wkWdtRI7CobU
 WsTRlO/aEicO6j7V0PHTGdAWLcrt1+Qa+9avUZtRKJrqswmpmnjRCQpTsASqhTJXFMbs
 S/ag==
X-Gm-Message-State: AOJu0YwIdyD1dcPkIG7aMOYlo/jhfuU1fkL1lBpxJfp22Y/1naVvC2wS
 DZ6SrLuizTb0CUIFkxvWc6yQLQ==
X-Google-Smtp-Source: AGHT+IHtRxKk7CXcPNdMQTTEBVfCDemBFx4pebeQoAgF8nP7IxdEu3s1ozmEdmztrqIM2F97b6iYUw==
X-Received: by 2002:a5d:5b17:0:b0:31f:a4fa:130a with SMTP id
 bx23-20020a5d5b17000000b0031fa4fa130amr465227wrb.14.1695884723076; 
 Thu, 28 Sep 2023 00:05:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0?
 ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
 by smtp.googlemail.com with ESMTPSA id
 bv19-20020a0560001f1300b0032327b70ef6sm10037825wrb.70.2023.09.28.00.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 00:05:22 -0700 (PDT)
Message-ID: <d8515a00-4d41-2d23-09ca-30f474fcbabd@linaro.org>
Date: Thu, 28 Sep 2023 09:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
 <CAJZ5v0guyQ-SpNHXYBG2F_WyCSvgjXocGBy61Ep1Cy5-H-MOsQ@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAJZ5v0guyQ-SpNHXYBG2F_WyCSvgjXocGBy61Ep1Cy5-H-MOsQ@mail.gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-arm-msm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
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
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, Keerthy <j-keerthy@ti.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, kernel@pengutronix.de,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjcvMDkvMjAyMyAyMTo0NSwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gSGksCj4gCj4g
T24gV2VkLCBTZXAgMjcsIDIwMjMgYXQgOTozOOKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCj4gPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4+Cj4+IEhlbGxvLAo+Pgo+PiB0
aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL3Ro
ZXJtYWwgdG8gdXNlCj4+IC5yZW1vdmVfbmV3KCkuIFRoZSBtb3RpdmF0aW9uIGlzIHRvIGdldCBy
aWQgb2YgYW4gaW50ZWdlciByZXR1cm4gY29kZQo+PiB0aGF0IGlzIChtb3N0bHkpIGlnbm9yZWQg
YnkgdGhlIHBsYXRmb3JtIGRyaXZlciBjb3JlIGFuZCBlcnJvciBwcm9uZSBvbgo+PiB0aGUgZHJp
dmVyIHNpZGUuCj4+Cj4+IFNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06IFByb3Zp
ZGUgYSByZW1vdmUgY2FsbGJhY2sgdGhhdAo+PiByZXR1cm5zIG5vIHZhbHVlIikgZm9yIGFuIGV4
dGVuZGVkIGV4cGxhbmF0aW9uIGFuZCB0aGUgZXZlbnR1YWwgZ29hbC4KPj4KPj4gVGhlcmUgYXJl
IG5vIGludGVyZGVwZW5kZW5jaWVzIGJldHdlZW4gdGhlIHBhdGNoZXMuIEFzIHRoZXJlIGFyZSBz
dGlsbAo+PiBxdWl0ZSBhIGZldyBkcml2ZXJzIHRvIGNvbnZlcnQsIEknbSBoYXBweSBhYm91dCBl
dmVyeSBwYXRjaCB0aGF0IG1ha2VzCj4+IGl0IGluLiBTbyBldmVuIGlmIHRoZXJlIGlzIGEgbWVy
Z2UgY29uZmxpY3Qgd2l0aCBvbmUgcGF0Y2ggdW50aWwgeW91Cj4+IGFwcGx5IG9yIGEgc3ViamVj
dCBwcmVmaXggaXMgc3Vib3B0aW1hbCwgcGxlYXNlIGFwcGx5IHRoZSByZW1haW5kZXIgb2YKPj4g
dGhpcyBzZXJpZXMgYW55aG93Lgo+IAo+IEkgdGhpbmsgSSdsbCBnbyBhaGVhZCBhbmQgYXBwbHkg
YWxsIG9mIHRoaXMgaW4gb25lIGdvIChmb3IgNi43KS4KPiAKPiBEYW5pZWwsIGFueSBvYmplY3Rp
b25zPwoKTm8gb2JqZWN0aW9uLCBmb3IgdGhlIHNlcmllczoKCkFja2VkLWJ5OiBEYW5pZWwgTGV6
Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KCi0tIAo8aHR0cDovL3d3dy5saW5hcm8u
b3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpG
b2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFj
ZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRw
Oi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
