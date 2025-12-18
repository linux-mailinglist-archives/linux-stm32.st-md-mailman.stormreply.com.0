Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D28FCCCA92
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 17:10:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEA5BC58D7A;
	Thu, 18 Dec 2025 16:10:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0D39C5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 16:10:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ADF6860008;
 Thu, 18 Dec 2025 16:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E74C4CEFB;
 Thu, 18 Dec 2025 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766074249;
 bh=zlgwqexkBMnoqotoasLnmEGnWT3Dr1HRS4BATSlZwKc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=l7Y18yQiBkXWcWjcByBadrlPgG0wKuIGVGiFXaBgFzasOninl90Z26tTM9PRFrAi+
 vL50jYUJCyB5jQhgUYScc/yR3IVPB8H6dXspE68wvyOvADRxgKDJCwRkCwjKOzFZEi
 /H/HIgd6hGptTZBrN7T7AONbHF5T2ohjBwPBBqo6JGiwJaZuCnAypqxJ3CpkFIe/r3
 f3vzZtbjS1Kg6zFWoTXSDwFgPoGix+Z0Rz4ikqxVf7R74bWOgR/KoH3pXRvIy/gblI
 +pxPx4VojQ1z67lQi+1UlAbt6OW/z4Yc+KQmw/JmazkGiYCsdE5Q3+zrfm7l8eXZ58
 XrYW0t0PVNy0Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
Message-Id: <176607424544.18448.1362838186917250806.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 17:10:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v9 0/7] Add DDR4
 memory-controller bindings and factorise LPDDR and DDR bindings
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

Ck9uIFR1ZSwgMTggTm92IDIwMjUgMTY6MDc6NTYgKzAxMDAsIENsw6ltZW50IExlIEdvZmZpYyB3
cm90ZToKPiBJbnRyb2R1Y2UgRERSNCBiaW5kaW5ncywgd2hpY2ggaXMgdGhlIGZpcnN0IEREUiB0
eXBlIHRvIGJlIGFkZGVkLgo+IEFzIHRoZSBERFIgYW5kIExQRERSIHVzZSB0aGUgc2FtZSBwcm9w
ZXJ0aWVzLCBmYWN0b3Jpc2UgdGhlbSBpbiBhCj4gc2RyYW0tcHJvcHMgYmluZGluZ3MgZmlsZSBh
bmQgcmVuYW1lIGxwZGRyLWNoYW5uZWwgaW50byBzZHJhbS1jaGFubmVsLgo+IAo+IENoYW5nZXMg
aW4gdjk6Cj4gLSBJbiB0aGUgZGRyNCBjb21wYXRpYmxlIHBhdHRlcm4gOgo+ICAgICBzL2Rkclgt
WVlZWSxBQUFBLi4uLFpaL2RkclgtWVlZWSxBQUFBLi4uLVpaLwo+ICAgICBUaGUgY29tbWEgYmVm
b3JlIHRoZSAiWloiIHBhcnQgaGFzIGJlZW4gcmVwbGFjZWQgd2l0aCBhIG1pbnVzLgo+IC0gQWRk
IGluZm9ybWF0aW9uIGFib3V0IGhvdyB0aGUgY29tcGF0aWJsZSBpcyBjb25zdHJ1Y3RlZCBpbiB0
aGUgcGF0Y2ggMjoKPiAgICJkdC1iaW5kaW5nczogbWVtb3J5OiBpbnRyb2R1Y2UgRERSNCIKPiAt
IEFkZCBLcnp5c3p0b2YgS296bG93c2tpJ3MgdHJhaWxlciBvbiBwYXRjaCAxCj4gLSBMaW5rIHRv
IHY4OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwOTMwLWI0LWRkci1iaW5kaW5ncy12
OC0wLWZlNGQ4YzAxNWE1MEBnbWFpbC5jb20KPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoK
WzEvN10gZHQtYmluZGluZ3M6IG1lbW9yeTogZmFjdG9yaXNlIExQRERSIHByb3BzIGludG8gU0RS
QU0gcHJvcHMKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9rcnprL2xpbnV4LW1lbS1jdHJs
L2MvZGZmYWExYmVlYTllN2EwZDkwMmZjNGUyNWUxMzdhZmNmMTI5NzI2NwpbMi83XSBkdC1iaW5k
aW5nczogbWVtb3J5OiBpbnRyb2R1Y2UgRERSNAogICAgICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L2tyemsvbGludXgtbWVtLWN0cmwvYy9iNWMxYTIxNzU1MmMzNTEzOTc3YTlmMTEzOGIwNWRlMGJh
ZGE4YTUyClszLzddIGR0LWJpbmRpbmdzOiBtZW1vcnk6IGZhY3RvcmlzZSBMUEREUiBjaGFubmVs
IGJpbmRpbmcgaW50byBTRFJBTSBjaGFubmVsCiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
a3J6ay9saW51eC1tZW0tY3RybC9jLzZhYjM1ODFhYjE5ZmEzNDhiOTNjODVhNzkzZTQ1Y2Q4YTgw
OTEyYTgKWzQvN10gZHQtYmluZGluZzogbWVtb3J5OiBhZGQgRERSNCBjaGFubmVsIGNvbXBhdGli
bGUKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9rcnprL2xpbnV4LW1lbS1jdHJsL2MvMzZl
Y2M4MzQ2NzQ3YjYwMDg5MmUzMDQwZTFkMGVjYjFlOTM5YzZlOApbNS83XSBkdC1iaW5kaW5nczog
bWVtb3J5OiBTRFJBTSBjaGFubmVsOiBzdGFuZGFyZGlzZSBub2RlIG5hbWUKICAgICAgaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9rcnprL2xpbnV4LW1lbS1jdHJsL2MvOTgwNWYyY2ZjODgzMDE4Zjdi
Zjg0Yzg0ZTNhZjM3ODZjMzdkYWM3YgoKQmVzdCByZWdhcmRzLAotLSAKS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
