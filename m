Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B7F2C018
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2019 09:30:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12AADC6C85A
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2019 07:30:42 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C7B7C6906E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2019 07:30:40 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id b18so15069175qkc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2019 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=liX278HTgn3dzodp7H0O3yv5Xch4o5IxEkhO3Idcuvw=;
 b=Xof57xMef9rhMVvwdzWqgl8c8PWB/Qq5WaAyj1db7xil+fDCj2i2m2YnoW8pKwTFyW
 2fV5WVtAWhMVaj64Iuj3Xg8EqCSIHF9C1lbxhu3ktohEZLkh788n0+WGOtLwsRx5rSSB
 idqXNx8jf21nLRjVkPZziJlecnNAnwLPmW96STeBbUTLipuKTqsP7RhQL0Ob3lS65mkx
 UfHomb1WgXBlgs+mcjx1y7MMHVGLMi62Y+rgLWH1eZYzKN7d8r65fCXeTVeX7ZVuzXCK
 RD9+LjBiqfsMx6BBjE4DmFkIMgoU4pUkbXkfAC55Nl4lss1Qn+wXSgeO8/o6OXFjcjzP
 qjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=liX278HTgn3dzodp7H0O3yv5Xch4o5IxEkhO3Idcuvw=;
 b=FS2EokYpQunQK7afEtzPN0iwEEufa5JxZd2Ac3/EuDpUG3nTCkTFkB1HAmCwkhilXa
 7BiRBA9VoaHdEI8+Q2aN47B3apFjD1usEWPo9OgjbPd8D3WqIZC8pNDFXKRW572vscPR
 nJ2w+oLdphJL0BqrTXWFfwcSnOOm3u7SLnFnr4aZ75sIRWno+TCAk/Yjr/BG+843UZbp
 BUXCFiod7DgEobUobaqmO9DLrBBA3RCAsMO6y8Tx3BkLBa3FRrpNkdo+emFzsapyj1MX
 J7ECiaKSOIqDBJLnqQt7pzGt5cNRsRvv1iUXbVeU8LwGaqX0w9/vhCKXHb4bVmIw3zOr
 y6Aw==
X-Gm-Message-State: APjAAAWiJvVWvCYRLJgwazTW+bknZAP7m3Te4NNPpjVqyLSa+pBbLgRm
 Qzi5JO1JlD6v6r0EPX2gmrANNg1Q+6a8FWqIpvxliQ==
X-Google-Smtp-Source: APXvYqw/o9g3j0+8QuWo1gdBVqYhqsgNj/cyEh5sq/3CNJ6H80Oh+b9UbNvS2HHUMZy5yppiywgVa8gezanxUHTOGjg=
X-Received: by 2002:a37:502:: with SMTP id 2mr3621845qkf.93.1559028639303;
 Tue, 28 May 2019 00:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190527115830.15836-1-benjamin.gaignard@st.com>
 <1e4c4cbf-869e-8b6a-a1d6-cc7dccb2515a@st.com>
In-Reply-To: <1e4c4cbf-869e-8b6a-a1d6-cc7dccb2515a@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 28 May 2019 09:30:28 +0200
Message-ID: <CA+M3ks5UxZ0iugtR_zJPshtC=HAjoAzTPmu6oxt7BQWTuj203Q@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: restore calls to
	clk_{enable/disable}
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

TGUgbHVuLiAyNyBtYWkgMjAxOSDDoCAxNDoyOCwgUGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNv
cm51QHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4gSGkgQmVuamFtaW4sCj4KPiBNYW55IHRoYW5rcyBm
b3IgdGhpcyBmaXggKGFuZCBtb3JlIGdlbmVyYWxseSBmb3IgcHVzaGluZyBTVE0gcGF0Y2hlcyBv
bgo+IG1pc2MgOi0pCj4KPiBBY2tlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51
QHN0LmNvbT4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dCwKc29ycnkgZm9yIHRoZSBtaXN0YWtl
LgoKQmVuamFtaW4KPgo+IFBoaWxpcHBlIDotKQo+Cj4gT24gNS8yNy8xOSAxOjU4IFBNLCBCZW5q
YW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+IEZyb206IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1p
bi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+ID4KPiA+IFJlc3RvcmUgY2FsbHMgdG8gY2xrX3tlbmFi
bGUvZGlzYWJsZX0gZGVsZXRlZCBhZnRlciBhcHBseWluZyB0aGUgd3JvbmcKPiA+IHZlcnNpb24g
b2YgdGhlIHBhdGNoCj4gPgo+ID4gRml4ZXM6IGZkNjkwNWZjYTRmMCAoImRybS9zdG06IGx0ZGM6
IHJlbW92ZSBjbGtfcm91bmRfcmF0ZSBjb21tZW50IikKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBC
ZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KPiA+IC0tLQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDIgKysKPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBpbmRleCBhZTJhYWYy
YTYyZWUuLmFjMjk4OTBlZGViNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gQEAgLTUwNywx
MCArNTA3LDEyIEBAIHN0YXRpYyBib29sIGx0ZGNfY3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKPiA+ICAgICAgIHN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGNydGNfdG9f
bHRkYyhjcnRjKTsKPiA+ICAgICAgIGludCByYXRlID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwo+ID4K
PiA+ICsgICAgIGNsa19kaXNhYmxlKGxkZXYtPnBpeGVsX2Nsayk7Cj4gPiAgICAgICBpZiAoY2xr
X3NldF9yYXRlKGxkZXYtPnBpeGVsX2NsaywgcmF0ZSkgPCAwKSB7Cj4gPiAgICAgICAgICAgICAg
IERSTV9FUlJPUigiQ2Fubm90IHNldCByYXRlICglZEh6KSBmb3IgcGl4ZWwgY2xrXG4iLCByYXRl
KTsKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gICAgICAgfQo+ID4gKyAgICAg
Y2xrX2VuYWJsZShsZGV2LT5waXhlbF9jbGspOwo+ID4KPiA+ICAgICAgIGFkanVzdGVkX21vZGUt
PmNsb2NrID0gY2xrX2dldF9yYXRlKGxkZXYtPnBpeGVsX2NsaykgLyAxMDAwOwo+ID4KPiA+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
