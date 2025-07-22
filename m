Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 641AFB0E250
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 19:01:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0001C36B0C;
	Tue, 22 Jul 2025 17:01:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE3D3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 17:01:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75EA95C48BA;
 Tue, 22 Jul 2025 17:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034DDC4CEEB;
 Tue, 22 Jul 2025 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753203680;
 bh=4ExxWF210EVKXVfZ8XRUE1perdO4miFY1lWLlDpGXyE=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=o1qzI20yrVdhUnbNKS9chhnWZwfsufwiVXUoOBR5Nzqdw4VuznVLUtui48AqcvckC
 dksJVF+i5y4kslxWQZQSbXWGchZw/2Vnydl1hmZ8MCBw3tTb7lKjvZ80/jWQKNNGzF
 PxTgOs34OjapDTx9a2Y80Wk4bp7d1/jrUPkELzwhXxJn6f8UrfOIX0PIPqIVfqO2Df
 CJHRsHhmxBuI6EjTWH+DSFGpZpqzQ559K9Vt3euNX2h57Hoqhp123HjpkZUmQHGvrl
 OaieU6ya2bzCTb4dzFod3SamD0A9iFYEGl0+ELuDNjUWsaLEWupl7EPr1vj26f83VY
 MM1BiQ/ZB1Qbg==
Date: Tue, 22 Jul 2025 12:01:19 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-11-7b7a4f3dc8a0@foss.st.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-11-7b7a4f3dc8a0@foss.st.com>
Message-Id: <175320367908.42297.8460265656019241171.robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 11/19] dt-bindings: perf: stm32:
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIFR1ZSwgMjIgSnVsIDIwMjUgMTY6MDM6MjggKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3
cm90ZToKPiBERFJQRVJGTSBpcyB0aGUgRERSIFBlcmZvcm1hbmNlIE1vbml0b3IgZW1iZWRkZWQg
aW4gU1RNMzJNUFUgU29DLgo+IEl0IGFsbG93cyB0byBtb25pdG9yIEREUiBldmVudHMgdGhhdCBj
b21lIGZyb20gdGhlIEREUiBDb250cm9sbGVyCj4gc3VjaCBhcyByZWFkIG9yIHdyaXRlIGV2ZW50
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2Zm
aWNAZm9zcy5zdC5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qs
c3RtMzItZGRyLXBtdS55YW1sIHwgOTQgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygrKQo+IAoKTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5n
ICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cgp5YW1sbGludCB3YXJuaW5n
cy9lcnJvcnM6CgpkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgpEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGVyZi9zdCxzdG0zMi1kZHItcG11LmV4YW1wbGUuZHRiOiAvZXhh
bXBsZS0xL2RkcjMtY2hhbm5lbDogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21w
YXRpYmxlOiBbJ2plZGVjLGRkcjMtY2hhbm5lbCddCgpkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFr
ZSByZWZjaGVja2RvY3MpOgoKU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9kZXZpY2V0cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjUwNzIyLWRkcnBlcmZtLXVwc3RyZWFtLXYz
LTExLTdiN2E0ZjNkYzhhMEBmb3NzLnN0LmNvbQoKVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMg
Z2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5CnNob3VsZCBi
ZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guCgpJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmlu
ZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCmVycm9yKHMpLCB0aGVuIG1ha2Ug
c3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvCmRhdGU6
CgpwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCgpQbGVhc2UgY2hlY2sgYW5kIHJlLXN1
Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlCnRoYXQg
RFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1
cCBjaGVja2luZwp5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0
IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
