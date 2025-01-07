Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF31A03806
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 07:36:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97C3AC78018;
	Tue,  7 Jan 2025 06:36:35 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69527C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 06:36:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-21661be2c2dso201016875ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jan 2025 22:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736231786; x=1736836586;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kng/mpbUzhaJx0h/7Fasw6w2qS0oY3rIDnnEx7pNUzQ=;
 b=bGFoR9ju98wnP+vCjGo1q3oxgqzQUDBjaP45ToNTF/53O1GnSx7xft9N9DPr4X0r1J
 QlHtOz8dRG1v6W3Cm9C6Y8wRtM2gUaNwdXJ+GvM95DtVjdn17xwIRrHXq9uHIDg1wje+
 fJeknmcHv9NBtbxIfWWZETNEvQxdcIXdubXzhz+S7+sfHe4vVN5ruVCvsLSUCl85b0Po
 T/lQQW6L54/0lxAWHTaUAWu0cxisFiKP4ylDb+DWOh8O33YfbMnOFgKgQBlZnKu3WffP
 aKEphMFk9Bt0mNCLlBalFp/d5jwGv2UxWZfmyq2ZbzKgkOnqflOfWcWcVePRgDHfyvCt
 PT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736231786; x=1736836586;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kng/mpbUzhaJx0h/7Fasw6w2qS0oY3rIDnnEx7pNUzQ=;
 b=duL7f4M2nfZj0yEd3R8IYa/kUNSdSwvdD5jZ4VoQHgDFFuWiehXmj9gQjVfXV4qSAl
 y0TXwNyxfNjSpOG1GYuIXiaLUIXfOA5yZqs16QBJA9vJObG3sZ6WoEijuWvZsln8vr/O
 Ffi3hioFDb9s02stRTz3VVjFxIsYSozSWHkUIP/s1rRCTlwRvFCVvYpCfhjbRsJFX3tg
 l7fcdypKaRZlXfhmXJ3eq8PGdDmFKLEGF0GFomGW1bn/gD1/JC7M4y1F7sP1bDPj6vhv
 QJ3QazJ7w5fi1kKd3YvCf5dNDrVXYsdu0LPPUVRpHd0hSQXvUXcUWFA+sb+7N/6E/49F
 nqVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkGIQ7t3uzJa5EdCipB8nP7jzpPn9j0oSt/CVTke3t3pbNoRxKIMmI1i/o547qGnrd4f4DEC54Qwabbg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzhQnfbIBfVaUmCEfYaY9Fnpvv8Dg//mLacqF9JNKUISL2Vea8i
 AZyKHzKNFku4JzJB3YvYIOMl52PDNvPlb0vMO+9iFDeZWcC3kGj0
X-Gm-Gg: ASbGncv2HkKgf4vhfz3vApKlegFvIATxQMvlQ40/+kYErWY3Jy7t5oaqYa7AjdF14YP
 3JDqTn3SzgW7X3Qq1qv2XaXQ4tM53Ci4CouY+0Nj51OQK3xR9/XmjSb/Rr56gGwewje4dGO/Ci+
 RgOONQq7ozccxU8Ke+o6D5EKauMf+tmR/otuvB0uFMLiXWuX7EYPmW0etHW/ZER80GNFpUoLJ7J
 qwaRXi8EgPWNrxEr/mN18/3zHTArwXiwPkEzrs1xzC/sIpUoeJfW4IrOOLYeylC7SlUDslN0GN1
 VPWQBh8C+W6q5M8uC7YRyryWRZYZBgElwr0=
X-Google-Smtp-Source: AGHT+IFB3swUN2iLMUEOpHvMus0FiubXQryQDXtAgLSPcX+ECwaEuxj3DZQ/Bf/+X66C3yI9GBLI7g==
X-Received: by 2002:a17:903:94e:b0:212:68e2:6c81 with SMTP id
 d9443c01a7336-219e6ea0223mr977864255ad.24.1736231785959; 
 Mon, 06 Jan 2025 22:36:25 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a739b423fsm23758445ad.198.2025.01.06.22.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 22:36:25 -0800 (PST)
Message-ID: <83c11616-ac3a-48b8-a513-ca000ff9d48e@gmail.com>
Date: Tue, 7 Jan 2025 14:36:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-2-a0987203069@gmail.com>
 <173592330334.2414402.4730979254460270593.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <173592330334.2414402.4730979254460270593.robh@kernel.org>
Cc: richardcochran@gmail.com, devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 yclu4@nuvoton.com, davem@davemloft.net, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, schung@nuvoton.com,
 peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 1/3] dt-bindings: net:
 nuvoton: Add schema for Nuvoton MA35 family GMAC
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

ClJvYiBIZXJyaW5nIChBcm0pIOaWvCAxLzQvMjAyNSAxMjo1NSBBTSDlr6vpgZM6Cj4gUGxlYXNl
IGFkZCBBY2tlZC1ieS9SZXZpZXdlZC1ieSB0YWdzIHdoZW4gcG9zdGluZyBuZXcgdmVyc2lvbnMu
IEhvd2V2ZXIsCj4gdGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzKm9ubHkqIHRvIGFk
ZCB0aGUgdGFncy4gVGhlIHVwc3RyZWFtCj4gbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIGFj
a3MgcmVjZWl2ZWQgb24gdGhlIHZlcnNpb24gdGhleSBhcHBseS4KCkdvdCBpdC4gVGhhbmsgeW91
IGZvciB0aGUgcmVtaW5kZXIu8J+ZggoKSm9leQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
