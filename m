Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 034AA8D4B28
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 13:57:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD6F4C6C859;
	Thu, 30 May 2024 11:57:37 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1359C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 11:57:29 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-43fab2fa4ccso3914181cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 04:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717070247; x=1717675047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UjHdVTNPfpZSE5mw/0S4dwLQIRvAN8JureryKLiLrHw=;
 b=dQOHvY3vV/YG9Xx6j3vKlQb9jHSbfq7meyN/0IKLR794G53ikjvrnlBJYtOAn1fls9
 7VXRGny90SIBWynr/tOMIV5kZh0Mt5CKQH9bhRN1lxAECpC67ITMF8WwOO0z3kfQD7UU
 QH/6jDtsVBfKcAELso9t4DLjurwixjBLEbCpFr1IDVmLUwe6yTrHkb5I+2NblvbcNirX
 vkkala0nl+kU9Lo0jdxdZrbw1LkiNA97uTeWnXphFb+/mAKXQa1ZYvJ1D3D+DI1LVkUt
 BbYrk2riN2C4f8B5UY5zbe1+JcCtFP5VS0ywbj70r5TjD0xWnFtg3fn8Pwd+Q21FiMB/
 8z9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwGJI/1f+N7+AC+wSVa8ICF3NdBE78SmyQx285MGGYkvSngWlKBJ+Z+SSJvPZqCZWPKVv5lTGbY1YwNluS+cpT6gvSlnDb8N6P5TXdsWuYI/FLpYoDbA3H
X-Gm-Message-State: AOJu0YzARRMqxUM3EwftN6twXWta5oynwTecdvXfq6zzoa6DGqkKLl7z
 BZ1uZIpS8tXLN+65vhGEB1AL+teJsCIkcTQOuelId37I378ZTW2Ivyvkq5mj
X-Google-Smtp-Source: AGHT+IFaOB9u6kkySBB2Ad6A4YE+Ne8bWQ/QIVflEbx5pxOH3hgzh3Ny/ys38ZAkbon1IZIvS2frYw==
X-Received: by 2002:a05:622a:54b:b0:43a:8353:775c with SMTP id
 d75a77b69052e-43fe92a322fmr23553231cf.2.1717070247245; 
 Thu, 30 May 2024 04:57:27 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com.
 [209.85.222.180]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb16b7966sm65054951cf.10.2024.05.30.04.57.26
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 04:57:27 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-794ba2d4601so58578985a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 04:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWpzREMz0ACNKCZpVNS0Ixhmzey/emkbw6QKtRyhk6KadNOMFTc9FDisnPGKgOP8R6RNbKM4uqwlM8G2sVNB0aGkpvpvs5CRD8+zlmqSmit1n8ZbUwdO4w5
X-Received: by 2002:a25:6842:0:b0:dfa:48f3:2253 with SMTP id
 3f1490d57ef6-dfa5a619bd3mr2110161276.32.1717070226150; Thu, 30 May 2024
 04:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 13:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Chunyan Zhang <zhang.lyra@gmail.com>, openbmc@lists.ozlabs.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/20] pinctrl: Use scope based
	of_node_put() cleanups
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

SGkgUGVuZywKCk9uIFNhdCwgTWF5IDQsIDIwMjQgYXQgMzoxMuKAr1BNIFBlbmcgRmFuIChPU1Mp
IDxwZW5nLmZhbkBvc3MubnhwLmNvbT4gd3JvdGU6Cj4gVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVf
cHV0KCkgdG8gc2ltcGxpZnkgY29kZS4gSXQgcmVkdWNlcyB0aGUgY2hhbmNlCj4gb2YgZm9yZ2V0
dGluZyBvZl9ub2RlX3B1dCgpLCBhbmQgYWxzbyBzaW1wbGlmaWVzIGVycm9yIGhhbmRsaW5nIHBh
dGguCj4gSSBub3QgYWJsZSB0byB0ZXN0IHRoZSBjaGFuZ2VzIG9uIGFsbCB0aGUgaGFyZHdhcmVz
LCBzbyBkcml2ZXIgb3duZXJzLAo+IHBsZWFzZSBoZWxwIHJldmlldyB3aGVuIHlvdSBoYXZlIHRp
bWUuCj4KPiBUaGlzIHBhdGNoc2V0IHdhcyBpbnNwaXJlZCBmcm9tIERhbidzIGNvbW1lbnRzIG9u
IHBpbmN0cmwtc2NtaS1pbXguYywKPiB0aGFua3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZh
biA8cGVuZy5mYW5AbnhwLmNvbT4KCkFuZHkncyBxdWVzdGlvbiBhYm91dCBjb2RlIGdlbmVyYXRp
b24gb24gYSByZWxhdGVkIHBhdGNoIG1hZGUgbWUKd29uZGVyLCB0b28uCgpPbiBhcm0zMiwgYSBj
b252ZXJzaW9uIHRvIGZvcl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKCkgc2VlbXMgdG8KY29z
dCBjYS4gNDggYnl0ZXMgb2YgYWRkaXRpb25hbCBjb2RlLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIg
dGhlcmUgd2VyZQpleHBsaWNpdCBjbGVhbnVwcyBiZWZvcmUgb3Igbm90LgoKSSBjaGVja2VkICJw
aW5jdHJsOiByZW5lc2FzOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcyIs
CmFuZCBhbGwgYnV0IHRoZSBjb252ZXJzaW9ucyBpbiAqX2R0X25vZGVfdG9fbWFwKCkgY29zdCA0
OCBieXRlcyBlYWNoLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
