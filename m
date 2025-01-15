Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478DA11D73
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 10:23:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAA77C78F76;
	Wed, 15 Jan 2025 09:23:23 +0000 (UTC)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CE47C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 09:23:16 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5af1b4.dynamic.kabel-deutschland.de
 [95.90.241.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9D6D261E64783;
 Wed, 15 Jan 2025 10:22:10 +0100 (CET)
Message-ID: <990a3fc9-7fd6-49b6-8918-d5bf4ae48953@molgen.mpg.de>
Date: Wed, 15 Jan 2025 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joey Lu <a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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

RGVhciBKb2V5LAoKClRoYW5rIHlvdSBmb3IgeW91ciBwcm9tcHQgcmVwbHkuCgoKQW0gMTUuMDEu
MjUgdW0gMTA6MDMgc2NocmllYiBKb2V5IEx1OgoKPiBQYXVsIE1lbnplbCDmlrwgMS8xNC8yMDI1
IDk6NDkgQU0g5a+r6YGTOgoKW+KApl0KCj4+IEFtIDEzLjAxLjI1IHVtIDAwOjU0IHNjaHJpZWIg
Sm9leSBMdToKPj4+IEFkZCBzdXBwb3J0IGZvciBHaWdhYml0IEV0aGVybmV0IG9uIE51dm90b24g
TUEzNSBzZXJpZXMgdXNpbmcgZHdtYWMgCj4+PiBkcml2ZXIuCgpb4oCmXQoKPj4gQWxzbywgcGxl
YXNlIGRvY3VtZW50IGhvdyB0ZXN0ZWQgdGhlIGRyaXZlci4gTWF5YmUgZXZlbiBwYXN0ZSBuZXcg
bG9nIAo+PiBtZXNzYWdlcy4KPiAKPiBUaGVzZSBhcmUgdGhlIGtlcm5lbCBjb25maWd1cmF0aW9u
cyBmb3IgdGVzdGluZyB0aGUgTUEzNUQxIEdNQUMgZHJpdmVyOiAKPiBBUkNIX01BMzUsIFNUTU1B
Q19QTEFURk9STSwgRFdNQUNfTlVWT1RPTi4KPiAKPiBJJ20gbm90IHN1cmUgaWYgdGhpcyBpbmZv
cm1hdGlvbiBpcyBzdWZmaWNpZW50LCBzbyBwbGVhc2UgcHJvdmlkZSBzb21lIAo+IGd1aWRhbmNl
IG9uIHdoYXQgZWxzZSBJIHNob3VsZCBpbmNsdWRlIHRvIG1lZXQgeW91ciByZXF1aXJlbWVudHMu
CgpJ4oCZZCBiZSBpbnRlcmVzdGVkIG9uIHdoYXQgaGFyZHdhcmUgeW91IHRlc3RlZCBpdC4gUHJv
YmFibHkgc29tZSAKZXZhbHVhdGlvbiBvciBjdXN0b21lciByZWZlcmVuY2UgYm9hcmQuCgo+IEkg
d2lsbCBpbmNsdWRlIHRoZSBsb2cgbWVzc2FnZXMgYXQgdGhlIGVuZCBvZiB0aGUgZW1haWwuCgpB
d2Vzb21lLiBUaGFuayB5b3UuIFBlcnNvbmFsbHksIEkgYWxzbyBsaWtlIHRvIHNlZSB0aG9zZSBp
biB0aGUgY29tbWl0IAptZXNzYWdlLgoKPj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgTHVubiA8YW5k
cmV3QGx1bm4uY2g+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2V5IEx1IDxhMDk4NzIwMzA2OUBnbWFp
bC5jb20+Cj4+Cj4+IEFzIHlvdSB1c2UgeW91ciBjb21wYW55IGVtYWlsIGFkZHJlc3MgaW4gdGhl
IEFVVEhPUiBsaW5lIGJlbG93LCBwbGVhc2UgCj4+IGFsc28gYWRkIHRoYXQgZW1haWwgYWRkcmVz
cyB0byB0aGUgY29tbWl0IG1lc3NhZ2UgKGFuZCBtYXliZSBldmVuIGFzIAo+PiB0aGUgYXV0aG9y
KS4KPgo+IEkgd2lsbCB1cGRhdGUgdGhlIEFVVEhPUiB0byB1c2UgbXkgcGVyc29uYWwgZW1haWwg
YWRkcmVzcyBpbnN0ZWFkIG9mIHRoZSAKPiBjb21wYW55IGVtYWlsLgoKVW5kZXJzdG9vZC4gKHlj
bHU0QG51dm90b24uY29tIGlzIGFsc28gcGVyc29uYWwsIGJ1dCB0aGUgR21haWwgYWRkcmVzcyAK
aXMgcHJpdmF0ZSwgSSBndWVzcy4gOy0pKS4KCkZvciBzdGF0aXN0aWNzLCBob3cgY29tcGFuaWVz
IGNvbnRyaWJ1dGUgdG8gdGhlIExpbnV4IGtlcm5lbCwgaGF2aW5nIHRoZSAKY29tcGFueSBhZGRy
ZXNzIHNvbWV3aGVyZSB3b3VsZCBiZSBuaWNlIHRob3VnaCwgYXMgeW91IGFyZSBkb2luZyB0aGlz
IGFzIAp5b3VyIHdvcmsgYXQgTnV2b3RvbiwgcmlnaHQ/Cgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnwqDCoCB8wqAgMTEgKysKPj4+IMKg
IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlwqAgfMKgwqAgMSAr
Cj4+PiDCoCAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbnV2b3Rvbi5jwqDCoCB8
IDE3OSArKysrKysrKysrKysrKysrKysKPj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTkxIGluc2Vy
dGlvbnMoKykKPj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1udXZvdG9uLmMKClvigKZdCgo+IGxvZzoKPiAKPiBbwqDCoMKg
IFQwXSBCb290aW5nIExpbnV4IG9uIHBoeXNpY2FsIENQVSAweDAwMDAwMDAwMDAgWzB4NDExZmQw
NDBdCgpPdXQgb2YgY3VyaW9zaXR5LCBob3cgZG8geW91IGdldCB0aGVzZSB0aW1lc3RhbXBzIFQw
LCBUMSwg4oCmPwoKW+KApl0KCgpUaGFuayB5b3UgYW5kIGtpbmQgcmVnYXJkcywKClBhdWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
