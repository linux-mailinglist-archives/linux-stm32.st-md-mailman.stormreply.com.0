Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CEFA0570F
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 10:38:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B6DC78030;
	Wed,  8 Jan 2025 09:38:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BD2EC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 09:38:44 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3862d161947so7820451f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2025 01:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736329124; x=1736933924;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mDL559tBrr/c+O7uNT1qWo/LHQ82r4NDbguV4lcJTVs=;
 b=aeQcAVDS1wLmlIc6Y7zm7KPsRvM4rt3bdCfPHs7litangP40vqTOfA1+iFo2QEmlXI
 i83lWNlTPuS/csoNnxtoaSRd0TbYrt0vsqtdFXCFjDtaJ8mSTeD70IfKJbpzQU2EY04j
 jx9c65U9Yk5p6YXIOn7/BxHVsrXqSCgKSFApcJIItl4F6uUULCB2c5kqi2OAmohAnpKe
 UiK9kBKjlRRgoIXDeaIBFaZu9WxDJW7dnKNXQBYajdUb5bVaCF+3QjO7VjO35lNQE0Z3
 7kfl7rY56USKpaetwYLm6nHXq5kB0AAVMPSBK5URH8WqxF6A/HeJZDceuA1b4y/dHYSQ
 J+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736329124; x=1736933924;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mDL559tBrr/c+O7uNT1qWo/LHQ82r4NDbguV4lcJTVs=;
 b=KM6PNhrCC2fjBCz8LMjEItH0tvacYjO2NLNReW1+ldKb0gQZq/nFGDC+DZsCWayFtU
 Ytow/qSAV4rJrQ9K8lFQD3VPAqgtyprdKrTX1QguYPl2qNdPnnryB1FEHgJmJz7cysOw
 cWvcmVSMQDDLFnNCSF6/TKxxC4DRrJkMewwqKx3AFxGR3mDkyUhy20OmzinNZ0yuLwd1
 YkxaIZo4deGakfZxTdyCVrKr7l2adY+rHLAH9c8IS/kBKUuFoH8JO6nBTGKgU6F2KjDN
 i8K7CxupPlTvM4rWixn3JgVRq2gdEmbUnil42N7UO4Y2nXjmOEcCSoqKH3qreMHybO33
 72bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrJsflgoS82eQyCnHPgaEI0VMnnGtpUtGk6efjanGjX2wzAWtviUSV9nati4teBsZyZfUOJ7HmOD/BPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxt+nKzoJYdmKT1uTW2R5Kfvu9hM9p2DtHGhK6yisr18IdcpbPI
 AI7wVtuwhSUgWbLMtygRqRZxzs6xj0aUI4v6CnwFjGrAvGJ4zXY/qc0zE/PfXrg=
X-Gm-Gg: ASbGnct17gVkuc1olnaiv7jMn6XcVUTB9oWfLwisFb9lQB4Dc9vZ9uT5CzMhhAqyRJv
 UEUbHt4vBjFO/1PFdXP/8gO3Qkr0EUv5vZ04JT69HSh09s8bjFv9p4FLtLO0vLmKXw3V2QzQRhm
 iI+qIJZggZIfXzzfBScwakyp946KS2jeN6ctpptAmaCM1h5IDT+hpkWmbnv9Kz65uANrmVegofq
 boloIq7on86GFDbhj+t9VdiTwEUh9fEZgid+fxwU5SndFCMnjvdgadAGnTQwGLHCFffDMQIzE72
 Ip99NQHhkNWFaL3Ewc3s
X-Google-Smtp-Source: AGHT+IEYud8HXrnnBRfQKSjaBRvM+YCl9Bp382tGy2B0NHlzlfFxJe7Ru+DWxpOuAvFe6cE/t2KRgA==
X-Received: by 2002:a05:6000:18a3:b0:385:f0dc:c9fd with SMTP id
 ffacd0b85a97d-38a8730dcf2mr1495919f8f.27.1736329123722; 
 Wed, 08 Jan 2025 01:38:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a636asm53864908f8f.88.2025.01.08.01.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 01:38:43 -0800 (PST)
Message-ID: <71aceba7-d610-4550-a8a8-352c8dd4b44f@linaro.org>
Date: Wed, 8 Jan 2025 10:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: Correct indentation
 and style in DTS example
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

T24gMDcvMDEvMjAyNSAxNDoxMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBEVFMgZXhh
bXBsZSBpbiB0aGUgYmluZGluZ3Mgc2hvdWxkIGJlIGluZGVudGVkIHdpdGggMi0gb3IgNC1zcGFj
ZXMgYW5kCj4gYWxpZ25lZCB3aXRoIG9wZW5pbmcgJy0gfCcsIHNvIGNvcnJlY3QgYW55IGRpZmZl
cmVuY2VzIGxpa2UgMy1zcGFjZXMgb3IKPiBtaXh0dXJlcyAyLSBhbmQgNC1zcGFjZXMgaW4gb25l
IGJpbmRpbmcuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGhlcmUsIGJ1dCBzYXZlcyBzb21l
IGNvbW1lbnRzIGR1cmluZyByZXZpZXdzIG9mCj4gbmV3IHBhdGNoZXMgYnVpbHQgb24gZXhpc3Rp
bmcgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gLS0tCgpBcHBsaWVkLCB0aGFua3MKCi0tIAo8aHR0
cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3Bh
Z2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4g
VHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
