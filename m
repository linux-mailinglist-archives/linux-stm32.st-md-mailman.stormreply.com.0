Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251751B4F8
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 03:02:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F9B7C6046B;
	Thu,  5 May 2022 01:02:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFFE7C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 01:02:25 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5BD788021F;
 Thu,  5 May 2022 03:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651712544;
 bh=pWrURzubWu+p/NpTsyL688Pw7a3ZTUEd1pN76BWk2CI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Lc2xswilLZZ+NnESnlhBrCD368bj8HeNoDssmFqANNiPglLqbJXjEmed8QRb5ojxU
 MQUhdRm4MtX3e1uUYuGQfRmylFhym63G9gLfw687Yw4Y08QhiG8pIcb8X5Fsrq5xN8
 AJ6vdcSvW6tAI1rvh02YSYDxIxqdkOhOUwKeMygVYEqROpb8DQVXuooTkdgXwZUy6T
 buvblAul7yoNAzBpnDmBlYXRzVgADmwKPWnqtGxzBnGXDcdey6jQbhii1SlAh6LihQ
 W2aNyt4LoxTgVJWYKGldgLZ/AJ+DAUu1nciwzDV1CXE2RP1x9laVHiTCg22t8zCWkp
 6CnwnM0cbOqfA==
Message-ID: <5adb61a1-7959-cab3-2be6-ab7555ed7876@denx.de>
Date: Thu, 5 May 2022 03:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Erwan LE RAY <erwan.leray@foss.st.com>, linux-serial@vger.kernel.org
References: <20220430162845.244655-1-marex@denx.de>
 <20220430162845.244655-2-marex@denx.de>
 <702dcede-ff97-b074-20bf-7c695f988d40@foss.st.com>
 <18f886d9-924b-e32b-e298-90e998b30662@denx.de>
 <57896136-5e08-b9fe-2e3e-0eff4388e064@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <57896136-5e08-b9fe-2e3e-0eff4388e064@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] serial: stm32: Use TC interrupt to
 deassert GPIO RTS in RS485 mode
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

T24gNS80LzIyIDE3OjU0LCBFcndhbiBMRSBSQVkgd3JvdGU6CgpIaSwKClsuLi5dCgo+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyAKPj4+PiBiL2RyaXZl
cnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCj4+Pj4gaW5kZXggMjI0ZjM1OWM2MDUxZS4uNzY0
NDE1YjhlOGYwMyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNh
cnQuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCj4+Pj4gQEAg
LTQxNyw2ICs0MTcsMTQgQEAgc3RhdGljIHZvaWQgCj4+Pj4gc3RtMzJfdXNhcnRfdHhfaW50ZXJy
dXB0X2VuYWJsZShzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBzdG0zMl91c2FydF9zZXRfYml0cyhwb3J0LCBvZnMtPmNyMSwgVVNBUlRfQ1IxX1RYRUlFKTsK
Pj4+PiDCoCB9Cj4+Pj4gK3N0YXRpYyB2b2lkIHN0bTMyX3VzYXJ0X3RjX2ludGVycnVwdF9lbmFi
bGUoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCkKPj4+PiArewo+Pj4+ICvCoMKgwqAgc3RydWN0IHN0
bTMyX3BvcnQgKnN0bTMyX3BvcnQgPSB0b19zdG0zMl9wb3J0KHBvcnQpOwo+Pj4+ICvCoMKgwqAg
Y29uc3Qgc3RydWN0IHN0bTMyX3VzYXJ0X29mZnNldHMgKm9mcyA9ICZzdG0zMl9wb3J0LT5pbmZv
LT5vZnM7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgc3RtMzJfdXNhcnRfc2V0X2JpdHMocG9ydCwgb2Zz
LT5jcjEsIFVTQVJUX0NSMV9UQ0lFKTsKPj4+PiArfQo+Pj4+ICsKPj4+IEkgZG9uJ3Qgc2VlIHRo
ZSBhZGRlZCB2YWx1ZSBvZiB0aGlzIGhlbHBlciAob25seSAxIGluc3RydWN0aW9uIHVzZWQgMSAK
Pj4+IHRpbWUpLCBhbmQgb3RoZXIgSW50ZXJydXB0IEVuYWJsZWQgYml0cyBhcmUgYWxyZWFkeSBz
ZXQvdW5zZXQgaW4gCj4+PiBvdGhlcnMgZnVuY3Rpb25zIG9mIHRoaXMgZHJpdmVyLgo+Pj4gVG8g
a2VlcCBhbiBob21vZ2VuZW91cyBjb2RlIGluIHRoZSBkcml2ZXIsIGNvdWxkIHlvdSBwbGVhc2Ug
cmVtb3ZlIAo+Pj4gdGhpcyBoZWxwZXIgYW5kIHNldCBUQ0lFIGRpcmVjdGx5IHdoZW4geW91IG5l
ZWQgaXQgPwo+Pgo+PiBTaG91bGQgSSBhbHNvIHJlbW92ZSBzdG0zMl91c2FydF90eF9pbnRlcnJ1
cHRfZW5hYmxlKCkgLyAKPj4gc3RtMzJfdXNhcnRfdHhfaW50ZXJydXB0X2Rpc2FibGUoKSAsIHdo
aWNoIGRvZXMgdGhlIHNhbWUgdGhpbmcgZm9yIAo+PiBvdGhlciBiaXRzIGluIHRoZSBpbnRlcnJ1
cHQgcmVnaXN0ZXIgPwo+Pgo+IEluIHN0bTMyX3VzYXJ0X3R4X2ludGVycnVwdF9lbmFibGUoKSAv
IAo+IHN0bTMyX3VzYXJ0X3R4X2ludGVycnVwdF9kaXNhYmxlKCkgY2FzZSwgMiBiaXRzIGFyZSBj
b25maWd1cmVkIAo+IGRpZmZlcmVudGx5IHVuZGVyIGEgY29uZGl0aW9uLCBhbmQgc3RtMzJfdXNh
cnRfdHhfaW50ZXJydXB0X2Rpc2FibGUoKSBpcyAKPiBjYWxsZWQgNCB0aW1lcyBpbiB0aGUgZHJp
dmVyLiBUaGUgZmFjdG9yaXphdGlvbiBpcyB0cmlnZ2VyZWQgYnkgdGhlIAo+IG11bHRpcGxlIGNh
bGxzIHRvIHRoaXMgY29kZS4KCnN0bTMyX3VzYXJ0X3RjX2ludGVycnVwdF97ZW4sZGlzfWFibGUo
KSBpcyBjYWxsZWQgMyB0aW1lcyBhZnRlciAyLzIsIHNvIApoYXZpbmcgMyBjb3BpZXMgb2YgdGhl
IHNhbWUgY29kZSBzcHJpbmtsZWQgYWNyb3NzIHRoZSBkcml2ZXIgc2VlbXMgaWZmeSAKYXQgYmVz
dC4gQWxzbywgc3RtMzJfdXNhcnRfdGNfaW50ZXJydXB0X3tlbixkaXN9YWJsZSgpIGhhbmRsZXMg
dGhlIApyZWdpc3RlciBvZmZzZXQgKCRvZnMgdmFyaWFibGUpLCB0aGF0IHdvdWxkIGFsc28gaGF2
ZSB0byBiZSBkdXBsaWNhdGVkIAphbGwgb3ZlciB0aGUgZHJpdmVyLiBJIGRvbid0IGxpa2UgdGhh
dCwgaXQgd291bGQgbWFrZSB0aGUgY29kZSBoYXJkZXIgdG8gCnJlYWQuCgo+IEluIHlvdXIgcHJv
cG9zYWwsIHRoZSBoZWxwZXIgaXMgZXhlY3V0aW5nIGEgc2luZ2xlIGluc3RydWN0aW9uCgpUaGUg
aGVscGVyIGZpcnN0IGhhcyB0byBmaWd1cmUgb3V0IHRoZSByZWdpc3RlciBvZmZzZXQgZnJvbSB0
aGlzICRvZnMgCnRhYmxlIHdoaWNoIGlzIGF0IGxlYXN0IHR3byBpbnN0cnVjdGlvbnMsIGFuZCB0
aGVuIGRvZXMgcmVnaXN0ZXIgUk1XIAp3aGljaCBhcmUgYXQgbGVhc3QgdGhyZWUgaW5zdHJ1Y3Rp
b25zIG9uIGFybTMyLgoKPiwgYW5kIGlzIAo+IGNhbGxlZCBvbmx5IG9uY2UKClRocmljZSBpbiB0
b3RhbC4KCj4gLCByZWFzb24gd2h5IEkgc3VnZ2VzdGVkIHRvIGVuYWJsZSAvIGRpc2FibGUgdGhl
IFRDSUUgCj4gZGlyZWN0bHkgaW4geW91ciBuZXcgZnVuY3Rpb25zIHN0bTMyX3VzYXJ0X3RjX2lu
dGVycnVwdF9lbmFibGUoKSAvIAo+IHN0bTMyX3VzYXJ0X3RjX2ludGVycnVwdF9kaXNhYmxlKCku
Cj4gCj4+IFRoYXQgc291bmRzIHRvIG1lIGxpa2UgbWFraW5nIHRoZSBjb2RlIGhhcmRlciB0byBy
ZWFkLCBub3QgZWFzaWVyLgpTZWVtcyB3ZSBoYXZlIGEgY29kaW5nIHN0eWxlIHByZWZlcmVuY2Ug
c3RhbGwgaGVyZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
