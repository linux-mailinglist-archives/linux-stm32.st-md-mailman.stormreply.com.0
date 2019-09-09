Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A72AD5C1
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Sep 2019 11:33:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3960C35E01;
	Mon,  9 Sep 2019 09:33:09 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 458F7C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Sep 2019 09:33:09 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id f13so12353035qkm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Sep 2019 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2tHmH1stIAhWci8qIBPtmNf+VD11DJ+UCL9f9Y17abo=;
 b=vrZnv+PStMf+ECSwAA9EBVmkJ1p3GaWvYFKNeMG3Owov4IHFuOEVR00hBZEXUYgKSh
 OieKMKPXAWSyeWC/HP+/8QjHPAQdr34fWMdBDb4EyrTrZzcaWm+bFSXF8/i1Qu+HEiyz
 CKq1XWiDER91AclIs00Rtj003JXkH1Eu9Ku5Gq5DOUvFkeqvW6kHPWF61Px47znWI9K1
 S/swfW3z34aw9icDEOL4KLxAVFXkRZCd61hfEJTlf//onBcY4c/nTKxMTOkbTn4T4qAu
 gUry9EPHH1pj8bML9BWQUN4v2UvpiQKwO3J3lFPxgg0Hq0i2zXZ1H1fYb9CNTHuZvNPo
 y/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2tHmH1stIAhWci8qIBPtmNf+VD11DJ+UCL9f9Y17abo=;
 b=V/Jj8Od9IUrnlNQyUZzIO0JWXfCYbeD8OoheIwsXLl9czgNNEDpKbznE8DuRSvUh/e
 KoYM++bWbsirU2vnyHl30AUyVoWyznCArzCooOp6vBJShzWNipSgjiZr93sg1568GfpE
 eKzykquHpUhzinkqzvCkyZUfYe/gtfPXaBUcowp2WyY9A9VPxNSiRp+96+xIUMJQlSVm
 rrbBB2eRJ04iP9f2j3R2R1+s8+IZpmw+3cstzDlS61b/ekO8iBl/vO+PbhT78OB1bnUR
 wFTu7wu5VXIrD2i42R9vVnV1Qvp4Ua2Dsy4aU0vSA4lOZyABNsvyz1lNgTeTvq/evlEc
 l4dw==
X-Gm-Message-State: APjAAAWmomwPJjX3Og25I/Ifi0sYH5m2YybbNI8Q6kcTJtB6ta1DVHDb
 PHaeSgeWUT8KY0MuQ4eUY4BimB8OGaXzkHZy6ZkEgw==
X-Google-Smtp-Source: APXvYqyJ2skoDsCxCcviaFJEdYxXi0/LKrzEr6iBfeSawT0Q0tTImcnSBrPILhJzLyjKObBRKhPopIxIjwlVAoBadOo=
X-Received: by 2002:ae9:dd81:: with SMTP id r123mr6813864qkf.103.1568021588009; 
 Mon, 09 Sep 2019 02:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <1567761708-31777-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1567761708-31777-1-git-send-email-yannick.fertre@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 9 Sep 2019 11:32:57 +0200
Message-ID: <CA+M3ks6MQBScJ4mOY3VD-OTP-wG2VfSLMxA-9z6ZkNAeO53SMA@mail.gmail.com>
To: =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: add pinctrl for DPI
	encoder mode
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

TGUgdmVuLiA2IHNlcHQuIDIwMTkgw6AgMTE6MjIsIFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5m
ZXJ0cmVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBUaGUgaW1wbGVtZW50YXRpb24gb2YgZnVuY3Rp
b25zIGVuY29kZXJfZW5hYmxlIGFuZCBlbmNvZGVyX2Rpc2FibGUKPiBtYWtlIHBvc3NpYmxlIHRv
IGNvbnRyb2wgdGhlIHBpbmN0cmwgYWNjb3JkaW5nIHRvIHRoZSBlbmNvZGVyIHR5cGUuCj4gVGhl
IHBpbmN0cmwgbXVzdCBiZSBhY3RpdmF0ZWQgb25seSBpZiB0aGUgZW5jb2RlciB0eXBlIGlzIERQ
SS4KPiBUaGlzIGhlbHBzIHRvIG1vdmUgdGhlIERQSS1yZWxhdGVkIHBpbmN0cmwgY29uZmlndXJh
dGlvbiBmcm9tCj4gYWxsIHRoZSBwYW5lbCBvciBicmlkZ2UgdG8gdGhlIExUREMgZHQgbm9kZS4K
Pgo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgo+
Cj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+
CgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQsClRoYW5rcywKQmVuamFtaW4KCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRk
Yy5jCj4gaW5kZXggM2FiNGZiZi4uMWM0ZmRlMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc3RtL2x0ZGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gQEAgLTE1
LDYgKzE1LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvb2ZfYWRkcmVzcy5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KPiArI2luY2x1
ZGUgPGxpbnV4L3BpbmN0cmwvY29uc3VtZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+ICAjaW5jbHVkZSA8
bGludXgvcmVzZXQuaD4KPiBAQCAtMTA0MCw2ICsxMDQxLDM2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2VuY29kZXJfZnVuY3MgbHRkY19lbmNvZGVyX2Z1bmNzID0gewo+ICAgICAgICAgLmRl
c3Ryb3kgPSBkcm1fZW5jb2Rlcl9jbGVhbnVwLAo+ICB9Owo+Cj4gK3N0YXRpYyB2b2lkIGx0ZGNf
ZW5jb2Rlcl9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiArewo+ICsgICAg
ICAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4gKwo+ICsgICAgICAg
RFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKPiArCj4gKyAgICAgICAvKiBTZXQgdG8gc2xlZXAgc3Rh
dGUgdGhlIHBpbmN0cmwgd2hhdGV2ZXIgdHlwZSBvZiBlbmNvZGVyICovCj4gKyAgICAgICBwaW5j
dHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShkZGV2LT5kZXYpOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
dm9pZCBsdGRjX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiAr
ewo+ICsgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4gKwo+
ICsgICAgICAgRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKPiArCj4gKyAgICAgICAvKgo+ICsgICAg
ICAgICogU2V0IHRvIGRlZmF1bHQgc3RhdGUgdGhlIHBpbmN0cmwgb25seSB3aXRoIERQSSB0eXBl
Lgo+ICsgICAgICAgICogT3RoZXJzIHR5cGVzIGxpa2UgRFNJLCBkb24ndCBuZWVkIHBpbmN0cmwg
ZHVlIHRvCj4gKyAgICAgICAgKiBpbnRlcm5hbCBicmlkZ2UgKHRoZSBzaWduYWxzIGRvIG5vdCBj
b21lIG91dCBvZiB0aGUgY2hpcHNldCkuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmIChlbmNv
ZGVyLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUEkpCj4gKyAgICAgICAgICAg
ICAgIHBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoZGRldi0+ZGV2KTsKPiArfQo+ICsK
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgbHRkY19lbmNv
ZGVyX2hlbHBlcl9mdW5jcyA9IHsKPiArICAgICAgIC5kaXNhYmxlID0gbHRkY19lbmNvZGVyX2Rp
c2FibGUsCj4gKyAgICAgICAuZW5hYmxlID0gbHRkY19lbmNvZGVyX2VuYWJsZSwKPiArfTsKPiAr
Cj4gIHN0YXRpYyBpbnQgbHRkY19lbmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYs
IHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlcjsKPiBAQCAtMTA1NSw2ICsxMDg2LDggQEAgc3RhdGljIGludCBsdGRjX2Vu
Y29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiwgc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSkKPiAgICAgICAgIGRybV9lbmNvZGVyX2luaXQoZGRldiwgZW5jb2RlciwgJmx0ZGNfZW5j
b2Rlcl9mdW5jcywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfRU5DT0RFUl9E
UEksIE5VTEwpOwo+Cj4gKyAgICAgICBkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIsICZs
dGRjX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPiArCj4gICAgICAgICByZXQgPSBkcm1fYnJpZGdl
X2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwpOwo+ICAgICAgICAgaWYgKHJldCkgewo+ICAg
ICAgICAgICAgICAgICBkcm1fZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIpOwo+IEBAIC0xMjgwLDYg
KzEzMTMsOCBAQCBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQo+Cj4gICAg
ICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUobGRldi0+cGl4ZWxfY2xrKTsKPgo+ICsgICAgICAg
cGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGRldi0+ZGV2KTsKPiArCj4gICAgICAgICBw
bV9ydW50aW1lX2VuYWJsZShkZGV2LT5kZXYpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAtLQo+
IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
