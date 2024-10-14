Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2176999D7FE
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 22:14:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDCCBC78018;
	Mon, 14 Oct 2024 20:14:23 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EB67C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2024 20:14:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AC58789018;
 Mon, 14 Oct 2024 22:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728936855;
 bh=Xb9CBRgvPOEpxga3+Wbc1szUOkY/ao1dzvTPIwjUP3o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xEiUNz/GObmtvWPz61uJu77G0Jn4coceO8KwxpAXsGvRmTR66LBk7EftBsGwcnF3x
 qCoPs0UVNrKj5jALk4qSWwuSgwvbth2+a7bMQLSzDuSdcEvhPzOLcoDe6gKqTgk/WR
 wh7TyeAdMz0StdJOMDEzXl5+8IldCLzg317YcDv6Pw27Ji1TlcyACfcfuwVgRsolHS
 +BztRJZrPUPAcnvJUWZJ7vcgVTwWa75MAa80RLhBe55mWmvUmQqthN+i5iRzJeRfpP
 E8Zh2ic4KbHCGYU05M27Lu7g1txO4o36rBR62Y9fS9tpxq1oYVUAF/Gyu5+jNUOITn
 AUa1h9bWc1OTA==
Message-ID: <dca83197-3484-4d6b-8507-118bf9e80e19@denx.de>
Date: Mon, 14 Oct 2024 20:55:05 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d862765e-e396-4f7c-97ff-76df9aa03216@foss.st.com>
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

T24gMTAvMTQvMjQgMjozNiBQTSwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4gCj4gCj4gT24g
MTAvMTQvMjQgMTA6NTIsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAxMC8xNC8yNCAxMDozOCBB
TSwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDEwLzExLzI0IDE4OjE3
LCBNYXJlayBWYXN1dCB3cm90ZToKPj4+PiBPbiAxMC8xMS8yNCA1OjQxIFBNLCBHYXRpZW4gQ2hl
dmFsbGllciB3cm90ZToKPj4+Pgo+Pj4+IFsuLi5dCj4+Pj4KPj4+Pj4gQEAgLTU1MSw2ICs1NjUs
NDEgQEAgc3RhdGljIGludCBzdG0zMl9ybmdfcHJvYmUoc3RydWN0IAo+Pj4+PiBwbGF0Zm9ybV9k
ZXZpY2UgKm9mZGV2KQo+Pj4+PiDCoMKgwqDCoMKgIHByaXYtPnJuZy5yZWFkID0gc3RtMzJfcm5n
X3JlYWQ7Cj4+Pj4+IMKgwqDCoMKgwqAgcHJpdi0+cm5nLnF1YWxpdHkgPSA5MDA7Cj4+Pj4+ICvC
oMKgwqAgaWYgKCFwcml2LT5kYXRhLT5uYl9jbG9jayB8fCBwcml2LT5kYXRhLT5uYl9jbG9jayA+
IDIpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4gKwo+Pj4+PiAr
wqDCoMKgIHByaXYtPmNsa19idWxrID0gZGV2bV9remFsbG9jKGRldiwgcHJpdi0+ZGF0YS0+bmJf
Y2xvY2sgKiAKPj4+Pj4gc2l6ZW9mKCpwcml2LT5jbGtfYnVsayksCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+Pj4+ICvCoMKg
wqAgaWYgKCFwcml2LT5jbGtfYnVsaykKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5P
TUVNOwo+Pj4+Cj4+Pj4gVHJ5IHRoaXM6Cj4+Pj4KPj4+PiByZXQgPSBkZXZtX2Nsa19idWxrX2dl
dChkZXYsIHByaXYtPmRhdGEtPm5iX2Nsb2NrLCBwcml2LT5jbGtfYnVsayk7Cj4+Pj4gLi4uCj4+
Pj4gLy8gU3dhcCB0aGUgY2xvY2sgaWYgdGhleSBhcmUgbm90IGluIHRoZSByaWdodCBvcmRlcjoK
Pj4+PiBpZiAocHJpdi0+ZGF0YS0+bmJfY2xvY2sgPT0gMiAmJgo+Pj4+IMKgwqDCoMKgIHN0cmNt
cChfX2Nsa19nZXRfbmFtZShwcml2LT5jbGtfYnVsa1swXS5jbGspLCAiY29yZSIpKQo+Pj4+IHsK
Pj4+PiDCoMKgY29uc3QgY2hhciAqaWQgPSBwcml2LT5jbGtfYnVsa1sxXS5pZDsKPj4+PiDCoMKg
c3RydWN0IGNsayAqY2xrID0gcHJpdi0+Y2xrX2J1bGtbMV0uY2xrOwo+Pj4+IMKgwqBwcml2LT5j
bGtfYnVsa1sxXS5pZCA9IHByaXYtPmNsa19idWxrWzBdLmlkOwo+Pj4+IMKgwqBwcml2LT5jbGtf
YnVsa1sxXS5jbGsgPSBwcml2LT5jbGtfYnVsa1swXS5jbGs7Cj4+Pj4gwqDCoHByaXYtPmNsa19i
dWxrWzBdLmlkID0gaWQ7Cj4+Pj4gwqDCoHByaXYtPmNsa19idWxrWzBdLmNsayA9IGNsazsKPj4+
PiB9Cj4+Pj4KPj4+Cj4+PiBIaSBNYXJlaywKPj4+Cj4+PiBUaGlzIHdvbid0IHdvcmsgYXMgdGhl
IG5hbWUgcmV0dXJuZWQgYnkgdGhpcyBBUEkgaXMgY2xrLT5jb3JlLT5uYW1lLgo+Pj4gQUZBSUNU
LCBpdCBkb2Vzbid0IGNvcnJlc3BvbmQgdG8gdGhlIG5hbWVzIHByZXNlbnQgaW4gdGhlIGRldmlj
ZSB0cmVlCj4+PiB1bmRlciB0aGUgImNsb2NrLW5hbWVzIiBwcm9wZXJ0eS4KPj4+IEFueSBvdGhl
ciBpZGVhIG9yIGFyZSB5b3UgZmluZSB3aXRoIHdoYXQncyBiZWxvdz8KPj4gSG1tbSwgaXQgaXMg
bm90IGdyZWF0LCBidXQgYXQgbGVhc3QgaXQgcmVkdWNlcyB0aGUgY2hhbmdlcyB0aHJvdWdob3V0
IAo+PiB0aGUgZHJpdmVyLCBzbyB0aGF0IGlzIGFuIGltcHJvdmVtZW50Lgo+Pgo+PiBJIGd1ZXNz
IG9uZSBjb3VsZCBkbyBzb21lIG9mX2Nsa19nZXQoKSBhbmQgY2xrX2lzX21hdGNoKCkgaW4gcHJv
YmUgdG8gCj4+IGxvb2sgdXAgdGhlIGNsb2NrIGluIE9GIGJ5IG5hbWUgYW5kIHRoZW4gY29tcGFy
ZSB3aGljaCBjbG9jayBpcyB3aGljaCAKPj4gYmVmb3JlIHN3YXBwaW5nIHRoZW0gaW4gY2xrX2J1
bGtbXSBhcnJheSwgYnV0IHRoYXQgbWlnaHQgYmUgdG9vIAo+PiBjb252b2x1dGVkPwo+IAo+IFll
cywgcHJvYmFibHkgdG9vIG11Y2guIFdoYXQncyBwcmVzZW50IGluIHRoZSBwYXRjaCBpcyBub3Qg
Y2xvc2UgdG8KPiBwZXJmZWN0aW9uIGJ1dCBoYXMgdGhlIGFkdmFudGFnZSBvZiBiZWluZyBzdHJh
aWdodGZvcndhcmQuIElmIHdlIGFncmVlCj4gb24gdGhhdCwgSSdsbCBzZW5kIGEgVjMgY29udGFp
bmluZyB0aGUgbW9kaWZpY2F0aW9ucyBpbiB0aGUgYmluZGluZ3MKPiBmaWxlLgpFcnJyLCBJJ20g
c29ycnksIG1heWJlIHRoZXJlIGlzIGEgd2F5IHRvIGRvIHRoaXMgYmV0dGVyLiBMb29rIGF0IApk
cml2ZXJzL2Nsay9jbGstYnVsay5jIDoKCiAgMTUgc3RhdGljIGludCBfX211c3RfY2hlY2sgb2Zf
Y2xrX2J1bGtfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCAKbnVtX2Nsa3MsCiAgMTYg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGtfYnVsa19k
YXRhICpjbGtzKQogIDE3IHsKICAxOCAgICAgICAgIGludCByZXQ7CiAgMTkgICAgICAgICBpbnQg
aTsKICAyMAogIDIxICAgICAgICAgZm9yIChpID0gMDsgaSA8IG51bV9jbGtzOyBpKyspIHsKICAy
MiAgICAgICAgICAgICAgICAgY2xrc1tpXS5pZCA9IE5VTEw7CiAgMjMgICAgICAgICAgICAgICAg
IGNsa3NbaV0uY2xrID0gTlVMTDsKICAyNCAgICAgICAgIH0KICAyNQogIDI2ICAgICAgICAgZm9y
IChpID0gMDsgaSA8IG51bV9jbGtzOyBpKyspIHsKICAyNyAgICAgICAgICAgICAgICAgb2ZfcHJv
cGVydHlfcmVhZF9zdHJpbmdfaW5kZXgobnAsICJjbG9jay1uYW1lcyIsIGksIAomY2xrc1tpXS5p
ZCk7CiAgMjggICAgICAgICAgICAgICAgIGNsa3NbaV0uY2xrID0gb2ZfY2xrX2dldChucCwgaSk7
CgpJZiBJIHJlYWQgdGhpcyByaWdodCwgdGhlbiBjbGtzW2ldLmlkIHNob3VsZCBiZSB0aGUgRFQg
Y2xvY2sgbmFtZS4gU28gCnRoZSBzd2FwIGNvbmRpdGlvbmFsIGFib3ZlIGNvdWxkIHVzZSAuaWQg
dG8gaWRlbnRpZnkgd2hldGhlciB0aGUgZmlyc3QgCnBvc2l0aW9uIGlzIGNvcmUgY2xvY2sgb3Ig
bm90LCBsaWtlIHRoaXM6CgppZiAocHJpdi0+ZGF0YS0+bmJfY2xvY2sgPT0gMiAmJgogICAgIHN0
cmNtcChfX2Nsa19nZXRfbmFtZShwcml2LT5jbGtfYnVsa1swXS5pZCksICJjb3JlIikpCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eCgpZb3UgbWlnaHQgbmVl
ZCB0byB1c2UgZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkgdG8gYWNjZXNzIHRoZSAKb2ZfY2xrX2J1
bGtfZ2V0KCkgLgoKT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZyBzdGlsbCA/Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
