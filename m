Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF073506DA9
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 15:38:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74181C6049A;
	Tue, 19 Apr 2022 13:38:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C990C6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 13:38:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3C7D3839B7;
 Tue, 19 Apr 2022 15:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650375535;
 bh=C6bkAusu1flzQMOf+A+6byWOd4l1MhM2tfURKsZszaI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fKU4kGGJAiQa69b41st5FHLO4TPaKY2oGupNuVQeI5qpbOyrGObl8QdH0u1pbiHg6
 mzpNHG4osX/7XDkcmK5Sz+IqnJmYfprLqoJEYj+7mxxzWZyHy5zcTZn/yaSRQJg7IE
 m7YlLKCuWKYtV1wifuHkGzhsS9IVnqj4v9Oit85dUBUeBgQBnITmbuhiU3pMmCOqpH
 OZJ6qDmlsowm5okRCtEsrK2cug+0Ga5NyKbOSq2BilDhuwMIAkzsCbzho9weJFmOMJ
 dbNquWG43XygUYkEKjUKYHPUnlh+RPl7aISPvODVL9ij4zGq2va3+tI2R97wJW5YOt
 JGnkHCqPN63cg==
Message-ID: <0f3c5762-f317-b9e5-47a6-dadb92008b0a@denx.de>
Date: Tue, 19 Apr 2022 15:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org
References: <20220415215550.498381-1-marex@denx.de>
 <316ce7c7-2a8b-7854-8ea1-3cbe588eb605@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <316ce7c7-2a8b-7854-8ea1-3cbe588eb605@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC][PATCH] irqchip/stm32: Retrigger hierarchy
 for LEVEL triggered IRQs in tasklet
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

T24gNC8xOS8yMiAxNDozNiwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBNYXJlawoKSGks
Cgo+IE9uIDQvMTUvMjIgMjM6NTUsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBUaGUgY3VycmVudCBF
T0kgaGFuZGxlciBmb3IgTEVWRUwgdHJpZ2dlcmVkIGludGVycnVwdHMgY2FsbHMgCj4+IGNsa19l
bmFibGUoKSwKPj4gcmVnaXN0ZXIgSU8sIGNsa19kaXNhYmxlKCkuIFRoZSBjbG9jayBtYW5pcHVs
YXRpb24gcmVxdWlyZXMgbG9ja2luZyB3aGljaAo+PiBoYXBwZW5zIHdpdGggSVJRcyBkaXNhYmxl
ZCBpbiBjbGtfZW5hYmxlX2xvY2soKS4gTW92ZSB0aGUgTEVWRUwgSVJRIHRlc3QKPj4gYW5kIHJl
dHJpZ2dlciBpbnRvIGRlZGljYXRlZCB0YXNrbGV0IGFuZCBzY2hlZHVsZSB0aGUgdGFza2xldCBl
dmVyeSB0aW1lCj4+IGEgTEVWRUwgSVJRIHRyaWdnZXJzLiBUaGlzIG1ha2VzIEVPSSBmYXN0IGZv
ciBtYWpvcml0eSBvZiBJUlFzIG9uIHRoaXMKPj4gcGxhdGZvcm0gYWdhaW4sIHNpbmNlIHRob3Nl
IGFyZSBlZGdlIHRyaWdnZXJlZCBJUlFzLCBhbmQgTEVWRUwgdHJpZ2dlcmVkCj4+IElSUXMgYXJl
IHRoZSBleGNlcHRpb24uCj4+Cj4+IFRoaXMgYWxzbyBmaXhlcyB0aGUgZm9sbG93aW5nIHNwbGF0
IGZvdW5kIHdoZW4gdXNpbmcgcHJlZW1wdC1ydDoKPj4gwqAgLS0tLS0tLS0tLS0tWyBjdXQgaGVy
ZSBdLS0tLS0tLS0tLS0tCj4+IMKgIFdBUk5JTkc6IENQVTogMCBQSUQ6IDAgYXQga2VybmVsL2xv
Y2tpbmcvcnRtdXRleC5jOjIwNDAgCj4+IF9fcnRfbXV0ZXhfdHJ5bG9jaysweDM3LzB4NjIKPj4g
wqAgTW9kdWxlcyBsaW5rZWQgaW46Cj4+IMKgIENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlci8w
IE5vdCB0YWludGVkIAo+PiA1LjEwLjEwOS1ydDY1LXN0YWJsZS1zdGFuZGFyZC0wMDA2OC1nNmE1
YWZjNGIxMjE3ICM4NQo+PiDCoCBIYXJkd2FyZSBuYW1lOiBTVE0zMiAoRGV2aWNlIFRyZWUgU3Vw
cG9ydCkKPj4gwqAgWzxjMDEwYTQ1ZD5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8YzAxMDc2
NmY+XSAoc2hvd19zdGFjaysweGIvMHhjKQo+PiDCoCBbPGMwMTA3NjZmPl0gKHNob3dfc3RhY2sp
IGZyb20gWzxjMDYzNTNhYj5dIChkdW1wX3N0YWNrKzB4NmYvMHg4NCkKPj4gwqAgWzxjMDYzNTNh
Yj5dIChkdW1wX3N0YWNrKSBmcm9tIFs8YzAxMTQ1ZTM+XSAoX193YXJuKzB4N2YvMHhhNCkKPj4g
wqAgWzxjMDExNDVlMz5dIChfX3dhcm4pIGZyb20gWzxjMDYzMzg2Zj5dICh3YXJuX3Nsb3dwYXRo
X2ZtdCsweDNiLzB4NzQpCj4+IMKgIFs8YzA2MzM4NmY+XSAod2Fybl9zbG93cGF0aF9mbXQpIGZy
b20gWzxjMDYzYjQzZD5dIAo+PiAoX19ydF9tdXRleF90cnlsb2NrKzB4MzcvMHg2MikKPj4gwqAg
WzxjMDYzYjQzZD5dIChfX3J0X211dGV4X3RyeWxvY2spIGZyb20gWzxjMDYzYzA1Mz5dIAo+PiAo
cnRfc3Bpbl90cnlsb2NrKzB4Ny8weDE2KQo+PiDCoCBbPGMwNjNjMDUzPl0gKHJ0X3NwaW5fdHJ5
bG9jaykgZnJvbSBbPGMwMzZhMmYzPl0gCj4+IChjbGtfZW5hYmxlX2xvY2srMHhiLzB4ODApCj4+
IMKgIFs8YzAzNmEyZjM+XSAoY2xrX2VuYWJsZV9sb2NrKSBmcm9tIFs8YzAzNmJhNjk+XSAKPj4g
KGNsa19jb3JlX2VuYWJsZV9sb2NrKzB4OS8weDE4KQo+PiDCoCBbPGMwMzZiYTY5Pl0gKGNsa19j
b3JlX2VuYWJsZV9sb2NrKSBmcm9tIFs8YzAzNGU5ZjM+XSAKPj4gKHN0bTMyX2dwaW9fZ2V0KzB4
MTEvMHgyNCkKPj4gwqAgWzxjMDM0ZTlmMz5dIChzdG0zMl9ncGlvX2dldCkgZnJvbSBbPGMwMzRl
ZjQzPl0gCj4+IChzdG0zMl9ncGlvX2lycV90cmlnZ2VyKzB4MWYvMHg0OCkKPj4gwqAgWzxjMDM0
ZWY0Mz5dIChzdG0zMl9ncGlvX2lycV90cmlnZ2VyKSBmcm9tIFs8YzAxNGFhNTM+XSAKPj4gKGhh
bmRsZV9mYXN0ZW9pX2lycSsweDcxLzB4YTgpCj4+IMKgIFs8YzAxNGFhNTM+XSAoaGFuZGxlX2Zh
c3Rlb2lfaXJxKSBmcm9tIFs8YzAxNDcxMTE+XSAKPj4gKGdlbmVyaWNfaGFuZGxlX2lycSsweDE5
LzB4MjIpCj4+IMKgIFs8YzAxNDcxMTE+XSAoZ2VuZXJpY19oYW5kbGVfaXJxKSBmcm9tIFs8YzAx
NDc1MmQ+XSAKPj4gKF9faGFuZGxlX2RvbWFpbl9pcnErMHg1NS8weDY0KQo+PiDCoCBbPGMwMTQ3
NTJkPl0gKF9faGFuZGxlX2RvbWFpbl9pcnEpIGZyb20gWzxjMDM0NmYxMz5dIAo+PiAoZ2ljX2hh
bmRsZV9pcnErMHg1My8weDY0KQo+PiDCoCBbPGMwMzQ2ZjEzPl0gKGdpY19oYW5kbGVfaXJxKSBm
cm9tIFs8YzAxMDBiYTU+XSAoX19pcnFfc3ZjKzB4NjUvMHhjMCkKPj4gwqAgRXhjZXB0aW9uIHN0
YWNrKDB4YzBlMDFmMTggdG8gMHhjMGUwMWY2MCkKPj4gwqAgMWYwMDrCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDAwMDMwMGMgCj4+IDAwMDAwMDAw
Cj4+IMKgIDFmMjA6IDAwMDAzMDBjIGMwMTBmZjAxIDAwMDAwMDAwIDAwMDAwMDAwIGMwZTAwMDAw
IGMwZTA3NzE0IDAwMDAwMDAxIAo+PiBjMGUwMWY3OAo+PiDCoCAxZjQwOiBjMGUwNzc1OCAwMDAw
MDAwMCBlZjdjZDBmZiBjMGUwMWY2OCBjMDEwNTU0YiBjMDEwNTU0MiA0MDAwMDAzMyAKPj4gZmZm
ZmZmZmYKPj4gwqAgWzxjMDEwMGJhNT5dIChfX2lycV9zdmMpIGZyb20gWzxjMDEwNTU0Mj5dIChh
cmNoX2NwdV9pZGxlKzB4Yy8weDFlKQo+PiDCoCBbPGMwMTA1NTQyPl0gKGFyY2hfY3B1X2lkbGUp
IGZyb20gWzxjMDYzYmU5NT5dIAo+PiAoZGVmYXVsdF9pZGxlX2NhbGwrMHgyMS8weDNjKQo+PiDC
oCBbPGMwNjNiZTk1Pl0gKGRlZmF1bHRfaWRsZV9jYWxsKSBmcm9tIFs8YzAxMzI0Zjc+XSAoZG9f
aWRsZSsweGUzLzB4MWU0KQo+PiDCoCBbPGMwMTMyNGY3Pl0gKGRvX2lkbGUpIGZyb20gWzxjMDEz
MjdiMz5dIChjcHVfc3RhcnR1cF9lbnRyeSsweDEzLzB4MTQpCj4+IMKgIFs8YzAxMzI3YjM+XSAo
Y3B1X3N0YXJ0dXBfZW50cnkpIGZyb20gWzxjMGEwMGMxMz5dIAo+PiAoc3RhcnRfa2VybmVsKzB4
Mzk3LzB4M2Q0KQo+PiDCoCBbPGMwYTAwYzEzPl0gKHN0YXJ0X2tlcm5lbCkgZnJvbSBbPDAwMDAw
MDAwPl0gKDB4MCkKPj4gwqAgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMiBdLS0tCj4g
Cj4gSW50ZXJuYWxseSB3ZSBhcmUgY2hhbmdpbmcgdGhpbmdzIGFib3V0IGNsb2NraW5nIGluIHN0
bTMyIHBpbmN0cmwgCj4gZHJpdmVyLiBGYWJpZW4gd2lsbCBnaXZlIG1vcmUgZGV0YWlscyB0aGFu
IG1lLCBidXQgdGhlIGlkZWEgaXMgdG8gY2xvY2sgCj4gb25lIHRpbWVzIGFsbCBiYW5rcyBkdXJp
bmcgcHJvYmUuIEl0IGlzIGRvbmUgbWFpbmlseSB0byBpbXByb3ZlIAo+IHBlcmZvcm1hbmNlcyBk
dXJpbmcgR1BJTyB0b2dnbGluZyBhbmQgaXQgd2lsbCBmaXggYWxzbyB0aGUgaXNzdWUgeW91IAo+
IHJlcG9ydC4KCk5pY2UuIElmIHlvdSBoYXZlIGFueXRoaW5nIHRvIHN1Ym1pdCwgcGxlYXNlIEND
IG1lLgoKQWxzbywgSSB0aGluayB5b3UgY2FuIHN0aWxsIGFwcGx5IHRoaXMgb25lIGFzIGFuIG9w
dGltaXphdGlvbiA/CgpbUEFUQ0hdIGlycWNoaXAvc3RtMzI6IERvIG5vdCBjYWxsIHN0bTMyX2dw
aW9fZ2V0KCkgZm9yIGVkZ2UgdHJpZ2dlcmVkIApJUlFzIGluIEVPSQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
