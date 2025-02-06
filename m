Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF36A2A1C3
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 08:05:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 546E7C78F88;
	Thu,  6 Feb 2025 07:05:51 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA340C78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 07:05:43 +0000 (UTC)
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
 by mx.socionext.com with ESMTP; 06 Feb 2025 16:05:41 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
 by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 139D8200705C;
 Thu,  6 Feb 2025 16:05:41 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with
 ESMTP; Thu, 6 Feb 2025 16:05:41 +0900
Received: from [192.168.1.141] (unknown [10.213.44.71])
 by iyokan2.css.socionext.com (Postfix) with ESMTP id 14A9CAB188;
 Thu,  6 Feb 2025 16:05:40 +0900 (JST)
Message-ID: <ac319cf8-5501-40f2-bf23-fc04a91d4f1f@socionext.com>
Date: Thu, 6 Feb 2025 16:05:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Yanteng Si <si.yanteng@linux.dev>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
 <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
 <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk> <20250203142342.145af901@kernel.org>
 <f728a006-e588-4eab-b667-b1ff7dfd66c5@linux.dev>
 <Z6N4J-_C3lq5a_VQ@shell.armlinux.org.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <Z6N4J-_C3lq5a_VQ@shell.armlinux.org.uk>
Cc: Furong Xu <0x1207@gmail.com>, Petr Tesarik <petr@tesarici.cz>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Steven Price <steven.price@arm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Xi Ruoyao <xry111@xry111.site>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Allow zero for
	[tr]x_fifo_size
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

SGkgUnVzc2VsbCwKCk9uIDIwMjUvMDIvMDUgMjM6MzksIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3
cm90ZToKPiBPbiBXZWQsIEZlYiAwNSwgMjAyNSBhdCAxMDoyMjowMFBNICswODAwLCBZYW50ZW5n
IFNpIHdyb3RlOgo+Pgo+PiDlnKggMi80LzI1IDA2OjIzLCBKYWt1YiBLaWNpbnNraSDlhpnpgZM6
Cj4+PiBPbiBNb24sIDMgRmViIDIwMjUgMTE6MTY6MzQgKzAwMDAgUnVzc2VsbCBLaW5nIChPcmFj
bGUpIHdyb3RlOgo+Pj4+PiBJJ3ZlIG5vIG9waW5pb24gd2hldGhlciB0aGUgb3JpZ2luYWwgc2Vy
aWVzICJoYWQgdmFsdWUiIC0gSSdtIGp1c3QKPj4+Pj4gdHJ5aW5nIHRvIGZpeCB0aGUgYnJlYWth
Z2UgdGhhdCBlbnRhaWxlZC4gTXkgZmlyc3QgYXR0ZW1wdCBhdCBhCj4+Pj4+IHBhdGNoCj4+Pj4+
IHdhcyBpbmRlZWQgYSAocGFydGlhbCkgcmV2ZXJ0LCBidXQgQW5kcmV3IHdhcyBrZWVuIHRvIGZp
bmQgYSBiZXR0ZXIKPj4+Pj4gc29sdXRpb25bMV0uCj4+Pj4gVGhlcmUgYXJlIHR3byB3YXlzIHRv
IGZpeCB0aGUgYnJlYWthZ2UgLSBlaXRoZXIgcmV2ZXJ0IHRoZSBvcmlnaW5hbAo+Pj4+IHBhdGNo
ZXMgKHdoaWNoIGlmIHRoZXkgaGF2ZSBsaXR0bGUgdmFsdWUgbm93IHdvdWxkIGJlIHRoZSBzZW5z
aWJsZQo+Pj4+IGFwcHJvYWNoIElNSE8pCj4+PiArMSwgSSBhbHNvIHZvdGUgcmV2ZXJ0IEZXSVcK
Pj4KPj4gKzEsIHNhbWUgaGVyZS4KPj4KPj4KPj4gRm9yIGEgZHJpdmVyIHRoYXQgcnVucyBvbiBz
byBtdWNoIGhhcmR3YXJlLCB3ZSBuZWVkIHRvIGFjdAo+Pgo+PiBjYXV0aW91c2x5LiBBIGNydWNp
YWwgcHJlcmVxdWlzaXRlIGlzIHRoYXQgY29kZSBjaGFuZ2VzIG11c3QKPj4KPj4gbmV2ZXIgY2F1
c2Ugc29tZSBoYXJkd2FyZSB0byBtYWxmdW5jdGlvbi4gSSB3YXMgdG9vIHNpbXBsaXN0aWMKPj4K
Pj4gaW4gbXkgdGhpbmtpbmcgd2hlbiByZXZpZXdpbmcgdGhpcyBiZWZvcmUsIGFuZCBJIHNpbmNl
cmVseQo+Pgo+PiBhcG9sb2dpemUgZm9yIHRoYXQuCj4+Cj4+Cj4+IFN0ZXZlbiwgdGhhbmsgeW91
IGZvciB5b3VyIHRlc3RzLCBMZXQncyByZXZlcnQgaXQuCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci9FMXRmZXlSLTAwM1lHSi1HYkBybWstUEMuYXJtbGludXgub3JnLnVrCgpJJ20gc29y
cnkgdG8gYm90aGVyIHlvdS4gVGhhbmtzIGZvciBwb3N0aW5nIHJldmVydC4KClRoZXJlIGFyZSB2
YXJpYXRpb25zIGluIHRoZSBjYXBhYmlsaXRpZXMgdGhhdCB0aGUgaGFyZHdhcmUgaGFzLCBhbmQg
bW9yZQpoYXJkd2FyZSBuZWVkcyB0byBiZSB2ZXJpZmllZCB0byBzaG93IHRoYXQgdGhleSB3b3Jr
IGNvcnJlY3RseSwgc28gaXQgaGFkCnRvIGJlIGhhbmRsZWQgY2FyZWZ1bGx5LiBSZXBvcnRzIHRo
YXQgdGhlIGNoYW5nZSBwYXRjaCAid29ya2VkIiBvcgoiZGlkbid0IHdvcmsiIG9uIGFueSBoYXJk
d2FyZSBhcmUgaGVscGZ1bC4KCkkgYXBvbG9naXplIHRoYXQgcG9zdGluZyB0aGlzIGNoYW5nZSB0
byAiLW5ldCIgd2FzIGluYXBwcm9wcmlhdGUKYmVjYXVzZSBJIGFkZGVkIGEgY29tcGxldGVseSBu
ZXcgZmVhdHVyZS4KClRoYW5rIHlvdSwKCi0tLQpCZXN0IFJlZ2FyZHMKS3VuaWhpa28gSGF5YXNo
aQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
