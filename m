Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 615AC2932C
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 10:34:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2181FC57775
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 08:34:27 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2F7FC57773
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 08:34:25 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id b18so263391qkc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 01:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oKqDPNhFrhfI648m2ZpZorjnGR/p8vjrAU5pnK+zOrc=;
 b=I2DlnDhPUcB9WSOCiHzGa1dh1aSnEVCZqggaUOEx9lu7ClYlgQWd6xGoN6YLBPFd1B
 y4VQ8i8uCB9rsJzrpZWQeb66qboUfGI6KX8JrBPy8kILPXMFqypAi02U7tX7kF7Vu9Hq
 Rgml47oOcJaNGJ2WC/7p7ccoaY757I98JYMCeJMe0sE6+052hFn/5G9Z7e3pmwA+wIp4
 fRXfuvzU/zFpDBHtVf0JPhkfXlgAQsd3jVYyMxpSCAoXbIUARfcI8LmTkJ+XII8WNDTa
 K5NIpfMyyaLuO1nfuIEI+7Vn8r4v2NnRZaBtpmf7tCoJnUnVu47g7OXKU8BLxRMpUb9W
 bP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oKqDPNhFrhfI648m2ZpZorjnGR/p8vjrAU5pnK+zOrc=;
 b=H/Bugc/gAvLZhC1JpLR/RfelU090kY6l3cBsQqDWo9ZeLsOB0UHkeZR6loYwZjqZDe
 LpZl8YMUNUQJI4hhevSfoy0oh7R8YYZwMffq+yodd2ReJ3DFHj15dA0GJ9APtqfH25SX
 pWVDSGOE9PgUtmWFhAVsDGFrffNt2PskvzX3nslEd+bGzsWAmWYLZd0AGhAQDz1tXAK4
 nC73d69q+XrDpkE8sjr9Qh4/+qPlO0I87hHWf7+gg1HeUZTKU85mCGiIHt2SLgNN5XoR
 ae1W3cTuqIoYQuRB31t4jboPklESkNvcSngARqUhYXvSPwQdO6/omFYKfta+R2NIigPo
 p5/g==
X-Gm-Message-State: APjAAAVVwQNubYyNrr17MLXIR0ldeYhX0j/dSMHMWzz6vtpaGXWZMb2B
 23+HT+I7eNfmahl3T8ItqFSqli1VCUUs+SBOmAwtTg==
X-Google-Smtp-Source: APXvYqyMS3Rs1LJXdWZyK+SojuIy5gzc84YCqZt/AjhqaC8guA5a6LqGCwTxVOOBLQN9MRZFyJwqWtLqDZrNHGIGZ/Q=
X-Received: by 2002:ac8:5501:: with SMTP id j1mr4886948qtq.239.1558686864752; 
 Fri, 24 May 2019 01:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <1557500579-19720-1-git-send-email-yannick.fertre@st.com>
 <aa466c60-9110-630e-3c75-99e632207334@st.com>
In-Reply-To: <aa466c60-9110-630e-3c75-99e632207334@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 24 May 2019 10:34:13 +0200
Message-ID: <CA+M3ks6nqUdMGxkBYf17ptVMB0P3xJ+cY93xXhCX6FTcKJr+eA@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: dsi: check hardware version
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

TGUgdmVuLiAxMCBtYWkgMjAxOSDDoCAxODozMSwgUGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNv
cm51QHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4KPiBEZWFyIFlhbm5pY2ssCj4gVGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBEZWFyIEJlbmphbWluLAo+IElmIHlvdSBhcmUgZmluZSB3aXRoIHRoaXMg
cGF0Y2gsIHBsZWFzZSBwdXNoIGl0ICphZnRlciogdGhlIHBhdGNoIG5hbWVkCj4gImRybS9zdG06
IGRzaTogYWRkIHN1cHBvcnQgb2YgYW4gb3B0aW9uYWwgcmVndWxhdG9yIiAoaWYgSSB3ZWxsCj4g
dW5kZXJzdG9vZCB0aG9zZSB0d28gcGF0Y2hlcykKPgo+IFRoYW5rIHlvdQo+IFBoaWxpcHBlIDot
KQoKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0LAoKQmVuamFtaW4KPgo+Cj4gT24gNS8xMC8xOSA1
OjAyIFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6Cj4gPiBDaGVjayB2ZXJzaW9uIG9mIERTSSBo
YXJkd2FyZSBJUC4gT25seSB2ZXJzaW9ucyAxLjMwICYgMS4zMQo+ID4gYXJlIHN1cHBvcnRlZC4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0
LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5j
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21p
cGlfZHNpLXN0bS5jCj4gPiBpbmRleCAyMmJkMDk1Li4yOTEwNWU5IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYwo+ID4gQEAgLTIyNyw3ICsyMjcsNiBAQCBkd19t
aXBpX2RzaV9nZXRfbGFuZV9tYnBzKHZvaWQgKnByaXZfZGF0YSwgY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUsCj4gPiAgICAgICB1MzIgdmFsOwo+ID4KPiA+ICAgICAgIC8qIFVw
ZGF0ZSBsYW5lIGNhcGFiaWxpdGllcyBhY2NvcmRpbmcgdG8gaHcgdmVyc2lvbiAqLwo+ID4gLSAg
ICAgZHNpLT5od192ZXJzaW9uID0gZHNpX3JlYWQoZHNpLCBEU0lfVkVSU0lPTikgJiBWRVJTSU9O
Owo+ID4gICAgICAgZHNpLT5sYW5lX21pbl9rYnBzID0gTEFORV9NSU5fS0JQUzsKPiA+ICAgICAg
IGRzaS0+bGFuZV9tYXhfa2JwcyA9IExBTkVfTUFYX0tCUFM7Cj4gPiAgICAgICBpZiAoZHNpLT5o
d192ZXJzaW9uID09IEhXVkVSXzEzMSkgewo+ID4gQEAgLTMwNiw2ICszMDUsNyBAQCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3N0bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ID4gICB7Cj4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ID4gICAg
ICAgc3RydWN0IGR3X21pcGlfZHNpX3N0bSAqZHNpOwo+ID4gKyAgICAgc3RydWN0IGNsayAqcGNs
azsKPiA+ICAgICAgIHN0cnVjdCByZXNvdXJjZSAqcmVzOwo+ID4gICAgICAgaW50IHJldDsKPiA+
Cj4gPiBAQCAtMzQ3LDYgKzM0NywyOCBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3N0bV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAgICAgICAgICAgICBnb3RvIGVy
cl9jbGtfZ2V0Owo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAgIHBjbGsgPSBkZXZtX2Nsa19nZXQo
ZGV2LCAicGNsayIpOwo+ID4gKyAgICAgaWYgKElTX0VSUihwY2xrKSkgewo+ID4gKyAgICAgICAg
ICAgICByZXQgPSBQVFJfRVJSKHBjbGspOwo+ID4gKyAgICAgICAgICAgICBEUk1fRVJST1IoIlVu
YWJsZSB0byBnZXQgcGVyaXBoZXJhbCBjbG9jazogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAg
ICAgIGdvdG8gZXJyX2RzaV9wcm9iZTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHJldCA9
IGNsa19wcmVwYXJlX2VuYWJsZShwY2xrKTsKPiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ICsgICAg
ICAgICAgICAgRFJNX0VSUk9SKCIlczogRmFpbGVkIHRvIGVuYWJsZSBwZXJpcGhlcmFsIGNsa1xu
IiwgX19mdW5jX18pOwo+ID4gKyAgICAgICAgICAgICBnb3RvIGVycl9kc2lfcHJvYmU7Cj4gPiAr
ICAgICB9Cj4gPiArCj4gPiArICAgICBkc2ktPmh3X3ZlcnNpb24gPSBkc2lfcmVhZChkc2ksIERT
SV9WRVJTSU9OKSAmIFZFUlNJT047Cj4gPiArICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUocGNs
ayk7Cj4gPiArCj4gPiArICAgICBpZiAoZHNpLT5od192ZXJzaW9uICE9IEhXVkVSXzEzMCAmJiBk
c2ktPmh3X3ZlcnNpb24gIT0gSFdWRVJfMTMxKSB7Cj4gPiArICAgICAgICAgICAgIHJldCA9IC1F
Tk9ERVY7Cj4gPiArICAgICAgICAgICAgIERSTV9FUlJPUigiYmFkIGRzaSBoYXJkd2FyZSB2ZXJz
aW9uXG4iKTsKPiA+ICsgICAgICAgICAgICAgZ290byBlcnJfZHNpX3Byb2JlOwo+ID4gKyAgICAg
fQo+ID4gKwo+ID4gICAgICAgZHdfbWlwaV9kc2lfc3RtX3BsYXRfZGF0YS5iYXNlID0gZHNpLT5i
YXNlOwo+ID4gICAgICAgZHdfbWlwaV9kc2lfc3RtX3BsYXRfZGF0YS5wcml2X2RhdGEgPSBkc2k7
Cj4gPgo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
