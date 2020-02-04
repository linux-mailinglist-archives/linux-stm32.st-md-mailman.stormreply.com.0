Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7F15190C
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 11:57:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA4FDC36B0C;
	Tue,  4 Feb 2020 10:57:00 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3833C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 10:56:57 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id db9so8327660qvb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Feb 2020 02:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/oUsrvLxDIg2kRTkRIDa+3f0CNVdXlRSCLiuyEtYa9c=;
 b=QBN3hZRqRJfvXM7KsldzN/Y7UB9nRf6fT56y9YAkEYDPA55hGUnbTbep8I6bfTbsdW
 m9Pwoqx4QhXDeO4XtwYSVmDPrWsWQOAo19+2PH+U9Ib5ANtLC8DwrcskFIYSaLHRm45h
 wLNqkjMwYOrCgjqSaai4YcdjOhwatJxCFjhvu8E89Kxo754pXUvKWDfKHhQxIbcwKFzj
 h/dQt17+28/5KKynnLEiKf8IZ/OdCSCJJKD1FhhadNOwhLKCLtBsQjUOMyr5LS94Be9/
 jR+tIGVKEm8A36MijR7kSUYjISnBxK4tA4/iPgmJoWnNId1zmePgSeO4W49pCkgbszTL
 EAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/oUsrvLxDIg2kRTkRIDa+3f0CNVdXlRSCLiuyEtYa9c=;
 b=XjsgRBUG3IFXX/814cGBmSGtDjowsgmTv46mPUQdHwHdy7x3g5N1JhsuQ2DfI+ldE7
 ucHCkO8Cj91r//71CsDE2YXND7oj4saTNfdNWGQ/gwvv9sS0+n81F0+mwI11i59m5D8v
 ZcmazlXd/dmrM925FGHK/HSiLO3bGHBRbocRTuvbvxCq6lKxe0Q48CEiljcezXEJOMku
 vtGxjuN/mB48vVWJzH2nmo44+z2Rw9BJZAvJBr2T1ISTTZQwCRcVvK3T3Gpv+eb7TUcl
 OtfHBW2uaA5Pb8m/wQud6SVMv7vEPmyIBfXWoMw5wsgc+AMr8CraM9HYITG05FHwI73q
 WDVQ==
X-Gm-Message-State: APjAAAXy/7Acpuu32I7O1renVtbsEQUyHhK8rCnsZS2KF+f2FMsO5opz
 uhaircUV8QBR/pGIFVhmH/sv9LJJec4tuax8HZZGmA==
X-Google-Smtp-Source: APXvYqwHoNsb4va0mzD8ErAs5TLzl8MOKBkFKNiQum74YciVvwTDMrSJ6Tqrk1Jak8OGeSAYlPULUa93UHza4xbn1YQ=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr25795609qvp.210.1580813815924; 
 Tue, 04 Feb 2020 02:56:55 -0800 (PST)
MIME-Version: 1.0
References: <1579528013-28445-1-git-send-email-yannick.fertre@st.com>
 <69cced11-c30a-da6c-0465-79b632901b62@st.com>
In-Reply-To: <69cced11-c30a-da6c-0465-79b632901b62@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 4 Feb 2020 11:56:45 +0100
Message-ID: <CA+M3ks5dcQOcHAszgCP=XH5dQrO7OYqpHybeZOm2dXrLBeoJ+w@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: enable/disable depends on
	encoder
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

TGUgamV1LiAyMyBqYW52LiAyMDIwIMOgIDEwOjQ3LCBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUu
Y29ybnVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBEZWFyIFlhbm5pY2ssCj4gVGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBQaGlsaXBwZSA6LSkKPgo+IE9uIDEvMjAvMjAgMjo0NiBQTSwgWWFubmlj
ayBGZXJ0cmUgd3JvdGU6Cj4gPiBGcm9tOiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJl
QHN0LmNvbT4KPiA+Cj4gPiBXaGVuIGNvbm5lY3RlZCB0byBhIGRzaSBob3N0LCB0aGUgbHRkYyBk
aXNwbGF5IGNvbnRyb2xsZXIKPiA+IG11c3Qgc2VuZCBmcmFtZXMgb25seSBhZnRlciB0aGUgZW5k
IG9mIHRoZSBkc2kgcGFuZWwKPiA+IGluaXRpYWxpemF0aW9uIHRvIGF2b2lkIGVycm9ycyB3aGVu
IHRoZSBkc2kgaG9zdCBzZW5kcwo+ID4gY29tbWFuZHMgdG8gdGhlIGRzaSBwYW5lbCAoZHNpIHB4
IGZpZm8gZnVsbCkuCj4gPiBUbyBhdm9pZCB0aGlzIGlzc3VlLCB0aGUgZGlzcGxheSBjb250cm9s
bGVyIG11c3QgYmUKPiA+IGVuYWJsZWQvZGlzYWJsZWQgd2hlbiB0aGUgZW5jb2RlciBpcyBlbmFi
bGVkL2Rpc2FibGVkLgo+ID4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4KClRoYW5rcwpCZW5q
YW1pbgoKPiA+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVA
c3QuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgMTQgKysr
KysrKystLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gaW5kZXggNzE5ZGZjNS4uOWVmMTI1ZCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gQEAgLTQzNyw5ICs0MzcsNiBAQCBzdGF0aWMgdm9p
ZCBsdGRjX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gPiAgICAg
ICAvKiBDb21taXQgc2hhZG93IHJlZ2lzdGVycyA9IHVwZGF0ZSBwbGFuZXMgYXQgbmV4dCB2Ymxh
bmsgKi8KPiA+ICAgICAgIHJlZ19zZXQobGRldi0+cmVncywgTFREQ19TUkNSLCBTUkNSX1ZCUik7
Cj4gPgo+ID4gLSAgICAgLyogRW5hYmxlIExUREMgKi8KPiA+IC0gICAgIHJlZ19zZXQobGRldi0+
cmVncywgTFREQ19HQ1IsIEdDUl9MVERDRU4pOwo+ID4gLQo+ID4gICAgICAgZHJtX2NydGNfdmJs
YW5rX29uKGNydGMpOwo+ID4gICB9Cj4gPgo+ID4gQEAgLTQ1Myw5ICs0NTAsNiBAQCBzdGF0aWMg
dm9pZCBsdGRjX2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4K
PiA+ICAgICAgIGRybV9jcnRjX3ZibGFua19vZmYoY3J0Yyk7Cj4gPgo+ID4gLSAgICAgLyogZGlz
YWJsZSBMVERDICovCj4gPiAtICAgICByZWdfY2xlYXIobGRldi0+cmVncywgTFREQ19HQ1IsIEdD
Ul9MVERDRU4pOwo+ID4gLQo+ID4gICAgICAgLyogZGlzYWJsZSBJUlEgKi8KPiA+ICAgICAgIHJl
Z19jbGVhcihsZGV2LT5yZWdzLCBMVERDX0lFUiwgSUVSX1JSSUUgfCBJRVJfRlVJRSB8IElFUl9U
RVJSSUUpOwo+ID4KPiA+IEBAIC0xMDU4LDkgKzEwNTIsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZW5jb2Rlcl9mdW5jcyBsdGRjX2VuY29kZXJfZnVuY3MgPSB7Cj4gPiAgIHN0YXRpYyB2
b2lkIGx0ZGNfZW5jb2Rlcl9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiA+
ICAgewo+ID4gICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4g
PiArICAgICBzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKPiA+
Cj4gPiAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJcbiIpOwo+ID4KPiA+ICsgICAgIC8qIERpc2Fi
bGUgTFREQyAqLwo+ID4gKyAgICAgcmVnX2NsZWFyKGxkZXYtPnJlZ3MsIExURENfR0NSLCBHQ1Jf
TFREQ0VOKTsKPiA+ICsKPiA+ICAgICAgIC8qIFNldCB0byBzbGVlcCBzdGF0ZSB0aGUgcGluY3Ry
bCB3aGF0ZXZlciB0eXBlIG9mIGVuY29kZXIgKi8KPiA+ICAgICAgIHBpbmN0cmxfcG1fc2VsZWN0
X3NsZWVwX3N0YXRlKGRkZXYtPmRldik7Cj4gPiAgIH0KPiA+IEBAIC0xMDY4LDYgKzEwNjYsNyBA
QCBzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZGlzYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIpCj4gPiAgIHN0YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9lbmFibGUoc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyKQo+ID4gICB7Cj4gPiAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGRl
diA9IGVuY29kZXItPmRldjsKPiA+ICsgICAgIHN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGRk
ZXYtPmRldl9wcml2YXRlOwo+ID4KPiA+ICAgICAgIERSTV9ERUJVR19EUklWRVIoIlxuIik7Cj4g
Pgo+ID4gQEAgLTEwNzgsNiArMTA3Nyw5IEBAIHN0YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9lbmFi
bGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+ID4gICAgICAgICovCj4gPiAgICAgICBp
ZiAoZW5jb2Rlci0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFBJKQo+ID4gICAg
ICAgICAgICAgICBwaW5jdHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0YXRlKGRkZXYtPmRldik7Cj4g
PiArCj4gPiArICAgICAvKiBFbmFibGUgTFREQyAqLwo+ID4gKyAgICAgcmVnX3NldChsZGV2LT5y
ZWdzLCBMVERDX0dDUiwgR0NSX0xURENFTik7Cj4gPiAgIH0KPiA+Cj4gPiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGx0ZGNfZW5jb2Rlcl9oZWxwZXJfZnVu
Y3MgPSB7Cj4gPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
