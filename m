Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0AD8C4C5F
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 08:36:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE0C2C6B476;
	Tue, 14 May 2024 06:36:29 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECC9BC5E2D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 06:36:22 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6209e8a0386so43029447b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 23:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715668578; x=1716273378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SyXm2XZJp7cQccvVHsZwFRorrc4lUY+2faX/WPeRScc=;
 b=rIA50EG48DDVdJjR+2DqKeZSz+/9XEiz3LZqerIvoo8zQcN8CKozx4kJkwQebWOZtu
 p41Kfxz+zwwvrlUjW4Br0SbDZDaAs2T1Oxbn0Pa/Tfg9hgA2nqfBXpENnKh+8/q9/mKk
 MVodlvJrT7qbVxsN/uZlosWgkMHqblMwbG2sPRsijp4Qj5xCnCuP+fqwmHSwTXAvSeWt
 dyOxZQT0FyFXUgq/NDGdvpBPXpwZA9PY9VDD2ebVfDo2t0pvxY7B12wsuIVZiWK6pTaa
 pISDxxNaQEKnPgddm31mH/rmUFXuWyudxuEWDdDjDzD9vk0pc8JBdASro5tzyYDXyhON
 FC0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1RSdOllMuUTBMKJACSYNXeYcoY96IW7Ve5fH5iLQ/EtRmBw2aAqOY7sR8UJK25Vy6oYcj6YeDPQmFMQCFz0r0ZQDohNeGRRk8pKrwIuZWa6iBqGe28SBl
X-Gm-Message-State: AOJu0YzFNAbdUjI0wjheZ5I3BT8pbDQyS+z+bk27KEvkI9/361cyBYq6
 VhfudabJgAXUsozhdY+PMjEzZIl62W1qSZvFTBQeVWQwy792wMgL97a3UYHQ
X-Google-Smtp-Source: AGHT+IEaETvUX7RfTSsppH3BPXnsZl7IwaRwmut9MEDSiMR5o+i1dz0sbA53PI9kLZQ3jzFuWWbGpw==
X-Received: by 2002:a81:490d:0:b0:61a:eabf:742 with SMTP id
 00721157ae682-622b001cd7dmr164572207b3.43.1715668578590; 
 Mon, 13 May 2024 23:36:18 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6209e26ae7esm24357947b3.57.2024.05.13.23.36.18
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 23:36:18 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-de60a51fe21so5198149276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 23:36:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWjNiMlT+VkKEV+hav+7vo3Zc2fzUOB+To2L0Z8yiqcw+njx4uw4FDNZovJIX9Fmzl8CKQPwNYPh6Lg/zzvsU/FIGYkIsv1jCy0bQeyuWmCS1cQd4A2PeiR
X-Received: by 2002:a5b:f48:0:b0:de5:567b:88f with SMTP id
 3f1490d57ef6-dee4f31a205mr14563293276.10.1715668557234; 
 Mon, 13 May 2024 23:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
 <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
In-Reply-To: <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 08:35:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 07/20] pinctrl: renesas: Use scope
	based of_node_put() cleanups
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

SGkgTGludXMsCgpPbiBNb24sIE1heSAxMywgMjAyNCBhdCAxMDo1MeKAr1BNIExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBNYXkgMTMsIDIw
MjQgYXQgMTo1OeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+ID4gT24gU2F0LCBNYXkgNCwgMjAyNCBhdCAzOjE04oCvUE0gUGVuZyBGYW4gKE9T
UykgPHBlbmcuZmFuQG9zcy5ueHAuY29tPiB3cm90ZToKPiA+ID4gRnJvbTogUGVuZyBGYW4gPHBl
bmcuZmFuQG54cC5jb20+Cj4gPiA+Cj4gPiA+IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgp
IGNsZWFudXAgdG8gc2ltcGxpZnkgY29kZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGVu
ZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Cj4gPgo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+
ID4KPiA+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPgo+ID4gQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+Cj4KPiBEb2VzIHRoaXMgZ28gaW50byB0aGUgUmVuZXNhcyBwYXRjaCBzdGFjaz8K
Pgo+IEkgdGhpbmsgdGhlIHBhdGNoIHN0YW5kcyBmaW5lIHdpdGhvdXQgdGhlIHJlc3Qgb2YgdGhl
IHNlcmllcy4KClN1cmUsIEkgY2FuIGRvIHRoYXQuCkZyb20geW91ciBwb3NpdGl2ZSByZXNwb25z
ZSB0byB2MSwgSSB0aG91Z2h0IHRoYXQgcGVyaGFwcyB5b3UganVzdAp3YW50ZWQgdG8gdGFrZSB0
aGUgZnVsbCBzZXJpZXMgeW91cnNlbGY/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
