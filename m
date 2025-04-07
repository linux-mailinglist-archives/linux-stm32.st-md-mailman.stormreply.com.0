Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F6BA7D634
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 09:37:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6719AC78F94;
	Mon,  7 Apr 2025 07:37:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10065C78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 07:37:57 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so35117765e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 00:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744011477; x=1744616277;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T/iUB0JBxFkjp2l/okcxobSe1sYUcwQcPDba5DDM9oY=;
 b=iSIt/unr4nIjQxAhq9UGEe3V0Sj+YdoeNrvn6bVz9RR220ToG801A7sZwVha68nOmu
 d9OCq2GDIKPywf3DXuzA/OeRu0f2vhRbFptM+CwytpM567R2fj0uLin1TSk3A4td3OMo
 TGNBAFcWltHyDw2GH+aKcncoxkb5pIc6RBESUYFP3+wMbNCRMol+9u5co8rgk0sBUs1b
 NbkiFRzENuE+7ZsNKFwLf9BEl1Y6vwNVWuDNhioXoV6iKIgIFmJi5oklW97dHX6iUos5
 g7WjCdCAPOm+YdofzbDzcvBK3HYyqblClnh8ET05BVyDYTPyh6/h7tAY6ICcueToZ31t
 qTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744011477; x=1744616277;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T/iUB0JBxFkjp2l/okcxobSe1sYUcwQcPDba5DDM9oY=;
 b=KK7IT6HOJ8X/8YZUjRIdWXbfG2GdI24sZtL3u4F+9vA5AEWIIL6/u8zcubFGy+pmTp
 DDUqg0cTLwEVbDb4bqk/9rIfQotmYAm49NoxOLa1OCcu0owidN0o4LXKeb0TEl0Gny/p
 rZafMY1YnURurcI9rtmNt23/0/fvPMsVKDIBU+raEC8y9L6O06tMU8TKvViEkO6dgQCc
 PEutt61i1r0cI7GrRCYh5Zq6xgJ/5hGJ4y1UQqeNz+0etSp2uig1MZAlw201p/j4h4Ap
 aX1VkrqrSaisX4CTYj57lmVlFyuY237kiRy1s1mhVJzc/sG7KVGRojybbnHiVc0GeIC7
 bE0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzZ9hIpN72jUwuy7CNojd1Vbb3vg552jgOfm1T27dNMor2g2BFPc3bUThrH2+u9gNfB0jlcvYuI/d8Pg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwRBH+2h7apMf46lys9inhKdMPDG+AcjcWPpDP68WgBB+vdi22a
 +B8FKP2c6w+icWgxT5FGxtldFh2rWB81bnYZIdGK0n3Z7EEn33NLkJi2txzeeOE=
X-Gm-Gg: ASbGncuQjkeCFZfyTRdmEDSlJrBUmQtJoDucma391jTgvP4ENAu19dbc77SY7qErwYI
 A+6+h44vydW08NaBVcUVfLa1P6F2Pw73m6g7vUxkyUWMSECGcQS4AChe5XxZ/L4nUv832G+ZnFf
 QAX5yIPBGkaO7vdAGpGJTm8kIOg8bdSmlftHeke3UMcGTpBG27TGs2ltyoVDqpWS15oFlbY9ft+
 XcrwPKUhwPpk/wSwTeQdq11zf5zz5NVDv2KqWEUgVhfiegG1DgSChHZZMBzZwbdK06S/NzUUGgk
 VFUGMsMz01hUvsyUGVzEEM3vDASm+22Bi1jKAzSLgiSVZuGJxrRCf8G1SsrVIS4hEeOAGJvOqg7
 IEkm6UHee
X-Google-Smtp-Source: AGHT+IEDc/bRsFcizrk4e4TwMWtU8c1AL1TwXJ0IcJRIR1rjn42XqoKfWILEntbQHzwjOQZAQgc+Vg==
X-Received: by 2002:a05:600c:1e27:b0:43c:fc04:6d35 with SMTP id
 5b1f17b1804b1-43ee0615d04mr74241945e9.4.1744011477415; 
 Mon, 07 Apr 2025 00:37:57 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43ec1692ba4sm123138995e9.16.2025.04.07.00.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 00:37:56 -0700 (PDT)
Message-ID: <c14389a1-1904-450f-98c5-a55351518ed7@linaro.org>
Date: Mon, 7 Apr 2025 09:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
 <20250402090714.3548055-2-daniel.lezcano@linaro.org>
 <2503deb2-b993-7fd1-adf3-cafa1e7bd2f4@oss.nxp.com>
 <67daf656-0e08-471d-afce-22ba8f2fa1f2@linaro.org>
Content-Language: en-US
In-Reply-To: <67daf656-0e08-471d-afce-22ba8f2fa1f2@linaro.org>
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

T24gMDMvMDQvMjAyNSAxNzoyMSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gT24gMDMvMDQvMjAy
NSAwODozMywgR2hlbm5hZGkgUHJvY29wY2l1YyB3cm90ZToKPj4gT24gNC8yLzIwMjUgMTI6MDcg
UE0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBbIC4uLiBdCj4+PiArZXhhbXBsZXM6Cj4+PiAr
wqAgLSB8Cj4+PiArwqDCoMKgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9hcm0tZ2ljLmg+Cj4+PiArCj4+PiArwqDCoMKgIHRpbWVyQDQwMTFjMDAwIHsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gIm54cCxzMzJnMi1zdG0iOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJlZyA9IDwweDQwMTFjMDAwIDB4MzAwMD47Cj4+PiArwqDCoMKgwqDCoMKgwqAgaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDI0IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGNsb2NrcyA9IDwmY2xrcyAweDNiPjsKPj4+ICvCoMKgwqAgfTsKPj4KPj4gVGhlIFMz
MkcgcmVmZXJlbmNlIG1hbnVhbCBzcGVjaWZpZXMgdHdvIGNsb2NrcyBmb3IgdGhlIFNUTSBtb2R1
bGU6IG9uZQo+PiBmb3IgdGhlIHJlZ2lzdGVycyBhbmQgYW5vdGhlciBmb3IgdGhlIGNvdW50ZXIg
aXRzZWxmLiBTaG91bGRuJ3QgYm90aAo+PiBjbG9ja3MgYmUgcmVwcmVzZW50ZWQgaW4gdGhlIGJp
bmRpbmdzPwo+IAo+IEFGQUlDUywgdGhlcmUgYXJlIHR3byBjbG9ja3MgYXMgZGVzY3JpYmVkIGlu
IHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUgCj4gczMyZzIgcGFnZSA4NDMsIHNlY3Rpb24gMjMu
Ny4zIFRpbWVyIG1vZHVsZXMuCj4gCj4gVGhlIG1vZHVsZSBhbmQgdGhlIHJlZ2lzdGVyIGNsb2Nr
IGFyZSBmZWQgYnkgdGhlIFhCQVJfRElWM19DTEsgd2hpY2ggaXMgCj4gYW4gc3lzdGVtIGNsb2Nr
IGFsd2F5cy1vbi4KPiAKPiBwYWdlIDE5OTQsIDQwLjUuNCBDbG9ja2luZywgdGhlIGRvY3VtZW50
YXRpb24gc2F5czogIlRoaXMgbW9kdWxlIGhhcyBubyAKPiBjbG9ja2luZyBjb25zaWRlcmF0aW9u
cy4iCj4gCj4gIEZyb20gbXkgdW5kZXJzdGFuZGluZywgd2Ugc2hvdWxkIG5vdCBkZXNjcmliZSB0
aGUgWEJBUl9ESVYzX0NMSyBhcyBpdCAKPiBpcyBhIHN5c3RlbSBjbG9jay4KCkNhbiB5b3UgY2xh
cmlmeSBmb3IgdGhlIFNUTSBpZiB5b3Ugc3RpbGwgd2FudCB0byBjaGFuZ2UgdGhlIGJpbmRpbmcg
PwoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFj
ZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMh
L2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cv
PiBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
