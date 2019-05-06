Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E5D1451B
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 09:26:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AE26C78F67
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 07:26:04 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F970C78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 07:26:03 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id o7so1648066qtp.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 May 2019 00:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WNzn2D4LRFx0zq3ZMJPIJy2EHlJS0W/qRQO2E0djUbU=;
 b=BNjPq9C+fBd/dv+/34M6FL3Z2Pm8FqkPX6Z0HermdNoQMhO2azmmLW0MQfnj03p0b7
 G6hf2mwmU8G01N1ZkBrVVnNTG3r/otxtMeOTBFZyxhj9vjvZCeYarFlh3Z+YyBY0s7Q/
 n5Ij8Ly4cHNdL1GIhiFJUJEIk2EyVcRbn5+YyKfmsJgOjDdssNnRASzFPFZlWcaJ1nZL
 6qsOPoYcGCuqWRDZU55zWXSw6lOexvFw8+spMo1mmr7iFZQvKXYQdHz2IovIeSjmrZGM
 B4ttVnpCIIV/hKVyr9iZSiQvZCjroyPAYOk7dvqikc9cLkahrr/tOydJFEwW4Kjn48A2
 qiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WNzn2D4LRFx0zq3ZMJPIJy2EHlJS0W/qRQO2E0djUbU=;
 b=r4PvZIaHoUdV9Vn4scwyvNxkPaBfyp/mvqznq3bIoQQ1jCpV26TzdEi7HfOCfcZ4RV
 T7RWSYrs6uVNrl8dnmLOnh2S/8iEaQMi8XR3w/gUnbL7pBBSkIUD9GFAVQY4k/SeLt8R
 NEwn8b5E36lxQx74pujC/SVHN0A0nKKkZmkcaCilNkLpz+mZnr9O6FjNuqOy3MBsu+cu
 2X3CxcPscwPWvNp52tmFQcyqSUHhRUBA/tnpCmYwOuu/qFMtR7Q/Qr8ENl4ONWaL5Bee
 Kup4RZzehHV0284aRHqHFtiYYI60GbOL4n/TF0BwYY8FD11jcouUMz2LGRCgskF8F33h
 OTiw==
X-Gm-Message-State: APjAAAWqe1AKRcrQ4tY1HonpL/9dkpT/KH6Y5YkmHff7pxt4/3UEYM/R
 9u3xxbDA8zWLKl2TGP6sQ2hYt/bupBzNWsRWkX8yLQ==
X-Google-Smtp-Source: APXvYqw4GFj4q4UVpUiDKBHF6OghiHzU5JrTfWPLaCo7KAV2UX+jBKeVBbLTsVkPr/PjAhKVuoZEyF0uUBi9eKD6m8o=
X-Received: by 2002:aed:3fad:: with SMTP id s42mr20026506qth.335.1557127562156; 
 Mon, 06 May 2019 00:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <1556114601-30936-1-git-send-email-fabien.dessenne@st.com>
 <1556114601-30936-3-git-send-email-fabien.dessenne@st.com>
 <03f53dcc-816f-c017-f420-5eacc1fa486d@st.com>
In-Reply-To: <03f53dcc-816f-c017-f420-5eacc1fa486d@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 6 May 2019 09:25:51 +0200
Message-ID: <CA+M3ks6bGqux=D+8PgEn9ovGBEbUzkWSshB81Zy1OTG+U4Ww-w@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] drm/stm: ltdc: return appropriate
	error code during probe
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

TGUgdmVuLiAyNiBhdnIuIDIwMTkgw6AgMTQ6MzAsIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+IGEgw6ljcml0IDoKPgo+IEhpIEZhYmllbiwKPiBhbmQgdGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBQaGlsaXBwZSA6LSkKPgo+IE9uIDQvMjQvMTkgNDowMyBQTSwgRmFiaWVu
IERlc3Nlbm5lIHdyb3RlOgo+ID4gRHVyaW5nIHByb2JlLCByZXR1cm4gdGhlICJjbGtfZ2V0IiBl
cnJvciB2YWx1ZSBpbnN0ZWFkIG9mIC1FTk9ERVYuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFi
aWVuIERlc3Nlbm5lIDxmYWJpZW4uZGVzc2VubmVAc3QuY29tPgoKQXBwbGllZCBvbiBkcm0tbWlz
Yy1uZXh0LgpUaGFua3MsCkJlbmphbWluCgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jIHwgNSArKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBpbmRleCA1MjFiYTgzLi45
NzkxMmUyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBAQCAtMTE0NSw4ICsxMTQ1LDkgQEAg
aW50IGx0ZGNfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPiA+Cj4gPiAgICAgICBsZGV2
LT5waXhlbF9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibGNkIik7Cj4gPiAgICAgICBpZiAoSVNf
RVJSKGxkZXYtPnBpeGVsX2NsaykpIHsKPiA+IC0gICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFi
bGUgdG8gZ2V0IGxjZCBjbG9ja1xuIik7Cj4gPiAtICAgICAgICAgICAgIHJldHVybiAtRU5PREVW
Owo+ID4gKyAgICAgICAgICAgICBpZiAoUFRSX0VSUihsZGV2LT5waXhlbF9jbGspICE9IC1FUFJP
QkVfREVGRVIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFibGUgdG8g
Z2V0IGxjZCBjbG9ja1xuIik7Cj4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGxkZXYt
PnBpeGVsX2Nsayk7Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAgaWYgKGNsa19wcmVwYXJlX2Vu
YWJsZShsZGV2LT5waXhlbF9jbGspKSB7Cj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
