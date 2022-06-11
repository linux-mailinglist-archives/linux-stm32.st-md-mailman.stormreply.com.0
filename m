Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE285475CA
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jun 2022 16:50:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2494C5F1D7;
	Sat, 11 Jun 2022 14:50:06 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3598C03FD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 14:50:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A88AB80123;
 Sat, 11 Jun 2022 14:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC62CC34116;
 Sat, 11 Jun 2022 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654959004;
 bh=LX+rtX5P3mKqmVMa/tJgwQ4uwQTtTzZC0lJMO9c+uKY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NozNRnZ9eVVMlh3i/YFnXyveVGFVoLy0j6zJGUcdi8rJ4t2MDdOBT4MXOdmzJVbc1
 ZIKXXfLH89Q8gM33/AvmEkMy7rRJRm4wLuFmzjkNryddMmxJ0F2puXoi1DHkqKnEe7
 BMw3tDXb1LdjCJv0ZwsNznU5FKt/MnWP7qW7wg4BxhiFAu9Kgcsl40fmseyFCTpUIr
 irqOYi+V8FtnEYrtIDDJq5R6/OmDksOY9wgPTCNXsn8yQGMxmJq3ghGfhFOXEXv/SZ
 8mQiUM2KswJhVPFAsaXxGO2zwsjGSn8/KxZl6/iv+Lc9WGRXVQ578HMjv3GoAbU3KS
 d8lBUX9EjQXSA==
Date: Sat, 11 Jun 2022 15:59:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Message-ID: <20220611155902.2a5a7738@jic23-huawei>
In-Reply-To: <ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-21-nuno.sa@analog.com>
 <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
 <ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>, Tali Perry <tali.perry1@gmail.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 20/34] iio: inkern: only relase the device
 node when done with it
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

CitDYyBNYXJrIEJyb3duIGZvciBhIHF1ZXJ5IG9uIG9yZGVyaW5nIGluIGRldmljZSB0cmVlIGJh
c2VkIFNQSSBzZXR1cC4KCk9uIEZyaSwgMTAgSnVuIDIwMjIgMjI6MDg6NDEgKzAyMDAKTnVubyBT
w6EgPG5vbmFtZS5udW5vQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIEZyaSwgMjAyMi0wNi0xMCBh
dCAxNjo1NiArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMTAs
IDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4gd3JvdGU6ICAK
PiA+ID4gCj4gPiA+ICdvZl9ub2RlX3B1dCgpJyBjYW4gcG90ZW50aWFsbHkgcmVsZWFzZSB0aGUg
bWVtb3J5IHBvaW50ZWQgdG8gYnkKPiA+ID4gJ2lpb3NwZWMubnAnIHdoaWNoIHdvdWxkIGxlYXZl
IHVzIHdpdGggYW4gaW52YWxpZCBwb2ludGVyIChhbmQgd2UKPiA+ID4gd291bGQKPiA+ID4gc3Rp
bGwgcGFzcyBpdCBpbiAnb2ZfeGxhdGUoKScpLiBBcyBzdWNoLCB3ZSBjYW4gb25seSByZWxlYXNl
IHRoZQo+ID4gPiBub2RlCj4gPiA+IGFmdGVyIHdlIGFyZSBkb25lIHdpdGggaXQuICAKPiA+IAo+
ID4gVGhlIHF1ZXN0aW9uIHlvdSBzaG91bGQgYW5zd2VyIGluIHRoZSBjb21taXQgbWVzc2FnZSBp
cyB0aGUKPiA+IGZvbGxvd2luZzoKPiA+ICJDYW4gYW4gT0Ygbm9kZSwgYXR0YWNoZWQgdG8gYSBz
dHJ1Y3QgZGV2aWNlLCBiZSBnb25lIGJlZm9yZSB0aGUKPiA+IGRldmljZSBpdHNlbGY/IiBJZiBp
dCBzbywgdGhlbiBwYXRjaCBpcyBnb29kLCBvdGhlcndpc2UgdGhlcmUgaXMgbm8KPiA+IHBvaW50
IGluIHRoaXMgcGF0Y2ggaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4gICAKPiAKPiBZZWFoLCBJIG1p
Z2h0IGJlIHdyb25nIGJ1dCBmcm9tIGEgcXVpY2sgbG9vay4uLiB5ZXMsIEkgdGhpbmsgdGhlIG5v
ZGUKPiBjYW4gYmUgZ29uZSBiZWZvcmUgdGhlIGRldmljZS4gVGFrZSBhIGxvb2sgb24gdGhlIHNw
aSBvciBpMmMgb2Zfbm90aWZ5Cj4gaGFuZGxpbmcgYW5kIHlvdSBjYW4gc2VlIHRoYXQgdGhlIG5v
ZGVzIGFyZSBnZXQvcHV0IG9uIHRoZSBhZGQvcmVtb3ZlCj4gbm90aWZjYXRpb24uIE1lYW5pbmcg
dGhhdCB0aGUgbm9kZSBsaWZlc3BhbiBpcyBub3QgcmVhbGx5IGF0dGFjaGVkIHRvCj4gdGhlIGRl
dmljZSBsaWZlc3Bhbi4gSWYgaXQgd2FzLCBJIHdvdWxkIGV4cGVjdCB0byBzZWUgb2Zfbm9kZV9w
dXQoKSBvbgo+IHRoZSBkZXZpY2UgcmVsZWFzZSgpIGZ1bmN0aW9uLi4uCgpJIGhhZCBhIGxvb2sg
YXQgc3BpX29mX25vdGlmeSgpIGFuZCBpbmRlZWQgdmlhIHNwaV91bnJlZ2lzdGVyX2RldmljZSgp
CnRoZSBub2RlIGlzIHB1dCBqdXN0IGJlZm9yZSBkZXZpY2VfZGVsKCkgc28gSSBhZ3JlZSB0aGF0
IGF0IGZpcnN0IGdsYW5jZQppdCBzZWVtcyBsaWtlIHRoZXJlIG1heSBiZSBhIHJhY2UgdGhlcmUg
YWdhaW5zdCB0aGUgdXNlYWdlIGhlcmUuCk1hcmsgKCtDQykgb3V0IG9mIGludGVyZXN0IHdoeSBh
cmUgdGhlIG5vZGUgZ2V0cyBiZWZvcmUgdGhlIGRldmljZV9hZGQoKQppbiBzcGlfYWRkX2Rldmlj
ZSgpIGNhbGxlZCBmcm9tIG9mX3JlZ2lzdGVyX3NwaV9kZXZpY2UoKSBidXQgdGhlIG1hdGNoaW5n
Cm5vZGUgcHV0cyBiZWZvcmUgdGhlIGRldmljZV9kZWwoKSBpbiBzcGlfdW5yZWdpc3Rlcl9kZXZp
Y2UoKT8KU2VlbXMgbGlrZSBpbmNvbnNpc3RlbnQgb3JkZXJpbmcuLi4KCldoaWNoIGlzIG5vdCB0
byBzYXkgd2Ugc2hvdWxkbid0IGZpeCB0aGUgSUlPIHVzYWdlIGFzIHRoaXMgcGF0Y2ggZG9lcyEK
Cj4gCj4gQWdhaW4sIEkgbWlnaHQgYmUgd3JvbmcgYW5kIEkgYWRtaXQgSSB3YXMgbm90IHN1cmUg
YWJvdXQgaW5jbHVkaW5nIHRoaXMKPiBwYXRjaCBiZWNhdXNlIGl0J3MgYSB2ZXJ5IHVubGlrZWx5
IHNjZW5hcmlvIGV2ZW4gdGhvdWdoIEkgdGhpbmssIGluCj4gdGhlb3J5LCBhIHBvc3NpYmxlIG9u
ZS4KClRoZSBwYXRjaCBpcyBjdXJyZW50bHkgdmFsaWQgZXZlbiBpZiBpdCdzIG5vdCBhICdyZWFs
JyBidWcuCkdpdmVuIHdlIGFyZSBkb2luZyBhIHB1dCBvbiB0aGF0IGRldmljZV9ub2RlLCBpdCBt
YWtlcyBzZW5zZSBmb3IgdGhhdAp0byBvY2N1ciBhZnRlciB0aGUgbG9jYWwgdXNlIGhhcyBmaW5p
c2hlZCAtIHdlIHNob3VsZG4ndCBiZSByZWx5aW5nIG9uCndoYXQgaGFwcGVucyB0byBiZSB0aGUg
Y2FzZSBmb3IgbGlmZXRpbWVzIHRvZGF5LgoKTm93LCBJIGRpZCB3b25kZXIgaWYgYW55IGRyaXZl
cnMgYWN0dWFsbHkgdXNlIGl0IGluIHRoZWlyIHhsYXRlIGNhbGxiYWNrcy4KT25lIGRvZXMgZm9y
IGFuIGVycm9yIHByaW50LCBzbyB0aGlzIGlzIHBvdGVudGlhbGx5IHJlYWwgKGlmIHZlcnkgdW5s
aWtlbHkhKQoKVGhpcyBpc24ndCBhICdmaXgnIEknZCBleHBlY3QgdG8gcnVzaCBpbiwgb3IgbmVj
ZXNzYXJpbHkgYmFja3BvcnQgdG8gc3RhYmxlCmJ1dCBJIHRoaW5rIGl0J3MgYSB2YWxpZCBmaXgu
CgpQZXJoYXBzIGFkZCBhIGxpdHRsZSBtb3JlIGRldGFpbCB0byB0aGUgcGF0Y2ggZGVzY3JpcHRp
b24gZm9yIHYyLgoKVGhhbmtzLAoKSm9uYXRoYW4KCgo+IAo+IC0gTnVubyBTw6EKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
