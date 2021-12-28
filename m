Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED5D480C75
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Dec 2021 19:19:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C332CC5F1EF;
	Tue, 28 Dec 2021 18:19:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3252C5C828
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 18:19:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58829B816DD;
 Tue, 28 Dec 2021 18:19:42 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 7F351C36AE9;
 Tue, 28 Dec 2021 18:19:36 +0000 (UTC)
Date: Tue, 28 Dec 2021 18:25:21 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=        
 <u.kleine-koenig@pengutronix.de>
Message-ID: <20211228182521.1774dc79@jic23-huawei>
In-Reply-To: <20211227094526.698714-21-u.kleine-koenig@pengutronix.de>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
 <20211227094526.698714-21-u.kleine-koenig@pengutronix.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 20/23] counter: stm32-timer-cnt:
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

T24gTW9uLCAyNyBEZWMgMjAyMSAxMDo0NToyMyArMDEwMApVd2UgS2xlaW5lLUvDtm5pZyAgICAg
ICAgIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgoKPiBUaGlzIGZpeGVz
IGRldmljZSBsaWZldGltZSBpc3N1ZXMgd2hlcmUgaXQgd2FzIHBvc3NpYmxlIHRvIGZyZWUgYSBs
aXZlCj4gc3RydWN0IGRldmljZS4KPiAKPiBGaXhlczogYWQyOTkzN2UyMDZmICgiY291bnRlcjog
QWRkIFNUTTMyIFRpbWVyIHF1YWRyYXR1cmUgZW5jb2RlciIpCj4gU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KUmV2aWV3ZWQt
Ynk6IEpvbmF0aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4KClNhbWUg
YmFzaWMgZm9ybSBhcyBhbGwgdGhlIG90aGVycyBzbyBlYXN5IHRvIHJldmlldyAoaG9wZWZ1bGx5
IDopCgpKb25hdGhhbgoKPiAtLS0KPiAgZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5j
IHwgMzAgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5jIGIvZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVy
LWNudC5jCj4gaW5kZXggNGIwNWIxOThhOGQ4Li41Nzc5YWU3YzczY2YgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5jCj4gKysrIGIvZHJpdmVycy9jb3VudGVy
L3N0bTMyLXRpbWVyLWNudC5jCj4gQEAgLTI5LDcgKzI5LDYgQEAgc3RydWN0IHN0bTMyX3RpbWVy
X3JlZ3Mgewo+ICB9Owo+ICAKPiAgc3RydWN0IHN0bTMyX3RpbWVyX2NudCB7Cj4gLQlzdHJ1Y3Qg
Y291bnRlcl9kZXZpY2UgY291bnRlcjsKPiAgCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPiAgCXN0
cnVjdCBjbGsgKmNsazsKPiAgCXUzMiBtYXhfYXJyOwo+IEBAIC0zMTcsMzEgKzMxNiwzOCBAQCBz
dGF0aWMgaW50IHN0bTMyX3RpbWVyX2NudF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICAJc3RydWN0IHN0bTMyX3RpbWVycyAqZGRhdGEgPSBkZXZfZ2V0X2RydmRhdGEocGRl
di0+ZGV2LnBhcmVudCk7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICAJ
c3RydWN0IHN0bTMyX3RpbWVyX2NudCAqcHJpdjsKPiArCXN0cnVjdCBjb3VudGVyX2RldmljZSAq
Y291bnRlcjsKPiArCWludCByZXQ7Cj4gIAo+ICAJaWYgKElTX0VSUl9PUl9OVUxMKGRkYXRhKSkK
PiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gLQlwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6
ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7Cj4gLQlpZiAoIXByaXYpCj4gKwljb3VudGVyID0gZGV2
bV9jb3VudGVyX2FsbG9jKGRldiwgc2l6ZW9mKCpwcml2KSk7Cj4gKwlpZiAoIWNvdW50ZXIpCj4g
IAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+ICsJcHJpdiA9IGNvdW50ZXJfcHJpdihjb3VudGVyKTsK
PiArCj4gIAlwcml2LT5yZWdtYXAgPSBkZGF0YS0+cmVnbWFwOwo+ICAJcHJpdi0+Y2xrID0gZGRh
dGEtPmNsazsKPiAgCXByaXYtPm1heF9hcnIgPSBkZGF0YS0+bWF4X2FycjsKPiAgCj4gLQlwcml2
LT5jb3VudGVyLm5hbWUgPSBkZXZfbmFtZShkZXYpOwo+IC0JcHJpdi0+Y291bnRlci5wYXJlbnQg
PSBkZXY7Cj4gLQlwcml2LT5jb3VudGVyLm9wcyA9ICZzdG0zMl90aW1lcl9jbnRfb3BzOwo+IC0J
cHJpdi0+Y291bnRlci5jb3VudHMgPSAmc3RtMzJfY291bnRzOwo+IC0JcHJpdi0+Y291bnRlci5u
dW1fY291bnRzID0gMTsKPiAtCXByaXYtPmNvdW50ZXIuc2lnbmFscyA9IHN0bTMyX3NpZ25hbHM7
Cj4gLQlwcml2LT5jb3VudGVyLm51bV9zaWduYWxzID0gQVJSQVlfU0laRShzdG0zMl9zaWduYWxz
KTsKPiAtCXByaXYtPmNvdW50ZXIucHJpdiA9IHByaXY7Cj4gKwljb3VudGVyLT5uYW1lID0gZGV2
X25hbWUoZGV2KTsKPiArCWNvdW50ZXItPnBhcmVudCA9IGRldjsKPiArCWNvdW50ZXItPm9wcyA9
ICZzdG0zMl90aW1lcl9jbnRfb3BzOwo+ICsJY291bnRlci0+Y291bnRzID0gJnN0bTMyX2NvdW50
czsKPiArCWNvdW50ZXItPm51bV9jb3VudHMgPSAxOwo+ICsJY291bnRlci0+c2lnbmFscyA9IHN0
bTMyX3NpZ25hbHM7Cj4gKwljb3VudGVyLT5udW1fc2lnbmFscyA9IEFSUkFZX1NJWkUoc3RtMzJf
c2lnbmFscyk7Cj4gIAo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7Cj4gIAo+
ICAJLyogUmVnaXN0ZXIgQ291bnRlciBkZXZpY2UgKi8KPiAtCXJldHVybiBkZXZtX2NvdW50ZXJf
cmVnaXN0ZXIoZGV2LCAmcHJpdi0+Y291bnRlcik7Cj4gKwlyZXQgPSBkZXZtX2NvdW50ZXJfYWRk
KGRldiwgY291bnRlcik7Cj4gKwlpZiAocmV0IDwgMCkKPiArCQlkZXZfZXJyX3Byb2JlKGRldiwg
cmV0LCAiRmFpbGVkIHRvIGFkZCBjb3VudGVyXG4iKTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICB9
Cj4gIAo+ICBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3RpbWVyX2NudF9zdXNwZW5k
KHN0cnVjdCBkZXZpY2UgKmRldikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
