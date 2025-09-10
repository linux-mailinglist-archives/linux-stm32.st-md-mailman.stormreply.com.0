Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B29B5116B
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:34:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A500C3FACE;
	Wed, 10 Sep 2025 08:34:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40157C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:34:48 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso42610475e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757493287; x=1758098087;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lvxtkN58s90JpLuJgBRzi7rdiBNppM/NXoJyMRiUo58=;
 b=aQ7Ysu0bD2i+pC9NKxvD128S5KrK1oQa8e2AcaomRRKzRGP5OeLnSnG+xSL+xZG/lI
 GLeyb4U6b1rSq39eEH+B53iRerG1ofW9KZI7UBmIYv/M6FoxrxPvUi83u1nUmPKna+Io
 tnsjJcAJjKsliA/Qxc6sy6Z8c4uSlwpupsyb5SI/dv5oloItyE8QaDmdITDUypWSBeNB
 XmFVK97Lj0qxqBjRYL+HCbzK6CLBHJsDQNIQG7PlKkO1BM598hlGH8N7f6rd9sD+aRGZ
 VIpIo+5xumv+wf1ChUE/Re0WyqfnXf96rLcDccPTynGuZACLBAOynwbNhIt9VUG8lblk
 B54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757493287; x=1758098087;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lvxtkN58s90JpLuJgBRzi7rdiBNppM/NXoJyMRiUo58=;
 b=fgjhabuPVdUZhOV/QW/cW/lFaPajVqPjDdIAgMHN3GPm+m8o2mNaCYx+KG4xZLUaDM
 Ab1W/eRjTHr2sZnpxpRBQDLpPCtIgHJFRiuZleeDss9xITMLcbUBgxN1acF1ETnZhGTW
 U7vmhkfxHFejEWyb9qpXzBE69iCMk5mMfsYDuaoNVR6yxxOUMsmOgoX7zucmFqIfyQZd
 J7XyiT20us0qq64rLlmXcRgwD3IaepGTnzEMBuVMJQMLci0drOBPtr4sjnVIM+qzNTzG
 DXpZY+pwQov8uJ3PzdlSMFa5DeOZbHmEcS/gDjPo2mBVOD9bESL+tZKK44WBjySpNsXK
 e6IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH5djyWlISJb6b8FYyLg9Cx2dmvN1jTSvuYD49fkjr+Rny2n1tgD0CxSbY8SBa63kfWlFihpb9USh6ig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/N+vyeKzynaCUfrk6dAMdeA/GekAb+uCTz0H3FPkLrxVNyeza
 wYrqYWf+79Ve+AwQ8Pdb4RConUySb4ehMwi3/icCMq5Bc/45SpAUy1qbx9u/3CP8Tm4=
X-Gm-Gg: ASbGncvLtyJbtgR5o6l+m1GUuRIxyctYBbYW3SJNtCsteXHRi4X9ciNI6HT78dlxiV1
 ka2lBn/Vz2mCuLI63wZ4ZCLS7HWpvvGMvREtpiysULUbp6BDdDa8wtx0c9Ql7RUOIPngeZh/ec1
 01bYNr6nf9sVl7323id0WUwTKtsbcMX323qkelwTC0o9y6pmpQl66XBTEeVvqts87EpdapPzoYQ
 UG0ebn8uREPhDl47jPkZIutMHpCwjiDuyq6DjGDqQR/mswiPh4AukmLn3FvSDN7hZn5TlVPVJov
 s3suff0gQfIYLrKvhQqDE/19vHyISzXDgkVk0ZQdUp+f5fi0AStQrtVgaZ6WObVZVvCi5qU0dsw
 V7+Y0kCMs3bVlmZzhu+bBvhDvoJExnde0IgvOoDqU6NQVX9JJtk6APvj+LdziN0U5qr84NvZSPl
 FSfMWWC++OCujO32hspfFiCZm1JjWNEvzVcHo2A8rLxP7qsyo0O4aI3KN9XST6W2A=
X-Google-Smtp-Source: AGHT+IEQEEKz1G0RJ7Rv5RJrQMqTp7wb9aYAHyNKeRkV5T6QpUQaKrLWSe8p8sLtVzT2+/GsKFY/hg==
X-Received: by 2002:a05:600c:870f:b0:45b:8453:d7e with SMTP id
 5b1f17b1804b1-45de072e865mr136738135e9.6.1757493287542; 
 Wed, 10 Sep 2025 01:34:47 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef?
 (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net.
 [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df81e1e00sm19751505e9.10.2025.09.10.01.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 01:34:47 -0700 (PDT)
Message-ID: <e40e858f-091f-4059-a379-7aa25835c3ce@gmail.com>
Date: Wed, 10 Sep 2025 10:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
 <20250910-encouraging-masterful-dodo-3d1f60@kuoka>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250910-encouraging-masterful-dodo-3d1f60@kuoka>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Julius Werner <jwerner@chromium.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 12/20] dt-bindings: perf: stm32:
 introduce DDRPERFM dt-bindings
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

T24gMTAvMDkvMjAyNSAwOTo1NywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBUdWUs
IFNlcCAwOSwgMjAyNSBhdCAxMjoxMjoxOVBNICswMjAwLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3Jv
dGU6Cj4+IEZyb206IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KPj4KPj4gRERSUEVSRk0gaXMgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yIGVtYmVk
ZGVkIGluIFNUTTMyTVBVIFNvQy4KPj4gSXQgYWxsb3dzIHRvIG1vbml0b3IgRERSIGV2ZW50cyB0
aGF0IGNvbWUgZnJvbSB0aGUgRERSIENvbnRyb2xsZXIKPj4gc3VjaCBhcyByZWFkIG9yIHdyaXRl
IGV2ZW50cy4KPiAKPiBBbHNvOgo+IAo+IEEgbml0LCBzdWJqZWN0OiBkcm9wIHNlY29uZC9sYXN0
LCByZWR1bmRhbnQgImR0LWJpbmRpbmdzIi4gVGhlCj4gImR0LWJpbmRpbmdzIiBwcmVmaXggaXMg
YWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhlc2UgYXJlIGJpbmRpbmdzLgo+IFNlZSBhbHNvOgo+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE3LXJjMy9zb3VyY2UvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDE4CgpPb3Bz
LCBpdCB3aWxsIGJlIGZpeGVkIGluIG5leHQgdmVyc2lvbi4KCkJlc3QgcmVnYXJkcywKQ2zDqW1l
bnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
