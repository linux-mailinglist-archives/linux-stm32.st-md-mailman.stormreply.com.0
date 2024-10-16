Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F79A034A
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 09:56:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A73E5C78031;
	Wed, 16 Oct 2024 07:56:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 765BBC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 07:56:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G6skv5018459;
 Wed, 16 Oct 2024 09:56:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 h6vGd2oGBXjp3LNF/ZKw/vXaPHEfmCmhPVsuuoUPWew=; b=depyvZa7mGSXdNw8
 yhclXZax0Axo/lHoHn1i24hp+ok9KMlz+PK6qfri9cPONBSVd7JHVCQh4CdyDXWT
 D4sIa/LBgGnOZ7yXGdqDQ+MRmb1jgbs0dlHlCcizb6GtxFGPq7jXNJslyhoSq8p1
 z6CvY5QmMo/nBblCTm9uX6eKORPLEaUWbeFH65iAW3LbbRsyb2hOZ/gRcG0t5d8i
 a0N79pI/rDFQoqUl3+3oHX3afqlL6BWkKCjxSz1ObcSGFWkRKjFrQ6bPeVJC242P
 jiT/TyhpFZaNoAnv65F/t9XmptqrR+cWArmmwrlNR1gADK99hVUpGFlktYg4P6Ys
 VsEg7Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42a8mv8ah1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 09:56:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CBC414004B;
 Wed, 16 Oct 2024 09:55:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B0F6239453;
 Wed, 16 Oct 2024 09:54:28 +0200 (CEST)
Received: from [10.48.86.225] (10.48.86.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 09:54:27 +0200
Message-ID: <90ce2c1e-6e8b-43ba-9313-8b5560cb8e4d@foss.st.com>
Date: Wed, 16 Oct 2024 09:54:26 +0200
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
 <b06b5d09-190b-4567-aecd-4be1f1dee172@foss.st.com>
 <e5a21bb8-00c3-41f1-9a4d-856eb1465d45@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <e5a21bb8-00c3-41f1-9a4d-856eb1465d45@denx.de>
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

CgpPbiAxMC8xNS8yNCAxNzozOSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTAvMTUvMjQgNTox
MCBQTSwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDEwLzE0LzI0IDIwOjU1
LCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE9uIDEwLzE0LzI0IDI6MzYgUE0sIEdhdGllbiBDSEVW
QUxMSUVSIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiAxMC8xNC8yNCAxMDo1MiwgTWFyZWsgVmFz
dXQgd3JvdGU6Cj4+Pj4+IE9uIDEwLzE0LzI0IDEwOjM4IEFNLCBHYXRpZW4gQ0hFVkFMTElFUiB3
cm90ZToKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gT24gMTAvMTEvMjQgMTg6MTcsIE1hcmVrIFZhc3V0
IHdyb3RlOgo+Pj4+Pj4+IE9uIDEwLzExLzI0IDU6NDEgUE0sIEdhdGllbiBDaGV2YWxsaWVyIHdy
b3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gWy4uLl0KPj4+Pj4+Pgo+Pj4+Pj4+PiBAQCAtNTUxLDYgKzU2
NSw0MSBAQCBzdGF0aWMgaW50IHN0bTMyX3JuZ19wcm9iZShzdHJ1Y3QgCj4+Pj4+Pj4+IHBsYXRm
b3JtX2RldmljZSAqb2ZkZXYpCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgcHJpdi0+cm5nLnJlYWQgPSBz
dG0zMl9ybmdfcmVhZDsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBwcml2LT5ybmcucXVhbGl0eSA9IDkw
MDsKPj4+Pj4+Pj4gK8KgwqDCoCBpZiAoIXByaXYtPmRhdGEtPm5iX2Nsb2NrIHx8IHByaXYtPmRh
dGEtPm5iX2Nsb2NrID4gMikKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFM
Owo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgcHJpdi0+Y2xrX2J1bGsgPSBkZXZtX2t6YWxs
b2MoZGV2LCBwcml2LT5kYXRhLT5uYl9jbG9jayAqIAo+Pj4+Pj4+PiBzaXplb2YoKnByaXYtPmNs
a19idWxrKSwKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBHRlBfS0VSTkVMKTsKPj4+Pj4+Pj4gK8KgwqDCoCBpZiAoIXByaXYtPmNsa19idWxrKQo+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+Pj4+Pj4KPj4+Pj4+PiBU
cnkgdGhpczoKPj4+Pj4+Pgo+Pj4+Pj4+IHJldCA9IGRldm1fY2xrX2J1bGtfZ2V0KGRldiwgcHJp
di0+ZGF0YS0+bmJfY2xvY2ssIHByaXYtPmNsa19idWxrKTsKPj4+Pj4+PiAuLi4KPj4+Pj4+PiAv
LyBTd2FwIHRoZSBjbG9jayBpZiB0aGV5IGFyZSBub3QgaW4gdGhlIHJpZ2h0IG9yZGVyOgo+Pj4+
Pj4+IGlmIChwcml2LT5kYXRhLT5uYl9jbG9jayA9PSAyICYmCj4+Pj4+Pj4gwqDCoMKgwqAgc3Ry
Y21wKF9fY2xrX2dldF9uYW1lKHByaXYtPmNsa19idWxrWzBdLmNsayksICJjb3JlIikpCj4+Pj4+
Pj4gewo+Pj4+Pj4+IMKgwqBjb25zdCBjaGFyICppZCA9IHByaXYtPmNsa19idWxrWzFdLmlkOwo+
Pj4+Pj4+IMKgwqBzdHJ1Y3QgY2xrICpjbGsgPSBwcml2LT5jbGtfYnVsa1sxXS5jbGs7Cj4+Pj4+
Pj4gwqDCoHByaXYtPmNsa19idWxrWzFdLmlkID0gcHJpdi0+Y2xrX2J1bGtbMF0uaWQ7Cj4+Pj4+
Pj4gwqDCoHByaXYtPmNsa19idWxrWzFdLmNsayA9IHByaXYtPmNsa19idWxrWzBdLmNsazsKPj4+
Pj4+PiDCoMKgcHJpdi0+Y2xrX2J1bGtbMF0uaWQgPSBpZDsKPj4+Pj4+PiDCoMKgcHJpdi0+Y2xr
X2J1bGtbMF0uY2xrID0gY2xrOwo+Pj4+Pj4+IH0KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEhpIE1h
cmVrLAo+Pj4+Pj4KPj4+Pj4+IFRoaXMgd29uJ3Qgd29yayBhcyB0aGUgbmFtZSByZXR1cm5lZCBi
eSB0aGlzIEFQSSBpcyBjbGstPmNvcmUtPm5hbWUuCj4+Pj4+PiBBRkFJQ1QsIGl0IGRvZXNuJ3Qg
Y29ycmVzcG9uZCB0byB0aGUgbmFtZXMgcHJlc2VudCBpbiB0aGUgZGV2aWNlIHRyZWUKPj4+Pj4+
IHVuZGVyIHRoZSAiY2xvY2stbmFtZXMiIHByb3BlcnR5Lgo+Pj4+Pj4gQW55IG90aGVyIGlkZWEg
b3IgYXJlIHlvdSBmaW5lIHdpdGggd2hhdCdzIGJlbG93Pwo+Pj4+PiBIbW1tLCBpdCBpcyBub3Qg
Z3JlYXQsIGJ1dCBhdCBsZWFzdCBpdCByZWR1Y2VzIHRoZSBjaGFuZ2VzIAo+Pj4+PiB0aHJvdWdo
b3V0IHRoZSBkcml2ZXIsIHNvIHRoYXQgaXMgYW4gaW1wcm92ZW1lbnQuCj4+Pj4+Cj4+Pj4+IEkg
Z3Vlc3Mgb25lIGNvdWxkIGRvIHNvbWUgb2ZfY2xrX2dldCgpIGFuZCBjbGtfaXNfbWF0Y2goKSBp
biBwcm9iZSAKPj4+Pj4gdG8gbG9vayB1cCB0aGUgY2xvY2sgaW4gT0YgYnkgbmFtZSBhbmQgdGhl
biBjb21wYXJlIHdoaWNoIGNsb2NrIGlzIAo+Pj4+PiB3aGljaCBiZWZvcmUgc3dhcHBpbmcgdGhl
bSBpbiBjbGtfYnVsa1tdIGFycmF5LCBidXQgdGhhdCBtaWdodCBiZSAKPj4+Pj4gdG9vIGNvbnZv
bHV0ZWQ/Cj4+Pj4KPj4+PiBZZXMsIHByb2JhYmx5IHRvbyBtdWNoLiBXaGF0J3MgcHJlc2VudCBp
biB0aGUgcGF0Y2ggaXMgbm90IGNsb3NlIHRvCj4+Pj4gcGVyZmVjdGlvbiBidXQgaGFzIHRoZSBh
ZHZhbnRhZ2Ugb2YgYmVpbmcgc3RyYWlnaHRmb3J3YXJkLiBJZiB3ZSBhZ3JlZQo+Pj4+IG9uIHRo
YXQsIEknbGwgc2VuZCBhIFYzIGNvbnRhaW5pbmcgdGhlIG1vZGlmaWNhdGlvbnMgaW4gdGhlIGJp
bmRpbmdzCj4+Pj4gZmlsZS4KPj4+IEVycnIsIEknbSBzb3JyeSwgbWF5YmUgdGhlcmUgaXMgYSB3
YXkgdG8gZG8gdGhpcyBiZXR0ZXIuIExvb2sgYXQgCj4+PiBkcml2ZXJzL2Nsay9jbGstYnVsay5j
IDoKPj4+Cj4+PiDCoMKgMTUgc3RhdGljIGludCBfX211c3RfY2hlY2sgb2ZfY2xrX2J1bGtfZ2V0
KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIAo+Pj4gaW50IG51bV9jbGtzLAo+Pj4gwqDCoDE2wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGNsa19idWxrX2RhdGEgKmNsa3MpCj4+PiDCoMKg
MTcgewo+Pj4gwqDCoDE4wqDCoMKgwqDCoMKgwqDCoCBpbnQgcmV0Owo+Pj4gwqDCoDE5wqDCoMKg
wqDCoMKgwqDCoCBpbnQgaTsKPj4+IMKgwqAyMAo+Pj4gwqDCoDIxwqDCoMKgwqDCoMKgwqDCoCBm
b3IgKGkgPSAwOyBpIDwgbnVtX2Nsa3M7IGkrKykgewo+Pj4gwqDCoDIywqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY2xrc1tpXS5pZCA9IE5VTEw7Cj4+PiDCoMKgMjPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGtzW2ldLmNsayA9IE5VTEw7Cj4+PiDCoMKgMjTCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+IMKgwqAyNQo+Pj4gwqDCoDI2wqDCoMKgwqDCoMKgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgbnVtX2Nsa3M7IGkrKykgewo+Pj4gwqDCoDI3wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmdfaW5kZXgobnAsICJjbG9jay1u
YW1lcyIsIAo+Pj4gaSwgJmNsa3NbaV0uaWQpOwo+Pj4gwqDCoDI4wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2xrc1tpXS5jbGsgPSBvZl9jbGtfZ2V0KG5wLCBpKTsKPj4+Cj4+PiBJ
ZiBJIHJlYWQgdGhpcyByaWdodCwgdGhlbiBjbGtzW2ldLmlkIHNob3VsZCBiZSB0aGUgRFQgY2xv
Y2sgbmFtZS4gU28gCj4+PiB0aGUgc3dhcCBjb25kaXRpb25hbCBhYm92ZSBjb3VsZCB1c2UgLmlk
IHRvIGlkZW50aWZ5IHdoZXRoZXIgdGhlIAo+Pj4gZmlyc3QgcG9zaXRpb24gaXMgY29yZSBjbG9j
ayBvciBub3QsIGxpa2UgdGhpczoKPj4+Cj4+PiBpZiAocHJpdi0+ZGF0YS0+bmJfY2xvY2sgPT0g
MiAmJgo+Pj4gwqDCoMKgwqAgc3RyY21wKF9fY2xrX2dldF9uYW1lKHByaXYtPmNsa19idWxrWzBd
LmlkKSwgImNvcmUiKSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXl4KPj4+
Cj4+PiBZb3UgbWlnaHQgbmVlZCB0byB1c2UgZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkgdG8gYWNj
ZXNzIHRoZSAKPj4+IG9mX2Nsa19idWxrX2dldCgpIC4KPj4+Cj4+PiBPciBhbSBJIG1pc3Npbmcg
c29tZXRoaW5nIHN0aWxsID8KPj4KPj4gT29vb29oIEkgc2VlLCBkZXZtX2Nsa19idWxrX2dldCgp
IGFuZCBkZXZtX2Nsa19idWxrX2dldF9hbGwoKSB1c2UKPj4gYSBkaWZmZXJlbnQgcGF0aC4gSSBk
b24ndCB1bmRlcnN0YW5kIHdoeSwgdG8gYmUgaG9uZXN0Li4uIFRoZSBkb2MKPj4gZG9lc24ndCBz
dGF0ZSB0aGlzIGRpZmZlcmVuY2UgZWl0aGVyLgo+IAo+IEluZGVlZCwgYnV0IG1heWJlIGdpdCBs
b2cgY291bGQgY2xhcmlmeSB0aGF0ID8gSSBsZWFybnQgYWJvdXQgdGhpcyAKPiB1c2VmdWwgdHJp
Y2sgYXQgbGFzdCB5ZWFyIEVtYmVkZGVkIFJlY2lwZXM6Cj4gCj4gJCBnaXQgbG9nIC1MOmNsa19i
dWxrX2dldF9hbGw6ZHJpdmVycy9jbGsvY2xrLWJ1bGsuYwo+IAoKV2lsbCBkZWZpbml0ZWx5IGtl
ZXAgdGhhdCBzb21ld2hlcmUsIHRoYW5rcy4KCj4+IEknbGwgZ2l2ZSB0aGlzIGEgdHJ5IHdoaWxl
IGFsc28gY29ycmVjdGluZyB0aGUgaXNzdWUgdGhhdCB0aGUgcm9ib3QKPj4gaGlnaGxpZ2h0ZWQu
Cj4gVGhhbmsgeW91ICEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
