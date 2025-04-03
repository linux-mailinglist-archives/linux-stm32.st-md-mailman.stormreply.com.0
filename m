Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FEEA7A646
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 17:21:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D08A4C78F85;
	Thu,  3 Apr 2025 15:21:20 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 045EFC78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 15:21:18 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso10734225e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Apr 2025 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743693678; x=1744298478;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LLzRxbLbGYqFEY7hyGVV9DDJqGfYqDcrqrelLGxLjeg=;
 b=zqEsNXvzHRB3LnIYQyEcrkbm0zjxr7JpSi8LYRHbzPzKOL0XH9R9RykuDh7t3Brn54
 kNXZZQCaIN70XzlSj/dP/+8V6s7e1EGOm3EiBJsYRC1gFRSpQuAbqeAz5YkTnbEuDY0m
 PvyGWfkMcAN4FTYk8vimmnjqob5EBWb0E4jSakepCtNt4Cy5DNH3RDEKts0Ls/fT8iwj
 EIqTtTEZVreBPruhlTK1ejVfQmSw4T3juPOz6CN0Rm5qeCTuXAx3B1hbZHKVbkv72h+B
 I5P2KDPxzdTWFpCRMF6Q5M9d8Ka4z4Z1jXg/Eu6Xu7McaYliB02SKVummxLfhi/lrQ+B
 bREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743693678; x=1744298478;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LLzRxbLbGYqFEY7hyGVV9DDJqGfYqDcrqrelLGxLjeg=;
 b=YqZ0QAMlNZXnF+wc+lQ8AB32HTUJbmzWxggFH2mWxZX14XJygedEbPVf0a9aDmjIcK
 4nBn8PpnZr9ttlIkgovj4pikXCrZfO5l9Q/bZ0+TgrLz5Qlo3lSWzWm3c5gnnhjxXuG2
 2g3bOykcSLmx48O5DJfwXhBWzs1eTY2ukSNWO9fLyOzeZFE4qtu9nUXzGL68BjYE3ix6
 KWrA82hZ1p0VqGORcFvKGc8EcD/4Jsv7mKszw4yDteXbFW/bEZItG1aw19uY70FttdqU
 JRGxBPlsjZLfbb3xnSl/MBv8uSAj0Su8KDLoeJ3ofbgPJkjFqk8VO0zFrW5nzBi4UKjg
 RfYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLnRnUjK3oB04SgCzMNpYA2KuiPRstAGlrXnJvVouKQuHRdSLHOA2k6GjdbenjEh1fVw3TSE4VuaGfNg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOnOU9JifF4+/nIy/KtD19MX61kQcR6lHl0zCaZVQXqjI5bqi/
 uMk5oACUc302QonqDJCT6LCxmBV+i6V+GDf6Fy3vPgHURaKif28WLhWWNC2REAs=
X-Gm-Gg: ASbGncvHbnUH7vidjcS3c4UTZfpw47HfmTDaI+Mn9PCNwKLSgEVbFcfe2VC7BJbLkOA
 Nv4z0QzTkRJYmsWE57Ke4aRFWnfOT9MJL2sn27Y6cs6MkOmgtpyfy7bvM3Y0T7PrRIE6NPJ1FNJ
 D8VrDwtUXKqD9W0texpEHb+7VoT7DK9uPclR0rm6W57RnyCu12Y8RPLESCiwQFdVm4R4FqKeE1r
 tSUX/WCeCa0AhpkXxFRfjywlLyRijdeMTqSh1oFOaYEMHKOMlixXZf5wFhSqvohXMsFtxFqJlnA
 CkPGcxpTXUu8QO24vR/hZ61nVQxBczV1HaWwOSABD0xUhChbt8RZc0FZrqVnQMzrtXC9XScV8Pt
 8abKJBtzs
X-Google-Smtp-Source: AGHT+IGw5ghzd9cHyGdFKWQ5WVPa7dVeNteHj1/e+hjpE89/v7AeOKF8SPeYMkbL/YLt+h17xVXsbA==
X-Received: by 2002:a5d:5c84:0:b0:39c:1efd:ed8f with SMTP id
 ffacd0b85a97d-39c1efdedbemr11060254f8f.50.1743693678287; 
 Thu, 03 Apr 2025 08:21:18 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43ec34bbd9csm21302405e9.20.2025.04.03.08.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 08:21:17 -0700 (PDT)
Message-ID: <67daf656-0e08-471d-afce-22ba8f2fa1f2@linaro.org>
Date: Thu, 3 Apr 2025 17:21:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
 <20250402090714.3548055-2-daniel.lezcano@linaro.org>
 <2503deb2-b993-7fd1-adf3-cafa1e7bd2f4@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <2503deb2-b993-7fd1-adf3-cafa1e7bd2f4@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 S32@nxp.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, thomas.fossati@linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, ghennadi.procopciuc@nxp.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: timer: Add NXP System
	Timer Module
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

T24gMDMvMDQvMjAyNSAwODozMywgR2hlbm5hZGkgUHJvY29wY2l1YyB3cm90ZToKPiBPbiA0LzIv
MjAyNSAxMjowNyBQTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gWyAuLi4gXQo+PiArZXhhbXBs
ZXM6Cj4+ICsgIC0gfAo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9hcm0tZ2ljLmg+Cj4+ICsKPj4gKyAgICB0aW1lckA0MDExYzAwMCB7Cj4+ICsgICAg
ICAgIGNvbXBhdGlibGUgPSAibnhwLHMzMmcyLXN0bSI7Cj4+ICsgICAgICAgIHJlZyA9IDwweDQw
MTFjMDAwIDB4MzAwMD47Cj4+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAyNCBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsKPj4gKyAgICAgICAgY2xvY2tzID0gPCZjbGtzIDB4M2I+Owo+PiAr
ICAgIH07Cj4gCj4gVGhlIFMzMkcgcmVmZXJlbmNlIG1hbnVhbCBzcGVjaWZpZXMgdHdvIGNsb2Nr
cyBmb3IgdGhlIFNUTSBtb2R1bGU6IG9uZQo+IGZvciB0aGUgcmVnaXN0ZXJzIGFuZCBhbm90aGVy
IGZvciB0aGUgY291bnRlciBpdHNlbGYuIFNob3VsZG4ndCBib3RoCj4gY2xvY2tzIGJlIHJlcHJl
c2VudGVkIGluIHRoZSBiaW5kaW5ncz8KCkFGQUlDUywgdGhlcmUgYXJlIHR3byBjbG9ja3MgYXMg
ZGVzY3JpYmVkIGluIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUgCnMzMmcyIHBhZ2UgODQzLCBz
ZWN0aW9uIDIzLjcuMyBUaW1lciBtb2R1bGVzLgoKVGhlIG1vZHVsZSBhbmQgdGhlIHJlZ2lzdGVy
IGNsb2NrIGFyZSBmZWQgYnkgdGhlIFhCQVJfRElWM19DTEsgd2hpY2ggaXMgCmFuIHN5c3RlbSBj
bG9jayBhbHdheXMtb24uCgpwYWdlIDE5OTQsIDQwLjUuNCBDbG9ja2luZywgdGhlIGRvY3VtZW50
YXRpb24gc2F5czogIlRoaXMgbW9kdWxlIGhhcyBubyAKY2xvY2tpbmcgY29uc2lkZXJhdGlvbnMu
IgoKIEZyb20gbXkgdW5kZXJzdGFuZGluZywgd2Ugc2hvdWxkIG5vdCBkZXNjcmliZSB0aGUgWEJB
Ul9ESVYzX0NMSyBhcyBpdCAKaXMgYSBzeXN0ZW0gY2xvY2suCgoKLS0gCjxodHRwOi8vd3d3Lmxp
bmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJv
PiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwK
PGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
