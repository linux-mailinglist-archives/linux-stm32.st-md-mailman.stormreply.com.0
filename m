Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 450ACA52E0
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 11:35:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF5FBC35E01;
	Mon,  2 Sep 2019 09:35:20 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 064C9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2019 09:35:19 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id x134so1823899qkb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Sep 2019 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=38YIQw9rYXVcXSnz01ylMn1XuQgT2tKgepHXTvRAlmI=;
 b=MrtEnvsPeKbpdEE6n4t+yRTgqlactOV8g1SI+5jk0ZIyXDWGDbTrfXIz12VxRvYixu
 SI8Ls/by2Tn0tT31+NYhrzpSyE5Qa9YGGnyhVIPRyvIcUhdZeF3bi3rdJehdc0tDmz98
 CTP/uleQTCSkAmNWdqVCC0BkzhNBysidHkm9VFiK2EhUzjY3+sHD3BjBFcGIETlSLr27
 i6Qiijo8rqb36DwmQYlzWbmf2lxeJ2FOYX04K4zDuxcziu8LoskVWRvp4bG8nMy1wfVs
 bPt6NY0feBStC430sECK7fDZ4b8hOSs4S7Lbxq8HXiYsTdy5BQedyRMgkTk2AqWIjazR
 8/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=38YIQw9rYXVcXSnz01ylMn1XuQgT2tKgepHXTvRAlmI=;
 b=FWyrh1zsKC845HrhY0w8f2OJ2hiBRZbw9H35JiHrJucb/8SsWsOpKrIpYdnSSw6T2G
 QnCfUFSkUPnCdnjDfKQEPYBQyQW0sjWsYtD+vUtxT2DKwWF2ElSSb58VmfC6UxFv2Vxz
 zzMvTZT+1QJaHnZmHvcCKu0nFr3c3ePMT3ZPxGtie/sQsfnj426inUyO7Uw64YO+Hdz9
 9xB4wWM1zGb6KSvG91bqPEVVCeD5m/uC7Oh7+uMVyFwQaWjPSysFjW51tyooHu2WUdXX
 DiSMZbouOulrRSh6SP4vAP5ZEcRF1Kb2HmJQdnTZz6VjUXVAIldt1VqRsIwbIpptIOY1
 TrWw==
X-Gm-Message-State: APjAAAXDmr48m7Eag1ofE7VCgaK+HIq7lXpmw7H65cAI2GdZ7naIEjco
 6vTw0RbrFx/OvmyJD1bbxMZb6PGliA5N5Az14lEeEQ==
X-Google-Smtp-Source: APXvYqzstwtUHC+bSs9WdknmyMWA119lZrPIEt6ddRW8DWeESXgG8Thvv6/PsX8pItz2k9fLmDu/VaDOP/UcM6Gga/c=
X-Received: by 2002:a37:8547:: with SMTP id h68mr6152302qkd.219.1567416918785; 
 Mon, 02 Sep 2019 02:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <1564757262-6166-1-git-send-email-yannick.fertre@st.com>
 <ada48bc2-ac6a-8732-9aa6-03ef1c104abf@st.com>
In-Reply-To: <ada48bc2-ac6a-8732-9aa6-03ef1c104abf@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 2 Sep 2019 11:35:07 +0200
Message-ID: <CA+M3ks6MurXFitY24Cm9jCVx8h+VxTDFARxKuqg7MmhUk58X7w@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

K2RyaS1kZXZlbCBtYWlsaW5nIGxpc3QKCkxlIGx1bi4gMiBzZXB0LiAyMDE5IMOgIDEwOjQ3LCBQ
aGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBZ
YW5uaWNrLAo+Cj4gT24gOC8yLzE5IDQ6NDcgUE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToKPiA+
IFRoZSBpbXBsZW1lbnRhdGlvbiBvZiBmdW5jdGlvbnMgZW5jb2Rlcl9lbmFibGUgYW5kIGVuY29k
ZXJfZGlzYWJsZQo+ID4gbWFrZSBwb3NzaWJsZSB0byBjb250cm9sIHRoZSBwaW5jdHJsIGFjY29y
ZGluZyB0byB0aGUgZW5jb2RlciB0eXBlLgo+ID4gVGhlIHBpbmN0cmwgbXVzdCBiZSBhY3RpdmF0
ZWQgb25seSBpZiB0aGUgZW5jb2RlciB0eXBlIGlzIERQSS4KPiA+IFRoaXMgaGVscHMgdG8gbW92
ZSB0aGUgRFBJLXJlbGF0ZWQgcGluY3RybCBjb25maWd1cmF0aW9uIGZyb20KPiA+IGFsbCB0aGUg
cGFuZWwgb3IgYnJpZGdlIHRvIHRoZSBMVERDIGR0IG5vZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4gPiAtLS0KPiA+ICAg
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vbHRkYy5jCj4gPiBpbmRleCAzYWI0ZmJmLi4xYzRmZGUwIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jCj4gPiBAQCAtMTUsNiArMTUsNyBAQAo+ID4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+Cj4gPiAgICNpbmNsdWRlIDxs
aW51eC9vZl9ncmFwaC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+
Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICAgI2luY2x1ZGUg
PGxpbnV4L3BtX3J1bnRpbWUuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4gPiBA
QCAtMTA0MCw2ICsxMDQxLDM2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVu
Y3MgbHRkY19lbmNvZGVyX2Z1bmNzID0gewo+ID4gICAgICAgLmRlc3Ryb3kgPSBkcm1fZW5jb2Rl
cl9jbGVhbnVwLAo+ID4gICB9Owo+ID4KPiA+ICtzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZGlz
YWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gPiArewo+ID4gKyAgICAgc3RydWN0
IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4gPiArCj4gPiArICAgICBEUk1fREVC
VUdfRFJJVkVSKCJcbiIpOwo+ID4gKwo+ID4gKyAgICAgLyogU2V0IHRvIHNsZWVwIHN0YXRlIHRo
ZSBwaW5jdHJsIHdoYXRldmVyIHR5cGUgb2YgZW5jb2RlciAqLwo+ID4gKyAgICAgcGluY3RybF9w
bV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGRldi0+ZGV2KTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGlj
IHZvaWQgbHRkY19lbmNvZGVyX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4g
PiArewo+ID4gKyAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4g
PiArCj4gPiArICAgICBEUk1fREVCVUdfRFJJVkVSKCJcbiIpOwo+ID4gKwo+ID4gKyAgICAgLyoK
PiA+ICsgICAgICAqIFNldCB0byBkZWZhdWx0IHN0YXRlIHRoZSBwaW5jdHJsIG9ubHkgd2l0aCBE
UEkgdHlwZS4KPiA+ICsgICAgICAqIE90aGVycyB0eXBlcyBsaWtlIERTSSwgZG9uJ3QgbmVlZCBw
aW5jdHJsIGR1ZSB0bwo+ID4gKyAgICAgICogaW50ZXJuYWwgYnJpZGdlICh0aGUgc2lnbmFscyBk
byBub3QgY29tZSBvdXQgb2YgdGhlIGNoaXBzZXQpLgo+ID4gKyAgICAgICovCj4gPiArICAgICBp
ZiAoZW5jb2Rlci0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFBJKQo+ID4gKyAg
ICAgICAgICAgICBwaW5jdHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0YXRlKGRkZXYtPmRldik7Cj4g
PiArfQo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1
bmNzIGx0ZGNfZW5jb2Rlcl9oZWxwZXJfZnVuY3MgPSB7Cj4gPiArICAgICAuZGlzYWJsZSA9IGx0
ZGNfZW5jb2Rlcl9kaXNhYmxlLAo+ID4gKyAgICAgLmVuYWJsZSA9IGx0ZGNfZW5jb2Rlcl9lbmFi
bGUsCj4gPiArfTsKPiA+ICsKPiA+ICAgc3RhdGljIGludCBsdGRjX2VuY29kZXJfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGRldiwgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiA+ICAgewo+
ID4gICAgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwo+ID4gQEAgLTEwNTUsNiArMTA4
Niw4IEBAIHN0YXRpYyBpbnQgbHRkY19lbmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRk
ZXYsIHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gPiAgICAgICBkcm1fZW5jb2Rlcl9pbml0
KGRkZXYsIGVuY29kZXIsICZsdGRjX2VuY29kZXJfZnVuY3MsCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgIERSTV9NT0RFX0VOQ09ERVJfRFBJLCBOVUxMKTsKPiA+Cj4gPiArICAgICBkcm1fZW5j
b2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIsICZsdGRjX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPiA+
ICsKPiA+ICAgICAgIHJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsIGJyaWRnZSwgTlVM
TCk7Cj4gPiAgICAgICBpZiAocmV0KSB7Cj4gPiAgICAgICAgICAgICAgIGRybV9lbmNvZGVyX2Ns
ZWFudXAoZW5jb2Rlcik7Cj4gPiBAQCAtMTI4MCw2ICsxMzEzLDggQEAgaW50IGx0ZGNfbG9hZChz
dHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPiA+Cj4gPiAgICAgICBjbGtfZGlzYWJsZV91bnByZXBh
cmUobGRldi0+cGl4ZWxfY2xrKTsKPiA+Cj4gPiArICAgICBwaW5jdHJsX3BtX3NlbGVjdF9zbGVl
cF9zdGF0ZShkZGV2LT5kZXYpOwo+ID4gKwo+Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51
IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Cj4KPiBUaGFua3MKPiBQaGlsaXBwZSA6KQo+Cj4gPiAg
ICAgICBwbV9ydW50aW1lX2VuYWJsZShkZGV2LT5kZXYpOwo+ID4KPiA+ICAgICAgIHJldHVybiAw
Owo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
