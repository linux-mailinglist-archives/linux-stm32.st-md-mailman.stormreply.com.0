Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D070D9D4177
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C3E8C7A82F;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 628E5C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 10:34:18 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20ca388d242so8399665ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2024 02:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730975657; x=1731580457;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qHCnQjwtQk6Ee4qEjCK4DR0rfCUXjzBPqylzEtsbdRg=;
 b=M3NT4XRzx0Z3fE3Z17Jtgrk60XqqnR4JLYpRKljJTFafIvfEPky8BmYXFFEXuc3pYw
 CMBfVUrgspPBUZRohYl8dLVTqoBnDhNdn7eyrQC3q0l//QB9Qgd0poKXlBLA3o7Whw5/
 PZu/HXTl5OfGpLbNg3Jh6oUOF/ExNowVQ5vOWDacbnJpZqO8yDIJHTuZmBbGjeXm78wV
 32G8aaUhQCCb8L7miKwzFAJzgaPS8IqGq4NwR7Fz/NVqq/G59vlNeZ30IFTOYtuXmLxJ
 NATwtjhcPQav81fJ8SA+L27ebOfYGEoAsX2vZbGjusQGUE0gw+QzDxE0Vu/muYHraIYZ
 I81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730975657; x=1731580457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qHCnQjwtQk6Ee4qEjCK4DR0rfCUXjzBPqylzEtsbdRg=;
 b=jjX8dlhOMHCoW9q1R+He0d4X1zRUgMRW19Td6VwUbbFY0IxTCVDjCn7UkMHjsX/F4S
 ndoG4gXdL/yZUkkiXUNV1dUFZxSsAU/LRW53Vd06hS0vVvFurtRBwTt0rMJ3HIcy8CbP
 xQzj39t6EsxVaLBc3Gyo2RfMt7r3akpO2+tmsJC6f/9Si50tqamjry3SV4KhJVg3jFFs
 g4EJv/ovi59JNQ5yq3rZeb439/HuIIWlmAo1mOATHtMDaFCYxYUlLMQxPxI9hxoKg974
 s8KN1P3iDIGH6JZULeov9Dax8848OngzHmEy+6IT261vfMY6jO4YCz6gEy0HAuknfIRS
 g14g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFnxlXcHFnoQtQzetMvwzPe5USh7xxDNS3QRmdlKVnH9itSjBqzB+hRCdFGHJHe6h/qFsGkd3A9qjblQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4EZtaBSxUwl/D8bydtAl3qtyckr2DO0K5KLdcdug51Qkbow9J
 eWoR64rAJKkNwzHAkbmpCupUNPGtcETJajEyP194kpcFkkeuFmbk
X-Google-Smtp-Source: AGHT+IHkZfIEbD222fQn11aAU/4JCGtUmB7xX2nq1qct7iJZBs/q3eDUArv4HK7B8GzG/yGYnzOsoQ==
X-Received: by 2002:a17:902:e884:b0:20b:3f70:2e05 with SMTP id
 d9443c01a7336-2111afd6c99mr328557145ad.41.1730975656993; 
 Thu, 07 Nov 2024 02:34:16 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e42b8csm9056135ad.131.2024.11.07.02.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 02:34:16 -0800 (PST)
Message-ID: <61a76bb1-f247-4e9e-b6ba-163fd8af4f69@gmail.com>
Date: Thu, 7 Nov 2024 18:34:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <12f4ea21-d83b-412c-9904-d9fe8f8a0167@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <12f4ea21-d83b-412c-9904-d9fe8f8a0167@lunn.ch>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
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

CkFuZHJldyBMdW5uIOaWvCAxMS83LzIwMjQgMjoxMyBBTSDlr6vpgZM6Cj4+ICsgIG1hYy1pZDoK
Pj4gKyAgICBtYXhJdGVtczogMQo+PiArICAgIGRlc2NyaXB0aW9uOgo+PiArICAgICAgVGhlIGlu
dGVyZmFjZSBvZiBNQUMuCj4gUGxlYXNlIGNvdWxkIHlvdSBleHBhbmQgb24gd2hhdCB0aGlzIGlz
PwpUaGlzIHByb3BlcnR5IHdpbGwgYmUgcmVtb3ZlZC4gVGhhbmtzLgo+IAlBbmRyZXcKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
