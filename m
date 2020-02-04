Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D216E15191B
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 11:58:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C319C36B0C;
	Tue,  4 Feb 2020 10:58:44 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E34CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 10:58:42 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d5so13986274qto.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Feb 2020 02:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YL3TO9ZpKBY8+YOVx7GVmXHwa9ZG4OtIovpotqZSOvQ=;
 b=i0jtLvBBX8r5QFc0r7Hxo2IZOc6yvj9C31xPCO1shilPLnf2bgJo2m6Tz7Lgh3spwt
 tnKqB4gxkprzhxpFv6FFGHeXmydAtHjxmf0aefNbF9p+ihxiajkPn1gY17dmT1J4+vym
 SErflyV3b6IxZovmGu7nMrHcy8kBkMAgMvM5vZ8FZ+eZ8HDqAEEczfSp/WMNHoejJYfM
 lyLrVQTvEcYf2IES4Z3MPN+Vosc+DOGCjPIfkEGjJBPSMC+/zMLUNHbNahIE5qmE9J9a
 jZUN3yRHQOcgCFTynkHYZJp4g/5Q4fTQPU8VZy3I0/R/vlKdXcVL8w/muhJKDi58nv9Z
 vp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YL3TO9ZpKBY8+YOVx7GVmXHwa9ZG4OtIovpotqZSOvQ=;
 b=m4wxZST0M9vuq0Ffhm11wAv2GPRAh2gcM6bfRpRzhFVfEqOr+n9vibYIWA8Y2w0cUs
 DrGOXJrTt0o4GXuRU2JksI3zhL73OJeyGmnudQxraVq5Fowkzqas1xhToIA3c5UIzUtb
 PoOYwB5uF8ifrhVqv9nOA35EAlwAPG9iUdDRyi+77s3B4Y/xC69eZHrxBv2VF96dqWgv
 vFTv07cntoinT18N0Z5NsiD4Ap/PeiySw57Qg0xeboAR4mTOl2NcZjYYg4aB84JIc7F8
 zr7wYRByc9cfQf/abUzjALMkidNfBXNYEorDm3hwOw/Jv8d3SOiBDbh30MzMaOVWstlJ
 0RPw==
X-Gm-Message-State: APjAAAUwqH23uZSDSqAzrrZKjWVI1E36X3o3VSN37bGLlgS4j4m7Im4q
 BJMy8hnkGkOTsUR5lWvvhFYTdxPu6NNvj7SAQ1l39Q==
X-Google-Smtp-Source: APXvYqyiwcSIqGmki9INgStVr+9p8LXvXFoIcE7YOnPCL2ZR5ORRWCr1pIBeEgRF46HUbHiAIYa9Vwxx/3iq0aPPtKQ=
X-Received: by 2002:aed:2bc2:: with SMTP id e60mr28271222qtd.115.1580813920706; 
 Tue, 04 Feb 2020 02:58:40 -0800 (PST)
MIME-Version: 1.0
References: <1579601650-7055-1-git-send-email-yannick.fertre@st.com>
 <f925ddf5-3265-638b-14b9-71b549b5a9ad@st.com>
In-Reply-To: <f925ddf5-3265-638b-14b9-71b549b5a9ad@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 4 Feb 2020 11:58:30 +0100
Message-ID: <CA+M3ks7jCHzOuHnOO=v5AgsqSRbMVxYhkMY332u5qec=jJtHsw@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: check crtc state before
	enabling LIE
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

TGUgamV1LiAyMyBqYW52LiAyMDIwIMOgIDEwOjUwLCBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUu
Y29ybnVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBEZWFyIFlhbm5pY2ssCj4gVGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBQaGlsaXBwZSA6LSkKPgo+IE9uIDEvMjEvMjAgMTE6MTQgQU0sIFlhbm5p
Y2sgRmVydHJlIHdyb3RlOgo+ID4gRm9sbG93aW5nIGludmVzdGlnYXRpb25zIG9mIGEgaGFyZHdh
cmUgYnVnLCB0aGUgTElFIGludGVycnVwdAo+ID4gY2FuIG9jY3VyIHdoaWxlIHRoZSBkaXNwbGF5
IGNvbnRyb2xsZXIgaXMgbm90IGFjdGl2YXRlZC4KPiA+IExJRSBpbnRlcnJ1cHQgKHZibGFuaykg
ZG9uJ3QgaGF2ZSB0byBiZSBzZXQgaWYgdGhlIENSVEMgaXMgbm90Cj4gPiBlbmFibGVkLgo+ID4K
CkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4KClRoYW5rcwpCZW5qYW1pbgoKPiA+IFNpZ25lZC1v
ZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4gPiAtLS0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCA3ICsrKysrKy0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5j
Cj4gPiBpbmRleCBjMjgxNWU4Li5lYTY1NGM3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBA
QCAtNjQ4LDkgKzY0OCwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2hlbHBlcl9m
dW5jcyBsdGRjX2NydGNfaGVscGVyX2Z1bmNzID0gewo+ID4gICBzdGF0aWMgaW50IGx0ZGNfY3J0
Y19lbmFibGVfdmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiA+ICAgewo+ID4gICAgICAg
c3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190b19sdGRjKGNydGMpOwo+ID4gKyAgICAg
c3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSA9IGNydGMtPnN0YXRlOwo+ID4KPiA+ICAgICAg
IERSTV9ERUJVR19EUklWRVIoIlxuIik7Cj4gPiAtICAgICByZWdfc2V0KGxkZXYtPnJlZ3MsIExU
RENfSUVSLCBJRVJfTElFKTsKPiA+ICsKPiA+ICsgICAgIGlmIChzdGF0ZS0+ZW5hYmxlKQo+ID4g
KyAgICAgICAgICAgICByZWdfc2V0KGxkZXYtPnJlZ3MsIExURENfSUVSLCBJRVJfTElFKTsKPiA+
ICsgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPiA+Cj4gPiAgICAg
ICByZXR1cm4gMDsKPiA+ICAgfQo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
