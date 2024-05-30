Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF18D484B
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 11:21:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D5CDC6C859;
	Thu, 30 May 2024 09:21:59 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62624C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 09:21:52 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-794ab12341aso73739585a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 02:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717060911; x=1717665711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWN78EB24MX6Q0HZqErBr8t9tcr4nbKt3etlWVHkE68=;
 b=vSID+o9VTYW4PGlppyuAZqevbCIQSPicNVROBN/SxNQxKRAE+5dbQmbZ1cB+XEVFIE
 QxmnOin/doP9CaSsdWqHYc5bvPF9AAX+4O+I3+wGGCgy5DzE9mOyNiPuaTg8XDyfmAwA
 bdIh2zZ4/+kmLQzcZgawtaecyzBaWPUAOlkqg9bqrBMSSiNv5brVSGtcQRvOG4afxJO0
 ovpHRPVtSL3vtF63pHNEzUJxYSOvTrv+5IDrfFtQnCVmTRtYsI41zw3Pd+8ZzgUEw9jj
 zNdF1gtzYKIzHK/4gpEHPMrgksXqmrUuGIfp0GaS13VjhWFOjkBUvpKEuJQ6GuEEUZZG
 uREA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1wNoONild/lL5yOTGi8OQq5JFzxMVf84+CW5HtT6trKVZaRl+vISjZMCb7ZmJJuvWqOWEp2EV+A1sTaC+dYNy596KgdzaXFNl0YeqCAhbqU4at6IQUL7Q
X-Gm-Message-State: AOJu0Ywma0E8T9GvnfmUrg1jnXfmF+nMFE9/SsHqtcgLEaY3vRDRvejX
 N98Tf+O6hfucTaLDDjeaYktiA5vcRX50sPcu9T4UIP2w7Ye+X3R0DLJphlT4
X-Google-Smtp-Source: AGHT+IFnsLHNlbo5nfuGm6uMCqELqdq2efTMsjkSvbFLS3ELtXAP5O/36ETDGInlkkfXxRPHT8WB2g==
X-Received: by 2002:a05:6214:2b8e:b0:6ad:5b75:5227 with SMTP id
 6a1803df08f44-6ae0e75a35cmr21650106d6.5.1717060910669; 
 Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com.
 [209.85.222.176]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac070f05d5sm62544726d6.50.2024.05.30.02.21.50
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-794ab12341aso73738485a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 02:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXOLDH7N8ZwVUIgBrfR6b+jT+rC2nQWeE6T/wxl/oFINyVO+wGXqiz9hy4v6zCer34/s+xCdV7JE/b+KLKIpNowld4tt8vLThBxt85mgd+gtijcd4ISTWeo
X-Received: by 2002:a25:8c84:0:b0:dd1:6cad:8fd3 with SMTP id
 3f1490d57ef6-dfa5dcdc800mr946343276.27.1717060889311; Thu, 30 May 2024
 02:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
 <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
In-Reply-To: <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 11:21:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
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
 Heiko Stuebner <heiko@sntech.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
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

SGkgQW5keSwKCk9uIFRodSwgTWF5IDMwLCAyMDI0IGF0IDExOjAz4oCvQU0gQW5keSBTaGV2Y2hl
bmtvCjxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPiBNb24sIE1heSAxMywgMjAy
NCBhdCAwMTo1OTowM1BNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4ga2lyam9pdHRpOgo+ID4g
T24gU2F0LCBNYXkgNCwgMjAyNCBhdCAzOjE04oCvUE0gUGVuZyBGYW4gKE9TUykgPHBlbmcuZmFu
QG9zcy5ueHAuY29tPiB3cm90ZToKPiA+IFlvdSBtaXNzZWQgb25lIHRyaXZpYWwgY29udmVyc2lv
biwgcHJlc3VtYWJseSBiZWNhdXNlIG5vIGVycm9yIGhhbmRsaW5nCj4gPiBhbmQgdGh1cyBubyBv
Zl9ub2RlX3B1dCgpIGlzIGludm9sdmVkPwo+Cj4gTm90aGluZyBpcyBtaXNzZWQuIFRoZSBiZWxv
dyBpcyBhIHJlZHVuZGFudCBjaGFuZ2UuCj4KPiAuLi4KPgo+ID4gLSAgICAgICBmb3JfZWFjaF9j
aGlsZF9vZl9ub2RlKG5wLCBjaGlsZCkgewo+ID4gKyAgICAgICBmb3JfZWFjaF9jaGlsZF9vZl9u
b2RlX3Njb3BlZChucCwgY2hpbGQpIHsKPiA+ICAgICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVy
dHlfY291bnRfdTMyX2VsZW1zKGNoaWxkLCBSWk4xX1BJTlNfUFJPUCkgPiAwKQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgY291bnQrKzsKPiA+ICAgICAgICAgfQo+ID4KPiA+IElmIHlvdSBw
cmVmZXIgbm90IHRvIGluY2x1ZGUgdGhpcwo+Cj4gSSBwcmVmZXIgdGhpcyBub3QgdG8gYmUgaW5j
bHVkZWQgYXMgaXQgd2lsbCBnaXZlIGEgbWlzbGVhZGluZyBzaWduYWxzIHRvIHRoZQo+IHVzZSBv
ZiB0aGUgb3JpZ2luYWwgQVBJKHMpLgoKVGhhbmsgeW91IGZvciByZW1pbmRpbmcgbWUgdG8gc2Vu
ZCB0aGlzIG91dCBhcyBhIHNlcGFyYXRlIHBhdGNoIDotKQoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci9jMGEyOGY0NjZjNDJkNWQ1OWM3ZmFkZmExZmQwNWZkNTEyZDQzYjZmLjE3MTcwNjA3MDgu
Z2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
