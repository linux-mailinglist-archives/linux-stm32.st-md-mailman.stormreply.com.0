Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DAD9D935B
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 09:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3C4EC78F7C;
	Tue, 26 Nov 2024 08:34:45 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA27EC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 16:11:02 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb584a8f81so48340941fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 08:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732551058; x=1733155858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f4agveOwge0PFPBakCbLt+oYuwIz3qhwiYZMG0RcOCo=;
 b=LYdpjdWBr/Ap7tsn44FV5c1kqA6ecS4149zuipdQDIi7oZGoEbS5rVdMYe87ybiZ9F
 CLsKQ5GBmfFOAQyg10BRWy2QOCVRQe0JRXS9KpW+mvrJ18Fblj4f8r1AZoyCtBtScTCf
 aK+0kP2JfnbCcuHfhb2Mm0qUOd4oFcpKBuHt22pRLfEovQblG4fD9FqSU1aiorv9A5wn
 svqIE3k0yh4T+i2DHEWVtjp7mtNE4EzIq4asqPBYDdoe6Sgcx0kVKtNdS//bWnoJYsk5
 XPxwNuW3Zq+z8GyMUuZaOsSUwypHdr6OY5rDjZ4S+gulstnbetiSeBxSdX3V/tiO1pfP
 9x2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqvm1ILdxlMreuhzBP2Qd3iANZsVPsY9b2jTW/BuFIBpI+wBMokRbsvQ8s8LLa3So3V7wVaXm63Tx6Ig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwD+i0Z/ef1Cz+oy9KLTZ7VoxlSiEL+wT6aFIcP6g6QQpWqmGDB
 3aU10dlU70PIqfNaOUXuQ30Es9kLrRGDyOxhvgnXBwGEYtwTjCtFlXAn+FeK
X-Gm-Gg: ASbGnctR2LPaGLaXBzBavXewxHca3XZFb6uL9/67QQAUxKhqf7CvICRivKOji/TVPNz
 SFBkWS5qtbFQMEUx49LPiXqGDxLftWxv2IDMzy1w2NDTRBm+k+E46A5AgQgNhKFGVHFXGzB1D2s
 HzEwxlHMzMOEKpz4oHaJqxd9bDn0a7vTQBdyA8FysWNves/1uLYgvhSzKEUtBljNzWS56275bk2
 2Sf8fzkNxRbKTkXBWem06sdozYMv5Y1I0NctndsH3mpQzwEMOvXAYH1E/8OUNACPv1U81PzwuQA
 DzOBzgU=
X-Google-Smtp-Source: AGHT+IFN7Js4yt6KT4OpS1OkNFWLruc/wsqr83+VgQ9JZQar7OkPrkDDl3o1r1MGbuRxHGVZry2IZg==
X-Received: by 2002:a2e:a809:0:b0:2ff:8137:60a9 with SMTP id
 38308e7fff4ca-2ffa712ac11mr68098941fa.23.1732551058232; 
 Mon, 25 Nov 2024 08:10:58 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa53769d8sm15725521fa.79.2024.11.25.08.10.55
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 08:10:56 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ffa8092e34so37961481fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 08:10:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHPgE78gavzk6FJdaP6Gb1MTPNlj8cSE4t5vOT5Z9x1ADE8lvodzj7mXygEJ7h9FzoHuaw/RpWVn3+NA==@st-md-mailman.stormreply.com
X-Received: by 2002:a2e:be8e:0:b0:2ff:c368:5765 with SMTP id
 38308e7fff4ca-2ffc3685815mr25260511fa.8.1732551055307; Mon, 25 Nov 2024
 08:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
In-Reply-To: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 26 Nov 2024 00:10:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v64kH6gWRjBxHcFKw++vx9G7dwoiRCz0heaLO786orvd4w@mail.gmail.com>
Message-ID: <CAGb2v64kH6gWRjBxHcFKw++vx9G7dwoiRCz0heaLO786orvd4w@mail.gmail.com>
To: Sean Nyekjaer <sean@geanix.com>
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:34:44 +0000
Cc: Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] drm/sun4i: use
	drm_mode_validate_mode() helper function
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gTW9uLCBOb3YgMjUsIDIwMjQgYXQgOTo1MOKAr1BNIFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vh
bml4LmNvbT4gd3JvdGU6Cj4KPiBVc2UgbmV3IGhlbHBlciBmdW5jdGlvbiBmb3IgSERNSSBtb2Rl
IHZhbGlkYXRpb24KClRoaXMgaXMgYSBiaXQgbWlzbGVhZGluZyBzaW5jZSB0aGlzIGlzIGFjdHVh
bGx5IHRoZSBEUEkgb3IgcGFyYWxsZWwKb3V0cHV0IGVuY29kZXIsIG5vdCBIRE1JLiBIRE1JIGlz
IGluIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pX2VuYy5jCmFuZCBkcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jCgpDaGVuWXUKCj4gU2lnbmVkLW9mZi1ieTogU2Vh
biBOeWVramFlciA8c2VhbkBnZWFuaXguY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNGlfcmdiLmMgfCAyMiArKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9yZ2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW40aV9yZ2IuYwo+IGluZGV4IGRmYjZhY2M0MmYwMmVmYzQwZjM2OTE0ZTI5MjU1MTBjZDgwNTZk
MGIuLjRmODEwMGUzMjc2OWNmMzFjMjVmNWRkODQ5YTE4ZjViNzczNzYwOTAgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3JnYi5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjRpX3JnYi5jCj4gQEAgLTUxLDE0ICs1MSw2IEBAIHN0YXRpYyBpbnQgc3Vu
NGlfcmdiX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAgICAg
ICAgcmV0dXJuIGRybV9wYW5lbF9nZXRfbW9kZXMocmdiLT5wYW5lbCwgY29ubmVjdG9yKTsKPiAg
fQo+Cj4gLS8qCj4gLSAqIFZFU0EgRE1UIGRlZmluZXMgYSB0b2xlcmFuY2Ugb2YgMC41JSBvbiB0
aGUgcGl4ZWwgY2xvY2ssIHdoaWxlIHRoZQo+IC0gKiBDVlQgc3BlYyByZXVzZXMgdGhhdCB0b2xl
cmFuY2UgaW4gaXRzIGV4YW1wbGVzLCBzbyBpdCBsb29rcyB0byBiZSBhCj4gLSAqIGdvb2QgZGVm
YXVsdCB0b2xlcmFuY2UgZm9yIHRoZSBFRElELWJhc2VkIG1vZGVzLiBEZWZpbmUgaXQgdG8gNSBw
ZXIKPiAtICogbWlsbGUgdG8gYXZvaWQgZmxvYXRpbmcgcG9pbnQgb3BlcmF0aW9ucy4KPiAtICov
Cj4gLSNkZWZpbmUgU1VONElfUkdCX0RPVENMT0NLX1RPTEVSQU5DRV9QRVJfTUlMTEUgNQo+IC0K
PiAgc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzIHN1bjRpX3JnYl9tb2RlX3ZhbGlkKHN0cnVj
dCBkcm1fZW5jb2RlciAqY3J0YywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCj4gIHsK
PiBAQCAtNjcsOCArNTksOCBAQCBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMgc3VuNGlfcmdi
X21vZGVfdmFsaWQoc3RydWN0IGRybV9lbmNvZGVyICpjcnRjLAo+ICAgICAgICAgdTMyIGhzeW5j
ID0gbW9kZS0+aHN5bmNfZW5kIC0gbW9kZS0+aHN5bmNfc3RhcnQ7Cj4gICAgICAgICB1MzIgdnN5
bmMgPSBtb2RlLT52c3luY19lbmQgLSBtb2RlLT52c3luY19zdGFydDsKPiAgICAgICAgIHVuc2ln
bmVkIGxvbmcgbG9uZyByYXRlID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwo+IC0gICAgICAgdW5zaWdu
ZWQgbG9uZyBsb25nIGxvd2VzdCwgaGlnaGVzdDsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbG9u
ZyByb3VuZGVkX3JhdGU7Cj4gKyAgICAgICBpbnQgcmV0Owo+Cj4gICAgICAgICBEUk1fREVCVUdf
RFJJVkVSKCJWYWxpZGF0aW5nIG1vZGVzLi4uXG4iKTsKPgo+IEBAIC0xMjIsMTUgKzExNCw5IEBA
IHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBzdW40aV9yZ2JfbW9kZV92YWxpZChzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmNydGMsCj4gICAgICAgICB0Y29uLT5kY2xrX21heF9kaXYgPSAxMjc7Cj4g
ICAgICAgICByb3VuZGVkX3JhdGUgPSBjbGtfcm91bmRfcmF0ZSh0Y29uLT5kY2xrLCByYXRlKTsK
Pgo+IC0gICAgICAgbG93ZXN0ID0gcmF0ZSAqICgxMDAwIC0gU1VONElfUkdCX0RPVENMT0NLX1RP
TEVSQU5DRV9QRVJfTUlMTEUpOwo+IC0gICAgICAgZG9fZGl2KGxvd2VzdCwgMTAwMCk7Cj4gLSAg
ICAgICBpZiAocm91bmRlZF9yYXRlIDwgbG93ZXN0KQo+IC0gICAgICAgICAgICAgICByZXR1cm4g
TU9ERV9DTE9DS19MT1c7Cj4gLQo+IC0gICAgICAgaGlnaGVzdCA9IHJhdGUgKiAoMTAwMCArIFNV
TjRJX1JHQl9ET1RDTE9DS19UT0xFUkFOQ0VfUEVSX01JTExFKTsKPiAtICAgICAgIGRvX2Rpdiho
aWdoZXN0LCAxMDAwKTsKPiAtICAgICAgIGlmIChyb3VuZGVkX3JhdGUgPiBoaWdoZXN0KQo+IC0g
ICAgICAgICAgICAgICByZXR1cm4gTU9ERV9DTE9DS19ISUdIOwo+ICsgICAgICAgcmV0ID0gZHJt
X21vZGVfdmFsaWRhdGVfbW9kZShtb2RlLCByb3VuZGVkX3JhdGUpOwo+ICsgICAgICAgaWYgKHJl
dCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPgo+ICBvdXQ6Cj4gICAgICAgICBEUk1f
REVCVUdfRFJJVkVSKCJDbG9jayByYXRlIE9LXG4iKTsKPgo+IC0tCj4gMi40Ni4yCj4KPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
