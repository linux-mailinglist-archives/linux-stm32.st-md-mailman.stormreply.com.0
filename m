Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 972707547EF
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Jul 2023 11:26:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48E9FC6B444;
	Sat, 15 Jul 2023 09:26:52 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E88FC6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jul 2023 09:26:51 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-1b056276889so2090124fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jul 2023 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689413210; x=1692005210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHphB4LnIXM8B5KTzxaE1knTLhvmv4UUsDUmEXJtUjc=;
 b=KNtkg40Donc1RJ+Y/N6bMmujMSl9cywEa6fXVSQYqV4W4lT8G1IFlO5DKCTqezy9NY
 lefwY54PRhNWProidCgY7SJny7AEfavu3g+BjFgAL5dZzNMIElbAwgo4QZnm4OLwjy+V
 CVJWSo1L7gWOhYkpGKP0r9oukax6+UlfkfofBx8xxPcLUf3ek7zbTjABn/JHDdvTWXCu
 WWDX31kpkxyfmd7Q/WE+0i7y3grMAoIl2p8ABV+V0g6ZwAueUBzPNbjvXwLF4/1Voo58
 THpoQ4ecU8W2lHElPdLC420Acx2PDSK/3KkrYlQGhj1Cbwmy3bV4wSFCbbKfSoIqtJyV
 8cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689413210; x=1692005210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHphB4LnIXM8B5KTzxaE1knTLhvmv4UUsDUmEXJtUjc=;
 b=Rw1hoz8o4PPLeBUQ6QBV6bqjxLoRY9W00pOrhQsxY/ejRcaryboireK8MrbuXbWLsY
 bj4VavhFn4KlMMWQ+xCRbhhKN0DnTGUBKDGdXX4ZbzqRZzSTpLLWOp5BK/14YKIUiDkp
 DxMtAGpGnDiwmbFhSDNB+1xZXvJ1G3Wu1jUk4Z/LSWeWWh8jUvyc1KcUZ/OvAkxkaU4O
 YHkhM+oJSXU3uoMd3UqgoNEfckXSZ6X7xkBoPABUKunZ2R2vu9l2kWDcTvCNnC8nRf1A
 ztSqHHe6WpHNJ7CtFB6lYBPF7g6pXUINqDDESo5pdN8vgEwTHenbcyEeEMWB5TWkHQ5b
 cGSw==
X-Gm-Message-State: ABy/qLZzPmL3iLoYLMfqd+YYp+KqkSWYwHwt6l2cgLvUT2rST8kNV6QM
 V1DZxbcYxoG1p7iU2CCm+2AzqSHVLYWGk2RTIuM=
X-Google-Smtp-Source: APBJJlGwdJmxyzGjSGIAgoqFi7CGlWiMJBmcsPBzo9lxW5BLyYxxPOYfHlixbBaupkZxkAV8b0mEWpZJ8j8VMX6oWRI=
X-Received: by 2002:a05:6870:328d:b0:177:a158:9ef6 with SMTP id
 q13-20020a056870328d00b00177a1589ef6mr6679986oac.52.1689413209848; Sat, 15
 Jul 2023 02:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174841.4061919-1-robh@kernel.org>
In-Reply-To: <20230714174841.4061919-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 15 Jul 2023 11:26:38 +0200
Message-ID: <CAMhs-H-6tAV-+U-4zZDKs47eKCJr+kZ-Op8vR4SyJyE5LK_2aw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, devicetree@vger.kernel.org,
 Al Cooper <alcooperx@gmail.com>, dri-devel@lists.freedesktop.org,
 Justin Chen <justin.chen@broadcom.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Alban Bedel <albeu@free.fr>,
 Alim Akhtar <alim.akhtar@samsung.com>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-phy@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Yu Chen <chenyu56@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-can@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 linux-samsung-soc@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, JC Kuo <jckuo@nvidia.com>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [Linux-stm32] [PATCH] phy: Explicitly include correct DT
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo0OeKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gVGhlIERUIG9mX2RldmljZS5oIGFuZCBvZl9wbGF0Zm9ybS5oIGRh
dGUgYmFjayB0byB0aGUgc2VwYXJhdGUKPiBvZl9wbGF0Zm9ybV9idXNfdHlwZSBiZWZvcmUgaXQg
YXMgbWVyZ2VkIGludG8gdGhlIHJlZ3VsYXIgcGxhdGZvcm0gYnVzLgo+IEFzIHBhcnQgb2YgdGhh
dCBtZXJnZSBwcmVwcGluZyBBcm0gRFQgc3VwcG9ydCAxMyB5ZWFycyBhZ28sIHRoZXkKPiAidGVt
cG9yYXJpbHkiIGluY2x1ZGUgZWFjaCBvdGhlci4gVGhleSBhbHNvIGluY2x1ZGUgcGxhdGZvcm1f
ZGV2aWNlLmgKPiBhbmQgb2YuaC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0dHkgbXVjaCBy
YW5kb20gbWl4IG9mIHRob3NlIGluY2x1ZGUKPiBmaWxlcyB1c2VkIHRocm91Z2hvdXQgdGhlIHRy
ZWUuIEluIG9yZGVyIHRvIGRldGFuZ2xlIHRoZXNlIGhlYWRlcnMgYW5kCj4gcmVwbGFjZSB0aGUg
aW1wbGljaXQgaW5jbHVkZXMgd2l0aCBzdHJ1Y3QgZGVjbGFyYXRpb25zLCB1c2VycyBuZWVkIHRv
Cj4gZXhwbGljaXRseSBpbmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9waHkv
cmFsaW5rL3BoeS1tdDc2MjEtcGNpLmMgICAgICAgICAgICAgICAgICAgfCAzICstLQoKQWNrZWQt
Ynk6IFNlcmdpbyBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNvbT4KClRo
YW5rcywKICAgIFNlcmdpbyBQYXJhY3VlbGxvcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
