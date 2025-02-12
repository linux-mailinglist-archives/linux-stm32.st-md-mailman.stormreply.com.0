Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E548A32B6C
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2025 17:21:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C765C78F89;
	Wed, 12 Feb 2025 16:21:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4228CC78F89
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 16:21:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CEZrrx028666;
 Wed, 12 Feb 2025 17:21:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 jtTH0NF2OZaw1ZQ29k/edA3IlfDQAywZ7oVCTbLG9zs=; b=O3oaqEA/I/lcZQ2m
 L4kKOKxdlg+mTI3oe8flHZaFC54+QBIP6ufNUw+9Vug4ge6cvCnybHkvS89vlbua
 nPMOQAcCAmGy0FWs2dVlzwciSyJW4ajOKcbnNyM5Bpayc8byOg+D7owhSaWEG6RC
 kx57t5x5X4/dM/3TTCcwrzvFERdR2KCqI7GqTYPOWcehTB8N0kz6Wry6T9z2SAqH
 z5gKqsQ1izvugw4GN76xM64b52RzsyF9bkVwUKE6AL0igM6V1UAf4MbPsJpZtD4X
 kU5IQJ5oGVFsZ7OE4QS2vHQNBZtMqG4kLlN5SKjBdZHW4yEgQOhNwyA8mUN4GV2a
 3eSXdQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44rrfk295h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2025 17:21:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E769340045;
 Wed, 12 Feb 2025 17:19:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D05BA2CBC8E;
 Wed, 12 Feb 2025 17:17:56 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Feb
 2025 17:17:55 +0100
Message-ID: <52e74ce3-8ad0-4b42-b959-66ab70ac8501@foss.st.com>
Date: Wed, 12 Feb 2025 17:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-5-patrice.chotard@foss.st.com>
 <a74c3202-7a64-483d-907e-9a562e9dcd03@wanadoo.fr>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a74c3202-7a64-483d-907e-9a562e9dcd03@wanadoo.fr>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de,
 robh@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, mcoquelin.stm32@gmail.com, gregkh@linuxfoundation.org,
 p.zabel@pengutronix.de, krzk+dt@kernel.org, linux-spi@vger.kernel.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/8] memory: Add STM32 Octo Memory
	Manager driver
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

CgpPbiAyLzExLzI1IDE5OjE2LCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4gTGUgMTAvMDIv
MjAyNSDDoCAxNDoxOCwgcGF0cmljZS5jaG90YXJkLXJqMEllbC9KUjROQkRnaks3eTdUVVFAcHVi
bGljLmdtYW5lLm9yZyBhIMOpY3JpdMKgOgo+PiBGcm9tOiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZC1yajBJZWwvSlI0TkJEZ2pLN3k3VFVRQHB1YmxpYy5nbWFuZS5vcmc+Cj4+Cj4+
IE9jdG8gTWVtb3J5IE1hbmFnZXIgZHJpdmVyIChPTU0pIG1hbmFnZXM6Cj4+IMKgwqAgLSB0aGUg
bXV4aW5nIGJldHdlZW4gMiBPU1BJIGJ1c3NlcyBhbmQgMiBvdXRwdXQgcG9ydHMuCj4+IMKgwqDC
oMKgIFRoZXJlIGFyZSA0IHBvc3NpYmxlIG11eGluZyBjb25maWd1cmF0aW9uczoKPj4gwqDCoMKg
wqDCoMKgIC0gZGlyZWN0IG1vZGUgKG5vIG11bHRpcGxleGluZyk6IE9TUEkxIG91dHB1dCBpcyBv
biBwb3J0IDEgYW5kIE9TUEkyCj4+IMKgwqDCoMKgwqDCoMKgwqAgb3V0cHV0IGlzIG9uIHBvcnQg
Mgo+PiDCoMKgwqDCoMKgwqAgLSBPU1BJMSBhbmQgT1NQSTIgYXJlIG11bHRpcGxleGVkIG92ZXIg
dGhlIHNhbWUgb3V0cHV0IHBvcnQgMQo+PiDCoMKgwqDCoMKgwqAgLSBzd2FwcGVkIG1vZGUgKG5v
IG11bHRpcGxleGluZyksIE9TUEkxIG91dHB1dCBpcyBvbiBwb3J0IDIsCj4+IMKgwqDCoMKgwqDC
oMKgwqAgT1NQSTIgb3V0cHV0IGlzIG9uIHBvcnQgMQo+PiDCoMKgwqDCoMKgwqAgLSBPU1BJMSBh
bmQgT1NQSTIgYXJlIG11bHRpcGxleGVkIG92ZXIgdGhlIHNhbWUgb3V0cHV0IHBvcnQgMgo+PiDC
oMKgIC0gdGhlIHNwbGl0IG9mIHRoZSBtZW1vcnkgYXJlYSBzaGFyZWQgYmV0d2VlbiB0aGUgMiBP
U1BJIGluc3RhbmNlcy4KPj4gwqDCoCAtIGNoaXAgc2VsZWN0IHNlbGVjdGlvbiBvdmVycmlkZS4K
Pj4gwqDCoCAtIHRoZSB0aW1lIGJldHdlZW4gMiB0cmFuc2FjdGlvbnMgaW4gbXVsdGlwbGV4ZWQg
bW9kZS4KPj4gwqDCoCAtIGNoZWNrIGZpcmV3YWxsIGFjY2Vzcy4KPiAKPiAuLi4KPiAKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L3N0bTMyX29tbS5jIGIvZHJpdmVycy9tZW1vcnkvc3Rt
MzJfb21tLmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5h
ZjY5MTM3YmZiYTIKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL21lbW9yeS9zdG0z
Ml9vbW0uYwo+PiBAQCAtMCwwICsxLDUyMCBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTAo+IAo+IE5vdCBzdXJlIHRoaXMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXIgZXhpc3Rz
LgoKUmlnaHQsIGkgd2lsbCBmaXggdGhhdC4KCj4gCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChD
KSBTVE1pY3JvZWxlY3Ryb25pY3MgMjAyNCAtIEFsbCBSaWdodHMgUmVzZXJ2ZWQKPiAKPiAuLi4K
PiAKPj4gK8KgwqDCoCBwbV9ydW50aW1lX2VuYWJsZShkZXYpOwo+PiArCj4+ICvCoMKgwqAgLyog
Y2hlY2sgaWYgT01NJ3MgcmVzb3VyY2UgYWNjZXNzIGlzIGdyYW50ZWQgKi8KPj4gK8KgwqDCoCBy
ZXQgPSBzdG0zMl9vbW1fY2hlY2tfYWNjZXNzKGRldiwgZGV2LT5vZl9ub2RlKTsKPj4gK8KgwqDC
oCBpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVBQ0NFUykKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8g
ZXJyX2Nsa19yZWxlYXNlOwo+IAo+IFNob3VsZCB3ZSBjYWxsLCBoZXJlIGFuZCBiZWxvdywgcG1f
cnVudGltZV9kaXNhYmxlKCkgaW4gdGhlIGVycm9yIGhhbmRsaW5nIHBhdGgsIGFzIGRvbmUgaW4g
dGhlIHJlbW92ZSBmdW5jdGlvbj8KCnJpZ2h0LCBpIHdpbGwgYWRkIGl0LgoKPiAKPj4gKwo+PiAr
wqDCoMKgIGlmICghcmV0ICYmIGNoaWxkX2FjY2Vzc19ncmFudGVkID09IE9NTV9DSElMRF9OQikg
ewo+PiArwqDCoMKgwqDCoMKgwqAgLyogRW5zdXJlIGJvdGggT1NQSSBpbnN0YW5jZSBhcmUgZGlz
YWJsZWQgYmVmb3JlIGNvbmZpZ3VyaW5nIE9NTSAqLwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0g
c3RtMzJfb21tX2Rpc2FibGVfY2hpbGQoZGV2KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQp
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2Nsa19yZWxlYXNlOwo+PiArCj4+
ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBzdG0zMl9vbW1fY29uZmlndXJlKGRldik7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9j
bGtfcmVsZWFzZTsKPj4gK8KgwqDCoCB9IGVsc2Ugewo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2Ri
ZyhkZXYsICJPY3RvIE1lbW9yeSBNYW5hZ2VyIHJlc291cmNlJ3MgYWNjZXNzIG5vdCBncmFudGVk
XG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogQU1DUiBj
YW4ndCBiZSBzZXQsIHNvIGNoZWNrIGlmIGN1cnJlbnQgdmFsdWUgaXMgY29oZXJlbnQKPj4gK8Kg
wqDCoMKgwqDCoMKgwqAgKiB3aXRoIG1lbW9yeS1tYXAgYXJlYXMgZGVmaW5lZCBpbiBEVAo+PiAr
wqDCoMKgwqDCoMKgwqDCoCAqLwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gc3RtMzJfb21tX3Nl
dF9hbWNyKGRldiwgZmFsc2UpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfY2xrX3JlbGVhc2U7Cj4+ICvCoMKgwqAgfQo+PiAr
Cj4+ICvCoMKgwqAgLyogZm9yIGVhY2ggY2hpbGQsIGlmIHJlc291cmNlIGFjY2VzcyBpcyBncmFu
dGVkIGFuZCBzdGF0dXMgIm9rYXkiLCBwcm9iZSBpdCAqLwo+PiArwqDCoMKgIGZvciAoaSA9IDA7
IGkgPCBvbW0tPm5iX2NoaWxkOyBpKyspIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghY2hpbGRf
YWNjZXNzW2ldIHx8ICFvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKG9tbS0+Y2hpbGRbaV0ubm9kZSkp
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+PiArCj4+ICvCoMKgwqDCoMKg
wqDCoCB2ZGV2ID0gb2ZfcGxhdGZvcm1fZGV2aWNlX2NyZWF0ZShvbW0tPmNoaWxkW2ldLm5vZGUs
IE5VTEwsIE5VTEwpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCF2ZGV2KSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGNyZWF0ZSBPY3RvIE1lbW9y
eSBNYW5hZ2VyIGNoaWxkXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChqID0g
aTsgaiA+IDA7IC0taikgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChv
bW0tPmNoaWxkW2pdLmRldikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG9mX3BsYXRmb3JtX2RldmljZV9kZXN0cm95KG9tbS0+Y2hpbGRbal0uZGV2LCBOVUxMKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldCA9IC1FSU5WQUw7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2Ns
a19yZWxlYXNlOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqAgb21tLT5j
aGlsZFtpXS5kZXYgPSAmdmRldi0+ZGV2Owo+PiArwqDCoMKgIH0KPj4gKwo+PiArZXJyX2Nsa19y
ZWxlYXNlOgo+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBvbW0tPm5iX2NoaWxkOyBpKyspCj4+
ICvCoMKgwqDCoMKgwqDCoCBjbGtfcHV0KG9tbS0+Y2hpbGRbaV0uY2xrKTsKPj4gKwo+PiArwqDC
oMKgIHJldHVybiByZXQ7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHN0bTMyX29tbV9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qg
c3RtMzJfb21tICpvbW0gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPj4gK8KgwqDCoCBp
bnQgaTsKPj4gKwo+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBvbW0tPm5iX2NoaWxkOyBpKysp
Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAob21tLT5jaGlsZFtpXS5kZXYpCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG9mX3BsYXRmb3JtX2RldmljZV9kZXN0cm95KG9tbS0+Y2hpbGRbaV0uZGV2
LCBOVUxMKTsKPj4gKwo+PiArwqDCoMKgIGlmIChvbW0tPmNyICYgQ1JfTVVYRU4pCj4+ICvCoMKg
wqDCoMKgwqDCoCBzdG0zMl9vbW1fZW5hYmxlX2NoaWxkX2Nsb2NrKCZwZGV2LT5kZXYsIGZhbHNl
KTsKPj4gKwo+PiArwqDCoMKgIHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKPiAKPiBT
aG91bGQgd2UgaGF2ZToKPiDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBvbW0tPm5iX2NoaWxkOyBp
KyspCj4gwqDCoMKgwqDCoMKgwqAgY2xrX3B1dChvbW0tPmNoaWxkW2ldLmNsayk7Cj4gYXMgZG9u
ZSBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBvZiB0aGUgcHJvYmU/CgpubyBuZWVkLCBhcyBj
aGlsZCdzIGNsb2NrIGFyZSBhbHdheXMgZnJlZWQgaW4gc3RtMzJfb21tX3Byb2JlKCkgaW4gYWxs
IGNhc2VzLgoKPiAKPj4gK30KPj4gKwo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgc3RtMzJfb21tX29mX21hdGNoW10gPSB7Cj4+ICvCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJz
dCxzdG0zMm1wMjUtb21tIiwgfSwKPj4gK8KgwqDCoCB7fSwKPiAKPiBOaXRwaWNrOiBVbm5lZWRl
ZCAsIGFmdGVyIGEgdGVybWluYXRvci4KCm9rCgo+IAo+PiArfTsKPj4gK01PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIHN0bTMyX29tbV9vZl9tYXRjaCk7Cj4gCj4gLi4uCj4gCj4gQ0oKPiAKPiAKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
