Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 341FEAF7BFB
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 17:30:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C967AC3F94F;
	Thu,  3 Jul 2025 15:30:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 616CFC3F94D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 15:30:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0D1AD4652A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 15:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B79C4CEF5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751556645;
 bh=kf3R69g/8+n9ejwwkL6h4el8NdPueW74hEy4yuQ+Fcs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nG0c3PQKGVGoTtfCDduTcEI7W1NSi6vabGp+6w7YXIKmlYKIrjxaDRvDafBw0K0Qr
 oGHuVf6XBn3o1jILbhnAFdiQFJAdbFG38T/avxI6ruCAYXZEdVWCGO+I2FetJqbA3d
 vpLTDmrQksbPAlmfTn3E+RzN+ASyuwjyreA220nPQK5WV+iLFhfactLuqf5ACtHbyP
 O6gmYgwTkqq5P3KCMd0lCz5w+DjoZg7FOygXUggOVQwA89jEtX8Q6ZdT72lTiQxoGr
 3XhRfmbBLBier1wTDGeV6f5IRMyEsmjeQKZYxC6JtFxhF9fZG6A75HUqI0edagzTat
 ose0hmAvxc0yQ==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ae3cd8fdd77so822266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Jul 2025 08:30:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXKYa1BHtVou9IY4L5mbmqvdv5z7O0ANN9l5LQ7QrL3PI8DDy9MYZhVK44G529zsrSkvQu7saAlxekfPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzAJL5iQTdS4nT/4QGyfVpOPKGya2lweu9ZGU7vJCnuJ7E6kEAL
 qepMsYCw2GASVuBW35PyeHOox0gQ9OEwIvDn2H3S+BIJHcYjn60/GQ/pb3jvtFUP9aYoYBiieu+
 nVJASuEw7jLUHlYEKQwNQ1fBUkEsVXQ==
X-Google-Smtp-Source: AGHT+IFGK3wNYEmDTQE7cJvW5bwhu5w4lNajdS9akjc5i1/E/t6dIX21GgObTKsLF38FMy+/VygKrLB7PYcfFn+IPck=
X-Received: by 2002:a17:907:94cb:b0:ade:44f8:569 with SMTP id
 a640c23a62f3a-ae3c2c9d41bmr815278466b.42.1751556644360; Thu, 03 Jul 2025
 08:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250630213748.71919-1-matthew.gerlach@altera.com>
In-Reply-To: <20250630213748.71919-1-matthew.gerlach@altera.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Jul 2025 10:30:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLrLJ6wiqBk31NhronsUqX4_5FN-Lb26r-3SceDD7kkAA@mail.gmail.com>
X-Gm-Features: Ac12FXxuKTihI_ySZjceamap3hZ9PwUnYru49iIiSxON-urQArDwhuRwHAUu1ZI
Message-ID: <CAL_JsqLrLJ6wiqBk31NhronsUqX4_5FN-Lb26r-3SceDD7kkAA@mail.gmail.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Mun Yew Tham <mun.yew.tham@altera.com>, dinguyen@kernel.org,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v7] dt-bindings: net: Convert
	socfpga-dwmac bindings to yaml
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

T24gTW9uLCBKdW4gMzAsIDIwMjUgYXQgNDozOOKAr1BNIE1hdHRoZXcgR2VybGFjaAo8bWF0dGhl
dy5nZXJsYWNoQGFsdGVyYS5jb20+IHdyb3RlOgo+Cj4gQ29udmVydCB0aGUgYmluZGluZ3MgZm9y
IHNvY2ZwZ2EtZHdtYWMgdG8geWFtbC4gU2luY2UgdGhlIG9yaWdpbmFsCj4gdGV4dCBjb250YWlu
ZWQgZGVzY3JpcHRpb25zIGZvciB0d28gc2VwYXJhdGUgbm9kZXMsIHR3byBzZXBhcmF0ZQo+IHlh
bWwgZmlsZXMgd2VyZSBjcmVhdGVkLgoKRGlkIHlvdSB0ZXN0IHRoaXMgYWdhaW5zdCB5b3VyIGR0
cyBmaWxlcz86CgpldGhlcm5ldEBmZjgwNDAwMCAoYWx0cixzb2NmcGdhLXN0bW1hYy1hMTAtczEw
KTogaW9tbXVzOiBbWzExLCAzXV0gaXMgdG9vIHNob3J0CmV0aGVybmV0QGZmODAyMDAwIChhbHRy
LHNvY2ZwZ2Etc3RtbWFjLWExMC1zMTApOiBpb21tdXM6IFtbMTEsIDJdXSBpcyB0b28gc2hvcnQK
ZXRoZXJuZXRAZmY4MDAwMDAgKGFsdHIsc29jZnBnYS1zdG1tYWMtYTEwLXMxMCk6IGlvbW11czog
W1sxMSwgMV1dIGlzIHRvbyBzaG9ydAoKVGhlcmUncyBhbHNvIG9uZSBmb3IgJ3BoeS1hZGRyJywg
YnV0IHRoYXQgbmVlZHMgdG8gYmUgZHJvcHBlZCBmcm9tIHRoZQouZHRzIGZpbGVzIGFzIGl0IGRv
ZXNuJ3QgYXBwZWFyIHRvIGJlIHVzZWQuCgpbLi4uXQoKPiArICBpb21tdXM6Cj4gKyAgICBtYXhJ
dGVtczogMgoKWW91IG5lZWQgdG8gYWRkOgoKbWluSXRlbXM6IDEKCgpSb2IKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
