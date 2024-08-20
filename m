Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A201195807C
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 10:05:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E637C6DD66;
	Tue, 20 Aug 2024 08:05:46 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C303CC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 08:05:39 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so40822035e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724141139; x=1724745939;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YUrBtVd9BLV5NodOKrgO2/cphE/4UyWw8eXELeGJ9WA=;
 b=QMTMpPSkOuRH9nQqd6ezwpDLYD3mQOmawvxHaygrxu+YPDxk2rN+twxdfpzgSqFDHi
 2SazEAfKJiRgc1Ip2d2WFkf0zH7EVQwzxdQT5KRiSGfbMfwvJnvdf2d1cS5HzRJ6PynZ
 hOjJO4SwoOpm2edkGsgzzKqewJ0a+/KPkhSsFSRlOIFQuLM1lYTLx2d1uhdrJCuRLL0T
 nO6X7hnaNSmOfC3Be1prIRNvtK30ZSDIhr05IklUZpjhY1UqiQQsNjnaI7/8GL3gdLyZ
 HpNkEFHIN6vFYCSVvutJ16NjnT+m+s+GYPvuCg9fvtksizaKmnyZ9QXY529jgri4Hmud
 Knqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724141139; x=1724745939;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YUrBtVd9BLV5NodOKrgO2/cphE/4UyWw8eXELeGJ9WA=;
 b=lR9CHpofOyluxEBUILLlvNePX/o8vpCrRH861Ey8S+Oz/Qzy/edax4txauj7wi7BL1
 jKK0+fE8JwYKB7HoRxwIsFLGnitQkBWqlweFt9do7BlFyEFs/6i+PwGllN5AAaYycLFM
 ko3Tctc5Xx68iQ/WZnVrxmf+05htkP4ioWmrdkfOQap2emv7By9ByXLLozDIoHf7w8mM
 dahlp3+Hvp6crDv9DAH1IoUgLVsqLRBynvKxt2CIG0tcyr2YrBf4BfidIGSnEFmKoZ+T
 PPlvvCSmSB49OuLnMkqEMdClVOHtXifCk4kTRd8VwDtazGKQWfC1aqLAtBI1wBT8h+/w
 ywFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2j5uRQqQzal0FSTHvZvFJATSECEKpNIX4CEG0et1sVSEPTQNq3UIa8rji0Jia7CpoYm5r9YfbXpncaK+z+P37dgG7rZUZX9NZFIViEbVWNu8e8COLsoou
X-Gm-Message-State: AOJu0YwQ/zJjOL3hKZj8cB6oePWYlRo6pDOmZKe9A1RU/L7afo1K8FfR
 LGPJr1dbyy8xNAxeL3vIDHnXo0mQj84uK/o1Mx7T0Qrbqj464dqnMnSlAflXCfc=
X-Google-Smtp-Source: AGHT+IEeE1ef7g/ycQmCjSQj8MBpZAH2kJ9KOcQsu0ftfibRwdYkeus8X/03YczgKnaOrugc4fW/bg==
X-Received: by 2002:a05:600c:138a:b0:428:f41:d467 with SMTP id
 5b1f17b1804b1-429ed78900cmr93821075e9.10.1724141138716; 
 Tue, 20 Aug 2024 01:05:38 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-429eeadfafbsm131877645e9.47.2024.08.20.01.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:05:38 -0700 (PDT)
Message-ID: <c1722b7e-9378-454d-84f6-3f9399224cf8@linaro.org>
Date: Tue, 20 Aug 2024 10:05:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240716-thermal-v4-0-947b327e165c@gmail.com>
 <85eedb28-c02f-40ef-9d65-e8689b3f7dbd@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <85eedb28-c02f-40ef-9d65-e8689b3f7dbd@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/2] Add thermal management support for
	STi platform
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

T24gMTkvMDgvMjAyNCAyMjoyMSwgUmFwaGHDq2wgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4gSGVsbG8s
Cj4gCj4gTGUgMTYvMDcvMjAyNCDDoCAxOTozNCwgUmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3Jp
dMKgOgo+PiBUaGlzIHBhdGNoIHNlcmllcyBlbmhhbmNlcyB0aGUgc3RfdGhlcm1hbCBkcml2ZXIg
aW4gb3JkZXIgdG8gZW5hYmxlCj4+IHN1cHBvcnQgZm9yIHRoZXJtYWwgem9uZXMuIFRoZSBjaGFu
Z2VzIGluY2x1ZGU6Cj4+Cj4+IDEuIFJlcGxhY2UgZGVwcmVjYXRlZCBQTSBydW50aW1lIG1hY3Jv
cyB3aXRoIHRoZWlyIHVwZGF0ZWQgY291bnRlcnBhcnRzLgo+PiAyLiBJbXBsZW1lbnRpbmcgZGV2
bV8qIGJhc2VkIHRoZXJtYWwgb2Ygem9uZSBmdW5jdGlvbnMgd2l0aGluIHRoZSBkcml2ZXIuCj4+
IDMuIFVwZGF0aW5nIHRoZSBzdGloNDE4IGRldmljZS10cmVlLgo+Pgo+PiBUaGUgZGV2aWNlLXRy
ZWUgcGF0Y2ggZGVwZW5kcyBvbiBhbiBlYXJsaWVyIHBhdGNoIHNlbnQgdG8gdGhlIG1haWxpbmcK
Pj4gbGlzdCBbMV0uCj4+Cj4+IEFzIGl0IGlzIGN1cnJlbnRseSBpbXBsZW1lbnRlZCwgYW4gYWxl
cnQgdGhyZXNob2xkIG9mIDg1wrBDIGlzIHNldCB0bwo+PiB0cmlnZ2VyIHRoZSBDUFUgdGhyb3R0
bGluZywgYW5kIHdoZW4gdGhlIHRlbXBlcmF0dXJlIGV4Y2VlZHMgdGhlCj4+IGNyaXRpY2FsIHRo
cmVzaG9sZCBvZiA5NcKwQywgdGhlIHN5c3RlbSBzaHV0cyBkb3duLiBUaGVyZSBpcyBmb3Igbm93
IG5vCj4+IGFjdGl2ZSBjb29saW5nIGRldmljZSBvbiB0aGUgcGxhdGZvcm0sIHdoaWNoIGV4cGxh
aW5zIHRoZSB1c2Ugb2YgdGhlCj4+IGNwdWZyZXEgZnJhbWV3b3JrLgo+Pgo+PiBbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDMyMC10aGVybWFsLSAKPj4gdjMtMi03MDAyOTY2
OTRjNGFAZ21haWwuY29tCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFpcy1Qb3Ug
PHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjQ6Cj4+IC0gWzIv
Ml0gb3B0aW1pemUgZGVwZW5kZW5jaWVzCj4+IC0gWzIvMl0gZG8gbm90IHJldHVybiBkZXZtXyog
ZXhpdCBjb2RlCj4+IC0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0
MDcxNC10aGVybWFsLSAKPj4gdjMtMC04OGYyNDg5ZWY3ZDVAZ21haWwuY29tCj4gCj4gR2VudGxl
IHBpbmcgb24gdGhpcyBzZXJpZSA6KQo+IAo+IFRoYW5rcyBmb3IgeW91ciB0aW1lLAoKQXBwbGll
ZCwgdGhhbmtzCgpUaGFua3MgZm9yIHRoZSBwYXRjaCAyLzIgOykKCi0tIAo8aHR0cDovL3d3dy5s
aW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFy
bz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8
CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
