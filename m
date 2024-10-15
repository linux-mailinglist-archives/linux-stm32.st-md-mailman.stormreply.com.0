Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FBC99F0C1
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 17:13:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AF55C78030;
	Tue, 15 Oct 2024 15:13:50 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7701C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 15:13:42 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FBfd0r018076;
 Tue, 15 Oct 2024 17:13:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 A880Q2OSXTrE9WU64cKIX0T+jtcm1ta1QT9Gr1T9Cjw=; b=GDlG9XxrD0ZiJF55
 6g4imFbr0sP/QNSHD5H8aM6tnUZXaO5hzxCiAWDLVbUv3SkSL4uBBjMV8+xHlX3N
 +KCOSHPabgorYURUTTZ6l7nZRkckiX/+iWC6vAtPaqZoICr9ve3gYP5Ya8+yHpg+
 sTOK+rSutGZ9YwTkW4+KoGW9C+FysH+4qs8toe+ISKVXLibY3dOTCXSRBK9OKnwe
 42Ye9HE/5SFru6rrn1K6kYiQ5LW5MVsbzBPy8pFfKiDyhpjAhIBPEEw8J8q11WjO
 R2NlhWbxACeyzZBwRdsh9sbSp9rcKxTD/fpnHzRiXf8j+wbnDJe53aCa9cGNZuuh
 S3MWDA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42842jb63c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Oct 2024 17:13:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CFBEB40068;
 Tue, 15 Oct 2024 17:12:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A917523CB46;
 Tue, 15 Oct 2024 17:11:04 +0200 (CEST)
Received: from [10.48.86.225] (10.48.86.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 15 Oct
 2024 17:11:03 +0200
Message-ID: <b06b5d09-190b-4567-aecd-4be1f1dee172@foss.st.com>
Date: Tue, 15 Oct 2024 17:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, Olivia Mackall <olivia@selenic.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Lionel Debieve <lionel.debieve@foss.st.com>
References: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
 <20241011-rng-mp25-v2-v2-2-76fd6170280c@foss.st.com>
 <318dbd5e-f547-4d78-b42e-4dcacc08d328@denx.de>
 <f191d034-4116-4169-8c05-201450412bbd@foss.st.com>
 <8c13b0aa-7fb1-493c-9abc-5e5cfd982855@denx.de>
 <d862765e-e396-4f7c-97ff-76df9aa03216@foss.st.com>
 <dca83197-3484-4d6b-8507-118bf9e80e19@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <dca83197-3484-4d6b-8507-118bf9e80e19@denx.de>
X-Originating-IP: [10.48.86.225]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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

CgpPbiAxMC8xNC8yNCAyMDo1NSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTAvMTQvMjQgMjoz
NiBQTSwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDEwLzE0LzI0IDEwOjUy
LCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE9uIDEwLzE0LzI0IDEwOjM4IEFNLCBHYXRpZW4gQ0hF
VkFMTElFUiB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMTAvMTEvMjQgMTg6MTcsIE1hcmVrIFZh
c3V0IHdyb3RlOgo+Pj4+PiBPbiAxMC8xMS8yNCA1OjQxIFBNLCBHYXRpZW4gQ2hldmFsbGllciB3
cm90ZToKPj4+Pj4KPj4+Pj4gWy4uLl0KPj4+Pj4KPj4+Pj4+IEBAIC01NTEsNiArNTY1LDQxIEBA
IHN0YXRpYyBpbnQgc3RtMzJfcm5nX3Byb2JlKHN0cnVjdCAKPj4+Pj4+IHBsYXRmb3JtX2Rldmlj
ZSAqb2ZkZXYpCj4+Pj4+PiDCoMKgwqDCoMKgIHByaXYtPnJuZy5yZWFkID0gc3RtMzJfcm5nX3Jl
YWQ7Cj4+Pj4+PiDCoMKgwqDCoMKgIHByaXYtPnJuZy5xdWFsaXR5ID0gOTAwOwo+Pj4+Pj4gK8Kg
wqDCoCBpZiAoIXByaXYtPmRhdGEtPm5iX2Nsb2NrIHx8IHByaXYtPmRhdGEtPm5iX2Nsb2NrID4g
MikKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4+ICsKPj4+Pj4+
ICvCoMKgwqAgcHJpdi0+Y2xrX2J1bGsgPSBkZXZtX2t6YWxsb2MoZGV2LCBwcml2LT5kYXRhLT5u
Yl9jbG9jayAqIAo+Pj4+Pj4gc2l6ZW9mKCpwcml2LT5jbGtfYnVsayksCj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+Pj4+Pj4g
K8KgwqDCoCBpZiAoIXByaXYtPmNsa19idWxrKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAtRU5PTUVNOwo+Pj4+Pgo+Pj4+PiBUcnkgdGhpczoKPj4+Pj4KPj4+Pj4gcmV0ID0gZGV2bV9j
bGtfYnVsa19nZXQoZGV2LCBwcml2LT5kYXRhLT5uYl9jbG9jaywgcHJpdi0+Y2xrX2J1bGspOwo+
Pj4+PiAuLi4KPj4+Pj4gLy8gU3dhcCB0aGUgY2xvY2sgaWYgdGhleSBhcmUgbm90IGluIHRoZSBy
aWdodCBvcmRlcjoKPj4+Pj4gaWYgKHByaXYtPmRhdGEtPm5iX2Nsb2NrID09IDIgJiYKPj4+Pj4g
wqDCoMKgwqAgc3RyY21wKF9fY2xrX2dldF9uYW1lKHByaXYtPmNsa19idWxrWzBdLmNsayksICJj
b3JlIikpCj4+Pj4+IHsKPj4+Pj4gwqDCoGNvbnN0IGNoYXIgKmlkID0gcHJpdi0+Y2xrX2J1bGtb
MV0uaWQ7Cj4+Pj4+IMKgwqBzdHJ1Y3QgY2xrICpjbGsgPSBwcml2LT5jbGtfYnVsa1sxXS5jbGs7
Cj4+Pj4+IMKgwqBwcml2LT5jbGtfYnVsa1sxXS5pZCA9IHByaXYtPmNsa19idWxrWzBdLmlkOwo+
Pj4+PiDCoMKgcHJpdi0+Y2xrX2J1bGtbMV0uY2xrID0gcHJpdi0+Y2xrX2J1bGtbMF0uY2xrOwo+
Pj4+PiDCoMKgcHJpdi0+Y2xrX2J1bGtbMF0uaWQgPSBpZDsKPj4+Pj4gwqDCoHByaXYtPmNsa19i
dWxrWzBdLmNsayA9IGNsazsKPj4+Pj4gfQo+Pj4+Pgo+Pj4+Cj4+Pj4gSGkgTWFyZWssCj4+Pj4K
Pj4+PiBUaGlzIHdvbid0IHdvcmsgYXMgdGhlIG5hbWUgcmV0dXJuZWQgYnkgdGhpcyBBUEkgaXMg
Y2xrLT5jb3JlLT5uYW1lLgo+Pj4+IEFGQUlDVCwgaXQgZG9lc24ndCBjb3JyZXNwb25kIHRvIHRo
ZSBuYW1lcyBwcmVzZW50IGluIHRoZSBkZXZpY2UgdHJlZQo+Pj4+IHVuZGVyIHRoZSAiY2xvY2st
bmFtZXMiIHByb3BlcnR5Lgo+Pj4+IEFueSBvdGhlciBpZGVhIG9yIGFyZSB5b3UgZmluZSB3aXRo
IHdoYXQncyBiZWxvdz8KPj4+IEhtbW0sIGl0IGlzIG5vdCBncmVhdCwgYnV0IGF0IGxlYXN0IGl0
IHJlZHVjZXMgdGhlIGNoYW5nZXMgdGhyb3VnaG91dCAKPj4+IHRoZSBkcml2ZXIsIHNvIHRoYXQg
aXMgYW4gaW1wcm92ZW1lbnQuCj4+Pgo+Pj4gSSBndWVzcyBvbmUgY291bGQgZG8gc29tZSBvZl9j
bGtfZ2V0KCkgYW5kIGNsa19pc19tYXRjaCgpIGluIHByb2JlIHRvIAo+Pj4gbG9vayB1cCB0aGUg
Y2xvY2sgaW4gT0YgYnkgbmFtZSBhbmQgdGhlbiBjb21wYXJlIHdoaWNoIGNsb2NrIGlzIHdoaWNo
IAo+Pj4gYmVmb3JlIHN3YXBwaW5nIHRoZW0gaW4gY2xrX2J1bGtbXSBhcnJheSwgYnV0IHRoYXQg
bWlnaHQgYmUgdG9vIAo+Pj4gY29udm9sdXRlZD8KPj4KPj4gWWVzLCBwcm9iYWJseSB0b28gbXVj
aC4gV2hhdCdzIHByZXNlbnQgaW4gdGhlIHBhdGNoIGlzIG5vdCBjbG9zZSB0bwo+PiBwZXJmZWN0
aW9uIGJ1dCBoYXMgdGhlIGFkdmFudGFnZSBvZiBiZWluZyBzdHJhaWdodGZvcndhcmQuIElmIHdl
IGFncmVlCj4+IG9uIHRoYXQsIEknbGwgc2VuZCBhIFYzIGNvbnRhaW5pbmcgdGhlIG1vZGlmaWNh
dGlvbnMgaW4gdGhlIGJpbmRpbmdzCj4+IGZpbGUuCj4gRXJyciwgSSdtIHNvcnJ5LCBtYXliZSB0
aGVyZSBpcyBhIHdheSB0byBkbyB0aGlzIGJldHRlci4gTG9vayBhdCAKPiBkcml2ZXJzL2Nsay9j
bGstYnVsay5jIDoKPiAKPiAgwqAxNSBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBvZl9jbGtfYnVs
a19nZXQoc3RydWN0IGRldmljZV9ub2RlICpucCwgaW50IAo+IG51bV9jbGtzLAo+ICDCoDE2wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGNsa19idWxrX2RhdGEgKmNsa3MpCj4gIMKgMTcg
ewo+ICDCoDE4wqDCoMKgwqDCoMKgwqDCoCBpbnQgcmV0Owo+ICDCoDE5wqDCoMKgwqDCoMKgwqDC
oCBpbnQgaTsKPiAgwqAyMAo+ICDCoDIxwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwg
bnVtX2Nsa3M7IGkrKykgewo+ICDCoDIywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2xrc1tpXS5pZCA9IE5VTEw7Cj4gIMKgMjPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjbGtzW2ldLmNsayA9IE5VTEw7Cj4gIMKgMjTCoMKgwqDCoMKgwqDCoMKgIH0KPiAgwqAyNQo+
ICDCoDI2wqDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgbnVtX2Nsa3M7IGkrKykgewo+
ICDCoDI3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2ZfcHJvcGVydHlfcmVhZF9z
dHJpbmdfaW5kZXgobnAsICJjbG9jay1uYW1lcyIsIGksIAo+ICZjbGtzW2ldLmlkKTsKPiAgwqAy
OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa3NbaV0uY2xrID0gb2ZfY2xrX2dl
dChucCwgaSk7Cj4gCj4gSWYgSSByZWFkIHRoaXMgcmlnaHQsIHRoZW4gY2xrc1tpXS5pZCBzaG91
bGQgYmUgdGhlIERUIGNsb2NrIG5hbWUuIFNvIAo+IHRoZSBzd2FwIGNvbmRpdGlvbmFsIGFib3Zl
IGNvdWxkIHVzZSAuaWQgdG8gaWRlbnRpZnkgd2hldGhlciB0aGUgZmlyc3QgCj4gcG9zaXRpb24g
aXMgY29yZSBjbG9jayBvciBub3QsIGxpa2UgdGhpczoKPiAKPiBpZiAocHJpdi0+ZGF0YS0+bmJf
Y2xvY2sgPT0gMiAmJgo+ICDCoMKgwqAgc3RyY21wKF9fY2xrX2dldF9uYW1lKHByaXYtPmNsa19i
dWxrWzBdLmlkKSwgImNvcmUiKSkKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXl4K
PiAKPiBZb3UgbWlnaHQgbmVlZCB0byB1c2UgZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkgdG8gYWNj
ZXNzIHRoZSAKPiBvZl9jbGtfYnVsa19nZXQoKSAuCj4gCj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0
aGluZyBzdGlsbCA/CgpPb29vb2ggSSBzZWUsIGRldm1fY2xrX2J1bGtfZ2V0KCkgYW5kIGRldm1f
Y2xrX2J1bGtfZ2V0X2FsbCgpIHVzZQphIGRpZmZlcmVudCBwYXRoLiBJIGRvbid0IHVuZGVyc3Rh
bmQgd2h5LCB0byBiZSBob25lc3QuLi4gVGhlIGRvYwpkb2Vzbid0IHN0YXRlIHRoaXMgZGlmZmVy
ZW5jZSBlaXRoZXIuCgpJJ2xsIGdpdmUgdGhpcyBhIHRyeSB3aGlsZSBhbHNvIGNvcnJlY3Rpbmcg
dGhlIGlzc3VlIHRoYXQgdGhlIHJvYm90CmhpZ2hsaWdodGVkLgoKQmVzdCByZWdhcmRzLApHYXRp
ZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
