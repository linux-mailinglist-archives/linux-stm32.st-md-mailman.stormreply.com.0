Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2665BFED
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jan 2023 13:34:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7EBCC64110;
	Tue,  3 Jan 2023 12:34:11 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80574C03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 12:34:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D114BB80E4A;
 Tue,  3 Jan 2023 12:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464C4C433EF;
 Tue,  3 Jan 2023 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672749248;
 bh=Zv0HsH9alRe3Jbp1PCQVCB97IUwOrnBLb1PFj5noLvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H3/rMFsQkZ3HRh69JTFc5GNCuxsaem2VgYzhg3lormXHW92nyLCqSKHKl/TTdmTnm
 4+ES9BkLkNgzL1WcY/yxGnglu8W5P+ZYfSwr7bV/Nyug7ydPjs8yxyzFz65cb+FUqg
 3Ap7KpEIdCNjxkzgzsfLrrRxAogANSp9YiLNYZ3K50RQHWXtgbKfHAj4/cIMrOihEM
 BeFRQ+S7rBGVdZAj93i9kWtYT6XVGdJoDj4QWQN6Tx/UqUP4vLQe+VVi0MZ5t5nTpC
 vrdVNUWdscq/nJkN7Sq1Sa9WyxugJrcM8zvtuvWlVTMd0680wZ21pxT/LwZqptm+9Q
 r4LSYSaV6TXNQ==
Date: Tue, 3 Jan 2023 12:34:03 +0000
From: Lee Jones <lee@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <Y7Qgu8ugq/l7JzwU@google.com>
References: <20221213102707.1096345-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221213102707.1096345-1-olivier.moysan@foss.st.com>
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: enforce settings for pwm
	capture
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

T24gVHVlLCAxMyBEZWMgMjAyMiwgT2xpdmllciBNb3lzYW4gd3JvdGU6Cgo+IFRoZSBQV00gY2Fw
dHVyZSBhc3N1bWVzIHRoYXQgdGhlIGlucHV0IHNlbGVjdG9yIGlzIHNldCB0byBkZWZhdWx0Cj4g
aW5wdXQgYW5kIHRoYXQgdGhlIHNsYXZlIG1vZGUgaXMgZGlzYWJsZWQuIEZvcmNlIHJlc2V0IHN0
YXRlIGZvcgo+IFRJU0VMIGFuZCBTTUNSIHJlZ2lzdGVycyB0byBtYXRjaCB0aGlzIHJlcXVpcmVt
ZW50Lgo+IAo+IE5vdGUgdGhhdCBzbGF2ZSBtb2RlIGRpc2FibGluZyBpcyBub3QgYSBwcmUtcmVx
dWlzaXRlIGJ5IGl0c2VsZgo+IGZvciBjYXB0dXJlIG1vZGUsIGFzIGhhcmR3YXJlIHN1cHBvcnRz
IGl0IGZvciBQV00gY2FwdHVyZS4KPiBIb3dldmVyLCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgZHJpdmVyIGRvZXMgbm90Cj4gYWxsb3cgc2xhdmUgbW9kZSBmb3IgUFdNIGNhcHR1
cmUuIFNldHRpbmcgc2xhdmUgbW9kZSBmb3IgUFdNCj4gY2FwdHVyZSByZXN1bHRzIGluIHdyb25n
IGNhcHR1cmUgdmFsdWVzLgo+IAo+IEZpeGVzOiA1M2UzOGZlNzNmOTQgKCJwd206IHN0bTMyOiBB
ZGQgY2FwdHVyZSBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xp
dmllci5tb3lzYW5AZm9zcy5zdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5j
ICAgICAgICAgIHwgNCArKysrCj4gIGluY2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oIHwg
MSArCgpBY2tlZC1ieTogTGVlIEpvbmVzIDxsZWVAa2VybmVsLm9yZz4KCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1z
dG0zMi5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKPiBpbmRleCA3OTRjYTViMDI5NjguLjI0
YWFiMDQ1MGM3OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwo+ICsrKyBi
L2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCj4gQEAgLTIwNyw2ICsyMDcsMTAgQEAgc3RhdGljIGlu
dCBzdG0zMl9wd21fY2FwdHVyZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2
aWNlICpwd20sCj4gIAlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBUSU1fQVJSLCBwcml2LT5t
YXhfYXJyKTsKPiAgCXJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIFRJTV9QU0MsIHBzYyk7Cj4g
IAo+ICsJLyogUmVzZXQgaW5wdXQgc2VsZWN0b3IgdG8gaXRzIGRlZmF1bHQgaW5wdXQgYW5kIGRp
c2FibGUgc2xhdmUgbW9kZSAqLwo+ICsJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElNX1RJ
U0VMLCAweDApOwo+ICsJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElNX1NNQ1IsIDB4MCk7
Cj4gKwo+ICAJLyogTWFwIFRJMSBvciBUSTIgUFdNIGlucHV0IHRvIElDMSAmIElDMiAob3IgVEkz
LzQgdG8gSUMzICYgSUM0KSAqLwo+ICAJcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwK
PiAgCQkJICAgcHdtLT5od3B3bSA8IDIgPyBUSU1fQ0NNUjEgOiBUSU1fQ0NNUjIsCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oIGIvaW5jbHVkZS9saW51eC9t
ZmQvc3RtMzItdGltZXJzLmgKPiBpbmRleCA1ZjVjNDNmZDY5ZGQuLjFiOTQzMjVmZWJiMyAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oCj4gQEAgLTMxLDYgKzMxLDcgQEAKPiAgI2RlZmlu
ZSBUSU1fQkRUUgkweDQ0CS8qIEJyZWFrIGFuZCBEZWFkLVRpbWUgUmVnICovCj4gICNkZWZpbmUg
VElNX0RDUgkJMHg0OAkvKiBETUEgY29udHJvbCByZWdpc3RlciAgICAqLwo+ICAjZGVmaW5lIFRJ
TV9ETUFSCTB4NEMJLyogRE1BIHJlZ2lzdGVyIGZvciB0cmFuc2ZlciAqLwo+ICsjZGVmaW5lIFRJ
TV9USVNFTAkweDY4CS8qIElucHV0IFNlbGVjdGlvbiAgICAgICAgICovCj4gIAo+ICAjZGVmaW5l
IFRJTV9DUjFfQ0VOCUJJVCgwKQkvKiBDb3VudGVyIEVuYWJsZQkgICAqLwo+ICAjZGVmaW5lIFRJ
TV9DUjFfRElSCUJJVCg0KSAgLyogQ291bnRlciBEaXJlY3Rpb24JICAgKi8KPiAtLSAKPiAyLjI1
LjEKPiAKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
