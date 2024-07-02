Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B69253F1
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 08:53:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12F8EC71280;
	Wed,  3 Jul 2024 06:53:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C149DC6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 21:06:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 84DBB62057
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 21:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF92C4AF1D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719954380;
 bh=NyzwM0fsXKf4dXOAJKkuMhvtpscp3UAXzQ88ePFkdHg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GCsdrSnn07P6rQdhwRGFgVPdo6iRNJnXDO+OyTvoaEdBMQzmA5pbvboTGgmgf0E3k
 Zn02SsEqpvBVAEyko3/PmrrW4h1jIsYVH3w1VLtXLQSTEr95ddfFPg0G6dCfHFMpa5
 ajSApm1nTClirNEvFRlBgVuHEEIHhs4h9WgUD1JLK/hqTD4o7UjV9PlCQVxOVY2JGG
 kY/AXUxMZ5KfZFJ0AvjErTNqt8N7SDeBYojUSjkpe7IBnGgYQVFCMtagxDk0zXODhe
 qxtxBi+ql7vGeAgRa/NQGGGRwbo+9wlIK4/W4JiYdOkC+PW22tsSFTDGtO8GXSuwji
 /y43+DqNaMCnA==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cecba8d11so5683391e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Jul 2024 14:06:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXiO1f4uwjbSt5UA7vnmi/nEbSZtmiwscQr5b4keyFbrf8qCe9y9yAcLMTFyKmfzu1vjIG0KdHX0bRVOC4BHl53LP2mNiv2Jzb8eO1N//MNqEzlkxwHpYHa
X-Gm-Message-State: AOJu0YwHHjwFfXkjBx/Y8K+Oue8he7HluhogokHpzluJ/sF31sd+kA2F
 ZFMPl/HDiB4ri+GoFy0/PTe44Rf6KsXXlABhXL9pnwl/JGlz4cguZD4kC6zRaJeLE9rLreMDWsz
 XBOUfS4DE4J2bpST0YGyfXzFJIyy13eGtrfAj/Q==
X-Google-Smtp-Source: AGHT+IGUxDpnfmOI+j4i7sET5B6iGTwPCxoZxCFPXJYFFkWMGwCKQTKuc3id2P0lUND+5DiDyxhNNJ4MNomLGxiA7Lo=
X-Received: by 2002:a17:906:f185:b0:a72:b1b1:eb3a with SMTP id
 a640c23a62f3a-a751447b093mr634755766b.19.1719954357446; Tue, 02 Jul 2024
 14:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
From: Amit Kucheria <amitk@kernel.org>
Date: Wed, 3 Jul 2024 02:35:45 +0530
X-Gmail-Original-Message-ID: <CAHLCerMuG92Sf8+BdqPLqh+x3YxBjD6YdYF2k+AxQcwCqerxzw@mail.gmail.com>
Message-ID: <CAHLCerMuG92Sf8+BdqPLqh+x3YxBjD6YdYF2k+AxQcwCqerxzw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Wed, 03 Jul 2024 06:53:34 +0000
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Pascal Paillet <p.paillet@foss.st.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Keerthy <j-keerthy@ti.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 11/22] dt-bindings: thermal: qcom-tsens:
 reference thermal-sensor schema
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

T24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgMzoxN+KAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBEZXZpY2UgaXMgYSB0aGVy
bWFsIHNlbnNvciBhbmQgaXQgcmVxdWlyZXMgJyN0aGVybWFsLXNlbnNvci1jZWxscycsIHNvCj4g
cmVmZXJlbmNlIHRoZSB0aGVybWFsLXNlbnNvci55YW1sIHRvIHNpbXBsaWZ5IGl0IGFuZCBicmlu
ZyB0aGUKPiBjb21tb24gZGVmaW5pdGlvbiBvZiAnI3RoZXJtYWwtc2Vuc29yLWNlbGxzJyBwcm9w
ZXJ0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBBbWl0IEt1Y2hlcmlhIDxhbWl0a0Br
ZXJuZWwub3JnPgoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Ro
ZXJtYWwvcWNvbS10c2Vucy55YW1sIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3Fjb20tdHNlbnMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3Fjb20tdHNlbnMueWFtbAo+IGluZGV4
IDk5ZDljNTI2YzBiNi4uY2NlNjYyNDIyOGM3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3Fjb20tdHNlbnMueWFtbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3Fjb20tdHNlbnMueWFtbAo+IEBA
IC0yMTcsMTggKzIxNywxNiBAQCBwcm9wZXJ0aWVzOgo+Cj4gICAgIiN0aGVybWFsLXNlbnNvci1j
ZWxscyI6Cj4gICAgICBjb25zdDogMQo+IC0gICAgZGVzY3JpcHRpb246Cj4gLSAgICAgIE51bWJl
ciBvZiBjZWxscyByZXF1aXJlZCB0byB1bmlxdWVseSBpZGVudGlmeSB0aGUgdGhlcm1hbCBzZW5z
b3JzLiBTaW5jZQo+IC0gICAgICB3ZSBoYXZlIG11bHRpcGxlIHNlbnNvcnMgdGhpcyBpcyBzZXQg
dG8gMQo+Cj4gIHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gaW50ZXJydXB0cwo+
ICAgIC0gaW50ZXJydXB0LW5hbWVzCj4gLSAgLSAiI3RoZXJtYWwtc2Vuc29yLWNlbGxzIgo+ICAg
IC0gIiNxY29tLHNlbnNvcnMiCj4KPiAgYWxsT2Y6Cj4gKyAgLSAkcmVmOiB0aGVybWFsLXNlbnNv
ci55YW1sIwo+ICsKPiAgICAtIGlmOgo+ICAgICAgICBwcm9wZXJ0aWVzOgo+ICAgICAgICAgIGNv
bXBhdGlibGU6Cj4gQEAgLTI5Miw3ICsyOTAsNyBAQCBhbGxPZjoKPiAgICAgICAgcmVxdWlyZWQ6
Cj4gICAgICAgICAgLSByZWcKPgo+IC1hZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiArdW5l
dmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+Cj4gIGV4YW1wbGVzOgo+ICAgIC0gfAo+Cj4gLS0K
PiAyLjQzLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
