Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17279547555
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jun 2022 16:13:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCAD5C5F1D7;
	Sat, 11 Jun 2022 14:13:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFC30C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 14:13:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54048B816AD;
 Sat, 11 Jun 2022 14:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A775DC34116;
 Sat, 11 Jun 2022 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654956804;
 bh=nyZvL91oFCb9bthQSadgYmYYNFgPdHqKzIod7PSvXoE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C2tuo46TtbrdY2D19m2dgc8qWZXkB9kD9XOOUf+g2P6r7or/YShlN3zfieoRbi1Vk
 mRI7PO6xQMBBZDFZ33JtIn/6IVQn/VTxVQXaJO1ADbDwlQfv3ugfoK+SZ2wWPnkBEe
 NQN0YnkPwxplxSwb5TPXK7nCa4EcaM5XEQsCru/WIGnRxSEQ5MOC6fJr8zRFIfBTyu
 tLwN+T41I7UHRhABICFeESgCC5Pk7w7sag45jDCofg7ENDt7w2JsMMV2UnrL0YRNvo
 0EPVDiII3hAp7sPmFQsLP0zYudeuY2ortQ78I2x55E+QAmRNr9FxfNDMWR9mLxN2JJ
 ED2zAMUfpL0uQ==
Date: Sat, 11 Jun 2022 15:22:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20220611152222.43ab685e@jic23-huawei>
In-Reply-To: <CAHp75VdCrFa67_k3TJSznT0fzEK3h3+fk0MHpuwM6NBpTQODEw@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-16-nuno.sa@analog.com>
 <CAHp75VdCrFa67_k3TJSznT0fzEK3h3+fk0MHpuwM6NBpTQODEw@mail.gmail.com>
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
 Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
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
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 15/34] iio: humidity: hts221_buffer:
 explicitly add proper header files
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxNjo0NzoxNiArMDIwMApBbmR5IFNoZXZjaGVua28gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgoKPiBPbiBGcmksIEp1biAxMCwgMjAyMiBhdCAx
MDo0NyBBTSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPiB3cm90ZToKPiA+Cj4gPiBEbyBu
b3QgdHJ1c3QgdGhlIGZhY3QgdGhhdCBpaW8uaCBpbmNsdWRlcyBvZi5oIHdoaWNoIGluIHR1cm4g
aW5jbHVkZXMKPiA+IGFsbCB0aGUgaGVhZGVycyB3ZSBhcmUgcmVseWluZyBvbi4KPiA+Cj4gPiBU
aGUgdWx0aW1hdGUgZ29hbCBpcyB0byBhY3R1YWxseSBkcm9wIG9mLmggZnJvbSBpaW8uaC4gIAo+
IAo+IC4uLgo+IAo+ID4gICNpbmNsdWRlIDxsaW51eC9pcnFyZXR1cm4uaD4KPiA+ICAjaW5jbHVk
ZSA8bGludXgvcmVnbWFwLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+Cj4gPiAr
I2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+ICAKPiAKPiBZZXMsIEkgc2VlLCBidXQgeW91IGNh
biBtYWtlIGxpZmUgZWFzaWVyIGlmIHlvdSB0cnkgdG8gc3F1ZWV6ZSB0byB0aGUKPiBtb3N0IHNv
cnRlZCBwYXJ0LiBJIGRvIG5vdCBzZWUgZnVsbCBjb250ZXh0LCBidXQgaGVyZSBJIHdvdWxkIHB1
dCBpdAo+IGJlZm9yZSByZWdtYXAuaC4KPiAKV2l0aCBmdWxsIGNvbnRleHQgaXQncyBjbGVhciB0
aGUgbGlzdCBpcyB3YXkgb2ZmIHNvcnRlZCwgYnV0IG1laApwdXR0aW5nIGl0IGFib3ZlIHJlZ21h
cCBwcm9iYWJseSByZWR1Y2VzIHRoZSBmb2xsb3cgdXAgZGlmZiBhIHRpbnkKYml0IGFuZCBJIGRv
dWJ0IE51bm8gZmVlbHMgc3Ryb25nbHkgYWJvdXQgdGhpcyBzbyBJIHdlbnQgd2l0aAp3aGF0IEFu
ZHkgc3VnZ2VzdGVkIGFzIGEgdHdlYWsgd2hpbHN0IGFwcGx5aW5nLgoKQXBwbGllZAoKVGhhbmtz
LAoKSm9uYXRoYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
