Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850758B76D
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Aug 2022 19:58:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54667C5F1D3;
	Sat,  6 Aug 2022 17:58:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5103EC5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Aug 2022 17:58:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A5C3611CD;
 Sat,  6 Aug 2022 17:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D7CC433C1;
 Sat,  6 Aug 2022 17:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659808678;
 bh=HVIoATH2rby9Ront6vj1rC1jBMtGPMaPZSaw91TJhtw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JrXTs20sqJK4vyHSjv3HBS8soWagAa765JcDFbrSEvhF68Gxn9v9nEOPHiBraLNAl
 D9jST510x+bMWGdz13Euijka/DfkyioTOMLVLdsGWmUaN15eIUvpTYSO/MTHtOa3n7
 FvHvJ9GqQDpp7ZHVHtLFXZiuPoTLzOzLxDYwP0gdKzJH92mUkbbGAAd+aA9L6Ik/Un
 83Mr9/Syx4oIJUPpY1Xben4a6jFQ1lyxWm06TYAEY3EJZ/o2h4YcXjlLCJ0+wzlKZ4
 +tDNjbUCXLAXUnW8Jrt/A8L+T0/DrGBlHl9qVXZHIZlfbXn7Dj+XEy47HDwgZ2q1Uh
 NzR5e6vaHceCg==
Date: Sat, 6 Aug 2022 19:08:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220806190807.4f1d078c@jic23-huawei>
In-Reply-To: <20220806190337.5f3086c9@jic23-huawei>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-9-nuno.sa@analog.com>
 <20220806190337.5f3086c9@jic23-huawei>
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
Subject: Re: [Linux-stm32] [PATCH v3 08/15] iio: adc: ab8500-gpadc: convert
 to device properties
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

T24gU2F0LCA2IEF1ZyAyMDIyIDE5OjAzOjM3ICswMTAwCkpvbmF0aGFuIENhbWVyb24gPGppYzIz
QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmksIDE1IEp1bCAyMDIyIDE0OjI4OjU2ICswMjAw
Cj4gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4gd3JvdGU6Cj4gCj4gPiBNYWtlIHRoZSBj
b252ZXJzaW9uIHRvIGZpcm13YXJlIGFnbm9zdGljIGRldmljZSBwcm9wZXJ0aWVzLiBBcyBwYXJ0
IG9mCj4gPiB0aGUgY29udmVyc2lvbiB0aGUgSUlPIGlua2VybiBpbnRlcmZhY2UgJ29mX3hsYXRl
KCknIGlzIGFsc28gY29udmVydGVkIHRvCj4gPiAnZndub2RlX3hsYXRlKCknLiBUaGUgZ29hbCBp
cyB0byBjb21wbGV0ZWx5IGRyb3AgJ29mX3hsYXRlJyBhbmQgaGVuY2UgT0YKPiA+IGRlcGVuZGVu
Y2llcyBmcm9tIElJTy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FA
YW5hbG9nLmNvbT4KPiA+IEFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVu
a29AZ21haWwuY29tPiAgCj4gTml0cGljaywgYnV0IGlkZWFsbHkgdGhpcyB3b3VsZCBoYXZlIGJl
ZW4gdHdvIHBhdGNoZXMuIAo+IDEpIERyb3AgcGFyYW1ldGVyIHRvICpfcGFyc2VfY2hhbm5lbHMo
KSAKPiAyKSB0aGUgcmVzdC4KaWdub3JlIHRoYXQuICBJIGZvcmdvdCB0aGVyZSBpc24ndCBhIGRl
dmljZV9vZl9mb3JfZWFjaF9jaGlsZF9ub2RlKCkuClNvIGl0IHdvdWxkIGhhdmUgYmVlbiBtb3Jl
IGVmZm9ydCB0aGFuIGl0IHdhcyB3b3J0aC4KCj4gCj4gQXMgdGhhdCBsaXR0bGUgY29ybmVyIHdh
cyBoYXJkZXJ0IG8gY2hlY2sgdGhhbiB0aGUgcmVzdCA6KQoKPiAKPiBtZWguICBJdCdzIHRyaXZp
YWwgYXMgSSBzYWlkLCBvdGhlcndpc2UgbG9va3MgZ29vZCB0byBtZS4KPiAKPiBKb25hdGhhbgo+
IAo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9paW8vYWRjL2FiODUwMC1ncGFkYy5jIHwgMjcgKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDE1IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8v
YWRjL2FiODUwMC1ncGFkYy5jIGIvZHJpdmVycy9paW8vYWRjL2FiODUwMC1ncGFkYy5jCj4gPiBp
bmRleCA5MzBjZTk2ZTZmZjUuLjRmYTIxMjZhMzU0YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
aWlvL2FkYy9hYjg1MDAtZ3BhZGMuYwo+ID4gKysrIGIvZHJpdmVycy9paW8vYWRjL2FiODUwMC1n
cGFkYy5jCj4gPiBAQCAtOTI1LDggKzkyNSw4IEBAIHN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX3Jl
YWRfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCj4gPiAgCXJldHVybiAtRUlOVkFMOwo+
ID4gIH0KPiA+ICAKPiA+IC1zdGF0aWMgaW50IGFiODUwMF9ncGFkY19vZl94bGF0ZShzdHJ1Y3Qg
aWlvX2RldiAqaW5kaW9fZGV2LAo+ID4gLQkJCQkgY29uc3Qgc3RydWN0IG9mX3BoYW5kbGVfYXJn
cyAqaWlvc3BlYykKPiA+ICtzdGF0aWMgaW50IGFiODUwMF9ncGFkY19md25vZGVfeGxhdGUoc3Ry
dWN0IGlpb19kZXYgKmluZGlvX2RldiwKPiA+ICsJCQkJICAgICBjb25zdCBzdHJ1Y3QgZndub2Rl
X3JlZmVyZW5jZV9hcmdzICppaW9zcGVjKQo+ID4gIHsKPiA+ICAJaW50IGk7Cj4gPiAgCj4gPiBA
QCAtOTM4LDcgKzkzOCw3IEBAIHN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX29mX3hsYXRlKHN0cnVj
dCBpaW9fZGV2ICppbmRpb19kZXYsCj4gPiAgfQo+ID4gIAo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaWlvX2luZm8gYWI4NTAwX2dwYWRjX2luZm8gPSB7Cj4gPiAtCS5vZl94bGF0ZSA9IGFiODUw
MF9ncGFkY19vZl94bGF0ZSwKPiA+ICsJLmZ3bm9kZV94bGF0ZSA9IGFiODUwMF9ncGFkY19md25v
ZGVfeGxhdGUsCj4gPiAgCS5yZWFkX3JhdyA9IGFiODUwMF9ncGFkY19yZWFkX3JhdywKPiA+ICB9
Owo+ID4gIAo+ID4gQEAgLTk2OCw3ICs5NjgsNyBAQCBzdGF0aWMgaW50IGFiODUwMF9ncGFkY19y
dW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgLyoqCj4gPiAgICogYWI4NTAw
X2dwYWRjX3BhcnNlX2NoYW5uZWwoKSAtIHByb2Nlc3MgZGV2aWNldHJlZSBjaGFubmVsIGNvbmZp
Z3VyYXRpb24KPiA+ICAgKiBAZGV2OiBwb2ludGVyIHRvIGNvbnRhaW5pbmcgZGV2aWNlCj4gPiAt
ICogQG5wOiBkZXZpY2UgdHJlZSBub2RlIGZvciB0aGUgY2hhbm5lbCB0byBjb25maWd1cmUKPiA+
ICsgKiBAZndub2RlOiBmdyBub2RlIGZvciB0aGUgY2hhbm5lbCB0byBjb25maWd1cmUKPiA+ICAg
KiBAY2g6IGNoYW5uZWwgaW5mbyB0byBmaWxsIGluCj4gPiAgICogQGlpb19jaGFuOiBJSU8gY2hh
bm5lbCBzcGVjaWZpY2F0aW9uIHRvIGZpbGwgaW4KPiA+ICAgKgo+ID4gQEAgLTk3NiwxNSArOTc2
LDE1IEBAIHN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiA+ICAgKiBhbmQgZGVmaW5lIHVzYWdlIGZvciB0aGluZ3MgbGlrZSBBVVggR1BB
REMgaW5wdXRzIG1vcmUgcHJlY2lzZWx5Lgo+ID4gICAqLwo+ID4gIHN0YXRpYyBpbnQgYWI4NTAw
X2dwYWRjX3BhcnNlX2NoYW5uZWwoc3RydWN0IGRldmljZSAqZGV2LAo+ID4gLQkJCQkgICAgICBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gKwkJCQkgICAgICBzdHJ1Y3QgZndub2RlX2hhbmRs
ZSAqZndub2RlLAo+ID4gIAkJCQkgICAgICBzdHJ1Y3QgYWI4NTAwX2dwYWRjX2NoYW5faW5mbyAq
Y2gsCj4gPiAgCQkJCSAgICAgIHN0cnVjdCBpaW9fY2hhbl9zcGVjICppaW9fY2hhbikKPiA+ICB7
Cj4gPiAtCWNvbnN0IGNoYXIgKm5hbWUgPSBucC0+bmFtZTsKPiA+ICsJY29uc3QgY2hhciAqbmFt
ZSA9IGZ3bm9kZV9nZXRfbmFtZShmd25vZGUpOwo+ID4gIAl1MzIgY2hhbjsKPiA+ICAJaW50IHJl
dDsKPiA+ICAKPiA+IC0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJyZWciLCAmY2hh
bik7Cj4gPiArCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJyZWciLCAm
Y2hhbik7Cj4gPiAgCWlmIChyZXQpIHsKPiA+ICAJCWRldl9lcnIoZGV2LCAiaW52YWxpZCBjaGFu
bmVsIG51bWJlciAlc1xuIiwgbmFtZSk7Cj4gPiAgCQlyZXR1cm4gcmV0Owo+ID4gQEAgLTEwMjEs
MjIgKzEwMjEsMjAgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbChzdHJ1
Y3QgZGV2aWNlICpkZXYsCj4gPiAgLyoqCj4gPiAgICogYWI4NTAwX2dwYWRjX3BhcnNlX2NoYW5u
ZWxzKCkgLSBQYXJzZSB0aGUgR1BBREMgY2hhbm5lbHMgZnJvbSBEVAo+ID4gICAqIEBncGFkYzog
dGhlIEdQQURDIHRvIGNvbmZpZ3VyZSB0aGUgY2hhbm5lbHMgZm9yCj4gPiAtICogQG5wOiBkZXZp
Y2UgdHJlZSBub2RlIGNvbnRhaW5pbmcgdGhlIGNoYW5uZWwgY29uZmlndXJhdGlvbnMKPiA+ICAg
KiBAY2hhbnM6IHRoZSBJSU8gY2hhbm5lbHMgd2UgcGFyc2VkCj4gPiAgICogQG5jaGFuczogdGhl
IG51bWJlciBvZiBJSU8gY2hhbm5lbHMgd2UgcGFyc2VkCj4gPiAgICovCj4gPiAgc3RhdGljIGlu
dCBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbHMoc3RydWN0IGFiODUwMF9ncGFkYyAqZ3BhZGMs
Cj4gPiAtCQkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gIAkJCQkgICAgICAg
c3RydWN0IGlpb19jaGFuX3NwZWMgKipjaGFuc19wYXJzZWQsCj4gPiAgCQkJCSAgICAgICB1bnNp
Z25lZCBpbnQgKm5jaGFuc19wYXJzZWQpCj4gPiAgewo+ID4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUg
KmNoaWxkOwo+ID4gKwlzdHJ1Y3QgZndub2RlX2hhbmRsZSAqY2hpbGQ7Cj4gPiAgCXN0cnVjdCBh
Yjg1MDBfZ3BhZGNfY2hhbl9pbmZvICpjaDsKPiA+ICAJc3RydWN0IGlpb19jaGFuX3NwZWMgKmlp
b19jaGFuczsKPiA+ICAJdW5zaWduZWQgaW50IG5jaGFuczsKPiA+ICAJaW50IGk7Cj4gPiAgCj4g
PiAtCW5jaGFucyA9IG9mX2dldF9hdmFpbGFibGVfY2hpbGRfY291bnQobnApOwo+ID4gKwluY2hh
bnMgPSBkZXZpY2VfZ2V0X2NoaWxkX25vZGVfY291bnQoZ3BhZGMtPmRldik7Cj4gPiAgCWlmICgh
bmNoYW5zKSB7Cj4gPiAgCQlkZXZfZXJyKGdwYWRjLT5kZXYsICJubyBjaGFubmVsIGNoaWxkcmVu
XG4iKTsKPiA+ICAJCXJldHVybiAtRU5PREVWOwo+ID4gQEAgLTEwNTQsNyArMTA1Miw3IEBAIHN0
YXRpYyBpbnQgYWI4NTAwX2dwYWRjX3BhcnNlX2NoYW5uZWxzKHN0cnVjdCBhYjg1MDBfZ3BhZGMg
KmdwYWRjLAo+ID4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gPiAgCj4gPiAgCWkgPSAwOwo+ID4gLQlm
b3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZShucCwgY2hpbGQpIHsKPiA+ICsJZGV2aWNl
X2Zvcl9lYWNoX2NoaWxkX25vZGUoZ3BhZGMtPmRldiwgY2hpbGQpIHsKPiA+ICAJCXN0cnVjdCBp
aW9fY2hhbl9zcGVjICppaW9fY2hhbjsKPiA+ICAJCWludCByZXQ7Cj4gPiAgCj4gPiBAQCAtMTA2
NCw3ICsxMDYyLDcgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbHMoc3Ry
dWN0IGFiODUwMF9ncGFkYyAqZ3BhZGMsCj4gPiAgCQlyZXQgPSBhYjg1MDBfZ3BhZGNfcGFyc2Vf
Y2hhbm5lbChncGFkYy0+ZGV2LCBjaGlsZCwgY2gsCj4gPiAgCQkJCQkJIGlpb19jaGFuKTsKPiA+
ICAJCWlmIChyZXQpIHsKPiA+IC0JCQlvZl9ub2RlX3B1dChjaGlsZCk7Cj4gPiArCQkJZndub2Rl
X2hhbmRsZV9wdXQoY2hpbGQpOwo+ID4gIAkJCXJldHVybiByZXQ7Cj4gPiAgCQl9Cj4gPiAgCQlp
Kys7Cj4gPiBAQCAtMTA4MSw3ICsxMDc5LDYgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAJc3RydWN0IGFiODUwMF9ncGFk
YyAqZ3BhZGM7Cj4gPiAgCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7Cj4gPiAgCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBw
ZGV2LT5kZXYub2Zfbm9kZTsKPiA+ICAJc3RydWN0IGlpb19jaGFuX3NwZWMgKmlpb19jaGFuczsK
PiA+ICAJdW5zaWduZWQgaW50IG5faWlvX2NoYW5zOwo+ID4gIAlpbnQgcmV0Owo+ID4gQEAgLTEw
OTYsNyArMTA5Myw3IEBAIHN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgCWdwYWRjLT5kZXYgPSBkZXY7Cj4gPiAgCWdwYWRjLT5h
Yjg1MDAgPSBkZXZfZ2V0X2RydmRhdGEoZGV2LT5wYXJlbnQpOwo+ID4gIAo+ID4gLQlyZXQgPSBh
Yjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbHMoZ3BhZGMsIG5wLCAmaWlvX2NoYW5zLCAmbl9paW9f
Y2hhbnMpOwo+ID4gKwlyZXQgPSBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbHMoZ3BhZGMsICZp
aW9fY2hhbnMsICZuX2lpb19jaGFucyk7Cj4gPiAgCWlmIChyZXQpCj4gPiAgCQlyZXR1cm4gcmV0
Owo+ID4gICAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
