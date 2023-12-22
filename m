Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A534881C26C
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 01:49:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56329C6B477;
	Fri, 22 Dec 2023 00:49:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 785F7C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 00:49:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F78B61A97;
 Fri, 22 Dec 2023 00:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C3EC433C8;
 Fri, 22 Dec 2023 00:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703206141;
 bh=1DA8bmTOYGPA5GbuB9k2g469eTAv0F3olwtXeYlHwR0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gxBcCIzz0cbD3ugkonPp9VYh2HSxnLxa44GHnYR4IW6PW3J4Rgn6Pi+WryMmWt1u+
 5wnyPnVzVHb6DgT2GO27/QCOg4t+BvjuTcwizCAit096W6X13xq+4fB/fkm9xMJ+mV
 XzzXiN6P8tqW/3UKazKRBC1dyh6uQYainN29c7Cz5EVUloedh5VnVDqEwg5ox/ZTPE
 WAnKi/wnq12bdu9JOoLCsG2Hs1BtJrFNhXZ6TLM0u4y2mx2j+ug/sbSq8E3XmcfDh4
 /mURGarpcdtNGvskvrtl4VatuZlGrDntmlitK3JCfTA5uqUMlr1JBBqsp/hc9VSEVz
 hmabHJBfCHumw==
Message-ID: <a2d96b8259eed101c649fd71f7c1e453.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <21f758cb-ae25-4d74-905c-0d4820f00070@foss.st.com>
References: <20231219130909.265091-1-gabriel.fernandez@foss.st.com>
 <20231219130909.265091-2-gabriel.fernandez@foss.st.com>
 <c98539f99030f174583d7ee36802b4b9.sboyd@kernel.org>
 <21f758cb-ae25-4d74-905c-0d4820f00070@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 21 Dec 2023 16:48:59 -0800
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 1/2] clk: stm32: introduce clocks for
	STM32MP257 platform
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

UXVvdGluZyBHYWJyaWVsIEZFUk5BTkRFWiAoMjAyMy0xMi0yMSAwMjozMTo1MykKPiAKPiBPbiAx
Mi8yMC8yMyAyMzoxNiwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+ID4gUXVvdGluZyBnYWJyaWVsLmZl
cm5hbmRlekBmb3NzLnN0LmNvbSAoMjAyMy0xMi0xOSAwNTowOTowOCkKPiA+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAyNS5jIGIvZHJpdmVycy9jbGsvc3RtMzIv
Y2xrLXN0bTMybXAyNS5jCj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLjMxM2UwMjJjNjE0Mgo+ID4+IC0tLSAvZGV2L251bGwKPiA+PiArKysgYi9kcml2
ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDI1LmMKPiA+PiBAQCAtMCwwICsxLDE4MjYgQEAKPiA+
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4+ICsvKgo+ID4+
ICsgKiBDb3B5cmlnaHQgKEMpIFNUTWljcm9lbGVjdHJvbmljcyAyMDIzIC0gQWxsIFJpZ2h0cyBS
ZXNlcnZlZAo+ID4+ICsgKiBBdXRob3I6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5h
bmRlekBmb3NzLnN0LmNvbT4gZm9yIFNUTWljcm9lbGVjdHJvbmljcy4KPiA+PiArICovCj4gPj4g
Kwo+ID4+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gPj4gKyNpbmNsdWRlIDxsaW51eC9vZl9h
ZGRyZXNzLmg+Cj4gPj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+PiAr
Cj4gPj4gKyNpbmNsdWRlICJjbGstc3RtMzItY29yZS5oIgo+ID4+ICsjaW5jbHVkZSAicmVzZXQt
c3RtMzIuaCIKPiA+PiArI2luY2x1ZGUgInN0bTMybXAyNV9yY2MuaCIKPiA+PiArCj4gPj4gKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLmg+Cj4gPj4gKyNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9yZXNldC9zdCxzdG0zMm1wMjUtcmNjLmg+Cj4gPj4gKwo+ID4+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSBhZGMxMl9zcmNbXSA9IHsKPiA+PiAr
ICAgICAgIHsgLm5hbWUgPSAiY2tfZmxleGdlbl80NiIgfSwKPiA+IFRoaXMgaXMgYSBuZXcgZHJp
dmVyLiBEb24ndCB1c2UgLm5hbWUgaGVyZS4gSW5zdGVhZCB1c2UgLmluZGV4IG9yIC5odwo+ID4g
YW5kIGlmIHRoYXQgY2FuJ3Qgd29yayB0aGVuIHVzZSAuZndfbmFtZS4KPiAKPiBUaGVzZSBwYXJl
bnQgY2xvY2tzIGFyZSBtYW5hZ2VkIGJ5IGEgc2VjdXJlIHdvcmxkIGFuZCBleHBvc2VkIHRocm91
Z2ggU0NNSS4KPiAKPiBJZiBJIHVzZSAuaW5kZXggb3IgLmZ3X25hbWUsIGRvIEkgaGF2ZSB0byBl
eHBvc2UgMTIyIGNsb2NrcyBpbiBteSBEVCBub2RlID8KPiAKPiBUaGlzIHdpbGwgc2lnbmlmaWNh
bnRseSBpbmNyZWFzZSB0aGUgc2l6ZSBvZiB0aGUgRFQgZmlsZQo+IAo+ICDCoMKgwqAgwqDCoMKg
IMKgwqDCoCBjbG9jay1uYW1lcyA9ICJoc2UiLCAiaHNpIiwgLi4uLCAiY2tfc2NtaV9zdG01MDAi
Owo+ICDCoMKgIMKgwqDCoMKgIMKgwqDCoCBjbG9ja3MgPSA8JnNjbWlfY2xrIENLX1NDTUlfSFNF
PiwgPCZzY21pX2NsayBDS19TQ01JX0hTST4swqAgCj4gLi4uICwgwqAgPCZzY21pX2NsayBDS19T
Q01JX1NUTTUwMD47Cj4gCgpZZXM/IFdlIHdhbnQgRFQgdG8gZXhwcmVzcyB0aGUgY29ubmVjdGlv
bnMgYmV0d2VlbiBkZXZpY2Ugbm9kZXMsIGFuZCBpZgp0aGUgY2xrcyBtYW5hZ2VkIGJ5IFNDTUkg
YXJlIGNvbnN1bWVkIGhlcmUgdGhlbiB0aGV5IG5lZWQgdG8gYmUKc3BlY2lmaWVkIHZpYSB0aGUg
Y2xvY2tzIHByb3BlcnR5LgoKPiAKPiA+Cj4gPj4gKyAgICAgICB7IH0KPiA+PiArfTsKPiA+PiAr
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RtMzJtcDI1X21hdGNoX2RhdGEpOwo+ID4+ICsKPiA+
PiArc3RhdGljIGludCBnZXRfY2xvY2tfZGVwcyhzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiBXaGF0
IGlzIHRoZSBleHBsYW5hdGlvbiBmb3IgdGhpcyBmdW5jdGlvbj8KPiAKPiBJdCAncyB0byBtYW5h
Z2UgdGhlIGRlcGVuZGVuY3kgd2l0aCB0aGUgU0NNSSBjbG9jayBkcml2ZXIuCgpQbGVhc2UgZWxh
Ym9yYXRlLiBBcmUgeW91IG1ha2luZyBzdXJlIHRoZSBTQ01JIGNsayBkcml2ZXIgaGFzIHByb2Jl
ZApiZWZvcmUgdGhpcyBkcml2ZXI/IFdoeT8gV2hhdCdzIHdyb25nIHdpdGggcHJvYmluZyB0aGlz
IGRyaXZlciBmaXJzdD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
