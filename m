Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 480CFAAFAE7
	for <lists+linux-stm32@lfdr.de>; Thu,  8 May 2025 15:10:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6F44C7A822;
	Thu,  8 May 2025 13:10:12 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D243CC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 13:10:11 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so130952966b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 May 2025 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746709811; x=1747314611;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qMvBG083xP6dxkstmeCUA71FGvdXWAHknvGo9znoWPE=;
 b=N95UGB4PwmxPCorJpe651aJiReDnI10EFVjWhoSQN2zANZTqioupL3aOHtXyojKqZU
 Ug0RKpaYDSgE8ZpyLtvl4KzuuNHAsvIs28mOSghkbO6oay1bHprZikjgn3RMLRxwZ8Rq
 tkcsXcKNBQOLtHrrzKrpO65RWu3ybdpduao62ddAmRxKV4FDJJkInqJUDbBaUdad9UuT
 wetOi4yYaNWBya4GqCplt6KSUN8ud2FuPpEqyUwo7fPdrDbpoQf6tK+7vedjSFBAZdC+
 cUZIHpRtP6p1B9eiGzqKdEVir6/IiCay93VIJH91bfc8qWqXu/QTKqG32n3P0oKF2b9u
 c8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746709811; x=1747314611;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qMvBG083xP6dxkstmeCUA71FGvdXWAHknvGo9znoWPE=;
 b=KGTNuxXR9JF9Vy+P4Ha7h6Taeu+IEi8WQSeOt5KaexpekbhHV+NC2k7uOeoQGeOUUC
 8VUd121pl441Qt3IFIebxa/yJvLgjb/y7Bis1xU3scalHibEUgmhDaD8yFna8RoEjR1F
 vlwf/LFxvXenpofaP3ZHpMfuOskKgS+Msi9lp6e+Ma1YIuGDM57yArO15qD8tTJUqHhr
 8wpmxxGUREDCWDRDcnN+NDVScVAOw+rZMbVcJdoiTWClDV7rkVOk3posGlqoPscSkkM5
 /02GUoTrrX8uJUNdW/Uzt3XOSJqND1HT3behNzKdqIPZAhjGBvAFuZIp4IEWyNNCFfto
 4WdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmp4eWK0UQXmtXcupqGx42nNm0XGQDgfSl4pW1sBtSQQATSMgj6G5OOchMlnxCtLxkO8aFo8UyzagN0w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwCQ2/z9H/GAnVcwh6LjWYbiAnTZ8NCGAHFwLVQzfbVxOrVTH+m
 +qAlNv5xrvVgZ152eelp8tPzloyqSeBHl7mVVRQ781hWLEgOetb2
X-Gm-Gg: ASbGnculiDMUzytuC8FU1IPGImQbhskg2sDp6gQx10UCYFNkj+r9Rdy7ixb2SCWjpGt
 VKZQVbDCCqERKXDudTcMd8iVBgyRP0qxGZsku/TbKABMci3NltcJFQAuSJRzDXQXpJiRo10W7eU
 F5N6ZjM7TB6CzHDmJdR36sJ7Woa575Sbtuml7VecWP/0gkcmPf7bGqw4vFUR6+6PWBBtN0/XTlq
 4TBgnGB6juSxXU4FYDoGo7YT1wK26r6uCZvjHykdVQA8B4yy21Fb0UVuBn7jqHsIEGBDgCLskvo
 lnW7BOOQ0OmyH0ghBXOOi904gI3lZWkEpyu58WRrvyei0gfU0w==
X-Google-Smtp-Source: AGHT+IEB6ljN3284yI5Xfi8yEjwnnAJXLsYkUNbO+pXteYAHjEfhnYbAgRfFH7dO7rz+OnQx0ARB+Q==
X-Received: by 2002:a17:907:9629:b0:aca:b72b:4576 with SMTP id
 a640c23a62f3a-ad1e8c4043bmr738658966b.33.1746709810784; 
 Thu, 08 May 2025 06:10:10 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c0371sm1074090066b.115.2025.05.08.06.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 06:10:10 -0700 (PDT)
Message-ID: <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Date: Thu, 8 May 2025 15:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
 <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] ARM: dts: stm32: add initial
 support for stm32mp157-ultra-fly-sbc board
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgQW5kcmV3LAoKdGhhbmsgWW91IG9uY2UgYWdhaW4gZm9yIGhlbHBmdWwgaGludC4KCkFuZHJl
dyBMdW5uIHdyb3RlOgo+Pj4+ICsJcGh5LWhhbmRsZSA9IDwmcGh5MT47Cj4+Pj4gKwo+Pj4+ICsJ
bWRpbyB7Cj4+Pj4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+Pj4gKwkJI3NpemUtY2VsbHMg
PSA8MD47Cj4+Pj4gKwkJY29tcGF0aWJsZSA9ICJzbnBzLGR3bWFjLW1kaW8iOwo+Pj4+ICsJCXBo
eTE6IGV0aGVybmV0LXBoeUAxIHsKPj4+PiArCQkJcmVnID0gPDE+Owo+Pj4+ICsJCQlpbnRlcnJ1
cHQtcGFyZW50ID0gPCZncGlvZD47Cj4+Pj4gKwkJCWludGVycnVwdHMgPSA8MCBJUlFfVFlQRV9F
REdFX0ZBTExJTkc+Owo+Pj4gUEhZIGludGVycnVwdHMgYXJlIDk5JSB0aW1lIGxldmVsLCBub3Qg
ZWRnZS4KPj4gVGhhdCBpcyBjb3JyZWN0LCBidXQgSSBhbSBmYWNpbmcgc3RyYW5nZSBiZWhhdmlv
ciwgd2hlbiBJIHNldAo+PiBJUlFfVFlQRV9MRVZFTF9MT1cuCj4+IE15IGJvYXJkIHN0b3BzIGJv
b3RpbmcgYXQ6Cj4+Cj4+IFsgICAgMi4zNDMyMzNdIFdhaXRpbmcgZm9yIHJvb3QgZGV2aWNlIC9k
ZXYvbW1jYmxrMHA0Li4uCj4+IFsgICAxMi42Mzg4MThdIHBsYXRmb3JtIDVhMDA2MDAwLnVzYnBo
eWM6IGRlZmVycmVkIHByb2JlIHBlbmRpbmcKPj4gWyAgIDEyLjY0MzE5Ml0gcGxhdGZvcm0gNDkw
MDAwMDAudXNiLW90ZzogZGVmZXJyZWQgcHJvYmUgcGVuZGluZwo+PiBbICAgMTIuNjQ5MDI5XSBw
bGF0Zm9ybSA0ODAwMzAwMC5hZGM6IGRlZmVycmVkIHByb2JlIHBlbmRpbmcKPj4gWyAgIDEyLjY1
NDI3N10gcGxhdGZvcm0gNTgwMGQwMDAudXNiOiBkZWZlcnJlZCBwcm9iZSBwZW5kaW5nCj4+IFsg
ICAxMi42NTk3NDRdIHBsYXRmb3JtIDU4MDBjMDAwLnVzYjogZGVmZXJyZWQgcHJvYmUgcGVuZGlu
Zwo+PiBbICAgMTIuNjY1MDg5XSBhbWJhIDU4MDA1MDAwLm1tYzogZGVmZXJyZWQgcHJvYmUgcGVu
ZGluZwo+PiBbICAgMTIuNjcwMjM5XSBhbWJhIDU4MDA3MDAwLm1tYzogZGVmZXJyZWQgcHJvYmUg
cGVuZGluZwo+PiBbICAgMTIuNjc1MTg1XSBwbGF0Zm9ybSA1MDAyNTAwMC52cmVmYnVmOiBkZWZl
cnJlZCBwcm9iZSBwZW5kaW5nCj4+Cj4+IEkgbXVzdCBpbnZlc3RpZ2F0ZSB0aGlzLiBJZiBZb3Ug
aGF2ZSBhbnkgaWRlYSwgWW91IGFyZSB3ZWxjb21lIHRvIHNoYXJlIGl0Lgo+IENvdWxkIGJlIGFu
IGludGVycnVwdCBzdG9ybS4gVGhlIGludGVycnVwdCBpcyBub3QgZ2V0dGluZyBjbGVhcmVkCj4g
YmVjYXVzZSBvZiBzb21ldGhpbmcgbWlzc2luZyBpbiB0aGUgUEhZIGRyaXZlciwgc28gaXQganVz
dCBmaXJlcyBhZ2Fpbgo+IGFuZCBhZ2Fpbi4KCkFmdGVyIGEgYnJpZWYgaW52ZXN0aWdhdGlvbiwg
SSB0ZW5kIHRvIGFncmVlIHdpdGggeW91ciBhc3Nlc3NtZW50IHRoYXQgCnRoZSBpc3N1ZSBsaWVz
IGluIHRoZSBkcml2ZXLigJRsaWtlbHkgdGhlIHN0bW1hYyBkcml2ZXIg4oCUIHdoaWNoIGlzIG91
dHNpZGUgCnRoZSBzY29wZSBvZiBteSBjaGFuZ2VzLgoKVGhlcmVmb3JlLCBJIHdvdWxkIHN1Z2dl
c3Qga2VlcGluZyBJUlFfVFlQRV9FREdFX0ZBTExJTkcgZm9yIG5vdywgb3IgCmFsdGVybmF0aXZl
bHkgbm90IHVzaW5nIGEgaGFyZHdhcmUgSVJRIGF0IGFsbCBhbmQgZmFsbGluZyBiYWNrIHRvIApw
b2xsaW5nLCBhcyBkb25lIGluIHN0bTMybXAxNXh4LWRreC5kdHNpLgoKQmVzdCByZWdhcmRzLApH
b3JhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
