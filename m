Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D48C4045
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 13:59:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22717C640E5;
	Mon, 13 May 2024 11:59:47 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12F00C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 11:59:40 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5b277e17e15so2353874eaf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 04:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715601578; x=1716206378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z24B9qDTJHEobEGC/70CrM/eVAoUVzOxiy7onUzGbVU=;
 b=f1iRJo37VswECbcoGN6H2iQkToEpE2O9+MV5IxVr71tTZw+hY9JCtB4nDftrOhh1gS
 P5bVmObukGiuH8YU9HEVIF+D6Ldzfu5en7Qyj26SkCQ4l3TZL8bx83mQ28AgMCFjfwwK
 KP7YYpX1awodstp5RLCLhXjRf2DNzM/wQpDqd9W0myzxophJkYCfoTcPDMy/y2uj5plh
 ldyrbM1ZNDlbuRs2h7oI9j/mG1dSR/cU7NTeI78dta6tflaUkBlMlFUY2FhmJr6/7fTe
 yIjvgW5Y1TZiC92l77KyFyla71+6UAHUfZGcUIRLGy/2z27yS9xhAt0tkK5TbY/Aa7oa
 xqJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnWDZ7i/SQUIth9XVC+9Ze/QJ3j1YgFlkjrssuMeprFrDHvtMaRKOIgxEJr2R8TXovPsVtPlBQz/ObSH1QVLHt+mlmVwaf4qe/IeSam9rFEXPHekwVLMjz
X-Gm-Message-State: AOJu0YzfWt7e6myvVOCHmV2aasOM9f66dY/+KZa68v8b44ip6Eni8ZE6
 3QGE77vTSuryQKc+ortLbsgfotY3oVwGoJgokvoBZfX8dAnMwwl7LWLvLIpr
X-Google-Smtp-Source: AGHT+IHa2TCkn580zboF0ZFBlyORqerr1Tyk+in+I5ERuH4/KdwDu6k4QjFPWVIK0WaFvAscZM86BA==
X-Received: by 2002:a05:6358:12a6:b0:17e:bb98:4879 with SMTP id
 e5c5f4694b2df-193baee5974mr1048879155d.3.1715601578134; 
 Mon, 13 May 2024 04:59:38 -0700 (PDT)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com.
 [209.85.210.174]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6340a449faasm7545585a12.10.2024.05.13.04.59.36
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 04:59:36 -0700 (PDT)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6f450f43971so3522890b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 04:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMzMJ/8aO+jZq3nR7RJYXnXSgUBFOGqIBl+6N7CCskXbe2WCGxtZdhInX2BtZDlOCiCru1hbj6/UAqKPbxl8qWCVVTEO2dEZKJgwKSK3PRd1xKganIIgST
X-Received: by 2002:a25:d048:0:b0:dcd:551f:1e2 with SMTP id
 3f1490d57ef6-dee4f3694bbmr8978126276.34.1715601555547; Mon, 13 May 2024
 04:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 13:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
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

SGkgUGVuZywKCk9uIFNhdCwgTWF5IDQsIDIwMjQgYXQgMzoxNOKAr1BNIFBlbmcgRmFuIChPU1Mp
IDxwZW5nLmZhbkBvc3MubnhwLmNvbT4gd3JvdGU6Cj4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFu
QG54cC5jb20+Cj4KPiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwIHRvIHNp
bXBsaWZ5IGNvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNv
bT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVz
YXMvcGluY3RybC1yem4xLmMKPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJs
LXJ6bjEuYwoKWW91IG1pc3NlZCBvbmUgdHJpdmlhbCBjb252ZXJzaW9uLCBwcmVzdW1hYmx5IGJl
Y2F1c2Ugbm8gZXJyb3IgaGFuZGxpbmcKYW5kIHRodXMgbm8gb2Zfbm9kZV9wdXQoKSBpcyBpbnZv
bHZlZD8KCkBAIC03MzcsMTMgKzczNywxMiBAQCBzdGF0aWMgaW50IHJ6bjFfcGluY3RybF9wYXJz
ZV9ncm91cHMoc3RydWN0CmRldmljZV9ub2RlICpucCwKCiBzdGF0aWMgaW50IHJ6bjFfcGluY3Ry
bF9jb3VudF9mdW5jdGlvbl9ncm91cHMoc3RydWN0IGRldmljZV9ub2RlICpucCkKIHsKLSAgICAg
ICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkOwogICAgICAgIGludCBjb3VudCA9IDA7CgogICAg
ICAgIGlmIChvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMobnAsIFJaTjFfUElOU19QUk9QKSA+
IDApCiAgICAgICAgICAgICAgICBjb3VudCsrOwoKLSAgICAgICBmb3JfZWFjaF9jaGlsZF9vZl9u
b2RlKG5wLCBjaGlsZCkgeworICAgICAgIGZvcl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKG5w
LCBjaGlsZCkgewogICAgICAgICAgICAgICAgaWYgKG9mX3Byb3BlcnR5X2NvdW50X3UzMl9lbGVt
cyhjaGlsZCwgUlpOMV9QSU5TX1BST1ApID4gMCkKICAgICAgICAgICAgICAgICAgICAgICAgY291
bnQrKzsKICAgICAgICB9CgpJZiB5b3UgcHJlZmVyIG5vdCB0byBpbmNsdWRlIHRoaXMsIEkgd2ls
bCBzZW5kIGEgc21hbGwgcGF0Y2ggbXlzZWxmIGxhdGVyLgoKR3J7b2V0amUsZWV0aW5nfXMsCgog
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
CkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
