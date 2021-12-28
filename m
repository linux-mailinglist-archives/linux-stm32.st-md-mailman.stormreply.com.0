Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F897480C4D
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Dec 2021 19:02:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC2D6C5F1EF;
	Tue, 28 Dec 2021 18:02:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E713EC5C828
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 18:02:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6C1E3B81684;
 Tue, 28 Dec 2021 18:02:27 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 87DA9C36AEC;
 Tue, 28 Dec 2021 18:02:21 +0000 (UTC)
Date: Tue, 28 Dec 2021 18:08:05 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=        
 <u.kleine-koenig@pengutronix.de>
Message-ID: <20211228180805.54b99114@jic23-huawei>
In-Reply-To: <20211227094526.698714-12-u.kleine-koenig@pengutronix.de>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
 <20211227094526.698714-12-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [PATCH v2 11/23] counter: stm32-lptimer-cnt:
 Convert to counter_priv() wrapper
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

T24gTW9uLCAyNyBEZWMgMjAyMSAxMDo0NToxNCArMDEwMApVd2UgS2xlaW5lLUvDtm5pZyAgICAg
ICAgIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgoKPiBUaGlzIGlzIGEg
c3RyYWlnaHQgZm9yd2FyZCBjb252ZXJzaW9uIHRvIHRoZSBuZXcgY291bnRlcl9wcml2KCkgd3Jh
cHBlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgpBY2tlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4u
Q2FtZXJvbkBodWF3ZWkuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9jb3VudGVyL3N0bTMyLWxwdGlt
ZXItY250LmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jb3Vu
dGVyL3N0bTMyLWxwdGltZXItY250LmMgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItbHB0aW1lci1j
bnQuYwo+IGluZGV4IDUxNjg4MzNiMWZkZi4uOWNmMDBlOTI5Y2MwIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNudC5jCj4gKysrIGIvZHJpdmVycy9jb3VudGVy
L3N0bTMyLWxwdGltZXItY250LmMKPiBAQCAtMTQxLDcgKzE0MSw3IEBAIHN0YXRpYyBjb25zdCBl
bnVtIGNvdW50ZXJfc3luYXBzZV9hY3Rpb24gc3RtMzJfbHB0aW1fY250X3N5bmFwc2VfYWN0aW9u
c1tdID0gewo+ICBzdGF0aWMgaW50IHN0bTMyX2xwdGltX2NudF9yZWFkKHN0cnVjdCBjb3VudGVy
X2RldmljZSAqY291bnRlciwKPiAgCQkJCXN0cnVjdCBjb3VudGVyX2NvdW50ICpjb3VudCwgdTY0
ICp2YWwpCj4gIHsKPiAtCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3Vu
dGVyLT5wcml2Owo+ICsJc3RydWN0IHN0bTMyX2xwdGltX2NudCAqY29uc3QgcHJpdiA9IGNvdW50
ZXJfcHJpdihjb3VudGVyKTsKPiAgCXUzMiBjbnQ7Cj4gIAlpbnQgcmV0Owo+ICAKPiBAQCAtMTU4
LDcgKzE1OCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfbHB0aW1fY250X2Z1bmN0aW9uX3JlYWQoc3Ry
dWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAo+ICAJCQkJCSBzdHJ1Y3QgY291bnRlcl9jb3Vu
dCAqY291bnQsCj4gIAkJCQkJIGVudW0gY291bnRlcl9mdW5jdGlvbiAqZnVuY3Rpb24pCj4gIHsK
PiAtCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2Owo+
ICsJc3RydWN0IHN0bTMyX2xwdGltX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihjb3Vu
dGVyKTsKPiAgCj4gIAlpZiAoIXByaXYtPnF1YWRyYXR1cmVfbW9kZSkgewo+ICAJCSpmdW5jdGlv
biA9IENPVU5URVJfRlVOQ1RJT05fSU5DUkVBU0U7Cj4gQEAgLTE3Nyw3ICsxNzcsNyBAQCBzdGF0
aWMgaW50IHN0bTMyX2xwdGltX2NudF9mdW5jdGlvbl93cml0ZShzdHJ1Y3QgY291bnRlcl9kZXZp
Y2UgKmNvdW50ZXIsCj4gIAkJCQkJICBzdHJ1Y3QgY291bnRlcl9jb3VudCAqY291bnQsCj4gIAkJ
CQkJICBlbnVtIGNvdW50ZXJfZnVuY3Rpb24gZnVuY3Rpb24pCj4gIHsKPiAtCXN0cnVjdCBzdG0z
Ml9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2Owo+ICsJc3RydWN0IHN0bTMy
X2xwdGltX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKPiAgCj4gIAlp
ZiAoc3RtMzJfbHB0aW1faXNfZW5hYmxlZChwcml2KSkKPiAgCQlyZXR1cm4gLUVCVVNZOwo+IEBA
IC0yMDAsNyArMjAwLDcgQEAgc3RhdGljIGludCBzdG0zMl9scHRpbV9jbnRfZW5hYmxlX3JlYWQo
c3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAo+ICAJCQkJICAgICAgIHN0cnVjdCBjb3Vu
dGVyX2NvdW50ICpjb3VudCwKPiAgCQkJCSAgICAgICB1OCAqZW5hYmxlKQo+ICB7Cj4gLQlzdHJ1
Y3Qgc3RtMzJfbHB0aW1fY250ICpjb25zdCBwcml2ID0gY291bnRlci0+cHJpdjsKPiArCXN0cnVj
dCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYoY291bnRlcik7Cj4g
IAlpbnQgcmV0Owo+ICAKPiAgCXJldCA9IHN0bTMyX2xwdGltX2lzX2VuYWJsZWQocHJpdik7Cj4g
QEAgLTIxNiw3ICsyMTYsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2xwdGltX2NudF9lbmFibGVfd3Jp
dGUoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAo+ICAJCQkJCXN0cnVjdCBjb3VudGVy
X2NvdW50ICpjb3VudCwKPiAgCQkJCQl1OCBlbmFibGUpCj4gIHsKPiAtCXN0cnVjdCBzdG0zMl9s
cHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2Owo+ICsJc3RydWN0IHN0bTMyX2xw
dGltX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKPiAgCWludCByZXQ7
Cj4gIAo+ICAJLyogQ2hlY2sgbm9ib2R5IHVzZXMgdGhlIHRpbWVyLCBvciBhbHJlYWR5IGRpc2Fi
bGVkL2VuYWJsZWQgKi8KPiBAQCAtMjQxLDcgKzI0MSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfbHB0
aW1fY250X2NlaWxpbmdfcmVhZChzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCj4gIAkJ
CQkJc3RydWN0IGNvdW50ZXJfY291bnQgKmNvdW50LAo+ICAJCQkJCXU2NCAqY2VpbGluZykKPiAg
ewo+IC0Jc3RydWN0IHN0bTMyX2xwdGltX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXItPnByaXY7
Cj4gKwlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250ICpjb25zdCBwcml2ID0gY291bnRlcl9wcml2KGNv
dW50ZXIpOwo+ICAKPiAgCSpjZWlsaW5nID0gcHJpdi0+Y2VpbGluZzsKPiAgCj4gQEAgLTI1Miw3
ICsyNTIsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2xwdGltX2NudF9jZWlsaW5nX3dyaXRlKHN0cnVj
dCBjb3VudGVyX2RldmljZSAqY291bnRlciwKPiAgCQkJCQkgc3RydWN0IGNvdW50ZXJfY291bnQg
KmNvdW50LAo+ICAJCQkJCSB1NjQgY2VpbGluZykKPiAgewo+IC0Jc3RydWN0IHN0bTMyX2xwdGlt
X2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXItPnByaXY7Cj4gKwlzdHJ1Y3Qgc3RtMzJfbHB0aW1f
Y250ICpjb25zdCBwcml2ID0gY291bnRlcl9wcml2KGNvdW50ZXIpOwo+ICAKPiAgCWlmIChzdG0z
Ml9scHRpbV9pc19lbmFibGVkKHByaXYpKQo+ICAJCXJldHVybiAtRUJVU1k7Cj4gQEAgLTI3Nyw3
ICsyNzcsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2xwdGltX2NudF9hY3Rpb25fcmVhZChzdHJ1Y3Qg
Y291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCj4gIAkJCQkgICAgICAgc3RydWN0IGNvdW50ZXJfc3lu
YXBzZSAqc3luYXBzZSwKPiAgCQkJCSAgICAgICBlbnVtIGNvdW50ZXJfc3luYXBzZV9hY3Rpb24g
KmFjdGlvbikKPiAgewo+IC0Jc3RydWN0IHN0bTMyX2xwdGltX2NudCAqY29uc3QgcHJpdiA9IGNv
dW50ZXItPnByaXY7Cj4gKwlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250ICpjb25zdCBwcml2ID0gY291
bnRlcl9wcml2KGNvdW50ZXIpOwo+ICAJZW51bSBjb3VudGVyX2Z1bmN0aW9uIGZ1bmN0aW9uOwo+
ICAJaW50IGVycjsKPiAgCj4gQEAgLTMyMSw3ICszMjEsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2xw
dGltX2NudF9hY3Rpb25fd3JpdGUoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAo+ICAJ
CQkJCXN0cnVjdCBjb3VudGVyX3N5bmFwc2UgKnN5bmFwc2UsCj4gIAkJCQkJZW51bSBjb3VudGVy
X3N5bmFwc2VfYWN0aW9uIGFjdGlvbikKPiAgewo+IC0Jc3RydWN0IHN0bTMyX2xwdGltX2NudCAq
Y29uc3QgcHJpdiA9IGNvdW50ZXItPnByaXY7Cj4gKwlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250ICpj
b25zdCBwcml2ID0gY291bnRlcl9wcml2KGNvdW50ZXIpOwo+ICAJZW51bSBjb3VudGVyX2Z1bmN0
aW9uIGZ1bmN0aW9uOwo+ICAJaW50IGVycjsKPiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
