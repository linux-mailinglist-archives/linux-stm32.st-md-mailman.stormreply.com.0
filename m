Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 125488D5B39
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 09:07:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B41D3C6DD72;
	Fri, 31 May 2024 07:07:13 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF4FBCFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 07:07:06 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-6f8ea563a46so1011665a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 00:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717139225; x=1717744025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayp9OTJcx8xBTEOWGr76ffez+fesdX+4XqGBVIDxEaQ=;
 b=c3bIz3wZc+WlcQAVrgEZZzib/blPaLuYyRdVrV/zUNxEYsPdxVZOEZ7fbqyTIHVjne
 RSe4W1GhfVIdN1jdbVertbLQ1zxUxc29agM0iDnbT5zdumfqJsVfYWJmAX3SSA9sgjn3
 fZG3dkPtAnQByq7CQ0O7Ae9N7MLp+CblU7GQsBSd4cY4kXpgEqg3XfIb449gTPS0G2JH
 rq5MczzuaMtNm4kIQd1aoN5VpM17AA+B8sied7n6+gzbdtlwrw/Cn7Xh+eGiU3n1F4fT
 S+CXV92Qpvt+gr/K0qhEu2CziXSQVDVbnTHQOxeThCZIjeBFzDbd0CVzVjvH7CO8qFFG
 vwtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi8vax47HGpq+676naHCXP/oKkoZNkHlIxMWBlH0ZnJfVSZwmkKdwdlpwTcOE8b7NHRfdws2enzS4Xl4x8qykZiE6r3znfEdE9MlvswhnOz89dWiBHqIhl
X-Gm-Message-State: AOJu0Yy3mokpslCLq6XDR5d6ssP9lE4NxhE1zhlCFww2ixt+A1PnobrP
 DSHUdv94MmkfIxuZdhhxuCCvCDnmYc5ar8uwutdWNP8laLqF3Pwjaim/0ZpH
X-Google-Smtp-Source: AGHT+IEgwfsFMyWTalKFkfeObfUuRPOePAUyAURrt+6/UtbCueA3xN8qxB6XciLDi9XUyDDm2ZmaAw==
X-Received: by 2002:a05:6830:1306:b0:6f0:6420:35cb with SMTP id
 46e09a7af769-6f911fb562amr1120405a34.29.1717139224535; 
 Fri, 31 May 2024 00:07:04 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com.
 [209.85.160.48]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-6f9105a9243sm258889a34.75.2024.05.31.00.07.04
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 00:07:04 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-24c9f9f52fdso938985fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 00:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXaD4X1MlkcS/GK2xUi/zpxQOtlRnI//sdkxALsXMqVn5P44qYHRR1PwtRHEmiLumIM9qN7i6lVm0W19XjcGPVHruboY0yr2NVIc3VuaMdbAeTptLMneR2S
X-Received: by 2002:a25:5f46:0:b0:df4:f149:1fc7 with SMTP id
 3f1490d57ef6-dfa73dc4a2dmr974775276.58.1717139203004; Fri, 31 May 2024
 00:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
 <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 May 2024 09:06:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 "Ghennadi Procopciuc \(OSS\)" <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Aisheng Dong <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Wells Lu <wellslutw@gmail.com>,
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

SGkgUGVuZywKCk9uIEZyaSwgTWF5IDMxLCAyMDI0IGF0IDU6MDfigK9BTSBQZW5nIEZhbiA8cGVu
Zy5mYW5AbnhwLmNvbT4gd3JvdGU6Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAwLzIwXSBw
aW5jdHJsOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKQo+ID4gY2xlYW51cHMKPiA+IE9u
IFNhdCwgTWF5IDQsIDIwMjQgYXQgMzoxMuKAr1BNIFBlbmcgRmFuIChPU1MpIDxwZW5nLmZhbkBv
c3MubnhwLmNvbT4KPiA+IHdyb3RlOgo+ID4gPiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQo
KSB0byBzaW1wbGlmeSBjb2RlLiBJdCByZWR1Y2VzIHRoZSBjaGFuY2UKPiA+ID4gb2YgZm9yZ2V0
dGluZyBvZl9ub2RlX3B1dCgpLCBhbmQgYWxzbyBzaW1wbGlmaWVzIGVycm9yIGhhbmRsaW5nIHBh
dGguCj4gPiA+IEkgbm90IGFibGUgdG8gdGVzdCB0aGUgY2hhbmdlcyBvbiBhbGwgdGhlIGhhcmR3
YXJlcywgc28gZHJpdmVyIG93bmVycywKPiA+ID4gcGxlYXNlIGhlbHAgcmV2aWV3IHdoZW4geW91
IGhhdmUgdGltZS4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaHNldCB3YXMgaW5zcGlyZWQgZnJvbSBE
YW4ncyBjb21tZW50cyBvbiBwaW5jdHJsLXNjbWktaW14LmMsCj4gPiA+IHRoYW5rcy4KPiA+ID4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Cj4gPgo+ID4g
QW5keSdzIHF1ZXN0aW9uIGFib3V0IGNvZGUgZ2VuZXJhdGlvbiBvbiBhIHJlbGF0ZWQgcGF0Y2gg
bWFkZSBtZSB3b25kZXIsCj4gPiB0b28uCj4gPgo+ID4gT24gYXJtMzIsIGEgY29udmVyc2lvbiB0
byBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlX3Njb3BlZCgpIHNlZW1zIHRvIGNvc3QgY2EuCj4gPiA0
OCBieXRlcyBvZiBhZGRpdGlvbmFsIGNvZGUsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGVyZSB3
ZXJlIGV4cGxpY2l0Cj4gPiBjbGVhbnVwcyBiZWZvcmUgb3Igbm90Lgo+ID4KPiA+IEkgY2hlY2tl
ZCAicGluY3RybDogcmVuZXNhczogVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51
cHMiLCBhbmQgYWxsCj4gPiBidXQgdGhlIGNvbnZlcnNpb25zIGluICpfZHRfbm9kZV90b19tYXAo
KSBjb3N0IDQ4IGJ5dGVzIGVhY2guCj4KPiBJIGFtIG5vdCBzdXJlIHRoaXMgaXMgYW4gaXNzdWUg
b3IgZWxzZS4gV2hhdCB3b3VsZCB5b3Ugc3VnZ2VzdCBtZSB0byBkbz8KPiBJZiB5b3UgdGhpbmsg
ZXh0cmEgNDhieXRlcyBjb25zdW1wdGlvbiBpcyBub3QgZ29vZCBoZXJlLCBmZWVsIGZyZWUgdG8g
ZHJvcCB0aGUKPiBwYXRjaC4KCkkgc3VnZ2VzdCBkb2luZyBub3RoaW5nIGFib3V0IHRoaXMuICBJ
IGp1c3Qgd2FudGVkIHBlb3BsZSB0byBiZSBhd2FyZQpvZiB0aGUgaW1wYWN0LiAgSSBndWVzcyBp
dCdzIGp1c3QgcGFydCBvZiB0aGUgc2xvdyBidXQgc3RlYWR5IGluY3JlYXNlCm9mIGtlcm5lbCBz
aXplIChjYS4gMjAtMzAgS2lCL3JlbGVhc2UpLi4uIDstKQoKR3J7b2V0amUsZWV0aW5nfXMsCgog
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
CkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
