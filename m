Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD258B7C1
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Aug 2022 20:43:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35F88C035BE;
	Sat,  6 Aug 2022 18:43:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D4E1C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Aug 2022 18:43:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02AB76123F;
 Sat,  6 Aug 2022 18:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4642C433C1;
 Sat,  6 Aug 2022 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659811398;
 bh=9zcEKsBlFaq2Abp3Ujre2SKv4E24ne+3Amc5GKr94r8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c9gsw5fxL6QdsooDIbb4X9vk/stoJ712TyCVJOtC9CJKSkjLFQCmXi/5mDrkXTPFl
 jwrx2ij+iN76kBuqX9E1RI3tmZt4rQAFUuSKPdHAlNEoeHtQQmFD+RkvIxrDw+QiHA
 pWSLiv4Et6Ox7W7nGspv5/wWXDvIqhyFgJ+QiSbeFsZXNY3pcirIGvvvl4tuSvzzRW
 x2bfobAuH8Qw/R6aRDHODz3poGX1Vras3COg4325mAbnVJjU+HP+0u4w7c6iC55bt2
 JRB9CaMTRw+5fLxFkM46MspQLfkomAlJE7T8i/QU3kwz6vO3V2HaHuYdvxorrGC8LB
 mAA2JfHh4MrsA==
Date: Sat, 6 Aug 2022 19:53:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220806195327.14626e0d@jic23-huawei>
In-Reply-To: <20220806191538.7019ecfe@jic23-huawei>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-14-nuno.sa@analog.com>
 <20220806191538.7019ecfe@jic23-huawei>
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

T24gU2F0LCA2IEF1ZyAyMDIyIDE5OjE1OjM4ICswMTAwCkpvbmF0aGFuIENhbWVyb24gPGppYzIz
QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmksIDE1IEp1bCAyMDIyIDE0OjI5OjAxICswMjAw
Cj4gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4gd3JvdGU6Cj4gCj4gPiBNYWtlIHRoZSBj
b252ZXJzaW9uIHRvIGZpcm13YXJlIGFnbm9zdGljIGRldmljZSBwcm9wZXJ0aWVzLiBBcyBwYXJ0
IG9mCj4gPiB0aGUgY29udmVyc2lvbiB0aGUgSUlPIGlua2VybiBpbnRlcmZhY2UgJ29mX3hsYXRl
KCknIGlzIGFsc28gY29udmVydGVkIHRvCj4gPiAnZndub2RlX3hsYXRlKCknLiBUaGUgZ29hbCBp
cyB0byBjb21wbGV0ZWx5IGRyb3AgJ29mX3hsYXRlJyBhbmQgaGVuY2UgT0YKPiA+IGRlcGVuZGVu
Y2llcyBmcm9tIElJTy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FA
YW5hbG9nLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNo
ZW5rb0BnbWFpbC5jb20+ICAKPiBPbmUgcXVlcnkgYmVsb3cuIE90aGVyd2lzZSBMR1RNIChub3Qg
dGhhdCdzIHRydWUgb2YgdGhlIG90aGVyIHBhdGNoZXMgSSBoYXZlbid0Cj4gY29tbWVudCBvbiBh
dCBhbGwpCj4gCj4gPiBAQCAtMTg4NSw4ICsxODg3LDEyIEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRj
X2dldF9sZWdhY3lfY2hhbl9jb3VudChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LCBzdHJ1Y3Qg
c3RtCj4gPiAgCQludW1fY2hhbm5lbHMgKz0gcmV0Owo+ID4gIAl9Cj4gPiAgCj4gPiAtCXJldCA9
IG9mX3Byb3BlcnR5X2NvdW50X2VsZW1zX29mX3NpemUobm9kZSwgInN0LGFkYy1kaWZmLWNoYW5u
ZWxzIiwKPiA+IC0JCQkJCSAgICAgIHNpemVvZihzdHJ1Y3Qgc3RtMzJfYWRjX2RpZmZfY2hhbm5l
bCkpOwo+ID4gKwkvKgo+ID4gKwkgKiBlYWNoIHN0LGFkYy1kaWZmLWNoYW5uZWxzIGlzIGEgZ3Jv
dXAgb2YgMiB1MzIgc28gd2UgZGl2aWRlIEByZXQKPiA+ICsJICogdG8gZ2V0IHRoZSAqcmVhbCog
bnVtYmVyIG9mIGNoYW5uZWxzLgo+ID4gKwkgKi8KPiA+ICsJcmV0ID0gZGV2aWNlX3Byb3BlcnR5
X2NvdW50X3UzMihkZXYsICJzdCxhZGMtZGlmZi1jaGFubmVscyIpOyAgCj4gCj4gSSB0aGluayB0
aGlzIGNhbiByZXR1cm4gYW4gZXJyb3IgY29kZSB3aGljaCBzaG91bGQgcHJvYmFibHkgYmUgaGFu
ZGxlZC4KPiBNb3JlIHRoYW4gcG9zc2libGUgdGhhdCB3YXMgdHJ1ZSBvZiBvcmlnaW5hbCBjb2Rl
IHRob3VnaC4uLgo+IAo+IElmIGl0IGNhbid0IHJldHVybiBhbiBlcnJvciBmb3Igc29tZSByZWFz
b24gSSdtIG1pc3NpbmcgcGVyaGFwcyBhCj4gY29tbWVudCB0byBleHBsYWluIHdoeS4KCkdpdmVu
IHRoaXMgd2FzIG9ubHkgb3V0c3RhbmRpbmcgcXVlc3Rpb24gSSBzdHVjayBhIGNvbnNlcnZhdGl2
ZQoKaWYgKHJldCA8IDApCglyZXR1cm4gcmV0OwpoZXJlIHdoaWxzdCBhcHBseWluZy4KCj4gCj4g
PiArCXJldCAvPSAoaW50KShzaXplb2Yoc3RydWN0IHN0bTMyX2FkY19kaWZmX2NoYW5uZWwpIC8g
c2l6ZW9mKHUzMikpOwo+ID4gIAlpZiAocmV0ID4gYWRjX2luZm8tPm1heF9jaGFubmVscykgewo+
ID4gIAkJZGV2X2VycigmaW5kaW9fZGV2LT5kZXYsICJCYWQgc3QsYWRjLWRpZmYtY2hhbm5lbHM/
XG4iKTsKPiA+ICAJCXJldHVybiAtRUlOVkFMOyAgCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
