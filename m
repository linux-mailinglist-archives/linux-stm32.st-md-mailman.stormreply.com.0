Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77499C6CB
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 12:10:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02E12C78013;
	Mon, 14 Oct 2024 10:10:18 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FEE5C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2024 10:10:10 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B3B7589041;
 Mon, 14 Oct 2024 12:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728900609;
 bh=QiUcJ5vcf2TcgSQTpOZdp1C5MCiNDwYEw8zZRWzqkOQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LEXhWo72oK2AmGD8j3W9kqbymw42C0DBbUTfe37wOqQys1PXaBp6JVKvvAH5GnACD
 ek6Em+m1PMzxDRFjkHwSbGeDCe0bgFoNT5hAzDDUNVGbjDIJtY3sgkV2l9vwWwXfDX
 z6lzHMIVks6PVUSEVTwYeFMRevzWp1zwI0m9nu02C8JwirmjCmu85DgG+r0dqbdPLa
 eCDQ3/WEnp2EAkSzxzclufuRqiLXeNVfr9g+spBiXgvvQXhxAlzoG60kjC5nH39eQo
 cKC2Y844XhDSVurTFJ8YG/ZJe0MeUN6UoMJPkK0liyrcZcnXEVJC8ugStDdiSPfUva
 PfwrYm3wh3WFw==
Message-ID: <8c13b0aa-7fb1-493c-9abc-5e5cfd982855@denx.de>
Date: Mon, 14 Oct 2024 10:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
References: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
 <20241011-rng-mp25-v2-v2-2-76fd6170280c@foss.st.com>
 <318dbd5e-f547-4d78-b42e-4dcacc08d328@denx.de>
 <f191d034-4116-4169-8c05-201450412bbd@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f191d034-4116-4169-8c05-201450412bbd@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/4] hwrng: stm32 - implement support
 for STM32MP25x platforms
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

T24gMTAvMTQvMjQgMTA6MzggQU0sIEdhdGllbiBDSEVWQUxMSUVSIHdyb3RlOgo+IAo+IAo+IE9u
IDEwLzExLzI0IDE4OjE3LCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gMTAvMTEvMjQgNTo0MSBQ
TSwgR2F0aWVuIENoZXZhbGxpZXIgd3JvdGU6Cj4+Cj4+IFsuLi5dCj4+Cj4+PiBAQCAtNTUxLDYg
KzU2NSw0MSBAQCBzdGF0aWMgaW50IHN0bTMyX3JuZ19wcm9iZShzdHJ1Y3QgCj4+PiBwbGF0Zm9y
bV9kZXZpY2UgKm9mZGV2KQo+Pj4gwqDCoMKgwqDCoCBwcml2LT5ybmcucmVhZCA9IHN0bTMyX3Ju
Z19yZWFkOwo+Pj4gwqDCoMKgwqDCoCBwcml2LT5ybmcucXVhbGl0eSA9IDkwMDsKPj4+ICvCoMKg
wqAgaWYgKCFwcml2LT5kYXRhLT5uYl9jbG9jayB8fCBwcml2LT5kYXRhLT5uYl9jbG9jayA+IDIp
Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+PiArCj4+PiArwqDCoMKgIHBy
aXYtPmNsa19idWxrID0gZGV2bV9remFsbG9jKGRldiwgcHJpdi0+ZGF0YS0+bmJfY2xvY2sgKiAK
Pj4+IHNpemVvZigqcHJpdi0+Y2xrX2J1bGspLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4+ICvCoMKgwqAgaWYgKCFwcml2LT5j
bGtfYnVsaykKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4KPj4gVHJ5IHRo
aXM6Cj4+Cj4+IHJldCA9IGRldm1fY2xrX2J1bGtfZ2V0KGRldiwgcHJpdi0+ZGF0YS0+bmJfY2xv
Y2ssIHByaXYtPmNsa19idWxrKTsKPj4gLi4uCj4+IC8vIFN3YXAgdGhlIGNsb2NrIGlmIHRoZXkg
YXJlIG5vdCBpbiB0aGUgcmlnaHQgb3JkZXI6Cj4+IGlmIChwcml2LT5kYXRhLT5uYl9jbG9jayA9
PSAyICYmCj4+IMKgwqDCoMKgIHN0cmNtcChfX2Nsa19nZXRfbmFtZShwcml2LT5jbGtfYnVsa1sw
XS5jbGspLCAiY29yZSIpKQo+PiB7Cj4+IMKgwqBjb25zdCBjaGFyICppZCA9IHByaXYtPmNsa19i
dWxrWzFdLmlkOwo+PiDCoMKgc3RydWN0IGNsayAqY2xrID0gcHJpdi0+Y2xrX2J1bGtbMV0uY2xr
Owo+PiDCoMKgcHJpdi0+Y2xrX2J1bGtbMV0uaWQgPSBwcml2LT5jbGtfYnVsa1swXS5pZDsKPj4g
wqDCoHByaXYtPmNsa19idWxrWzFdLmNsayA9IHByaXYtPmNsa19idWxrWzBdLmNsazsKPj4gwqDC
oHByaXYtPmNsa19idWxrWzBdLmlkID0gaWQ7Cj4+IMKgwqBwcml2LT5jbGtfYnVsa1swXS5jbGsg
PSBjbGs7Cj4+IH0KPj4KPiAKPiBIaSBNYXJlaywKPiAKPiBUaGlzIHdvbid0IHdvcmsgYXMgdGhl
IG5hbWUgcmV0dXJuZWQgYnkgdGhpcyBBUEkgaXMgY2xrLT5jb3JlLT5uYW1lLgo+IEFGQUlDVCwg
aXQgZG9lc24ndCBjb3JyZXNwb25kIHRvIHRoZSBuYW1lcyBwcmVzZW50IGluIHRoZSBkZXZpY2Ug
dHJlZQo+IHVuZGVyIHRoZSAiY2xvY2stbmFtZXMiIHByb3BlcnR5Lgo+IEFueSBvdGhlciBpZGVh
IG9yIGFyZSB5b3UgZmluZSB3aXRoIHdoYXQncyBiZWxvdz8KSG1tbSwgaXQgaXMgbm90IGdyZWF0
LCBidXQgYXQgbGVhc3QgaXQgcmVkdWNlcyB0aGUgY2hhbmdlcyB0aHJvdWdob3V0IAp0aGUgZHJp
dmVyLCBzbyB0aGF0IGlzIGFuIGltcHJvdmVtZW50LgoKSSBndWVzcyBvbmUgY291bGQgZG8gc29t
ZSBvZl9jbGtfZ2V0KCkgYW5kIGNsa19pc19tYXRjaCgpIGluIHByb2JlIHRvIApsb29rIHVwIHRo
ZSBjbG9jayBpbiBPRiBieSBuYW1lIGFuZCB0aGVuIGNvbXBhcmUgd2hpY2ggY2xvY2sgaXMgd2hp
Y2ggCmJlZm9yZSBzd2FwcGluZyB0aGVtIGluIGNsa19idWxrW10gYXJyYXksIGJ1dCB0aGF0IG1p
Z2h0IGJlIHRvbyBjb252b2x1dGVkPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
