Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022E480C77
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Dec 2021 19:20:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9F64C5F1EF;
	Tue, 28 Dec 2021 18:20:50 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8C97C5C828
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 18:20:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E57CB816DD;
 Tue, 28 Dec 2021 18:20:49 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 77F78C36AEC;
 Tue, 28 Dec 2021 18:20:43 +0000 (UTC)
Date: Tue, 28 Dec 2021 18:26:27 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=        
 <u.kleine-koenig@pengutronix.de>
Message-ID: <20211228182627.10dddf72@jic23-huawei>
In-Reply-To: <20211227094526.698714-22-u.kleine-koenig@pengutronix.de>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
 <20211227094526.698714-22-u.kleine-koenig@pengutronix.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 21/23] counter: stm32-lptimer-cnt:
 Convert to new counter registration
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

T24gTW9uLCAyNyBEZWMgMjAyMSAxMDo0NToyNCArMDEwMApVd2UgS2xlaW5lLUvDtm5pZyAgICAg
ICAgIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgoKPiBUaGlzIGZpeGVz
IGRldmljZSBsaWZldGltZSBpc3N1ZXMgd2hlcmUgaXQgd2FzIHBvc3NpYmxlIHRvIGZyZWUgYSBs
aXZlCj4gc3RydWN0IGRldmljZS4KPiAKPiBGaXhlczogNTk3ZjU1ZTNmMzZjICgiY291bnRlcjog
c3RtMzItbHB0aW1lcjogYWRkIGNvdW50ZXIgZGV2aWNlIikKPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQt
Ynk6IEpvbmF0aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4KCj4gLS0t
Cj4gIGRyaXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNudC5jIHwgMzMgKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NvdW50ZXIvc3RtMzItbHB0
aW1lci1jbnQuYyBiL2RyaXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNudC5jCj4gaW5kZXgg
OWNmMDBlOTI5Y2MwLi42ODAzMWQ5M2NlODkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jb3VudGVy
L3N0bTMyLWxwdGltZXItY250LmMKPiArKysgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItbHB0aW1l
ci1jbnQuYwo+IEBAIC0yMCw3ICsyMCw2IEBACj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+
ICAKPiAgc3RydWN0IHN0bTMyX2xwdGltX2NudCB7Cj4gLQlzdHJ1Y3QgY291bnRlcl9kZXZpY2Ug
Y291bnRlcjsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsKPiAgCXN0cnVjdCByZWdtYXAgKnJlZ21h
cDsKPiAgCXN0cnVjdCBjbGsgKmNsazsKPiBAQCAtNDExLDE0ICs0MTAsMTcgQEAgc3RhdGljIHN0
cnVjdCBjb3VudGVyX2NvdW50IHN0bTMyX2xwdGltX2luMV9jb3VudHMgPSB7Cj4gIHN0YXRpYyBp
bnQgc3RtMzJfbHB0aW1fY250X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IHsKPiAgCXN0cnVjdCBzdG0zMl9scHRpbWVyICpkZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShwZGV2
LT5kZXYucGFyZW50KTsKPiArCXN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlcjsKPiAgCXN0
cnVjdCBzdG0zMl9scHRpbV9jbnQgKnByaXY7Cj4gKwlpbnQgcmV0Owo+ICAKPiAgCWlmIChJU19F
UlJfT1JfTlVMTChkZGF0YSkpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+IC0JcHJpdiA9IGRl
dm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsKPiAtCWlm
ICghcHJpdikKPiArCWNvdW50ZXIgPSBkZXZtX2NvdW50ZXJfYWxsb2MoJnBkZXYtPmRldiwgc2l6
ZW9mKCpwcml2KSk7Cj4gKwlpZiAoIWNvdW50ZXIpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gKwlw
cml2ID0gY291bnRlcl9wcml2KGNvdW50ZXIpOwo+ICAKPiAgCXByaXYtPmRldiA9ICZwZGV2LT5k
ZXY7Cj4gIAlwcml2LT5yZWdtYXAgPSBkZGF0YS0+cmVnbWFwOwo+IEBAIC00MjYsMjMgKzQyOCwy
NiBAQCBzdGF0aWMgaW50IHN0bTMyX2xwdGltX2NudF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICAJcHJpdi0+Y2VpbGluZyA9IFNUTTMyX0xQVElNX01BWF9BUlI7Cj4gIAo+
ICAJLyogSW5pdGlhbGl6ZSBDb3VudGVyIGRldmljZSAqLwo+IC0JcHJpdi0+Y291bnRlci5uYW1l
ID0gZGV2X25hbWUoJnBkZXYtPmRldik7Cj4gLQlwcml2LT5jb3VudGVyLnBhcmVudCA9ICZwZGV2
LT5kZXY7Cj4gLQlwcml2LT5jb3VudGVyLm9wcyA9ICZzdG0zMl9scHRpbV9jbnRfb3BzOwo+ICsJ
Y291bnRlci0+bmFtZSA9IGRldl9uYW1lKCZwZGV2LT5kZXYpOwo+ICsJY291bnRlci0+cGFyZW50
ID0gJnBkZXYtPmRldjsKPiArCWNvdW50ZXItPm9wcyA9ICZzdG0zMl9scHRpbV9jbnRfb3BzOwo+
ICAJaWYgKGRkYXRhLT5oYXNfZW5jb2Rlcikgewo+IC0JCXByaXYtPmNvdW50ZXIuY291bnRzID0g
JnN0bTMyX2xwdGltX2VuY19jb3VudHM7Cj4gLQkJcHJpdi0+Y291bnRlci5udW1fc2lnbmFscyA9
IEFSUkFZX1NJWkUoc3RtMzJfbHB0aW1fY250X3NpZ25hbHMpOwo+ICsJCWNvdW50ZXItPmNvdW50
cyA9ICZzdG0zMl9scHRpbV9lbmNfY291bnRzOwo+ICsJCWNvdW50ZXItPm51bV9zaWduYWxzID0g
QVJSQVlfU0laRShzdG0zMl9scHRpbV9jbnRfc2lnbmFscyk7Cj4gIAl9IGVsc2Ugewo+IC0JCXBy
aXYtPmNvdW50ZXIuY291bnRzID0gJnN0bTMyX2xwdGltX2luMV9jb3VudHM7Cj4gLQkJcHJpdi0+
Y291bnRlci5udW1fc2lnbmFscyA9IDE7Cj4gKwkJY291bnRlci0+Y291bnRzID0gJnN0bTMyX2xw
dGltX2luMV9jb3VudHM7Cj4gKwkJY291bnRlci0+bnVtX3NpZ25hbHMgPSAxOwo+ICAJfQo+IC0J
cHJpdi0+Y291bnRlci5udW1fY291bnRzID0gMTsKPiAtCXByaXYtPmNvdW50ZXIuc2lnbmFscyA9
IHN0bTMyX2xwdGltX2NudF9zaWduYWxzOwo+IC0JcHJpdi0+Y291bnRlci5wcml2ID0gcHJpdjsK
PiArCWNvdW50ZXItPm51bV9jb3VudHMgPSAxOwo+ICsJY291bnRlci0+c2lnbmFscyA9IHN0bTMy
X2xwdGltX2NudF9zaWduYWxzOwo+ICAKPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHBy
aXYpOwo+ICAKPiAtCXJldHVybiBkZXZtX2NvdW50ZXJfcmVnaXN0ZXIoJnBkZXYtPmRldiwgJnBy
aXYtPmNvdW50ZXIpOwo+ICsJcmV0ID0gZGV2bV9jb3VudGVyX2FkZCgmcGRldi0+ZGV2LCBjb3Vu
dGVyKTsKPiArCWlmIChyZXQgPCAwKQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5k
ZXYsIHJldCwgIkZhaWxlZCB0byBhZGQgY291bnRlclxuIik7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4g
IH0KPiAgCj4gICNpZmRlZiBDT05GSUdfUE1fU0xFRVAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
