Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 533F658B761
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Aug 2022 19:53:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 085A0C5EC6B;
	Sat,  6 Aug 2022 17:53:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD7FFC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Aug 2022 17:53:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6FE88611D3;
 Sat,  6 Aug 2022 17:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94870C433C1;
 Sat,  6 Aug 2022 17:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659808407;
 bh=N4R6bAIgXf+qR39Qf/icSXDtbAcXLXJGvEsDtUbR9K8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RDKmkPqLK9JBNONow6WuECuYOe71VLiYyxMRujjqpc3fiZ5H1YG8ki07yccB2m/uU
 BR/EVwIyFTQALbGMMItSqlLF72BZt951zzF2yhRcB9bvcUqFyys61w77nn0J3NyXvu
 9QEP9BBw1lG78sCp+DHTGYA+bIExSwKvRzhV+ng62G3KIvUr5W9NXn/vKoMvzHDz6J
 TdxnKGhhJphslZ+ozkKxIibsIbj0KhW1OCrhnEgYwFoUw7+V44ScBM0ANOX8xtEh2e
 LJHDYSa5Iy4AevyL9LNtrdBM1TtuoDK+Jgh0S6tmo5FZMyrw7rO0IBr7eVNT2lkOmX
 EHsYtlpSnMYDA==
Date: Sat, 6 Aug 2022 19:03:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220806190337.5f3086c9@jic23-huawei>
In-Reply-To: <20220715122903.332535-9-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-9-nuno.sa@analog.com>
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

T24gRnJpLCAxNSBKdWwgMjAyMiAxNDoyODo1NiArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gTWFrZSB0aGUgY29udmVyc2lvbiB0byBmaXJtd2FyZSBhZ25vc3Rp
YyBkZXZpY2UgcHJvcGVydGllcy4gQXMgcGFydCBvZgo+IHRoZSBjb252ZXJzaW9uIHRoZSBJSU8g
aW5rZXJuIGludGVyZmFjZSAnb2ZfeGxhdGUoKScgaXMgYWxzbyBjb252ZXJ0ZWQgdG8KPiAnZndu
b2RlX3hsYXRlKCknLiBUaGUgZ29hbCBpcyB0byBjb21wbGV0ZWx5IGRyb3AgJ29mX3hsYXRlJyBh
bmQgaGVuY2UgT0YKPiBkZXBlbmRlbmNpZXMgZnJvbSBJSU8uCj4gCj4gU2lnbmVkLW9mZi1ieTog
TnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiBBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28g
PGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Ck5pdHBpY2ssIGJ1dCBpZGVhbGx5IHRoaXMgd291
bGQgaGF2ZSBiZWVuIHR3byBwYXRjaGVzLiAKMSkgRHJvcCBwYXJhbWV0ZXIgdG8gKl9wYXJzZV9j
aGFubmVscygpIAoyKSB0aGUgcmVzdC4KCkFzIHRoYXQgbGl0dGxlIGNvcm5lciB3YXMgaGFyZGVy
dCBvIGNoZWNrIHRoYW4gdGhlIHJlc3QgOikKCm1laC4gIEl0J3MgdHJpdmlhbCBhcyBJIHNhaWQs
IG90aGVyd2lzZSBsb29rcyBnb29kIHRvIG1lLgoKSm9uYXRoYW4KCgo+IC0tLQo+ICBkcml2ZXJz
L2lpby9hZGMvYWI4NTAwLWdwYWRjLmMgfCAyNyArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYWI4NTAwLWdwYWRjLmMgYi9kcml2ZXJzL2lp
by9hZGMvYWI4NTAwLWdwYWRjLmMKPiBpbmRleCA5MzBjZTk2ZTZmZjUuLjRmYTIxMjZhMzU0YiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvYWI4NTAwLWdwYWRjLmMKPiArKysgYi9kcml2
ZXJzL2lpby9hZGMvYWI4NTAwLWdwYWRjLmMKPiBAQCAtOTI1LDggKzkyNSw4IEBAIHN0YXRpYyBp
bnQgYWI4NTAwX2dwYWRjX3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCj4gIAly
ZXR1cm4gLUVJTlZBTDsKPiAgfQo+ICAKPiAtc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfb2ZfeGxh
dGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKPiAtCQkJCSBjb25zdCBzdHJ1Y3Qgb2ZfcGhh
bmRsZV9hcmdzICppaW9zcGVjKQo+ICtzdGF0aWMgaW50IGFiODUwMF9ncGFkY19md25vZGVfeGxh
dGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKPiArCQkJCSAgICAgY29uc3Qgc3RydWN0IGZ3
bm9kZV9yZWZlcmVuY2VfYXJncyAqaWlvc3BlYykKPiAgewo+ICAJaW50IGk7Cj4gIAo+IEBAIC05
MzgsNyArOTM4LDcgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfb2ZfeGxhdGUoc3RydWN0IGlp
b19kZXYgKmluZGlvX2RldiwKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpaW9faW5m
byBhYjg1MDBfZ3BhZGNfaW5mbyA9IHsKPiAtCS5vZl94bGF0ZSA9IGFiODUwMF9ncGFkY19vZl94
bGF0ZSwKPiArCS5md25vZGVfeGxhdGUgPSBhYjg1MDBfZ3BhZGNfZndub2RlX3hsYXRlLAo+ICAJ
LnJlYWRfcmF3ID0gYWI4NTAwX2dwYWRjX3JlYWRfcmF3LAo+ICB9Owo+ICAKPiBAQCAtOTY4LDcg
Kzk2OCw3IEBAIHN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiAgLyoqCj4gICAqIGFiODUwMF9ncGFkY19wYXJzZV9jaGFubmVsKCkgLSBw
cm9jZXNzIGRldmljZXRyZWUgY2hhbm5lbCBjb25maWd1cmF0aW9uCj4gICAqIEBkZXY6IHBvaW50
ZXIgdG8gY29udGFpbmluZyBkZXZpY2UKPiAtICogQG5wOiBkZXZpY2UgdHJlZSBub2RlIGZvciB0
aGUgY2hhbm5lbCB0byBjb25maWd1cmUKPiArICogQGZ3bm9kZTogZncgbm9kZSBmb3IgdGhlIGNo
YW5uZWwgdG8gY29uZmlndXJlCj4gICAqIEBjaDogY2hhbm5lbCBpbmZvIHRvIGZpbGwgaW4KPiAg
ICogQGlpb19jaGFuOiBJSU8gY2hhbm5lbCBzcGVjaWZpY2F0aW9uIHRvIGZpbGwgaW4KPiAgICoK
PiBAQCAtOTc2LDE1ICs5NzYsMTUgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcnVudGltZV9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgKiBhbmQgZGVmaW5lIHVzYWdlIGZvciB0aGlu
Z3MgbGlrZSBBVVggR1BBREMgaW5wdXRzIG1vcmUgcHJlY2lzZWx5Lgo+ICAgKi8KPiAgc3RhdGlj
IGludCBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gLQkJ
CQkgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ICsJCQkJICAgICAgc3RydWN0IGZ3bm9k
ZV9oYW5kbGUgKmZ3bm9kZSwKPiAgCQkJCSAgICAgIHN0cnVjdCBhYjg1MDBfZ3BhZGNfY2hhbl9p
bmZvICpjaCwKPiAgCQkJCSAgICAgIHN0cnVjdCBpaW9fY2hhbl9zcGVjICppaW9fY2hhbikKPiAg
ewo+IC0JY29uc3QgY2hhciAqbmFtZSA9IG5wLT5uYW1lOwo+ICsJY29uc3QgY2hhciAqbmFtZSA9
IGZ3bm9kZV9nZXRfbmFtZShmd25vZGUpOwo+ICAJdTMyIGNoYW47Cj4gIAlpbnQgcmV0Owo+ICAK
PiAtCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAicmVnIiwgJmNoYW4pOwo+ICsJcmV0
ID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyKGZ3bm9kZSwgInJlZyIsICZjaGFuKTsKPiAgCWlm
IChyZXQpIHsKPiAgCQlkZXZfZXJyKGRldiwgImludmFsaWQgY2hhbm5lbCBudW1iZXIgJXNcbiIs
IG5hbWUpOwo+ICAJCXJldHVybiByZXQ7Cj4gQEAgLTEwMjEsMjIgKzEwMjEsMjAgQEAgc3RhdGlj
IGludCBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIC8q
Kgo+ICAgKiBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbHMoKSAtIFBhcnNlIHRoZSBHUEFEQyBj
aGFubmVscyBmcm9tIERUCj4gICAqIEBncGFkYzogdGhlIEdQQURDIHRvIGNvbmZpZ3VyZSB0aGUg
Y2hhbm5lbHMgZm9yCj4gLSAqIEBucDogZGV2aWNlIHRyZWUgbm9kZSBjb250YWluaW5nIHRoZSBj
aGFubmVsIGNvbmZpZ3VyYXRpb25zCj4gICAqIEBjaGFuczogdGhlIElJTyBjaGFubmVscyB3ZSBw
YXJzZWQKPiAgICogQG5jaGFuczogdGhlIG51bWJlciBvZiBJSU8gY2hhbm5lbHMgd2UgcGFyc2Vk
Cj4gICAqLwo+ICBzdGF0aWMgaW50IGFiODUwMF9ncGFkY19wYXJzZV9jaGFubmVscyhzdHJ1Y3Qg
YWI4NTAwX2dwYWRjICpncGFkYywKPiAtCQkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
LAo+ICAJCQkJICAgICAgIHN0cnVjdCBpaW9fY2hhbl9zcGVjICoqY2hhbnNfcGFyc2VkLAo+ICAJ
CQkJICAgICAgIHVuc2lnbmVkIGludCAqbmNoYW5zX3BhcnNlZCkKPiAgewo+IC0Jc3RydWN0IGRl
dmljZV9ub2RlICpjaGlsZDsKPiArCXN0cnVjdCBmd25vZGVfaGFuZGxlICpjaGlsZDsKPiAgCXN0
cnVjdCBhYjg1MDBfZ3BhZGNfY2hhbl9pbmZvICpjaDsKPiAgCXN0cnVjdCBpaW9fY2hhbl9zcGVj
ICppaW9fY2hhbnM7Cj4gIAl1bnNpZ25lZCBpbnQgbmNoYW5zOwo+ICAJaW50IGk7Cj4gIAo+IC0J
bmNoYW5zID0gb2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9jb3VudChucCk7Cj4gKwluY2hhbnMgPSBk
ZXZpY2VfZ2V0X2NoaWxkX25vZGVfY291bnQoZ3BhZGMtPmRldik7Cj4gIAlpZiAoIW5jaGFucykg
ewo+ICAJCWRldl9lcnIoZ3BhZGMtPmRldiwgIm5vIGNoYW5uZWwgY2hpbGRyZW5cbiIpOwo+ICAJ
CXJldHVybiAtRU5PREVWOwo+IEBAIC0xMDU0LDcgKzEwNTIsNyBAQCBzdGF0aWMgaW50IGFiODUw
MF9ncGFkY19wYXJzZV9jaGFubmVscyhzdHJ1Y3QgYWI4NTAwX2dwYWRjICpncGFkYywKPiAgCQly
ZXR1cm4gLUVOT01FTTsKPiAgCj4gIAlpID0gMDsKPiAtCWZvcl9lYWNoX2F2YWlsYWJsZV9jaGls
ZF9vZl9ub2RlKG5wLCBjaGlsZCkgewo+ICsJZGV2aWNlX2Zvcl9lYWNoX2NoaWxkX25vZGUoZ3Bh
ZGMtPmRldiwgY2hpbGQpIHsKPiAgCQlzdHJ1Y3QgaWlvX2NoYW5fc3BlYyAqaWlvX2NoYW47Cj4g
IAkJaW50IHJldDsKPiAgCj4gQEAgLTEwNjQsNyArMTA2Miw3IEBAIHN0YXRpYyBpbnQgYWI4NTAw
X2dwYWRjX3BhcnNlX2NoYW5uZWxzKHN0cnVjdCBhYjg1MDBfZ3BhZGMgKmdwYWRjLAo+ICAJCXJl
dCA9IGFiODUwMF9ncGFkY19wYXJzZV9jaGFubmVsKGdwYWRjLT5kZXYsIGNoaWxkLCBjaCwKPiAg
CQkJCQkJIGlpb19jaGFuKTsKPiAgCQlpZiAocmV0KSB7Cj4gLQkJCW9mX25vZGVfcHV0KGNoaWxk
KTsKPiArCQkJZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwo+ICAJCQlyZXR1cm4gcmV0Owo+ICAJ
CX0KPiAgCQlpKys7Cj4gQEAgLTEwODEsNyArMTA3OSw2IEBAIHN0YXRpYyBpbnQgYWI4NTAwX2dw
YWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlzdHJ1Y3QgYWI4NTAw
X2dwYWRjICpncGFkYzsKPiAgCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7Cj4gIAlzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+IC0Jc3RydWN0IGRldmljZV9ub2RlICpucCA9IHBk
ZXYtPmRldi5vZl9ub2RlOwo+ICAJc3RydWN0IGlpb19jaGFuX3NwZWMgKmlpb19jaGFuczsKPiAg
CXVuc2lnbmVkIGludCBuX2lpb19jaGFuczsKPiAgCWludCByZXQ7Cj4gQEAgLTEwOTYsNyArMTA5
Myw3IEBAIHN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gIAlncGFkYy0+ZGV2ID0gZGV2Owo+ICAJZ3BhZGMtPmFiODUwMCA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYtPnBhcmVudCk7Cj4gIAo+IC0JcmV0ID0gYWI4NTAwX2dwYWRjX3BhcnNl
X2NoYW5uZWxzKGdwYWRjLCBucCwgJmlpb19jaGFucywgJm5faWlvX2NoYW5zKTsKPiArCXJldCA9
IGFiODUwMF9ncGFkY19wYXJzZV9jaGFubmVscyhncGFkYywgJmlpb19jaGFucywgJm5faWlvX2No
YW5zKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
