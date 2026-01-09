Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABE4D1105D
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 09:00:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4484AC3F945;
	Mon, 12 Jan 2026 08:00:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 492FCC8F291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 23:10:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F486600B0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 23:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1131C2BC9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 23:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768000222;
 bh=pvh5+c9d1qbVeHgj6hfcSp+Pmonb0UmxmVQR5Zl7mpw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZB3IzsmXvGdUT+9tN+xTzvMiHwdNmA24gS2pwyftRLpXe52CWVQNCPbLJUejjvBaq
 3mi0WY1yhAhBAzU/LkUE9n5+K2ugjlI4KZDQGWo/49EplymLEHpmZowcvIVLRuzw0S
 UXd7KyxKcCJebdFiYJrBoaeC8GU3ID9jl0Q2kSNMevX7fqxxJH8SjEyhBGyx+6cqhN
 vCdfPQi/fEf4bzOlPVrD/mPosxQE9BTk37wWIqGAl7bVt6cU6fVB6EUNujxzhVkHsJ
 7glSbYzNeK14il6+/Z7hfdjwZFu9m4YUP3C0IieAdfxboIwI4SBnrWvCAts7+XDon1
 ULZNjX2NYD6CA==
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-78fba1a1b1eso56193227b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jan 2026 15:10:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUKV+OXbKK8gAEdjEc8oPGNGWvpwr0sz7cg3d40ESSl17uToGfLtBPpnka8x7s959WiduBo4UlUsDEx+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+ZeXwWW9mLCs7IGGcg6Yp8e+eHP7GwlbdpOL/CBq10oUCNWac
 MQidD0bJUZFKXzNPuwijExyxy63xhO0u8EGbn2c9XDHQ9HlibzBYX2d2TnVHkaKhgkKHeEJd6Qg
 UfAYcNui+VgbpBDCc/kX2VX5uYyS1CQc=
X-Google-Smtp-Source: AGHT+IFEQO71e4cYNJObSCgFIiqeKEccxRrR8aY+yYr4ri3WGCll3aL6B5arU8gnOcBLuhvTFy39ew8yzQuWGlAloxk=
X-Received: by 2002:a05:690e:1188:b0:641:f5bc:692b with SMTP id
 956f58d0204a3-6470d2f46b7mr12056434d50.36.1768000222173; Fri, 09 Jan 2026
 15:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Jan 2026 00:10:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
X-Gm-Features: AZwV_QjvOySI13iVNOTYfIXgnODwhGbGn87uLlGk8QzCNwneRQXoKJ0Qs0Jx1Ps
Message-ID: <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>
X-Mailman-Approved-At: Mon, 12 Jan 2026 08:00:49 +0000
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 00/11] bus: add stm32 debug bus and
 coresight support for stm32mp1x platforms
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

SGkgR2F0aWVuLAoKdGhhbmtzIGZvciB5b3VyIHBhdGNoIHNlcmllcyEKCk9uIEZyaSwgSmFuIDks
IDIwMjYgYXQgMTE6NTbigK9BTSBHYXRpZW4gQ2hldmFsbGllcgo8Z2F0aWVuLmNoZXZhbGxpZXJA
Zm9zcy5zdC5jb20+IHdyb3RlOgoKPiBTdG0zMiBTb0NzIGVtYmVkIGRlYnVnIHBlcmlwaGVyYWxz
IHN1Y2ggYXMgQ29yZXNpZ2h0LiBUaGVzZSBwZXJpcGhlcmFscwo+IGNhbiBtb25pdG9yIHRoZSBh
Y3Rpdml0eSBvZiB0aGUgY29yZXMuIEJlY2F1c2Ugb2YgdGhhdCwgdGhleSBjYW4gYmUKPiB1c2Vk
IG9ubHkgaWYgc29tZSBmZWF0dXJlcyBpbiB0aGUgZGVidWcgY29uZmlndXJhdGlvbiBhcmUgZW5h
YmxlZC4KPiBFbHNlLCBlcnJvcnMgb3IgZmlyZXdhbGwgZXhjZXB0aW9ucyBjYW4gYmUgb2JzZXJ2
ZWQuIFNpbWlsYXJseSB0bwo+IHRoZSBFVFpQQyhvbiBzdG0zMm1wMXggcGxhdGZvcm1zKSBvciB0
aGUgUklGU0Mob24gc3RtMzJtcDJ4IHBsYXRmb3JtcyksCj4gZGVidWctcmVsYXRlZCBwZXJpcGhl
cmFscyBhY2Nlc3MgY2FuIGJlIGFzc2Vzc2VkIGF0IGJ1cyBsZXZlbCB0bwo+IHByZXZlbnQgdGhl
c2UgaXNzdWVzIGZyb20gaGFwcGVuaW5nLgo+Cj4gVGhlIGRlYnVnIGNvbmZpZ3VyYXRpb24gY2Fu
IG9ubHkgYmUgYWNjZXNzZWQgYnkgdGhlIHNlY3VyZSB3b3JsZC4KPiBUaGF0IG1lYW5zIHRoYXQg
YSBzZXJ2aWNlIG11c3QgYmUgaW1wbGVtZW50ZWQgaW4gdGhlIHNlY3VyZSB3b3JsZCBmb3IKPiB0
aGUga2VybmVsIHRvIGNoZWNrIHRoZSBmaXJld2FsbCBjb25maWd1cmF0aW9uLiBPbiBPcGVuU1RM
aW51eCwgaXQgaXMKPiBkb25lIHRocm91Z2ggYSBEZWJ1ZyBhY2Nlc3MgUFRBIGluIE9QLVRFRSBb
MV0uCj4gVG8gcmVwcmVzZW50IHRoZSBkZWJ1ZyBwZXJpcGhlcmFscyBwcmVzZW50IG9uIGEgZGVk
aWNhdGVkIGRlYnVnIGJ1cywKPiBjcmVhdGUgYSBkZWJ1ZyBidXMgbm9kZSBpbiB0aGUgZGV2aWNl
IHRyZWUgYW5kIHRoZSBhc3NvY2lhdGVkIGRyaXZlcgo+IHRoYXQgd2lsbCBpbnRlcmFjdCB3aXRo
IHRoaXMgUFRBLgo+Cj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX29zL3B1
bGwvNzY3Mwo+Cj4gU2lnbmVkLW9mZi1ieTogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2
YWxsaWVyQGZvc3Muc3QuY29tPgoKSSB0aGluayBKZW5zIFdpa2xhbmRlciB3YW50cyB0byBoYXZl
IGEgbG9vayBhdCB0aGlzIHBhcnRjaApzZXJpZXMsIHNvIGFkZGVkIGhpbSB0byB0aGUgVG86LgoK
WW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
