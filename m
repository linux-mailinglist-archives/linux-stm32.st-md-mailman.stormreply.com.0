Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59657B3DAE3
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Sep 2025 09:16:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8AFCC3F952;
	Mon,  1 Sep 2025 07:16:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B409CC35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 Aug 2025 01:30:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 69D04601A3;
 Sun, 31 Aug 2025 01:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13E7C4CEEB;
 Sun, 31 Aug 2025 01:30:22 +0000 (UTC)
Message-ID: <abac67ba-7aff-4ed2-937e-b483cffc635f@kernel.og>
Date: Sat, 30 Aug 2025 20:30:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Gerlach <matthew.gerlach@altera.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 dinguyen@kernel.org, maxime.chevallier@bootlin.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250724154052.205706-1-matthew.gerlach@altera.com>
 <20250724154052.205706-3-matthew.gerlach@altera.com>
 <13467efc-7c79-4d06-af1c-301b852a530c@altera.com>
 <a70d060d-f1c8-4147-8f1b-1c7ce6360252@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.og>
In-Reply-To: <a70d060d-f1c8-4147-8f1b-1c7ce6360252@altera.com>
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:16:14 +0000
Cc: Mun Yew Tham <mun.yew.tham@altera.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/4] arm64: dts: Agilex5 Add gmac nodes
 to DTSI for Agilex5
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

Ck9uIDgvMTEvMjUgMTA6NDAsIE1hdHRoZXcgR2VybGFjaCB3cm90ZToKPgo+Cj4gT24gOC80LzI1
IDc6NTcgQU0sIE1hdHRoZXcgR2VybGFjaCB3cm90ZToKPj4KPj4gT24gNy8yNC8yNSA4OjQwIEFN
LCBNYXR0aGV3IEdlcmxhY2ggd3JvdGU6Cj4+ID4gRnJvbTogTXVuIFlldyBUaGFtIDxtdW4ueWV3
LnRoYW1AYWx0ZXJhLmNvbT4KPj4gPgo+PiA+IEFkZCB0aGUgYmFzZSBkZXZpY2UgdHJlZSBub2Rl
cyBmb3IgZ21hYzAsIGdtYWMxLCBhbmQgZ21hYzIgdG8gdGhlIERUU0kKPj4gPiBmb3IgdGhlIEFn
aWxleDUgU09DRlBHQS7CoCBBZ2lsZXg1IGhhcyB0aHJlZSBFdGhlcm5ldCBjb250cm9sbGVycyAK
Pj4gYmFzZWQgb24KPj4gPiBTeW5vcHN5cyBEV0MgWEdNQUMgSVAgdmVyc2lvbiAyLjEwLgo+PiA+
Cj4+ID4gU2lnbmVkLW9mZi1ieTogTXVuIFlldyBUaGFtIDxtdW4ueWV3LnRoYW1AYWx0ZXJhLmNv
bT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEdlcmxhY2ggPG1hdHRoZXcuZ2VybGFjaEBh
bHRlcmEuY29tPgo+PiA+IC0tLQo+PiA+IHYyOgo+PiA+wqDCoCAtIFJlbW92ZSBnZW5lcmljIGNv
bXBhdGlibGUgc3RyaW5nIGZvciBBZ2lsZXg1Lgo+PiA+IC0tLQo+PiA+wqDCoCAuLi4vYXJtNjQv
Ym9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1LmR0c2kgfCAzMzYgCj4+ICsrKysrKysrKysr
KysrKysrKwo+PiA+wqDCoCAxIGZpbGUgY2hhbmdlZCwgMzM2IGluc2VydGlvbnMoKykKPj4gPgo+
PiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4
NS5kdHNpIAo+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1LmR0
c2kKPj4gPiBpbmRleCA3ZDkzOTRhMDQzMDIuLjA0ZTk5Y2Q3ZTc0YiAxMDA2NDQKPj4gPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5kdHNpCj4+ID4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9zb2NmcGdhX2FnaWxleDUuZHRzaQo+PiA+IEBA
IC00ODYsNSArNDg2LDM0MSBAQCBxc3BpOiBzcGlAMTA4ZDIwMDAgewo+PiA+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JnFzcGlfY2xrPjsKPj4gPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gPsKgwqDCoMKgwqDCoMKgwqDC
oMKgIH07Cj4+Cj4+IElzIHRoZXJlIGFueSBmZWVkYmFjayBmb3IgdGhpcyBwYXRjaCBhbmQgdGhl
IG5leHQgb25lIGluIHRoZSBzZXJpZXMsCj4+ICJbUEFUQ0ggdjIgMy80XSBhcm02NDogZHRzOiBz
b2NmcGdhOiBhZ2lsZXg1OiBlbmFibGUgZ21hYzIgb24gdGhlCj4+IEFnaWxleDUgZGV2IGtpdCI/
Cj4+Cj4+IFRoYW5rcywKPj4gTWF0dGhldyBHZXJsYWNoCj4KPiBKdXN0IGNoZWNraW5nIGluIGFn
YWluLiBJcyB0aGVyZSBhbnkgZmVlZGJhY2sgb24gdGhpcyBwYXRjaCAodjIgMi80KSAKPiBvciB0
aGUgbmV4dCBwYXRjaCAodjIgMy80KT8KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjUwNzI0MTU0MDUyLjIwNTcwNi0xLW1hdHRoZXcuZ2VybGFjaEBhbHRlcmEuY29tL1QvI20yYTVm
OWEzZDIyZGZlZjA5NDk4NmZkOGE0MjEwNTFmNTU2NjdiNDI3IAo+Cj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDI1MDcyNDE1NDA1Mi4yMDU3MDYtMS1tYXR0aGV3LmdlcmxhY2hAYWx0
ZXJhLmNvbS9ULyNtM2UzZDk3NzRkYmRiMzRkNjQ2YjUzYzA0YzQ2ZWM0OWQzMjI1NDU0NCAKPgo+
CgpBcHBsaWVkIQoKVGhhbmtzLAoKRGluaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
