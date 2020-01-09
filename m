Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C508D1356E2
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2020 11:31:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A451C36B0B;
	Thu,  9 Jan 2020 10:31:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE4B0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 10:31:41 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 009AVYNC091024;
 Thu, 9 Jan 2020 04:31:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578565894;
 bh=vRdA7ZpngQM+5zB53J/t9D79iFD6d3CN4ckUSA2NKZU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kqfAtqYyVFSJwV7sAQM96ZsH51Cc8Qfcgjh49mQJZW+5wcv9MqpoyEgdaP2YFpDcb
 +2PxadaY9hVlfjIC/8oPqSWQkfi/UFY2Ko2xjxTcHFUwar0CUx/N7aNr3jborunuex
 KcLERc0GHTymkwpkF6fTlikayArqWYj+LJOBXOeg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 009AVYmK079645
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 9 Jan 2020 04:31:34 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Jan
 2020 04:31:32 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Jan 2020 04:31:32 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 009AVU9e033718;
 Thu, 9 Jan 2020 04:31:30 -0600
To: Fabrice Gasnier <fabrice.gasnier@st.com>, <jic23@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
References: <20200107114532.6697-1-peter.ujfalusi@ti.com>
 <eade6657-8470-0d70-b3c1-fcdddf891c6c@st.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <4c0b7e3e-cd98-860a-e931-c216f1bc6e7a@ti.com>
Date: Thu, 9 Jan 2020 12:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eade6657-8470-0d70-b3c1-fcdddf891c6c@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-dfsdm: Use
 dma_request_chan() instead dma_request_slave_channel()
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

CgpPbiAwOS8wMS8yMDIwIDExLjEzLCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4gT24gMS83LzIw
IDEyOjQ1IFBNLCBQZXRlciBVamZhbHVzaSB3cm90ZToKPj4gZG1hX3JlcXVlc3Rfc2xhdmVfY2hh
bm5lbCgpIGlzIGEgd3JhcHBlciBvbiB0b3Agb2YgZG1hX3JlcXVlc3RfY2hhbigpCj4+IGVhdGlu
ZyB1cCB0aGUgZXJyb3IgY29kZS4KPj4KPj4gQnkgdXNpbmcgZG1hX3JlcXVlc3RfY2hhbigpIGRp
cmVjdGx5IHRoZSBkcml2ZXIgY2FuIHN1cHBvcnQgZGVmZXJyZWQKPj4gcHJvYmluZyBhZ2FpbnN0
IERNQS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNp
QHRpLmNvbT4KPj4gLS0tCj4+IEhpLAo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+PiAtIEZhbGwg
YmFjayB0byBJUlEgbW9kZSBmb3IgQURDIG9ubHkgaW4gY2FzZSBvZiBFTk9ERVYKPiAKPiBIaSBQ
ZXRlciwKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaCwKPiAKPiBQbGVhc2UgZmluZCBhIG1pbm9y
IGNvbW1lbnQgaGVyZSBhZnRlci4gQXBhcnQgZnJvbSB0aGF0LCB5b3UgY2FuIGFkZCBteToKPiAK
PiBBY2tlZC1ieTogRmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAc3QuY29tPgo+IAo+
IAo+Pgo+PiBSZWdhcmRzLAo+PiBQZXRlcgo+Pgo+PiAgZHJpdmVycy9paW8vYWRjL3N0bTMyLWRm
c2RtLWFkYy5jIHwgMjEgKysrKysrKysrKysrKysrKystLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaWlvL2FkYy9zdG0zMi1kZnNkbS1hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1kZnNk
bS1hZGMuYwo+PiBpbmRleCBlNDkzMjQyYzI2NmUuLjc0YTIyMTFiZGZmNCAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9paW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5jCj4+ICsrKyBiL2RyaXZlcnMvaWlv
L2FkYy9zdG0zMi1kZnNkbS1hZGMuYwo+PiBAQCAtMTM4Myw5ICsxMzgzLDEzIEBAIHN0YXRpYyBp
bnQgc3RtMzJfZGZzZG1fZG1hX3JlcXVlc3Qoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldikKPj4g
IHsKPj4gIAlzdHJ1Y3Qgc3RtMzJfZGZzZG1fYWRjICphZGMgPSBpaW9fcHJpdihpbmRpb19kZXYp
Owo+PiAgCj4+IC0JYWRjLT5kbWFfY2hhbiA9IGRtYV9yZXF1ZXN0X3NsYXZlX2NoYW5uZWwoJmlu
ZGlvX2Rldi0+ZGV2LCAicngiKTsKPj4gLQlpZiAoIWFkYy0+ZG1hX2NoYW4pCj4+IC0JCXJldHVy
biAtRUlOVkFMOwo+PiArCWFkYy0+ZG1hX2NoYW4gPSBkbWFfcmVxdWVzdF9jaGFuKCZpbmRpb19k
ZXYtPmRldiwgInJ4Iik7Cj4+ICsJaWYgKElTX0VSUihhZGMtPmRtYV9jaGFuKSkgewo+PiArCQlp
bnQgcmV0ID0gUFRSX0VSUihhZGMtPmRtYV9jaGFuKTsKPj4gKwo+PiArCQlhZGMtPmRtYV9jaGFu
ID0gTlVMTDsKPj4gKwkJcmV0dXJuIHJldDsKPiAKPiBZb3UgbWF5ICJyZXR1cm4gUFRSX0VSUihh
ZGMtPmRtYV9jaGFuKTsiIGRpcmVjdGx5IGhlcmUuCgpJIGRvbid0IG1ha2UgZGVjaXNpb24gaGVy
ZSBvbiBiZWhhbGYgb2YgdGhlIGFkYyBwYXRoIG9uIHRvIGdvIGZvcndhcmQgdy8Kb3Igdy9vIERN
QSBzdXBwb3J0IGFuZCBpZiB3ZSBnbyBhaGVhZCB0aGUgc3RtMzJfZGZzZG1fZG1hX3JlbGVhc2Uo
KQpuZWVkcyB0aGUgZG1hX2NoYW4gdG8gYmUgTlVMTCBpbiBjYXNlIHdlIGRvbid0IHVzZSBETUEu
CgpJdCBpcyBtdWNoIGNsZWFuZXIgdG8gc2V0IGRtYV9jaGFuIHRvIE5VTEwgaGVyZSB0aGFuIGRv
aW5nIGl0IGluIG90aGVyCnBhdGhzLgoKPiAKPiBCZXN0IFJlZ2FyZHMsCj4gRmFicmljZQo+IAo+
PiArCX0KPj4gIAo+PiAgCWFkYy0+cnhfYnVmID0gZG1hX2FsbG9jX2NvaGVyZW50KGFkYy0+ZG1h
X2NoYW4tPmRldmljZS0+ZGV2LAo+PiAgCQkJCQkgREZTRE1fRE1BX0JVRkZFUl9TSVpFLAo+PiBA
QCAtMTUwOSw3ICsxNTEzLDE2IEBAIHN0YXRpYyBpbnQgc3RtMzJfZGZzZG1fYWRjX2luaXQoc3Ry
dWN0IGlpb19kZXYgKmluZGlvX2RldikKPj4gIAlpbml0X2NvbXBsZXRpb24oJmFkYy0+Y29tcGxl
dGlvbik7Cj4+ICAKPj4gIAkvKiBPcHRpb25hbGx5IHJlcXVlc3QgRE1BICovCj4+IC0JaWYgKHN0
bTMyX2Rmc2RtX2RtYV9yZXF1ZXN0KGluZGlvX2RldikpIHsKPj4gKwlyZXQgPSBzdG0zMl9kZnNk
bV9kbWFfcmVxdWVzdChpbmRpb19kZXYpOwo+PiArCWlmIChyZXQpIHsKPj4gKwkJaWYgKHJldCAh
PSAtRU5PREVWKSB7Cj4+ICsJCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCj4+ICsJCQkJZGV2
X2VycigmaW5kaW9fZGV2LT5kZXYsCj4+ICsJCQkJCSJETUEgY2hhbm5lbCByZXF1ZXN0IGZhaWxl
ZCB3aXRoICVkXG4iLAo+PiArCQkJCQlyZXQpOwo+PiArCQkJcmV0dXJuIHJldDsKPj4gKwkJfQo+
PiArCj4+ICAJCWRldl9kYmcoJmluZGlvX2Rldi0+ZGV2LCAiTm8gRE1BIHN1cHBvcnRcbiIpOwo+
PiAgCQlyZXR1cm4gMDsKPj4gIAl9Cj4+CgotIFDDqXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
