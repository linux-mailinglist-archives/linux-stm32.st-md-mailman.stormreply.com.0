Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34484853AC6
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 20:20:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5B76C6DD69;
	Tue, 13 Feb 2024 19:20:44 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75A90C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 19:20:43 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d09bdddfc9so62794611fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 11:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707852042; x=1708456842;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjNs+EOtyNCTC3EqdQw06Whi85umzjdG+7lc6Okj5+w=;
 b=k1UkMf30ZZAivGkM9VTA7OB/00eETr6xmzkg9MfZE/pQNjV6nGlMCCjYkPmuMg6t+/
 U6sosu5/wYkxzYyvnDFbe41TnGYKwMFfIGdcXa93+vvMMb9ySjYYIIT2br4vRqQqsa95
 CeKjlaS9PjMa+YBaBQAl6ltQN3wZYyvJl2Ax92zqFdICIXoS/OYwfb/qPSZzYSSu/M+d
 pQgvO6cA3hSSkapGuflWGJb1e5yiFJuTxFHYgFW9F9AkQB0It1uQKPYMvkt5II1iCxCo
 ORncyW3Xivgab5ry0CCoAZ+wZIjKT4ZUuG1upS4K3QpLaRCBSc1jAlQ4t/ju5r6zA7o7
 uAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707852042; x=1708456842;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yjNs+EOtyNCTC3EqdQw06Whi85umzjdG+7lc6Okj5+w=;
 b=PmmAdDIZKqqpK+aaDOUA7K6fi9SdUIZ8PK7sRISIS4VBh4goP/S+jgqbeogzh4arJM
 2xGEbrCCo7C7K3OXjZTfYycjNWkFouVrfjpotte1j2C+2jywV5duZ+R2vzoORJQkB76L
 OKguzlxJGLrIf7Y5shAwkSnUBA97KMFcp416CV3tAqS16cStLx6xAgE5AZ2if69Nl9FF
 VgodH+6AlkcU505DUhHB5svUAQSLHQP/KE7GlOun1IKCZOSX/eo7gghvJ0JYHGSpCZNb
 MNca947HTM8xglE9KKsTC2h52wMX4upLZtBAdu0IUGKEBMmUgbXTJoHGgCqa8uQ7PR9W
 yMgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWibTaaf6/+IK2GasmvIz4VugMY8pyO6VtPTC+GgIu1pvivV6wYldqgGYM5TzYma23szKf2sPu6Fpi4Nnqg+x4pCF1x+a8kdvYfioXfatMy0EU7xjBpQ0gF
X-Gm-Message-State: AOJu0YyxQsPyYuj6+H5IqmLAAkIN7X/ZYTQaUL0Opu++At61NPM+oaxK
 ZgdNyLkbQ/sfm8En+rFa7nnL5SrseSCHH0BCxYO3+GNY5a7lJ1hF1jzICdNvLW/26U3OTDduPE9
 6MgCp+WBrE0J8/VYurlGKBVEAMFKp5QfL8OAIQQ==
X-Google-Smtp-Source: AGHT+IEZWLAHkTfr2RYxYmAawpXrqecxeSqmy9qOLy++NxWLqa4pCUBQKqoVAoJ/789qdHNcn5J1Tp0YXnefirN3NVc=
X-Received: by 2002:a2e:a724:0:b0:2d0:fe56:2057 with SMTP id
 s36-20020a2ea724000000b002d0fe562057mr376125lje.4.1707852042535; Tue, 13 Feb
 2024 11:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-1-a2373cd72d36@baylibre.com>
 <20240213172550.000023a7@Huawei.com>
In-Reply-To: <20240213172550.000023a7@Huawei.com>
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 13 Feb 2024 13:20:31 -0600
Message-ID: <CAMknhBHc5LnaOOYoeCvtDvUcSXzPnHUtkheYMt73Uv5512dJVg@mail.gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] spi: add spi_optimize_message() APIs
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMTE6MjXigK9BTSBKb25hdGhhbiBDYW1lcm9uCjxKb25h
dGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4KPiBJIHRob3VnaHQgYWJvdXQgc3Vn
Z2VzdGluZyBzcGxpdHRpbmcgdGhpcyBpbnRvIGFuIGluaXRpYWwgcGF0Y2ggdGhhdCBqdXN0IGRv
ZXMKPiB0aGUgYml0cyB3aXRob3V0IHRoZSBjb250cm9sbGVyIGNhbGxiYWNrcy4gTWF5YmUgaXQg
d291bGQgd29yayBiZXR0ZXIgdGhhdCB3YXkKPiB3aXRoIHRoYXQgaW50cm9kdWNlZCBhZnRlciB0
aGUgdmFsaWRhdGUgYW5kIHNwbGl0dGluZyBvZiB0cmFuc2ZlcnMgKHNvIG1vc3QKPiBvZiBwYXRj
aGVzIDEgYW5kIDIpIGFzIGEgcGF0Y2ggMyBwcmlvciB0byB0aGUgc3RtMzIgYWRkaXRpb25zPwoK
VW5sZXNzIGFueW9uZSBlbHNlIGZlZWxzIHRoZSBzYW1lIHdheSwgSSdtIGluY2xpbmVkIHRvIGF2
b2lkIHRoZSBleHRyYQp3b3JrIG9mIHNwbGl0dGluZyBpdCB1cC4KCgo+ID4gK3N0YXRpYyB2b2lk
IF9fc3BpX3Vub3B0aW1pemVfbWVzc2FnZShzdHJ1Y3Qgc3BpX21lc3NhZ2UgKm1zZykKPiA+ICt7
Cj4gPiArICAgICBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXIgKmN0bHIgPSBtc2ctPnNwaS0+Y29udHJv
bGxlcjsKPiA+ICsKPiA+ICsgICAgIGlmIChjdGxyLT51bm9wdGltaXplX21lc3NhZ2UpCj4gPiAr
ICAgICAgICAgICAgIGN0bHItPnVub3B0aW1pemVfbWVzc2FnZShtc2cpOwo+ID4gKwo+ID4gKyAg
ICAgbXNnLT5vcHRpbWl6ZWQgPSBmYWxzZTsKPiA+ICsgICAgIG1zZy0+b3B0X3N0YXRlID0gTlVM
TDsKPiA+ICt9Cj4KPiBTZWVtcyBtaXNiYWxhbmNlZCB0aGF0IHRoaXMgZG9lc24ndCB0YWtlIGEg
cHJlX29wdGltaXplZCBmbGFnIGluIGJ1dAo+IF9fc3BpX29wdGltaXplIGRvZXMuIEknZCBtb3Zl
IGhhbmRsaW5nIHRoYXQgdG8gb3V0c2lkZSB0aGUgY2FsbCBpbiBib3RoIGNhc2VzLgo+Cj4KCkFn
cmVlZC4KCgo+ID4gQEAgLTQzMzEsMTAgKzQ0NjMsMTUgQEAgc3RhdGljIGludCBfX3NwaV9zeW5j
KHN0cnVjdCBzcGlfZGV2aWNlICpzcGksIHN0cnVjdCBzcGlfbWVzc2FnZSAqbWVzc2FnZSkKPiA+
ICAgICAgICAgICAgICAgcmV0dXJuIC1FU0hVVERPV047Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAg
ICAgc3RhdHVzID0gX19zcGlfdmFsaWRhdGUoc3BpLCBtZXNzYWdlKTsKPiA+IC0gICAgIGlmIChz
dGF0dXMgIT0gMCkKPiA+ICsgICAgIHN0YXR1cyA9IHNwaV9tYXliZV9vcHRpbWl6ZV9tZXNzYWdl
KHNwaSwgbWVzc2FnZSk7Cj4gPiArICAgICBpZiAoc3RhdHVzKQo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gc3RhdHVzOwo+ID4KPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBOQjogYWxsIHJldHVy
biBwYXRocyBhZnRlciB0aGlzIHBvaW50IG11c3QgZW5zdXJlIHRoYXQKPiA+ICsgICAgICAqIHNw
aV9maW5hbGl6ZV9jdXJyZW50X21lc3NhZ2UoKSBpcyBjYWxsZWQgdG8gYXZvaWQgbGVha2luZyBy
ZXNvdXJjZXMuCj4KPiBJJ20gbm90IHN1cmUgYSBjYXRjaCBhbGwgbGlrZSB0aGF0IG1ha2VzIHNl
bnNlLiBOb3Qgc3VmZmljaWVudCB0byBjYWxsCj4gdGhlIGZpbmVyIGdyYWluZWQgc3BpX21heWJl
X3Vub3B0aW1pemVfbWVzc2FnZSgpICA/CgpIbW0uLi4gdGhpcyBpcyBteSBiaWFzIGZyb20gYSBw
cmV2aW91cyBmaXggc2hvd2luZyB0aHJvdWdoLiBNYXliZSB0aGlzCmNvbW1lbnQgZG9lc24ndCBi
ZWxvbmcgaW4gdGhpcyBwYXRjaC4gVGhlIHNob3J0IGFuc3dlciB0byB5b3VyCnF1ZXN0aW9uIGlz
ICJpdCdzIGNvbXBsaWNhdGVkIi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
