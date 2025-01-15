Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 833EEA12499
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 14:17:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36AE7C78F7D;
	Wed, 15 Jan 2025 13:17:11 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5E11C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 11:53:07 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3003c0c43c0so63807691fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 03:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736941987; x=1737546787;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
 b=yzXogabEIx3mVupGFXyRz5lBhzpE+d+2OOhkocbpjGG2giweXcnbDNZygnzLYtaEPx
 etrAMDBgxHWnman7Ds/BQOI75cYqfjQygYA80+P9hdu+X+T0vzzD2vpuRwC9Shg7zr9W
 aL0f8wZvcONNmrHlbesOwpPkYxYSRNoYnF5ADsCFLP/XJuZqYBV87ZiCBpu5jodZresZ
 SlFSWvqIzQB3+nDy5YrU8q82BD8Iyx/LroOReSeIIPta/P2EraUkan96tsA5pNlWZk4Q
 EDC0aGqKLT82rtleQPlBYR9cFOGS7dKUYl/WmmEbhmMmXf/XcGbjF1RsakVjKXOesQ0K
 oaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736941987; x=1737546787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
 b=jwjKsg7aiYb/WEd9+BfSeVj8oDYQSe++Ne95QkxGJ0uBvidJWO/d+6wnvpME9CDbTS
 1yxTz9MrBKXBZe4FewsBMX9hTgk9n2ZVp4dxfK0hcy3RHPC1ANauDZukiClgTt8b6F4M
 UWxpMIoAhX1XFLEI/fNZJYti3yPc42q1N4qrOQYoTyvx3ZR1M/QwMvVXHZK45TRPna+Q
 RnOu6egwQIezBggVV4N8iHkXPRZdR5pEGO5Jkv7b1Cr6kstfpgKcSA+Cov/rHozaxTNy
 XvfwUkDOTqGcBpC8jViU/IsmferuM62hXiQ0vC5rsaHqEnaMlinPz+Q84x4MuFF8gQ0Y
 6LUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7kgUghNyUhVUzukjg5mIzri+0qxPbCnSBT1CdKBCy7B5PVX+PJ+vas1y5bQEt3K/T3pzi3o2Idb1CHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+LLnQWkgu+rWeW18vIuYCND9MaRJR7qDHqhvZMVMo9Mm7U7Q8
 j9qkTGeuHrnE5avFambP0+VMjjNNJJto48ip+AeoFe/GDZYAQ1uMSZCPHKduFq43d4BDRZjIaDL
 XViXn41VDIxF8eYJOiLKdFe9CNG3/NTg6gVb+zw==
X-Gm-Gg: ASbGncvTNJGoAD5AppHS9qbQpu8ROWJwbcBMv9fvWYWVIce/OkApyjEw70BKXjeIXGj
 m1c0j7npjx+ANPNr6J0udbcPC/861CTkgl64Maw==
X-Google-Smtp-Source: AGHT+IGBlXrCMYgYKLgZmDqCoCkzk9zXGTEbjg0n3d9TmJW2cjKGPCuhqJcY6YuLhBfY419BlW8MYE5VzPIfrs+M4Z4=
X-Received: by 2002:a05:6512:ba5:b0:542:a73d:a39c with SMTP id
 2adb3069b0e04-542a73da516mr2355986e87.49.1736941987038; Wed, 15 Jan 2025
 03:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:52:55 +0100
X-Gm-Features: AbW1kvZ-ZJDljU7xDZeyhECu0xIb2cb416ZbrOmY5XJEA2ldhLke2kjbohdh8UU
Message-ID: <CACRpkdYPSprYwCz-Qk8a0CqEeec=HVV1AwgVbRDyv=Vk323wcg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Wed, 15 Jan 2025 13:17:09 +0000
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-arm-msm@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: Use str_enable_disable-like
	helpers
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgOTozNuKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFJlcGxhY2UgdGVybmFyeSAo
Y29uZGl0aW9uID8gImVuYWJsZSIgOiAiZGlzYWJsZSIpIHN5bnRheCB3aXRoIGhlbHBlcnMKPiBm
cm9tIHN0cmluZ19jaG9pY2VzLmggYmVjYXVzZToKPiAxLiBTaW1wbGUgZnVuY3Rpb24gY2FsbCB3
aXRoIG9uZSBhcmd1bWVudCBpcyBlYXNpZXIgdG8gcmVhZC4gIFRlcm5hcnkKPiAgICBvcGVyYXRv
ciBoYXMgdGhyZWUgYXJndW1lbnRzIGFuZCB3aXRoIHdyYXBwaW5nIG1pZ2h0IGxlYWQgdG8gcXVp
dGUKPiAgICBsb25nIGNvZGUuCj4gMi4gSXMgc2xpZ2h0bHkgc2hvcnRlciB0aHVzIGFsc28gZWFz
aWVyIHRvIHJlYWQuCj4gMy4gSXQgYnJpbmdzIHVuaWZvcm1pdHkgaW4gdGhlIHRleHQgLSBzYW1l
IHN0cmluZy4KPiA0LiBBbGxvd3MgZGVkdXBpbmcgYnkgdGhlIGxpbmtlciwgd2hpY2ggcmVzdWx0
cyBpbiBhIHNtYWxsZXIgYmluYXJ5Cj4gICAgZmlsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KClBhdGNoIGFw
cGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
