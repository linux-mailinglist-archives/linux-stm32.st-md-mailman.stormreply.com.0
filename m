Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C09D4178
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6342BC7A831;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F843C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 10:36:32 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-71e5a62031aso618352b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2024 02:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730975790; x=1731580590;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xC4jScz5PMTA20yKpGgSaZvcBSA6x4Yz2EVtRJnnFPg=;
 b=nIdYL132newV9TvrREba9LNXnhm274/8GcKRD0VVT4vW8VOAOwXJBhmL9ViiWVzaRK
 BAM9gpQMepWxKhK8pOHbCL/Ue4khzrjTPEUjl5DQjtuNwdOg80YXZK+E7pnB/4CZDNMY
 6t5EF5UXghBwPKmq+fjjcAed2Y/MMsjlBE/B3XyMY3XJwdDe7zauB7a3ex/di0qRIAmQ
 eOGxUqdIBOf53ZqWx29XKg8hGGWACJd6mwt3efTEihX2LTSvPJWyh5IKcQvXu+lVRCCa
 d0Q9vhinoQafoEAXtVEYLAH2SwVGwaltRwsoeYU6jvXcTzp3OKtYdNynbhdnc/m1P9dP
 3m8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730975790; x=1731580590;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xC4jScz5PMTA20yKpGgSaZvcBSA6x4Yz2EVtRJnnFPg=;
 b=CPFtGvTAOjnPzzQRW7mi4T/r72RS02iGcaAqdqxqSoJCXf1hml5Lo7+bYYLXi9jlKl
 oBESG6hOz1AgFsZrYyhCn4Gm7RN47lM/lsS+IKNpNxflbcXJ/eO+hJ66nwyWZO5wT7J8
 gFV5Xrb84D++N6RAIXrlXpgt56HcKIZa1NhEaSbDT1q4u1sGlwEUV4mgnpPZwZd/iwjo
 UxqwKLXbFynGYi+3gQcoao4xN0rMI06pFLldd0M4ipGay510eIWQ/RCStjySh4ZvPpvo
 bKYHJ2w7soL3SbpvUJi++PwJo/u2j2v73PkngYOHqgpiZf9zC0cnIzIss3O3MtLj+c6z
 sZYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIGHmfrBpgRqujM1xO0yBFnKxrem7QuAMr0ampOeDSUJQwGlO9glwioEEO0vgS9hKHS4xvq+MlTBaUdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1fkJ3BwCxQiBjsHsTyCEuXXt7Hb2nUWc6/wMC8WYEKBnyGH3n
 pxtSmOkCLHtsLuo8A7fY4h09RN11Ceus6ud8odBx0g2e93W1N+gq
X-Google-Smtp-Source: AGHT+IFEcmPOqn+X7HeywXdO6/sEgP5tjET/8PEbokkUZb1iOlKZDIKxcXvkvkXx3PWm7y2eChH7tQ==
X-Received: by 2002:a05:6a00:2284:b0:71e:4786:98ee with SMTP id
 d2e1a72fcca58-720c99b7befmr31801669b3a.21.1730975790564; 
 Thu, 07 Nov 2024 02:36:30 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724078a7d9esm1209196b3a.66.2024.11.07.02.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 02:36:30 -0800 (PST)
Message-ID: <99fa8255-12b5-4a54-acfe-cc0fbbba9c0e@gmail.com>
Date: Thu, 7 Nov 2024 18:36:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-4-a0987203069@gmail.com>
 <4c018927-b6ac-4414-9dde-487453350cca@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4c018927-b6ac-4414-9dde-487453350cca@lunn.ch>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
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

RGVhciBBbmRyZXcsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgpBbmRyZXcgTHVubiDmlrwg
MTEvNy8yMDI0IDI6MjMgQU0g5a+r6YGTOgo+PiArc3RydWN0IG52dF9wcml2X2RhdGEgewo+PiAr
CXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7Cj4+ICsJaW50IGlkOwo+PiArCXN0cnVjdCBy
ZWdtYXAgKnJlZ21hcDsKPj4gKwlwaHlfaW50ZXJmYWNlX3QgcGh5X21vZGU7Cj4gcGh5X21vZGUg
ZG9lcyBub3Qgc2VlbSB0byBiZSB1c2VkIG91dHNpZGUgb2YgbnV2b3Rvbl9nbWFjX3NldHVwKCku
IEluCj4gZmFjdCBub3RoaW5nIGluIG52dF9wcml2X2RhdGEgaXMgdXNlZCBvdXRzaWRlIG9mCj4g
bnV2b3Rvbl9nbWFjX3NldHVwLiBTbyBpdCBsb29rcyBsaWtlIHlvdSBjYW4gcmVtb3ZlIGl0LgpJ
IHdpbGwgcmVtb3ZlIGl0Lgo+PiArCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9mX25v
ZGUsICJ0eF9kZWxheSIsICZ0eF9kZWxheSkpIHsKPj4gKwkJZGV2X2luZm8oZGV2LCAiU2V0IFRY
IGRlbGF5KDB4MCkuXG4iKTsKPj4gKwkJdHhfZGVsYXkgPSAweDA7Cj4+ICsJfSBlbHNlIHsKPj4g
KwkJZGV2X2luZm8oZGV2LCAiU2V0IFRYIGRlbGF5KDB4JXgpLlxuIiwgdHhfZGVsYXkpOwo+IFBs
ZWFzZSBkb24ndCBzcGFtIHRoZSBsb2dzLiBkZXZfZGJnKCksIG9yIG5vIG1lc3NhZ2UgYXQgYWxs
Lgo+Cj4gCUFuZHJldwpJIHdpbGwgZml4IGl0LgoKVGhhbmtzIQoKQlIsCgpKb2V5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
