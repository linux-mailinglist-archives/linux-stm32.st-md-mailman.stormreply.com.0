Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF4EAA7138
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 14:07:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83577C78025;
	Fri,  2 May 2025 12:07:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E7F4C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 12:07:14 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso1175700f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 05:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746187634; x=1746792434;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rgNkZ9mACrHBZqehar2nVDjLj65HAeli8fMJrpgfgM=;
 b=DYOjEwCEoiV8wwRHFlaJrD9s9yEKPBLkIq6OKAXAagdAXnbDpgQB6Q+wa6hBADxOsz
 1KIrU/awGnXlHHdd2FZrQvA73kPJCFrhgWDHV1uTNX1pCX2hqcx7XK/wZ6Xx+frKQdB3
 kDonM1p57O2KMjZcowPqJpyOlZVP2b/mk0UPAFRQc2FKstD+1JH8TqQ8D0ZDC2Jc0lpJ
 cY7pluO3/pM2+ysWmGZ8Ko1e6Ip4EEQyDBOnXBNr6/iC7eA5Q62cL93l8XjPzzMPAk1M
 FJ0BE2f4loqI3sEAng/kBi1QfYZeJtIjHKgDFRvc6+3owoF0ksOx0Q1ZtxrJ7rcJp3PF
 +LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746187634; x=1746792434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rgNkZ9mACrHBZqehar2nVDjLj65HAeli8fMJrpgfgM=;
 b=f7fncxMu1DTgSIVCk5daF4FJ2ePig5U4vKVa6LWJ4x53UmaGl9W9z7UYvgCnFSNPe3
 98bMHzA+yjkB5Xaj0JgAsI9jrx7hT3P1HORUmHXe+oDB9UgabqzI6Zrlg19vkb2cTrbI
 RqbjvF28naulPxokDU3DdylcwTZg1tkqG/ndVmfBneglBh44sYges9iVe1TcWMSBRfSD
 3SV1xsRBaimM926+ojl+aI/YRLvTcUDYJXARXkYEQkFudFb30upTfFFSLVPu4V2qQoB0
 ZTjd1Snobbchj34Ft70eaHdqaFlSe7fsIAsSlqmuSJ8vwSf2ma84aTaGf7t71H8jddHi
 7bWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1eWq2rdTJfPWubYUCeQP+hwnFOpy4qbR54e6c3jd0L5McyPpiZSMtUYjjTBSrLRNCSHvk0yUg9lVeKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyaPzE+Y/EcxjpoUHw4suV03xSmnmyzveUFS11wLhXZV7qnh8+4
 3YvvV48iVxuH9Wo6jVYDFtusL5Il6fYv3V31OcUvqsbPQ7EkDm30VeY26MpThxvgjtyabJTdFaD
 b98nJ/Ah14nu/KWzrbU4vCNWoS7o=
X-Gm-Gg: ASbGncv9vEadZhmJt07AxztmLJwwLDE7WamZjDphRP/phvkQE1Ecw4TYnWwfbdGUrxM
 WyIDTPh37fvYhQ5vQyIks5SDzBzrg2Kpt4RLZaDUxQet5pUpHyphrGjsrUXU6nXwXVjL7zzP1Ga
 uCsSzRZMwV/em3LzGokGNpX4Q=
X-Google-Smtp-Source: AGHT+IG7KvwtY+fAyvBOxFwEDzVqGI1LaVcoOaUFi107MbB8iN6ojKgoX5BnPbLTFowGo/R5psaH03J7RqO1MUbSm+0=
X-Received: by 2002:a05:6000:2289:b0:39e:cbca:74cf with SMTP id
 ffacd0b85a97d-3a09815877bmr2287432f8f.6.1746187633746; Fri, 02 May 2025
 05:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
In-Reply-To: <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 13:06:47 +0100
X-Gm-Features: ATxdqUHUbZrCuHG6LsgfD0KsnguPDclXPpaPdX70W3hLnuLJ0SMY1WBzujOGSiM
Message-ID: <CA+V-a8unYCmhvcOhz19WbN_OH5BctPLhGH5ofZeMzSk_r9CsfA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/renesas-ostm:
 Enable OSTM reprobe for RZ/V2N SoC
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBGcmksIE1heSAyLCAyMDI1
IGF0IDE6MDLigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3
cm90ZToKPgo+IEhpIFByYWJoYWthciwKPgo+IE9uIFRodSwgMSBNYXkgMjAyNSBhdCAxNDozNywg
UHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBGcm9tOiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4g
Pgo+ID4gQWRkIENPTkZJR19BUkNIX1I5QTA5RzA1NiB0byB0aGUgcHJvYmUgY29uZGl0aW9uIGlu
IHJlbmVzYXMtb3N0bS5jIHNvIHRoYXQKPiA+IHRoZSBPU1RNIHBsYXRmb3JtIGRyaXZlciBjYW4g
cmVwcm9iZSBmb3IgdGhlIFJaL1YyTiAoUjlBMDlHMDU2KSBTb0MuIExpa2UKPiA+IFJaL0cyTCBh
bmQgUlovVjJIKFApLCB0aGUgUlovVjJOIGNvbnRhaW5zIHRoZSBHZW5lcmljIFRpbWVyIE1vZHVs
ZSAoT1NUTSkKPiA+IHdoaWNoIHJlcXVpcmVzIGl0cyByZXNldCB0byBiZSBkZWFzc2VydGVkIGJl
Zm9yZSBhbnkgcmVnaXN0ZXIgYWNjZXNzLgo+ID4gRW5hYmxpbmcgdGhlIHBsYXRmb3JtX2Rldmlj
ZSBwcm9iZSBwYXRoIGVuc3VyZXMgdGhlIGRyaXZlciBkZWZlcnMgdW50aWwKPiA+IHJlc2V0cyBh
cmUgYXZhaWxhYmxlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJo
YWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+Cj4gPiAtLS0gYS9kcml2
ZXJzL2Nsb2Nrc291cmNlL3JlbmVzYXMtb3N0bS5jCj4gPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291
cmNlL3JlbmVzYXMtb3N0bS5jCj4gPiBAQCAtMjI1LDcgKzIyNSw3IEBAIHN0YXRpYyBpbnQgX19p
bml0IG9zdG1faW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ID4KPiA+ICBUSU1FUl9PRl9E
RUNMQVJFKG9zdG0sICJyZW5lc2FzLG9zdG0iLCBvc3RtX2luaXQpOwo+ID4KPiA+IC0jaWYgZGVm
aW5lZChDT05GSUdfQVJDSF9SWkcyTCkgfHwgZGVmaW5lZChDT05GSUdfQVJDSF9SOUEwOUcwNTcp
Cj4gPiArI2lmIGRlZmluZWQoQ09ORklHX0FSQ0hfUlpHMkwpIHx8IGRlZmluZWQoQ09ORklHX0FS
Q0hfUjlBMDlHMDU3KSB8fCBkZWZpbmVkKENPTkZJR19BUkNIX1I5QTA5RzA1NikKPgo+IFdoYXQg
YWJvdXQgc2ltcGxpZnlpbmcgdGhpcyB0byBhIGNoZWNrIGZvciBDT05GSUdfQVJNNjQ/Cj4gVGhl
IG9ubHkgU29DcyB3aGljaCBkb24ndCB3YW50IHRoaXMgYXJlIFJaL0ExIGFuZCBSWi9BMiwgYmVj
YXVzZSB0aGV5Cj4gYXJlIENvcnRleC1BOSBhbmQgdGh1cyBkbyBub3QgaGF2ZSB0aGUgYXJjaGl0
ZWN0dXJlZCB0aW1lciwgd2hpY2ggaXMKPiBtYW5kYXRvcnkgb24gQVJNNjQuCj4KQWdyZWVkIEkg
d2lsbCBzaW1wbGlmeSB0aGlzIHRvIENPTkZJR19BUk02NC4KCkNoZWVycywKUHJhYmhha2FyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
