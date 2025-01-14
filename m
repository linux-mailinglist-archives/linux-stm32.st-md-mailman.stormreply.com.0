Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF7A1063C
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 13:10:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE2B3C7802D;
	Tue, 14 Jan 2025 12:10:41 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11CE0C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 12:10:34 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-385e44a1a2dso328495f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736856633; x=1737461433;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=L7S3Bqm4SNa/5fzzRYJGEgkQpxjwQsp8IpalJXQqIYs=;
 b=wb2XBJqYHkj9jMOT2UoHZc7MGr/il1wdLJOrnMHnANA96zgcb2np1cSd3kjl+lcgcE
 SHqEHOIurxKk1Vo3jmuukNcblfMN1R8oF/JwsmrHuWJv+V7wg9RCqC3wXlnatmLJJkgf
 IRNYKnUKYYTVuCgvl8umQTJ5XZBsDuORMy0hxLmEoYqXyQwPMZu4DLGVlzXNzsHyHUr7
 kzNvJDU+pm1N/F0UD44IpyV/uG3nE1XTv0khlg5TiVxSohHQ1bdD2huOXxSWkKaHUwTN
 iqq09M7Z2hpbC1AZEceY8LhdeNoyr4iTaJBpqzt9BGiocSz8jLAVPFObVqOAWHuAjpSy
 zddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736856633; x=1737461433;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7S3Bqm4SNa/5fzzRYJGEgkQpxjwQsp8IpalJXQqIYs=;
 b=BqvaPQQqZCOoTvsWhplQ1R+hXC9TkTGYX6XL6Elremm9eFMnOfHYUh9U8k49qpPGN/
 S9BgAUNV+TBY2PbdDAR1XzAnC5LvyDD4IlyM0Xw0zrA8y9+vUTG6QDjWGwuJylQ7dD3y
 mF6z8JI1uaEEfXewKOEo7kU9pkpRf2Ce1vxa1DcSaGpQKK428a0+DS3U4b8REOyKFHqu
 ciJPadt0i+jTgbYffrMoNuZsD9f1kkWB975AYR6N6yCXw/6EE7rPQ2esss4mi8ZLM+bh
 aM8cJYQue7vODPOtSQ/65sjkqUClwFDIOXH5QvGNfQIbS3JLqq/cxjMt/n2xuO7c8Rrg
 cwpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW52JqQV9kJuzx0o0MV0whpjdW8FcLX5UdA1wrFikhq0axHqHpvZRVNYdXRYNF6Dwr0E0ynTP2KMR5HBw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz6dUvE0IqLigmOo73+Fe8a4QGG29wdi8h3eusP3wJu5uSCOOq/
 20vwsCvAYuknIWwrRFCXB11MinzwD9a2WxvffKdJq84LfqPMPLFMkKHADPFzA5U=
X-Gm-Gg: ASbGncvb4Z074tsk1Oi3x7108DiiP3Ewe5/oGA6q1PbnZOBfmDFLYPDJZaEsIx6ZYB5
 0IILmCMkV1hfvNGtGQ27vrmAYqJay7NoxlL6Ni5jqckf++a40VhNIuShDkkRhkXUSqGXv8lPpum
 uNebMsdH+LxmmRE8AQzMplOqT+f6MRkxV0ncO3doUCWkC9FzpI+MV3bm3SKtPeIdcVxkdbXzLdq
 GOI2lXXfCn2dyPEkTAeK3A8I1cAL3rKEOclkl5l646oX4M1dx8IwEKUvtL7zXwRg/X5gqZl7dN9
X-Google-Smtp-Source: AGHT+IEyJ/lzH1HupLPZyyqFfgaVEsvS8mYjH3oZgQAV4JnCkZ/mE9gYnmXZGtd/cwlAg1EayO2C/Q==
X-Received: by 2002:a5d:648f:0:b0:385:f479:ef46 with SMTP id
 ffacd0b85a97d-38a87310d7bmr7823496f8f.13.1736856633432; 
 Tue, 14 Jan 2025 04:10:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c6dbsm14958381f8f.55.2025.01.14.04.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 04:10:32 -0800 (PST)
Message-ID: <b2315f7f-4c8d-480a-8ed7-fa81ec7a7f23@linaro.org>
Date: Tue, 14 Jan 2025 13:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
 <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
 <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
 <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
 <CABGWkvpGGdjJVTHppOohGPq3yi_Y20t9b0WWkPOriFU9=CHQMg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CABGWkvpGGdjJVTHppOohGPq3yi_Y20t9b0WWkPOriFU9=CHQMg@mail.gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: clock: convert stm32
 rcc bindings to json-schema
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

T24gMTQvMDEvMjAyNSAxMjoyNSwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gT24gVHVlLCBKYW4g
MTQsIDIwMjUgYXQgMTE6MTPigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCj4gPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDE0LzAxLzIwMjUgMTE6MDAsIERh
cmlvIEJpbmFjY2hpIHdyb3RlOgo+Pj4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMTA6NDjigK9B
TSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4g
T24gMTQvMDEvMjAyNSAxMDozNiwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4+Pj4+PiBOb3RoaW5n
IGltcHJvdmVkIGhlcmUuCj4+Pj4+Cj4+Pj4+IEluIG15IGh1bWJsZSBvcGluaW9uLCB0aGVyZSBp
cyBub3RoaW5nIHRvIGltcHJvdmUuIEFueSBtb2RpZmljYXRpb24KPj4+Pj4gbWFkZSBjYXVzZXMg
dGhlIHRlc3RzIHRvIGZhaWwuCj4+Pj4+Cj4+Pj4+ICQgZ2l0IGdyZXAgc3Qsc3RtMzJmNzQ2LXJj
YyBhcmNoLwo+Pj4+PiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NDYuZHRzaTogICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPQo+Pj4+PiAic3Qsc3RtMzJmNzQ2LXJjYyIsICJzdCxz
dG0zMi1yY2MiOwo+Pj4+PiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NjktZGlzY28uZHRz
OiAgICAgICBjb21wYXRpYmxlID0KPj4+Pj4gInN0LHN0bTMyZjc2OS1yY2MiLCAic3Qsc3RtMzJm
NzQ2LXJjYyIsICJzdCxzdG0zMi1yY2MiOwo+Pj4+Pgo+Pj4+PiBPciBhbSBJIG1pc3Npbmcgc29t
ZXRoaW5nPwo+Pj4+Cj4+Pj4gSG93IGNhbiBJIGtub3cgd2hhdCB5b3UgYXJlIG1pc3NpbmcgaWYg
eW91IGRvIG5vdCBzaG93IHRoZSBjb2RlPwo+Pj4KPj4+IFNvcnJ5LCBidXQgSSBzdGlsbCBjYW4n
dCB1bmRlcnN0YW5kLiBJIHJ1biBtdWx0aXBsZSB0ZXN0cywgdHJ5aW5nIHRvCj4+Cj4+IFlvdSBk
b24ndCB1bmRlcnN0YW5kIHRoYXQgSSBjYW5ub3QgaW1wcm92ZSB5b3VyIGNvZGUgaWYgSSBkbyBu
b3Qgc2VlIHRoZQo+PiBjb2RlPyBTbyBsZXQgbWUgcmVwaHJhc2U6IEluIG9yZGVyIHRvIHRlbGwg
d2hhdCBpcyB3cm9uZyB3aXRoIHNvbWUgc29ydAo+PiBvZiBjb2RlLCBJIG5lZWQgdG8gc2VlIGl0
LiBJIGNhbm5vdCB0ZWxsIHdoYXQgaXMgd3Jvbmcgd2l0aCBjb2RlIHdpdGhvdXQKPj4gc2VlaW5n
IGl0Lgo+IAo+IFlvdSB0b2xkIG1lIHRoYXQgdGhpcyBjb2RlIHdhcyBub3QgZXhhY3RseSBjb3Jy
ZWN0IGZvciB0aGUgcGFydHMKPiBtYXJrZWQgd2l0aCAqKioqKioqKio6CgpBbGwgcGxhY2VzIHdp
dGggc2FtZSBmYWxsYmFja3Mgc2hvdWxkIGJlIHVuaWZpZWQuIFlvdSBoYXZlIGF0IGxlYXN0IHR3
bwpvZiBzdWNoIGdyb3Vwcy4KCj4gCj4gcHJvcGVydGllczoKPiAgIGNvbXBhdGlibGU6Cj4gICAg
IG9uZU9mOgo+ICAgICAgIC0gaXRlbXM6Cj4gICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMyZjQy
eHgtcmNjCj4gICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMyLXJjYwo+ICAgICAgIC0gaXRlbXM6
Cj4gICAgICAgICAgIC0gZW51bToKPiAgICAgICAgICAgICAgIC0gc3Qsc3RtMzJmNDY5LXJjYwo+
ICAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMmY0Mnh4LXJjYwo+ICAgICAgICAgICAtIGNvbnN0
OiBzdCxzdG0zMi1yY2MKPiAgICAgICAtIGl0ZW1zOgo+ICAgICAgICAgICAtIGNvbnN0OiBzdCxz
dG0zMmY3NDYtcmNjICoqKioqKioqCj4gICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMyLXJjYwo+
ICAgICAgIC0gaXRlbXM6Cj4gICAgICAgICAgIC0gZW51bToKPiAgICAgICAgICAgICAgIC0gc3Qs
c3RtMzJmNzY5LXJjYwo+ICAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMmY3NDYtcmNjCj4gICAg
ICAgICAgIC0gY29uc3Q6IHN0LHN0bTMyLXJjYwo+ICAgICAgIC0gaXRlbXM6Cj4gICAgICAgICAg
IC0gY29uc3Q6IHN0LHN0bTMyaDc0My1yY2MgKioqKioqKioqCj4gICAgICAgICAgIC0gY29uc3Q6
IHN0LHN0bTMyLXJjYwo+IAo+IEkgaGF2ZW4ndCBmb3VuZCBhIHdheSB0byBtYWtlIGNoYW5nZXMg
dG8gdGhvc2UgZWxlbWVudHMgd2l0aG91dCBjYXVzaW5nIHRoZQo+IHRlc3RzIHRvIGZhaWwuIENv
dWxkIHlvdSBraW5kbHkgcHJvdmlkZSBtb3JlIGV4cGxpY2l0IGd1aWRhbmNlIG9uIHRoZSBraW5k
IG9mCj4gbW9kaWZpY2F0aW9uIHlvdSdyZSBleHBlY3Rpbmc/Cj4gCgppdGVtczoKICAtIGVudW06
CiAgICAgIC0gZm9vCiAgICAgIC0gYmFyCiAgIC0gY29uc3Q6IGJhegoKTGlrZSBJIHNhaWQ6IGFs
bCBRY29tIGJpbmRpbmdzLiBQcm9iYWJseSBhbGwgTlhQIGFzIHdlbGwuCgpCZXN0IHJlZ2FyZHMs
CktyenlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
