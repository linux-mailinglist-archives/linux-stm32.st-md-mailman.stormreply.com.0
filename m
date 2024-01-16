Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A7382EA39
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 08:42:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0685C6B457;
	Tue, 16 Jan 2024 07:42:52 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4D93C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 07:42:51 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so1135864066b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 23:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705390971; x=1705995771;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Co7zsJqeAeRE1qDOKNmW3TdEzTZPmfPOPRRWPGZTc5Q=;
 b=OR49fnZTxdhEGDO9yAVywPIaKaCeuvwfz4N2dky6wBrJeo6a7OAvOIv4ro8O6CSD4c
 c9HwYdz890vSTKuOafuovHKs4EAgAvdEYOIIO2+ezC3JIxNYhRsuqiPYRqpHqKjNzniW
 A50j0+S52CoT/q7d2ILcspFicOhjRjA14grqgEYEh0xhck3mkzcYjmsNiO6wNL/cTCDu
 +1ZCwUPIGCHzBA9K1IlNXeuuSNBzAnrM9v2w46M1Mu9BBrcZ03LaMvdU8jbDiABYAkNM
 gm3j/a+nH5rxMmNSngFWyQHyGICfz483ll6A0zUXXovU0m9TmModZRx55hn+ZheLkrOO
 RStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705390971; x=1705995771;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Co7zsJqeAeRE1qDOKNmW3TdEzTZPmfPOPRRWPGZTc5Q=;
 b=jm9ALC2My9UP9XPpI6OMXDoDzaSvKkj8h4Q69vyRGvh5ilW6PztAI5xMSi9Qj0CvO/
 q4ecI9X+gGwEfAXkXHZ2Z74s1uL69a8GGJGnN9Y+eiwhpHOb/8u4KlU6APs8nl4JWUXQ
 MtaAbEaP5pluJLyQHeLssZY2PdVFSMsZye/7ilEpu16FgwKGvC35XNcd34E58dx7SNRy
 mmQS4KhS8NfNO9Z2HKd6tDs/RgI9U6eyENu/ZL58YhQ0K7YMc+DDV7n+huIQjA7hu5ly
 6BXg83NPf+aDh9xBkZF1/SASet9wflfdFgaPiOaO96H6tijOHWTQtXIuKq1AMalco+WJ
 ZoXA==
X-Gm-Message-State: AOJu0YxLNzQDDCCK3794+8VRKT8G2BRHPlYTG28FtVkUcYSsasFAAFFT
 Oi/vfvC13SNFYyYkgIZo1rucWh0TiBCvjA==
X-Google-Smtp-Source: AGHT+IGKjsCq49FIAeeEatxbVWACKvbZ6Z6jG0Fgd5QvI9e+HE0M9qFmJBdbgLAkQSwvZbQYmepmcA==
X-Received: by 2002:a17:907:5c9:b0:a28:810b:580 with SMTP id
 wg9-20020a17090705c900b00a28810b0580mr2513089ejb.66.1705390971089; 
 Mon, 15 Jan 2024 23:42:51 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a1709064bd900b00a28f54aacf1sm6185810ejv.185.2024.01.15.23.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 23:42:50 -0800 (PST)
Message-ID: <e42818b2-8826-48f8-b9bd-35cbf464a08f@linaro.org>
Date: Tue, 16 Jan 2024 08:42:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Herring <robh@kernel.org>
References: <20240115132009.101718-1-raphael.gallais-pou@foss.st.com>
 <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
 <20240115154659.GA815331-robh@kernel.org>
 <3479c5d7-a9c3-40cf-a415-b8324f160ec7@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <3479c5d7-a9c3-40cf-a415-b8324f160ec7@foss.st.com>
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/6] dt-bindings: display: add
 dt-bindings for STM32 LVDS device
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

T24gMTUvMDEvMjAyNCAxNzo1MSwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPiAKPiBPbiAx
LzE1LzI0IDE2OjQ2LCBSb2IgSGVycmluZyB3cm90ZToKPj4gT24gTW9uLCBKYW4gMTUsIDIwMjQg
YXQgMDI6MjA6MDRQTSArMDEwMCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4+IEFkZCAi
c3Qsc3RtMzJtcDI1LWx2ZHMiIGNvbXBhdGlibGUuCj4+PgoKQSBuaXQsIHN1YmplY3Q6IGRyb3Ag
c2Vjb25kL2xhc3QsIHJlZHVuZGFudCAiZHQtYmluZGluZ3MgZm9yIi4gVGhlCiJkdC1iaW5kaW5n
cyIgcHJlZml4IGlzIGFscmVhZHkgc3RhdGluZyB0aGF0IHRoZXNlIGFyZSBiaW5kaW5ncy4KU2Vl
IGFsc286Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjctcmM4L3NvdXJjZS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNM
MTgKCj4+PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxh
aXMtcG91QGZvc3Muc3QuY29tPgo+Pj4gLS0tCj4+PiBEZXBlbmRzIG9uOiAiZHQtYmluZGluZ3M6
IHN0bTMyOiBhZGQgY2xvY2tzIGFuZCByZXNldCBiaW5kaW5nIGZvcgo+Pj4gCSAgICBzdG0zMm1w
MjUgcGxhdGZvcm0iIGJ5IEdhYnJpZWwgRmVybmFuZGV6Cj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2MzoK
Pj4+IAktIENsYXJpZnkgY29tbWl0IGRlcGVuZGVuY3kKPj4+IAktIEZpeCBpbmNsdWRlcyBpbiB0
aGUgZXhhbXBsZQo+Pj4gCS0gRml4IFlBTUwKPj4+IAktIEFkZCAiY2xvY2stY2VsbHMiIGRlc2Ny
aXB0aW9uCj4+PiAJLSBzL3JlZ3JvdXBzL2lzIGNvbXBvc2VkIG9mLwo+Pj4gCS0gQ2hhbmdlZCBj
b21wYXRpYmxlIHRvIHNob3cgU29DIHNwZWNpZmljaXR5Cj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2MjoK
Pj4+IAktIFN3aXRjaCBjb21wYXRpYmxlIGFuZCBjbG9jay1jZWxscyByZWxhdGVkIGFyZWFzCj4+
PiAJLSBSZW1vdmUgZmF1bHR5ICNpbmNsdWRlIGluIHRoZSBleGFtcGxlLgo+Pj4gCS0gQWRkIGVu
dHJ5IGluIE1BSU5UQUlORVJTCj4+PiAtLS0KPj4+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9zdCxz
dG0zMi1sdmRzLnlhbWwgICAgICAgfCAxMTkgKysrKysrKysrKysrKysrKysrCj4+IEZpbGVuYW1l
IG1hdGNoaW5nIGNvbXBhdGlibGUuCj4gCj4gSGkgUm9iLAo+IAo+IAo+IEkgd2FzIHVuc3VyZSBh
Ym91dCB0aGlzLgo+IAo+IFRoZSBkcml2ZXIgd2lsbCBldmVudHVhbGx5IHN1cHBvcnQgc2V2ZXJh
bCBTb0NzIHdpdGggZGlmZmVyZW50IGNvbXBhdGlibGVzLAo+IHdvdWxkbid0IHRoaXMgYmUgbW9y
ZSBjb25mdXNpbmcgPwoKTm8uICJFdmVudHVhbGx5IiBtaWdodCBuZXZlciBoYXBwZW4uCgo+IEkg
YWxzbyB3YW50ZWQgdG8ga2VlcCB0aGUgc2ltaWxhcml0eSB3aXRoIHRoZSAic3Qsc3RtMzItPGlw
Pi55YW1sIiBuYW1lIGZvciB0aGUKPiBEUk0gU1RNIGRyaXZlcnMuIFdvdWxkIHRoYXQgYmUgcG9z
c2libGUgPwoKQnV0IHdoeT8gVGhlIGNvbnNpc3RlbmN5IHdlIHdhbnQgaXMgdGhlIGZpbGVuYW1l
IG1hdGNoaW5nIGNvbXBhdGlibGUsCm5vdCBtYXRjaGluZyBvdGhlciBmaWxlbmFtZXMuIElmIHlv
dSBoYXZlIGhlcmUgbXVsdGlwbGUgZGV2aWNlcywKZG9jdW1lbnQgdGhlbSAqbm93Ki4KCj4gCj4g
Cj4gUmVnYXJkcywKPiAKPiBSYXBoYcOrbAoKSSBob3BlIHlvdSBkaWQgbm90IGlnbm9yZSByZXN0
IG9mIHRoZSBjb21tZW50cy4uLiBXZSBleHBlY3Qgc29tZSBzb3J0IG9mCiJhY2svb2svSSdsbCBm
aXgvd2hhdGV2ZXIiIG1lc3NhZ2UgYW5kIHlvdSB3cm90ZSBub3RoaW5nIGZ1cnRoZXIuCgpCZXN0
IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
