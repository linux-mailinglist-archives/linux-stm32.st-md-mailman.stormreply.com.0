Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20584A103C3
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 11:13:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5342C7802D;
	Tue, 14 Jan 2025 10:13:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1E1DC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 10:13:40 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d3cd821c60so956463a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 02:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736849620; x=1737454420;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=onDwLQJsnBJFPmm1fOiNWOV2V2/OfeEnsevme4QIeyY=;
 b=WXOP1n6DeexqisMQn/j6zAHhfSnFi061LSEceZJgEkPw8mbekgu2pduDqsHcUFJ7jA
 hsuM97j0gFg1Et8ybOiFzC44/LARoXZnWNg+tqr6VYMy38ZcvJAkfzKiRi8H6mIaGJ4V
 nEKs1l3gWwgpHWJx5NvFx/3EfExlP0aIfJSkvqyci5idMA62NXCVA7iNzn+r2mhwiyDl
 XeZ+i5pfebb3oX7ZwndOWmKVex393OhdA0gjXAKbzkIkqhQa5g8JcFkTcsiV2jmH+hrD
 di0pqDRgZNuTLdFXiGX9ecBBAkFH4jRJGpiYF3zI74pDvYgiSQSMhE6lJl4SrZAKXiRi
 L3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736849620; x=1737454420;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=onDwLQJsnBJFPmm1fOiNWOV2V2/OfeEnsevme4QIeyY=;
 b=Kz51Fu/I2GY/Eb0EpXq/uoSt5EETlllIW3/EjzGgQju/kfeEjj0rIsmzXh/ZAKkb/h
 PlTrhet8Xd5nBn8DC0cw3Y6YNQo6kP1KfAyiQ0RI0kbu9M0ETRrut2+zu7clZgOrJQnQ
 Qlp3jub2EBkg4fGpM6LYlQjzYyWkG9p4odfUKZoUBHUIPNb6Un7CDj7xQrMllh1CsLUI
 Trux5PbPZQEoV/kQV0Fk61PNo1LkzxvYvJNygIXXjAPLxE0+HxdDJFMCnSS4GEACuIhO
 mx4NSycAPolKU5ilxWLoRsVRfeIojEUlv48pahi2S5Kmg/9b2VKeArAHCmZsTB88ae0+
 zCng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSaKOi0DWnkzfR3+0MTi7d6Ry0Ah6THqIPKaHxfbhrX3OsooAJ22wZ6Wo97XbCEArPiPihnqXCqRstvA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzqVP4G5nDuxLk3R+G8k28TnE/YQ94XcZeEpqIN9tvf+ipSmO0v
 f3wLMSCt07Qew/2HrCbByc6eZSl/37mAesNV9yXnIK+O35Fe7EH1Xz8iNxqI/Fs=
X-Gm-Gg: ASbGncvWA5nK98yRzfRgw0mSwaVKm8DceRCk1ltIXkUOvu3/6FYcc13jBTfUCPYZd3k
 PkM9mLjq0E52W8gnT8MghfrEwbafLXYJWNFnVS+ZTeAvGlmjjd9iddodqkPJg2T6mb9wxFWLWFi
 +L+lc2Uaa1YqNfkhm/3j5AHjM5TLZ2+u0iYr60A+nTD4zobWgnpmwBckirw/Mw8ZCQWCtsOHEfU
 Ehh9nne1mNLUykvOPgQCLRRu6/bPp8rWTYQStgLUwyHfAYHAwgFKJTsUaFGvwDilFA8scrFx54c
X-Google-Smtp-Source: AGHT+IGgnkpVyamMUhyft+dfggczs/yHwby6IDz6TiynQnKUxT5g12HieH3ic3vi60H6gnSWHwhdkg==
X-Received: by 2002:a17:907:9621:b0:a99:4a35:2400 with SMTP id
 a640c23a62f3a-ab2ab73bdccmr944668766b.7.1736849620286; 
 Tue, 14 Jan 2025 02:13:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95647absm605929966b.118.2025.01.14.02.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 02:13:39 -0800 (PST)
Message-ID: <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
Date: Tue, 14 Jan 2025 11:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
 <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
 <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
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

T24gMTQvMDEvMjAyNSAxMTowMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gT24gVHVlLCBKYW4g
MTQsIDIwMjUgYXQgMTA6NDjigK9BTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pgo+PiBPbiAxNC8wMS8yMDI1IDEwOjM2LCBEYXJpbyBCaW5hY2NoaSB3cm90
ZToKPj4+PiBOb3RoaW5nIGltcHJvdmVkIGhlcmUuCj4+Pgo+Pj4gSW4gbXkgaHVtYmxlIG9waW5p
b24sIHRoZXJlIGlzIG5vdGhpbmcgdG8gaW1wcm92ZS4gQW55IG1vZGlmaWNhdGlvbgo+Pj4gbWFk
ZSBjYXVzZXMgdGhlIHRlc3RzIHRvIGZhaWwuCj4+Pgo+Pj4gJCBnaXQgZ3JlcCBzdCxzdG0zMmY3
NDYtcmNjIGFyY2gvCj4+PiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NDYuZHRzaTogICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPQo+Pj4gInN0LHN0bTMyZjc0Ni1yY2MiLCAic3Qs
c3RtMzItcmNjIjsKPj4+IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS1kaXNjby5kdHM6
ICAgICAgIGNvbXBhdGlibGUgPQo+Pj4gInN0LHN0bTMyZjc2OS1yY2MiLCAic3Qsc3RtMzJmNzQ2
LXJjYyIsICJzdCxzdG0zMi1yY2MiOwo+Pj4KPj4+IE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/
Cj4+Cj4+IEhvdyBjYW4gSSBrbm93IHdoYXQgeW91IGFyZSBtaXNzaW5nIGlmIHlvdSBkbyBub3Qg
c2hvdyB0aGUgY29kZT8KPiAKPiBTb3JyeSwgYnV0IEkgc3RpbGwgY2FuJ3QgdW5kZXJzdGFuZC4g
SSBydW4gbXVsdGlwbGUgdGVzdHMsIHRyeWluZyB0bwoKWW91IGRvbid0IHVuZGVyc3RhbmQgdGhh
dCBJIGNhbm5vdCBpbXByb3ZlIHlvdXIgY29kZSBpZiBJIGRvIG5vdCBzZWUgdGhlCmNvZGU/IFNv
IGxldCBtZSByZXBocmFzZTogSW4gb3JkZXIgdG8gdGVsbCB3aGF0IGlzIHdyb25nIHdpdGggc29t
ZSBzb3J0Cm9mIGNvZGUsIEkgbmVlZCB0byBzZWUgaXQuIEkgY2Fubm90IHRlbGwgd2hhdCBpcyB3
cm9uZyB3aXRoIGNvZGUgd2l0aG91dApzZWVpbmcgaXQuCgo+IG1vZGlmeSB0aGluZ3MKPiBiYXNl
ZCBvbiB3aGF0IEkgdW5kZXJzdG9vZCBvZiB5b3VyIHN1Z2dlc3Rpb25zLCBidXQgdGhlIHRlc3Rz
IGZhaWxlZAo+IGV2ZXJ5IHRpbWUuCj4gCj4gQ291bGQgeW91IGtpbmRseSBwcm92aWRlIGFuIGV4
YW1wbGUgb2Ygd2hhdCB5b3UnZCBsaWtlIG1lIHRvIGRvPwpBbnkgcWNvbSBiaW5kaW5nPyBBbnkg
b3RoZXIgU29DIGJpbmRpbmcgd2l0aCBtdWx0aXBsZSBkZXZpY2VzPwoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
