Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B88A1C397
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jan 2025 14:21:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFAEFC78011;
	Sat, 25 Jan 2025 13:21:31 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D5A9C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 13:21:24 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e53a5ff2233so5523302276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 05:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1737811283; x=1738416083;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqQlkYxYh5YiVxFjsX2QaXZvcKyx1dpoVsF7zYYgoA4=;
 b=OgbyNP5pBryRQrHh+3ZEX7X1FzEtvnoB0sfFvBb+24LOU0E2INE3sBVSlVfxjZakkV
 Y8K1Zp2gfcs59u35Vu7Nz95CuOjQSNiy5/BFspsX+SSE12s2Vd3lgCPdQfj5PywgT5BJ
 wCr/Qx6zcIDLqLedm85Ou/cY7oOExi8xeQYoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737811283; x=1738416083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqQlkYxYh5YiVxFjsX2QaXZvcKyx1dpoVsF7zYYgoA4=;
 b=OrgoFAAqbdQ1oIp9f/m6YYzgaIJRXMpEKVbdWc7raYk8CfVWCam4oxsw1IMOgGmdnq
 tZ6QXcq8YDBfIEQcjskGKAHb4ai79to8bzHmWWdaPES6b/7ctje6JEIyNltvDbyczRo9
 /aNPuRqWiLXIP1L9ONRzg+znh61AAFtqeawdYHrktPscm9NDlB6112S7mA4LZA7Lqy50
 hk2PkfbutamsWOiamfSPSBXMQb24ww0KiFK9CCuHMCOTBAjiBrwHwu+SzVst7xxWS9qy
 2+fTYFLyhYkVJfzMLqhRojvhohjwmIwoZdfqbfKmzcU/uyknBykUkvQ/dekGe8rDYlbC
 8fQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcq1e65u/B31WgT2sRZ1Mockne2Hw1gaa7axLWlqL4Zr+scbGdbDGgMdrRzMb9mOLJKrOLmiHj/3ScQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzl+cPli+pOTmVq9iz3IJXm/8myfjK2oWpgv3OSpT7dBnXdSJxF
 x0hX7d301IE9+C2Q/TtXHRjOSZSa9iB+8iUmLIobfwdRzIJjxCm/4wK+5M6+AQwm47FbAddLn6b
 DITaOcwDIYATnObYCqkMICAuhwFXfnJ9Gue05pw==
X-Gm-Gg: ASbGncud178hwJqAD6HtjqTxF9ICFH2rPiV6nxqnausRHpQ1FJ05ah1A4XSWhTyNkub
 +JH36YEqUAs4edcDPal3F2bIHSNHob91AX7sThJbA8blhNAjgoMn6cpo1rOez
X-Google-Smtp-Source: AGHT+IEC66mHyu/T69Up/dX022TugdsmD0uulT2kpXSasOG+om+qGGY/LBwo1LfOlHcKiAvuEQ7Oi2p0ts4rAblyPzI=
X-Received: by 2002:a05:690c:25c7:b0:6ef:6c57:ddc6 with SMTP id
 00721157ae682-6f6eb937ac1mr261166397b3.34.1737811283560; Sat, 25 Jan 2025
 05:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
 <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
 <73ad1336d9fbfa020ba666eef340f784.sboyd@kernel.org>
 <47865ef4-fb8c-4ba5-82d8-eed1f292bf4d@kernel.org>
In-Reply-To: <47865ef4-fb8c-4ba5-82d8-eed1f292bf4d@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 25 Jan 2025 14:21:13 +0100
X-Gm-Features: AWEUYZn9YZy8Owehe6KhYJIuvjU2tyrCD5F9XaUX2lhI1_Zpu924GXyOjD3iZ7A
Message-ID: <CABGWkvpeOyrzcU64pNxSYC7n-VOsjSEL-iD-_YqmCveGsrH-hg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/4] dt-bindings: clock: st,
 stm32-rcc: support spread spectrum clocking
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

T24gRnJpLCBKYW4gMjQsIDIwMjUgYXQgMjo0NeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNi8wMS8yMDI1IDAwOjIyLCBTdGVwaGVuIEJv
eWQgd3JvdGU6Cj4gPiBRdW90aW5nIERhcmlvIEJpbmFjY2hpICgyMDI1LTAxLTE0IDEwOjE5OjQ3
KQo+ID4+IFRoZSBhZGRpdGlvbiBvZiBEVCBiaW5kaW5ncyBmb3IgZW5hYmxpbmcgYW5kIHR1bmlu
ZyBzcHJlYWQgc3BlY3RydW0KPiA+PiBjbG9ja2luZyBnZW5lcmF0aW9uIGlzIGF2YWlsYWJsZSBv
bmx5IGZvciB0aGUgbWFpbiBQTEwgb2Ygc3RtMzJmezQsN30KPiA+PiBwbGF0Zm9ybXMuCj4gPj4K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVs
YXNvbHV0aW9ucy5jb20+Cj4gPj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPiA+Pgo+ID4+IC0tLQo+ID4KPiA+IEFwcGxp
ZWQgdG8gY2xrLW5leHQKPgo+IFVubHVja3kgdGltaW5nLiBOWFAganVzdCBzZW50IHRoaXM6Cj4K
PiBodHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1hL3B1bGwvMTU0Cj4K
PiB3aGljaCBtYWtlcyB0aGVzZSBiaW5kaW5ncyBvYnNvbGV0ZS4KPgoKV2h5IGhhdmUgdGhlIERU
IGJpbmRpbmdzIGFscmVhZHkgYmVjb21lIG9ic29sZXRlIGV2ZW4gdGhvdWdoIHRoZSBQUgpoYXMg
bm90IHlldCBiZWVuIGFjY2VwdGVkPyBUaGUgc2VyaWVzIGhhcyBhbHJlYWR5IGJlZW4gbWVyZ2Vk
IGludG8KdGhlIGtlcm5lbC4gUGxlYXNlIGxldCBtZSBrbm93IGlmIGFuZCB3aGVuIEkgbmVlZCB0
byBtYWtlIHRoZSBjaGFuZ2VzLgpUaGlzIGlzIHRoZSBmaXJzdCB0aW1lIEkgZmluZCBteXNlbGYg
aW4gc3VjaCBhIHNpdHVhdGlvbi4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4gQmVzdCBy
ZWdhcmRzLAo+IEtyenlzenRvZgoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRk
ZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNS
TAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkg
MDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRp
b25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
