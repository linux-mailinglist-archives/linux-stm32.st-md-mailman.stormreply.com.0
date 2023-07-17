Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 269BB755D2E
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jul 2023 09:43:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F20C6B452;
	Mon, 17 Jul 2023 07:43:48 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 732D3C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 07:43:47 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-76714d3c3a7so447352685a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 00:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689579826; x=1692171826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LWJf53shp0viE9TAbmwOxmgVvdOZl/M9mic33WO7Jo=;
 b=ROrf+GrJOZdrroRat9Bp5wMvW+WGMVhywE3Ut/TFbLNWzKL/7+xT6Ol6r1bdtyqHIt
 A08uAnPO2TzSX22vJr+H2P6D/ob08XYUShrKPGSfZ8cB2e/bHfD8hbzlUiKFRLIRLyk+
 7Gzn33mfj/hKhi6B9IZo4RXRfdEhD6WI2nafJ7ZuGzpXKlAoEVEFAP5uy4nux5GkQsjA
 RrZTp8UR5NEe+zWLsY+vGTcoLAKJrVebIHcyYkP2CjmWFx5qsLxX8f61aEdCe85fG4r2
 oVsNIjDDuw22SJlbDJSALoGe+VxR+b0Es73gAAd+DctL1JNfGlMbYdEcLX+YPhtLfX2C
 v5Ew==
X-Gm-Message-State: ABy/qLb8IzCdZan24gzRo0+NztlNKssbKvTF778BgWAVK/+/BvKerd5V
 WdIWPl9fJDdBgNdM6/m8n9NgSPN9Tz5A/A==
X-Google-Smtp-Source: APBJJlHFCA2gH3YfAeN6VWiqBZn5QG9QzDE/sQbvVxjSLUf48gX3TD3GH192lrv8i7o63neIDQw96w==
X-Received: by 2002:a37:b683:0:b0:768:125b:2b94 with SMTP id
 g125-20020a37b683000000b00768125b2b94mr5224543qkf.78.1689579825938; 
 Mon, 17 Jul 2023 00:43:45 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 p13-20020ae9f30d000000b007672e3348edsm5912265qkg.108.2023.07.17.00.43.45
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 00:43:45 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-403c8c48255so36202321cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 00:43:45 -0700 (PDT)
X-Received: by 2002:a25:2945:0:b0:c21:caaf:bd47 with SMTP id
 p66-20020a252945000000b00c21caafbd47mr10530962ybp.2.1689579804817; Mon, 17
 Jul 2023 00:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 09:43:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOUAPoBcSqHLTCKh8_PqyAiuGFEXedEPS48X=oc8SqDA@mail.gmail.com>
Message-ID: <CAMuHMdUOUAPoBcSqHLTCKh8_PqyAiuGFEXedEPS48X=oc8SqDA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-sunxi@lists.linux.dev,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, Chester Lin <clin@suse.com>,
 linux-gpio@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, soc@kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>,
 linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: Explicitly include correct DT
	includes
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo1MuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IFRoZSBEVCBvZl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRl
IGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0IGFz
IG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiBBcyBwYXJ0IG9mIHRoYXQg
bWVyZ2UgcHJlcHBpbmcgQXJtIERUIHN1cHBvcnQgMTMgeWVhcnMgYWdvLCB0aGV5Cj4gInRlbXBv
cmFyaWx5IiBpbmNsdWRlIGVhY2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2Rl
dmljZS5oCj4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdzIGEgcHJldHR5IG11Y2ggcmFu
ZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gZmlsZXMgdXNlZCB0aHJvdWdob3V0IHRoZSB0cmVl
LiBJbiBvcmRlciB0byBkZXRhbmdsZSB0aGVzZSBoZWFkZXJzIGFuZAo+IHJlcGxhY2UgdGhlIGlt
cGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0bwo+
IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVjdCBpbmNsdWRlcy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cgo+ICBkcml2ZXJzL3BpbmN0cmwvcmVu
ZXNhcy9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9waW5j
dHJsL3JlbmVzYXMvcGluY3RybC1yemExLmMgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgZHJp
dmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemEyLmMgICAgICAgICAgICAgICAgIHwgMyAr
Ky0KPiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jICAgICAgICAgICAg
ICAgIHwgMyArKy0KPiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yenYybS5jICAg
ICAgICAgICAgICAgIHwgMyArKy0KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
