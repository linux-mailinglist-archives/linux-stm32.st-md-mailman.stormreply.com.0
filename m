Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040699F375
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 18:55:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C801AC78031;
	Tue, 15 Oct 2024 16:55:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E972C78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 16:55:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3DE6488902;
 Tue, 15 Oct 2024 18:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729011336;
 bh=QHhwrY1OnwvNGfEUyssvc2Kp8cTGixua2i+C3QVWTJA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dyJ8JWfXSmudK9OM2hQM9dVmZrvvT0iXNqJHyvWZ2VXUoxwgWLMBMweWn8T9fNOKs
 vxSZYUaq2/c1SZ86iItJjYMIilm+xFL2O2j2TGYi1u8bgAxShISfHxDeAE85OFCHEJ
 UhX8yVhFntN8moe94pz6c/4ZncANv18yFo9e2DHS0SVT6iXCuNFyQIyXm5FJohniSm
 kEwF7ivBjfZGaVAzP15erINsaoQggG02WZw7urXusgY3IuYGw9S69czOEfJv9HXIMm
 wJd2OzP1yAp9GleZrhHiUuLapMmg+NvX1xbspUSwJxv5yI0Nr1ZzSRlrRaDnel7Vh3
 ivKinliNgLcOg==
Message-ID: <e5a21bb8-00c3-41f1-9a4d-856eb1465d45@denx.de>
Date: Tue, 15 Oct 2024 17:39:51 +0200
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
 <8c13b0aa-7fb1-493c-9abc-5e5cfd982855@denx.de>
 <d862765e-e396-4f7c-97ff-76df9aa03216@foss.st.com>
 <dca83197-3484-4d6b-8507-118bf9e80e19@denx.de>
 <b06b5d09-190b-4567-aecd-4be1f1dee172@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b06b5d09-190b-4567-aecd-4be1f1dee172@foss.st.com>
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

T24gMTAvMTUvMjQgNToxMCBQTSwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4gCj4gCj4gT24g
MTAvMTQvMjQgMjA6NTUsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAxMC8xNC8yNCAyOjM2IFBN
LCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMTAvMTQvMjQgMTA6NTIs
IE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+IE9uIDEwLzE0LzI0IDEwOjM4IEFNLCBHYXRpZW4gQ0hF
VkFMTElFUiB3cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMTAvMTEvMjQgMTg6MTcsIE1hcmVr
IFZhc3V0IHdyb3RlOgo+Pj4+Pj4gT24gMTAvMTEvMjQgNTo0MSBQTSwgR2F0aWVuIENoZXZhbGxp
ZXIgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gWy4uLl0KPj4+Pj4+Cj4+Pj4+Pj4gQEAgLTU1MSw2ICs1
NjUsNDEgQEAgc3RhdGljIGludCBzdG0zMl9ybmdfcHJvYmUoc3RydWN0IAo+Pj4+Pj4+IHBsYXRm
b3JtX2RldmljZSAqb2ZkZXYpCj4+Pj4+Pj4gwqDCoMKgwqDCoCBwcml2LT5ybmcucmVhZCA9IHN0
bTMyX3JuZ19yZWFkOwo+Pj4+Pj4+IMKgwqDCoMKgwqAgcHJpdi0+cm5nLnF1YWxpdHkgPSA5MDA7
Cj4+Pj4+Pj4gK8KgwqDCoCBpZiAoIXByaXYtPmRhdGEtPm5iX2Nsb2NrIHx8IHByaXYtPmRhdGEt
Pm5iX2Nsb2NrID4gMikKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+
Pj4+Pj4gKwo+Pj4+Pj4+ICvCoMKgwqAgcHJpdi0+Y2xrX2J1bGsgPSBkZXZtX2t6YWxsb2MoZGV2
LCBwcml2LT5kYXRhLT5uYl9jbG9jayAqIAo+Pj4+Pj4+IHNpemVvZigqcHJpdi0+Y2xrX2J1bGsp
LAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQ
X0tFUk5FTCk7Cj4+Pj4+Pj4gK8KgwqDCoCBpZiAoIXByaXYtPmNsa19idWxrKQo+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4+Pj4+Cj4+Pj4+PiBUcnkgdGhpczoKPj4+
Pj4+Cj4+Pj4+PiByZXQgPSBkZXZtX2Nsa19idWxrX2dldChkZXYsIHByaXYtPmRhdGEtPm5iX2Ns
b2NrLCBwcml2LT5jbGtfYnVsayk7Cj4+Pj4+PiAuLi4KPj4+Pj4+IC8vIFN3YXAgdGhlIGNsb2Nr
IGlmIHRoZXkgYXJlIG5vdCBpbiB0aGUgcmlnaHQgb3JkZXI6Cj4+Pj4+PiBpZiAocHJpdi0+ZGF0
YS0+bmJfY2xvY2sgPT0gMiAmJgo+Pj4+Pj4gwqDCoMKgwqAgc3RyY21wKF9fY2xrX2dldF9uYW1l
KHByaXYtPmNsa19idWxrWzBdLmNsayksICJjb3JlIikpCj4+Pj4+PiB7Cj4+Pj4+PiDCoMKgY29u
c3QgY2hhciAqaWQgPSBwcml2LT5jbGtfYnVsa1sxXS5pZDsKPj4+Pj4+IMKgwqBzdHJ1Y3QgY2xr
ICpjbGsgPSBwcml2LT5jbGtfYnVsa1sxXS5jbGs7Cj4+Pj4+PiDCoMKgcHJpdi0+Y2xrX2J1bGtb
MV0uaWQgPSBwcml2LT5jbGtfYnVsa1swXS5pZDsKPj4+Pj4+IMKgwqBwcml2LT5jbGtfYnVsa1sx
XS5jbGsgPSBwcml2LT5jbGtfYnVsa1swXS5jbGs7Cj4+Pj4+PiDCoMKgcHJpdi0+Y2xrX2J1bGtb
MF0uaWQgPSBpZDsKPj4+Pj4+IMKgwqBwcml2LT5jbGtfYnVsa1swXS5jbGsgPSBjbGs7Cj4+Pj4+
PiB9Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBIaSBNYXJlaywKPj4+Pj4KPj4+Pj4gVGhpcyB3b24ndCB3
b3JrIGFzIHRoZSBuYW1lIHJldHVybmVkIGJ5IHRoaXMgQVBJIGlzIGNsay0+Y29yZS0+bmFtZS4K
Pj4+Pj4gQUZBSUNULCBpdCBkb2Vzbid0IGNvcnJlc3BvbmQgdG8gdGhlIG5hbWVzIHByZXNlbnQg
aW4gdGhlIGRldmljZSB0cmVlCj4+Pj4+IHVuZGVyIHRoZSAiY2xvY2stbmFtZXMiIHByb3BlcnR5
Lgo+Pj4+PiBBbnkgb3RoZXIgaWRlYSBvciBhcmUgeW91IGZpbmUgd2l0aCB3aGF0J3MgYmVsb3c/
Cj4+Pj4gSG1tbSwgaXQgaXMgbm90IGdyZWF0LCBidXQgYXQgbGVhc3QgaXQgcmVkdWNlcyB0aGUg
Y2hhbmdlcyAKPj4+PiB0aHJvdWdob3V0IHRoZSBkcml2ZXIsIHNvIHRoYXQgaXMgYW4gaW1wcm92
ZW1lbnQuCj4+Pj4KPj4+PiBJIGd1ZXNzIG9uZSBjb3VsZCBkbyBzb21lIG9mX2Nsa19nZXQoKSBh
bmQgY2xrX2lzX21hdGNoKCkgaW4gcHJvYmUgCj4+Pj4gdG8gbG9vayB1cCB0aGUgY2xvY2sgaW4g
T0YgYnkgbmFtZSBhbmQgdGhlbiBjb21wYXJlIHdoaWNoIGNsb2NrIGlzIAo+Pj4+IHdoaWNoIGJl
Zm9yZSBzd2FwcGluZyB0aGVtIGluIGNsa19idWxrW10gYXJyYXksIGJ1dCB0aGF0IG1pZ2h0IGJl
IAo+Pj4+IHRvbyBjb252b2x1dGVkPwo+Pj4KPj4+IFllcywgcHJvYmFibHkgdG9vIG11Y2guIFdo
YXQncyBwcmVzZW50IGluIHRoZSBwYXRjaCBpcyBub3QgY2xvc2UgdG8KPj4+IHBlcmZlY3Rpb24g
YnV0IGhhcyB0aGUgYWR2YW50YWdlIG9mIGJlaW5nIHN0cmFpZ2h0Zm9yd2FyZC4gSWYgd2UgYWdy
ZWUKPj4+IG9uIHRoYXQsIEknbGwgc2VuZCBhIFYzIGNvbnRhaW5pbmcgdGhlIG1vZGlmaWNhdGlv
bnMgaW4gdGhlIGJpbmRpbmdzCj4+PiBmaWxlLgo+PiBFcnJyLCBJJ20gc29ycnksIG1heWJlIHRo
ZXJlIGlzIGEgd2F5IHRvIGRvIHRoaXMgYmV0dGVyLiBMb29rIGF0IAo+PiBkcml2ZXJzL2Nsay9j
bGstYnVsay5jIDoKPj4KPj4gwqDCoDE1IHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIG9mX2Nsa19i
dWxrX2dldChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCAKPj4gaW50IG51bV9jbGtzLAo+PiDCoMKg
MTbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY2xrX2J1bGtfZGF0YSAqY2xrcykKPj4g
wqDCoDE3IHsKPj4gwqDCoDE4wqDCoMKgwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiDCoMKgMTnCoMKg
wqDCoMKgwqDCoMKgIGludCBpOwo+PiDCoMKgMjAKPj4gwqDCoDIxwqDCoMKgwqDCoMKgwqDCoCBm
b3IgKGkgPSAwOyBpIDwgbnVtX2Nsa3M7IGkrKykgewo+PiDCoMKgMjLCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjbGtzW2ldLmlkID0gTlVMTDsKPj4gwqDCoDIzwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrc1tpXS5jbGsgPSBOVUxMOwo+PiDCoMKgMjTCoMKgwqDC
oMKgwqDCoMKgIH0KPj4gwqDCoDI1Cj4+IMKgwqAyNsKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0g
MDsgaSA8IG51bV9jbGtzOyBpKyspIHsKPj4gwqDCoDI3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmdfaW5kZXgobnAsICJjbG9jay1uYW1lcyIs
IAo+PiBpLCAmY2xrc1tpXS5pZCk7Cj4+IMKgwqAyOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNsa3NbaV0uY2xrID0gb2ZfY2xrX2dldChucCwgaSk7Cj4+Cj4+IElmIEkgcmVhZCB0
aGlzIHJpZ2h0LCB0aGVuIGNsa3NbaV0uaWQgc2hvdWxkIGJlIHRoZSBEVCBjbG9jayBuYW1lLiBT
byAKPj4gdGhlIHN3YXAgY29uZGl0aW9uYWwgYWJvdmUgY291bGQgdXNlIC5pZCB0byBpZGVudGlm
eSB3aGV0aGVyIHRoZSBmaXJzdCAKPj4gcG9zaXRpb24gaXMgY29yZSBjbG9jayBvciBub3QsIGxp
a2UgdGhpczoKPj4KPj4gaWYgKHByaXYtPmRhdGEtPm5iX2Nsb2NrID09IDIgJiYKPj4gwqDCoMKg
wqAgc3RyY21wKF9fY2xrX2dldF9uYW1lKHByaXYtPmNsa19idWxrWzBdLmlkKSwgImNvcmUiKSkK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeXgo+Pgo+PiBZb3UgbWlnaHQgbmVl
ZCB0byB1c2UgZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkgdG8gYWNjZXNzIHRoZSAKPj4gb2ZfY2xr
X2J1bGtfZ2V0KCkgLgo+Pgo+PiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nIHN0aWxsID8KPiAK
PiBPb29vb2ggSSBzZWUsIGRldm1fY2xrX2J1bGtfZ2V0KCkgYW5kIGRldm1fY2xrX2J1bGtfZ2V0
X2FsbCgpIHVzZQo+IGEgZGlmZmVyZW50IHBhdGguIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHksIHRv
IGJlIGhvbmVzdC4uLiBUaGUgZG9jCj4gZG9lc24ndCBzdGF0ZSB0aGlzIGRpZmZlcmVuY2UgZWl0
aGVyLgoKSW5kZWVkLCBidXQgbWF5YmUgZ2l0IGxvZyBjb3VsZCBjbGFyaWZ5IHRoYXQgPyBJIGxl
YXJudCBhYm91dCB0aGlzIAp1c2VmdWwgdHJpY2sgYXQgbGFzdCB5ZWFyIEVtYmVkZGVkIFJlY2lw
ZXM6CgokIGdpdCBsb2cgLUw6Y2xrX2J1bGtfZ2V0X2FsbDpkcml2ZXJzL2Nsay9jbGstYnVsay5j
Cgo+IEknbGwgZ2l2ZSB0aGlzIGEgdHJ5IHdoaWxlIGFsc28gY29ycmVjdGluZyB0aGUgaXNzdWUg
dGhhdCB0aGUgcm9ib3QKPiBoaWdobGlnaHRlZC4KVGhhbmsgeW91ICEKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
