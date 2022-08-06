Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B4A58B775
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Aug 2022 20:05:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2406C03FC8;
	Sat,  6 Aug 2022 18:05:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A458C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Aug 2022 18:05:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31B1C61210;
 Sat,  6 Aug 2022 18:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB2FC433D6;
 Sat,  6 Aug 2022 18:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659809130;
 bh=0HzIP9SrV9O0nOfGbgmplxgNw0/6ojVp7tFkN11yVfo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iA++Zo5YNbwlgF1KdigAHMVod+mw3obkjxP4uPKJvKf80VHhLrMMeOcL794ocZ7EI
 ZH6j33/TxYpNNkeorROm7kBPIi6GZ3N4zGn+uVtPmCGpROUqPY/YzcTta1o5ae6x63
 BsLUBDEE1UJVibwXbIeHCoFJqh/ffLdroa+3LM60I72Ff3nqzaADtLFYzV2vTVXYW4
 rWf3HqA65ikztbAjdOeysHIm5F5igz/Igtcm4nrImlGhp+1uR8b0aqzZuTv2zwkYBQ
 HhnHAdImxE66ThSwNx/eE0E+QiMoHOmqTiw2OYQv1E8YoQgoTG3GGViObJghhs1Q4B
 1Ipe76VEq8dFw==
Date: Sat, 6 Aug 2022 19:15:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220806191538.7019ecfe@jic23-huawei>
In-Reply-To: <20220715122903.332535-14-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-14-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Gwendal Grignou <gwendal@chromium.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo Chen <haibo.chen@nxp.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Andy
 Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 linux-imx@nxp.com, Zhang Rui <rui.zhang@intel.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org,
 Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v3 13/15] iio: adc: stm32-adc: convert to
 device properties
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

T24gRnJpLCAxNSBKdWwgMjAyMiAxNDoyOTowMSArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gTWFrZSB0aGUgY29udmVyc2lvbiB0byBmaXJtd2FyZSBhZ25vc3Rp
YyBkZXZpY2UgcHJvcGVydGllcy4gQXMgcGFydCBvZgo+IHRoZSBjb252ZXJzaW9uIHRoZSBJSU8g
aW5rZXJuIGludGVyZmFjZSAnb2ZfeGxhdGUoKScgaXMgYWxzbyBjb252ZXJ0ZWQgdG8KPiAnZndu
b2RlX3hsYXRlKCknLiBUaGUgZ29hbCBpcyB0byBjb21wbGV0ZWx5IGRyb3AgJ29mX3hsYXRlJyBh
bmQgaGVuY2UgT0YKPiBkZXBlbmRlbmNpZXMgZnJvbSBJSU8uCj4gCj4gU2lnbmVkLW9mZi1ieTog
TnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hl
bmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgpPbmUgcXVlcnkgYmVsb3cuIE90aGVyd2lz
ZSBMR1RNIChub3QgdGhhdCdzIHRydWUgb2YgdGhlIG90aGVyIHBhdGNoZXMgSSBoYXZlbid0CmNv
bW1lbnQgb24gYXQgYWxsKQoKPiBAQCAtMTg4NSw4ICsxODg3LDEyIEBAIHN0YXRpYyBpbnQgc3Rt
MzJfYWRjX2dldF9sZWdhY3lfY2hhbl9jb3VudChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LCBz
dHJ1Y3Qgc3RtCj4gIAkJbnVtX2NoYW5uZWxzICs9IHJldDsKPiAgCX0KPiAgCj4gLQlyZXQgPSBv
Zl9wcm9wZXJ0eV9jb3VudF9lbGVtc19vZl9zaXplKG5vZGUsICJzdCxhZGMtZGlmZi1jaGFubmVs
cyIsCj4gLQkJCQkJICAgICAgc2l6ZW9mKHN0cnVjdCBzdG0zMl9hZGNfZGlmZl9jaGFubmVsKSk7
Cj4gKwkvKgo+ICsJICogZWFjaCBzdCxhZGMtZGlmZi1jaGFubmVscyBpcyBhIGdyb3VwIG9mIDIg
dTMyIHNvIHdlIGRpdmlkZSBAcmV0Cj4gKwkgKiB0byBnZXQgdGhlICpyZWFsKiBudW1iZXIgb2Yg
Y2hhbm5lbHMuCj4gKwkgKi8KPiArCXJldCA9IGRldmljZV9wcm9wZXJ0eV9jb3VudF91MzIoZGV2
LCAic3QsYWRjLWRpZmYtY2hhbm5lbHMiKTsKCkkgdGhpbmsgdGhpcyBjYW4gcmV0dXJuIGFuIGVy
cm9yIGNvZGUgd2hpY2ggc2hvdWxkIHByb2JhYmx5IGJlIGhhbmRsZWQuCk1vcmUgdGhhbiBwb3Nz
aWJsZSB0aGF0IHdhcyB0cnVlIG9mIG9yaWdpbmFsIGNvZGUgdGhvdWdoLi4uCgpJZiBpdCBjYW4n
dCByZXR1cm4gYW4gZXJyb3IgZm9yIHNvbWUgcmVhc29uIEknbSBtaXNzaW5nIHBlcmhhcHMgYQpj
b21tZW50IHRvIGV4cGxhaW4gd2h5LgoKPiArCXJldCAvPSAoaW50KShzaXplb2Yoc3RydWN0IHN0
bTMyX2FkY19kaWZmX2NoYW5uZWwpIC8gc2l6ZW9mKHUzMikpOwo+ICAJaWYgKHJldCA+IGFkY19p
bmZvLT5tYXhfY2hhbm5lbHMpIHsKPiAgCQlkZXZfZXJyKCZpbmRpb19kZXYtPmRldiwgIkJhZCBz
dCxhZGMtZGlmZi1jaGFubmVscz9cbiIpOwo+ICAJCXJldHVybiAtRUlOVkFMOwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
