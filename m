Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF569E996
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Feb 2023 22:38:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A88EC6A5F8;
	Tue, 21 Feb 2023 21:38:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8573C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 21:38:24 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id cq23so22504174edb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 13:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2x4QxJv4nKAQD6nmh3v1P/gvRFcvPZ/+reUMK1IHmk=;
 b=hvcbbxjHy3yfhZZaSoQ20ukzgEnIfEyrMlnC1c8Mj23mZ7Z3onoLj/8XHMhGA9BGdj
 2e55K/WV6r5hQDtRQOvv6Luyw8hQYXkV9vDaxVFsHD77eysOg2nkgkw+/JjpTCkAeFBN
 lznssBgKnma18h7wVh5jhzY5IReazXSbGL9j8s7utXvSkeXZmD8s6kMSM7EcRgZLCYyG
 yYnuxUfUfSGSdRy10QjagUJAF3urpw1t3CZN0Gk6ajP79qxMM1PpbRMsSgckdZqlRUJa
 cllc8OuefC+uCPx2sarqRn+81n7w22uOi37fJj34mGr+UEKjzYlRxX8OQjb0wgqBB63z
 ZHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g2x4QxJv4nKAQD6nmh3v1P/gvRFcvPZ/+reUMK1IHmk=;
 b=FoSBJzB/RzfEKqXhFaskF+Y/bsZDLzhV4F2lt9IxRntuT39jLfkWRY/S/Mh3DNAt3t
 YvgCywMaWDZ62lbDQV72C1gznOERu+9OSWevIDafr0tCqYpolgS6+A80cxCnn0kICNZW
 wmmkdpKoNMJZtkysebFsbJ5hHY1B2r+eqBGZCtkZQZxwJ9eZ12WFaafWNfRlQvyPsk68
 4pBkTM3UTK7ZafjGHNSl7UFsrQaKgCm6PwBgyBcjwW2UVs/zO8yhNY+WTTIf1g24h2Yv
 RVUO9C0oIOrUgHdkdNiIooWO7iCHl8ZeJuzPmex4QQyDRMuXcZHo0yr9BbMcL9mxYnCb
 opdw==
X-Gm-Message-State: AO0yUKUaMEvH68l5FQHxcqNu+/te4x4v3VucLphr/N/QeEofuLkP0NKR
 9iZ9GIibjegSzOWr0yeJj7rde8zDSSvMV1n5vTY=
X-Google-Smtp-Source: AK7set+WgWx80yG+IPD6BZtc2LM511WxHd/1uNy9RyymaByA5DzDe9ltu/NxF8DAR1dqIEJxGGjio8OxlPTpsYlt4UQ=
X-Received: by 2002:a17:907:3d91:b0:8af:2e89:83df with SMTP id
 he17-20020a1709073d9100b008af2e8983dfmr13559381ejc.6.1677015504149; Tue, 21
 Feb 2023 13:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20230221145021.31993-1-zajec5@gmail.com>
In-Reply-To: <20230221145021.31993-1-zajec5@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 Feb 2023 22:38:13 +0100
Message-ID: <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Evgeniy Polyakov <zbr@ioremap.net>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Richard Weinberger <richard@nod.at>, Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] nvmem: add explicit config option to read
	OF fixed cells
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

SGVsbG8gUmFmYcWCLAoKT24gVHVlLCBGZWIgMjEsIDIwMjMgYXQgMzo1MCBQTSBSYWZhxYIgTWnF
gmVja2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tp
IDxyYWZhbEBtaWxlY2tpLnBsPgo+Cj4gTlZNRU0gc3Vic3lzdGVtIGxvb2tzIGZvciBmaXhlZCBO
Vk1FTSBjZWxscyAoc3BlY2lmaWVkIGluIERUKSBieQo+IGRlZmF1bHQuIFRoaXMgYmVoYXZpb3Vy
IG1hZGUgc2Vuc2UgaW4gZWFybHkgZGF5cyBiZWZvcmUgYWRkaW5nIHN1cHBvcnQKPiBmb3IgZHlu
YW1pYyBjZWxscy4KPgo+IFdpdGggZXZlcnkgbmV3IHN1cHBvcnRlZCBOVk1FTSBkZXZpY2Ugd2l0
aCBkeW5hbWljIGNlbGxzIGN1cnJlbnQKPiBiZWhhdmlvdXIgYmVjb21lcyBub24tb3B0aW1hbC4g
SXQgcmVzdWx0cyBpbiB1bm5lZWRlZCBpdGVyYXRpbmcgb3ZlciBEVAo+IG5vZGVzIGFuZCBtYXkg
cmVzdWx0IGluIGZhbHNlIGRpc2NvdmVyeSBvZiBjZWxscyAoZGVwZW5kaW5nIG9uIHVzZWQgRFQK
PiBwcm9wZXJ0aWVzKS4KSSBhbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUgcmVjZW50IGNoYW5nZXMg
YXJvdW5kIGR5bmFtaWMgY2VsbHMuCklzIHRoZXJlIGFueSBkaXNjdXNzaW9uL3N1bW1hcnkgdGhh
dCBJIGNhbiByZWFkIHRvIGdldCB1cCB0byBzcGVlZD8KCk15IG1haW4gdGhvdWdodCBpczogaWYg
dGhlcmUgYXJlIG1hbnkgImZpeGVkIE9GIGNlbGxzIiBpbXBsZW1lbnRhdGlvbnMKYW5kIG9ubHkg
YSBmZXcgImR5bmFtaWMiIG9uZXMgLSBkb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gZmxpcCB0aGUgbG9n
aWMKYW5kIGludHJvZHVjZSBhIG5ldyAidXNlX2R5bmFtaWNfb2ZfY2VsbHMiIGZsYWcgaW5zdGVh
ZD8KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
