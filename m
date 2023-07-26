Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64726763745
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 15:15:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BE2BC6B45C;
	Wed, 26 Jul 2023 13:15:34 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72F56C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 13:15:33 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-99bcc0adab4so70851066b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 06:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690377333; x=1690982133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xxpwGdqfKpW+2bA8L4L3lh4iGcowSXsRVpwai0mk4fQ=;
 b=aBmywB8kJps6NL8kYvNQkYJixI+qt0vHUmnmDQL+JaHi33F/2lIJLWXRTW3t4o7Mlg
 WrZHD3nyD/VyY+S65kqDZHPdUpACQQ8+BmX+U2PHnDrXJf53acmFV/x4JCy690s4zc2Y
 FYMegG8v2565mbDeZbI+3sPoFAg7DZSiGauJTCuhHbG+zmA0iCkRf1tEhQ5U/dyUOal5
 +kx9DKbzGtWh4Jg8uwEE30I7NPXDCyQQnLrmaIB1tMw+ZpvqNTMw8zKC6iDUagMHBrDZ
 OUaGlbtQGbQFid4ezBHNIomlTBjv4/DghU5y/GAhxkiATl+b6cycISfJwr162uJLLuSo
 l94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377333; x=1690982133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xxpwGdqfKpW+2bA8L4L3lh4iGcowSXsRVpwai0mk4fQ=;
 b=d63V3GuWTrR14Ms1ovC7Nw0ajSo9PYGXhCVPkc5TmqcsxlK+wHJSKD4Hlpe4cVkyxS
 HdOenQdoO+JODh7xdRkcP0w37BbrWKYNQ8n7HfLiC8Cfr/oxq08hdImdjWRWuil4PqrB
 FKwmtAHFWaaiXfOi1IMR4BrL+T1uYZf36fpC+1MINwCcq17o2BDywH7bZjQhARoD1a48
 DczI4fHugDB8xYeG5ui5Df9mt+GDOQieBIYb58XBhfX1RegLWPhYpRFnqmUjrf0lnIWk
 NLrvrdPJwvbdr7MtQeCYDrHBwdsTEKRfiASxvSG2JOYvPOK51Xg2zUxMl+G0oYzgfOd/
 F6Iw==
X-Gm-Message-State: ABy/qLYe8TSpQzJAwq2Uj+EUq341PB27KQ7J0qBlDIUw53VQ2x2y2ayz
 /Ak3WM4YpoOGokApqHptwFzTDQ==
X-Google-Smtp-Source: APBJJlFMhteteZfyviZtv4MyvkzBxODZxA8tpAKbuYijpc64a+D7iboNckbTfSv3dVIDPN6HQHdc/w==
X-Received: by 2002:a17:906:64cc:b0:994:539d:f97f with SMTP id
 p12-20020a17090664cc00b00994539df97fmr1726109ejn.37.1690377332545; 
 Wed, 26 Jul 2023 06:15:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a1709064e0900b009886aaeb722sm9518979eju.137.2023.07.26.06.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 06:15:31 -0700 (PDT)
Message-ID: <453c362a-c9bf-1cd4-187c-8916ed406c64@linaro.org>
Date: Wed, 26 Jul 2023 15:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
 <20230726070322.103871-3-krzysztof.kozlowski@linaro.org>
 <CAOMZO5C1JN7w+LhK-J0_ttKVopyeRq6VmCpAHujN_tGPMobotA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAOMZO5C1JN7w+LhK-J0_ttKVopyeRq6VmCpAHujN_tGPMobotA@mail.gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/8] AMR: dts: imx28-m28evk: populate
	fixed regulators
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

T24gMjYvMDcvMjAyMyAxNTowOCwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBQYXRjaGVzIDEsIDIs
IDMsIGFuZCA0IGhhdmUgYSB0eXBvIGluIHRoZSBTdWJqZWN0OiBzL0FNUi9BUk0uCj4gCj4gT24g
V2VkLCBKdWwgMjYsIDIwMjMgYXQgNDowM+KAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPiA8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gRml4ZWQgcmVndWxhdG9y
cyBwdXQgdW5kZXIgInJlZ3VsYXRvcnMiIG5vZGUgd2lsbCBub3QgYmUgcG9wdWxhdGVkLAo+PiB1
bmxlc3Mgc2ltcGxlLWJ1cyBvciBzb21ldGhpbmcgc2ltaWxhciBpcyB1c2VkLiAgRHJvcCB0aGUg
InJlZ3VsYXRvcnMiCj4+IHdyYXBwZXIgbm9kZSB0byBmaXggdGhpcy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
Pgo+PiAtLS0KPj4gIGFyY2gvYXJtL2Jvb3QvZHRzL254cC9teHMvaW14MjgtbTI4ZXZrLmR0cyB8
IDQ1ICsrKysrKysrKystLS0tLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspLCAyNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL254cC9teHMvaW14MjgtbTI4ZXZrLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9teHMv
aW14MjgtbTI4ZXZrLmR0cwo+PiBpbmRleCBlMzUwZDU3YTRjZWMuLjZiZjI2ZjM4NmE1ZSAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL214cy9pbXgyOC1tMjhldmsuZHRzCj4+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9teHMvaW14MjgtbTI4ZXZrLmR0cwo+PiBAQCAt
MTgsMzMgKzE4LDI4IEBAIGJhY2tsaWdodCB7Cj4+ICAgICAgICAgICAgICAgICBkZWZhdWx0LWJy
aWdodG5lc3MtbGV2ZWwgPSA8Nj47Cj4+ICAgICAgICAgfTsKPj4KPj4gLSAgICAgICByZWd1bGF0
b3JzIHsKPj4gLSAgICAgICAgICAgICAgIHJlZ192ZGRpb19zZDA6IHJlZ3VsYXRvckAxIHsKPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+
PiAtICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47Cj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1uYW1lID0gInZkZGlvLXNkMCI7Cj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgZ3BpbyA9IDwmZ3BpbzMgMjggMD47Cj4+IC0gICAgICAgICAg
ICAgICB9Owo+PiArICAgICAgIHJlZ192ZGRpb19zZDA6IHJlZ3VsYXRvci0xIHsKPiAKPiBJdCBz
aG91bGQgYmUgYmV0dGVyIHRvIHdyaXRlOgo+IAo+IHJlZ192ZGRpb19zZDA6IHJlZ3VsYXRvci12
ZGRpby1zZDAgewo+IAo+IHJlZ3VsYXRvci0xIGlzIG5vdCB2ZXJ5IGRlc2NyaXB0aXZlLgoKTm9k
ZSBuYW1lcyBzaG91bGQgYmUgZ2VuZXJpYywgbm90IGRlc2NyaXB0aXZlLiBUaGVzZSBhcmUgb2xk
IHNvdXJjZXMsIHNvCnRoZXkgZG8gbm90IHVzZSBmdWxseSBvdmVycmlkZS1ieS1waGFuZGxlL2xh
YmVsIHN0eWxlLCB0aHVzIHdpdGgKZXhpc3RpbmcgbmFtaW5nIEkgcmVkdWNlIHRoZSBjaGFuY2Vz
IG9mIHdyb25nIG92ZXJyaWRlcyBpbiBzb21lIG90aGVyCmJvYXJkIG9yIERUU0kuCgpCZXN0IHJl
Z2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
