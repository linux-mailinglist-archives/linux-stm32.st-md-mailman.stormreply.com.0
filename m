Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8950F8C4100
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 14:50:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CBB8C640E5;
	Mon, 13 May 2024 12:50:30 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1472BC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 12:50:23 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DBQd8F009156;
 Mon, 13 May 2024 14:49:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=jULG4BPSUFaHm0SKRBaAKf82JzLF2ZXIL0z6ooA0hNg=; b=6E
 M+wPBHTG9ST0T5Fws2x7VuO9e7bNBevGyZ2rVYrEKqwujVz2wJ+GaMRrP8wqj6Gx
 VEIORBcsNTRAFY7Vul4OQCvrCNiNyFQLeuclTaloTVn+HZjfa3nP9j408Sy6eCff
 Nza937rWANALuLSC/ii7BLd+uh1jgX5BM27P+iRckhH6wNU2kbQwRGrpbKBsQSoV
 8XA/x63SrdOTBjQIdui63HSWvAibBwxIoBi3T11R1SMo5157fqR0Ms+q7K8cnoPv
 AyqzxHAe9FVJpyPn0K70sXDWMXvkQ6nqQ9GQhY62qT7qJzhPuf7vnvVFTfBogCSR
 oYbFIP1yx4pk2WmsmQKA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y2kmhmbyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 14:49:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1F9694002D;
 Mon, 13 May 2024 14:49:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AA2121B519;
 Mon, 13 May 2024 14:48:28 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 14:48:26 +0200
Message-ID: <4da0ce80-2120-4d67-aaaa-7dbf13b1da73@foss.st.com>
Date: Mon, 13 May 2024 14:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-4-christophe.roullier@foss.st.com>
 <56f2d023-82d5-4910-8c4e-68e9d62bd1fe@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <56f2d023-82d5-4910-8c4e-68e9d62bd1fe@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_08,2024-05-10_02,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 03/11] net: stmmac: dwmac-stm32: rework
 glue to simplify management
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

SGkKCk9uIDQvMjYvMjQgMTY6NTMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDQvMjYvMjQgMjo1
NiBQTSwgQ2hyaXN0b3BoZSBSb3VsbGllciB3cm90ZToKPj4gQ2hhbmdlIGdsdWUgdG8gYmUgbW9y
ZSBnZW5lcmljIGFuZCBtYW5hZ2UgZWFzaWx5IG5leHQgc3RtMzIgcHJvZHVjdHMuCj4+IFRoZSBn
b2FsIG9mIHRoaXMgY29tbWl0IGlzIHRvIGhhdmUgb25lIHN0bTMybXAxX3NldF9tb2RlIGZ1bmN0
aW9uIHdoaWNoCj4+IGNhbiBtYW5hZ2UgZGlmZmVyZW50IFNUTTMyIFNPQy4gU09DIGNhbiBoYXZl
IGRpZmZlcmVudCBTWVNDRkcgcmVnaXN0ZXIKPj4gYml0ZmllbGRzLiBzbyBpbiBwbWNzZXRyIHdl
IGRlZmluZWQgdGhlIGJpdGZpZWxkcyBjb3JyZXNwb25kaW5nIHRvIAo+PiB0aGUgU09DLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxsaWVy
QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1zdG0zMi5jIHwgNzYgKysrKysrKysrKysrKy0tLS0tLQo+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jIAo+PiBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMKPj4gaW5k
ZXggYzkyZGZjNGVjZjU3Li42OGEwMmRlMjVhYzcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMKPj4gKysrIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYwo+PiBAQCAtMjMsMTAgKzIz
LDYgQEAKPj4gwqAgwqAgI2RlZmluZSBTWVNDRkdfTUNVX0VUSF9NQVNLwqDCoMKgwqDCoMKgwqAg
QklUKDIzKQo+PiDCoCAjZGVmaW5lIFNZU0NGR19NUDFfRVRIX01BU0vCoMKgwqDCoMKgwqDCoCBH
RU5NQVNLKDIzLCAxNikKPj4gLSNkZWZpbmUgU1lTQ0ZHX1BNQ0NMUlJfT0ZGU0VUwqDCoMKgwqDC
oMKgwqAgMHg0MAo+PiAtCj4+IC0jZGVmaW5lIFNZU0NGR19QTUNSX0VUSF9DTEtfU0VMwqDCoMKg
wqDCoMKgwqAgQklUKDE2KQo+PiAtI2RlZmluZSBTWVNDRkdfUE1DUl9FVEhfUkVGX0NMS19TRUzC
oMKgwqAgQklUKDE3KQo+PiDCoCDCoCAvKiBDTE9DSyBmZWVkIHRvIFBIWSovCj4+IMKgICNkZWZp
bmUgRVRIX0NLX0ZfMjVNwqDCoMKgIDI1MDAwMDAwCj4+IEBAIC00Niw5ICs0Miw2IEBACj4+IMKg
wqAgKiBSTUlJwqAgfMKgwqAgMcKgwqDCoMKgIHzCoMKgIDDCoMKgwqDCoMKgIHzCoMKgIDDCoMKg
wqDCoMKgwqAgfMKgIG4vYcKgIHwKPj4gwqDCoCAqLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4+IMKgwqAgKi8KPj4gLSNkZWZpbmUgU1lTQ0ZHX1BNQ1JfRVRIX1NF
TF9NSUnCoMKgwqDCoMKgwqDCoCBCSVQoMjApCj4+IC0jZGVmaW5lIFNZU0NGR19QTUNSX0VUSF9T
RUxfUkdNSUnCoMKgwqAgQklUKDIxKQo+PiAtI2RlZmluZSBTWVNDRkdfUE1DUl9FVEhfU0VMX1JN
SUnCoMKgwqAgQklUKDIzKQo+PiDCoCAjZGVmaW5lIFNZU0NGR19QTUNSX0VUSF9TRUxfR01JScKg
wqDCoCAwCj4+IMKgICNkZWZpbmUgU1lTQ0ZHX01DVV9FVEhfU0VMX01JScKgwqDCoMKgwqDCoMKg
IDAKPj4gwqAgI2RlZmluZSBTWVNDRkdfTUNVX0VUSF9TRUxfUk1JScKgwqDCoMKgwqDCoMKgIDEK
Pj4gQEAgLTkwLDE5ICs4MywzMyBAQCBzdHJ1Y3Qgc3RtMzJfZHdtYWMgewo+PiDCoMKgwqDCoMKg
IGludCBldGhfcmVmX2Nsa19zZWxfcmVnOwo+PiDCoMKgwqDCoMKgIGludCBpcnFfcHdyX3dha2V1
cDsKPj4gwqDCoMKgwqDCoCB1MzIgbW9kZV9yZWc7wqDCoMKgwqDCoMKgwqDCoCAvKiBNQUMgZ2x1
ZS1sb2dpYyBtb2RlIHJlZ2lzdGVyICovCj4+ICvCoMKgwqAgdTMyIG1vZGVfbWFzazsKPj4gwqDC
oMKgwqDCoCBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4+IMKgwqDCoMKgwqAgdTMyIHNwZWVkOwo+
PiDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBzdG0zMl9vcHMgKm9wczsKPj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgZGV2aWNlICpkZXY7Cj4+IMKgIH07Cj4+IMKgICtzdHJ1Y3Qgc3RtMzJfc3lzY2ZnX3Bt
Y3NldHIgewo+PiArwqDCoMKgIHUzMiBldGgxX2Nsa19zZWw7Cj4+ICvCoMKgwqAgdTMyIGV0aDFf
cmVmX2Nsa19zZWw7Cj4+ICvCoMKgwqAgdTMyIGV0aDFfc2VsbWlpOwo+PiArwqDCoMKgIHUzMiBl
dGgxX3NlbF9yZ21paTsKPj4gK8KgwqDCoCB1MzIgZXRoMV9zZWxfcm1paTsKPj4gK8KgwqDCoCB1
MzIgZXRoMl9jbGtfc2VsOwo+PiArwqDCoMKgIHUzMiBldGgyX3JlZl9jbGtfc2VsOwo+PiArwqDC
oMKgIHUzMiBldGgyX3NlbF9yZ21paTsKPj4gK8KgwqDCoCB1MzIgZXRoMl9zZWxfcm1paTsKPj4g
K307Cj4KPiBbLi4uXQo+Cj4+IEBAIC00ODcsOCArNTAyLDE5IEBAIHN0YXRpYyBzdHJ1Y3Qgc3Rt
MzJfb3BzIHN0bTMybXAxX2R3bWFjX2RhdGEgPSB7Cj4+IMKgwqDCoMKgwqAgLnN1c3BlbmQgPSBz
dG0zMm1wMV9zdXNwZW5kLAo+PiDCoMKgwqDCoMKgIC5yZXN1bWUgPSBzdG0zMm1wMV9yZXN1bWUs
Cj4+IMKgwqDCoMKgwqAgLnBhcnNlX2RhdGEgPSBzdG0zMm1wMV9wYXJzZV9kYXRhLAo+PiAtwqDC
oMKgIC5zeXNjZmdfZXRoX21hc2sgPSBTWVNDRkdfTVAxX0VUSF9NQVNLLAo+PiAtwqDCoMKgIC5j
bGtfcnhfZW5hYmxlX2luX3N1c3BlbmQgPSB0cnVlCj4+ICvCoMKgwqAgLmNsa19yeF9lbmFibGVf
aW5fc3VzcGVuZCA9IHRydWUsCj4+ICvCoMKgwqAgLnN5c2NmZ19jbHJfb2ZmID0gMHg0NCwKPj4g
K8KgwqDCoCAucG1jc2V0ciA9IHsKPj4gK8KgwqDCoMKgwqDCoMKgIC5ldGgxX2Nsa19zZWzCoMKg
wqDCoMKgwqDCoCA9IEJJVCgxNiksCj4+ICvCoMKgwqDCoMKgwqDCoCAuZXRoMV9yZWZfY2xrX3Nl
bMKgwqDCoCA9IEJJVCgxNyksCj4+ICvCoMKgwqDCoMKgwqDCoCAuZXRoMV9zZWxtaWnCoMKgwqDC
oMKgwqDCoCA9IEJJVCgyMCksCj4+ICvCoMKgwqDCoMKgwqDCoCAuZXRoMV9zZWxfcmdtaWnCoMKg
wqDCoMKgwqDCoCA9IEJJVCgyMSksCj4+ICvCoMKgwqDCoMKgwqDCoCAuZXRoMV9zZWxfcm1pacKg
wqDCoMKgwqDCoMKgID0gQklUKDIzKSwKPj4gK8KgwqDCoMKgwqDCoMKgIC5ldGgyX2Nsa19zZWzC
oMKgwqDCoMKgwqDCoCA9IDAsCj4+ICvCoMKgwqDCoMKgwqDCoCAuZXRoMl9yZWZfY2xrX3NlbMKg
wqDCoCA9IDAsCj4+ICvCoMKgwqDCoMKgwqDCoCAuZXRoMl9zZWxfcmdtaWnCoMKgwqDCoMKgwqDC
oCA9IDAsCj4+ICvCoMKgwqDCoMKgwqDCoCAuZXRoMl9zZWxfcm1pacKgwqDCoMKgwqDCoMKgID0g
MAo+PiArwqDCoMKgIH0KPj4gwqAgfTsKPgo+IElzIHRoaXMgc3RydWN0dXJlIHJlYWxseSBuZWNl
c3NhcnkgPwo+CkkgcHJlZmVyIHRvIGtlZXAgdGhpcyBpbXBsZW1lbnRhdGlvbiBmb3IgdGhlIG1v
bWVudCwgYXMgaXQgaXMgd29ya2luZyAKZmluZS4gTWF5YmUgYXQgYSBsYXRlciBzdGFnZSwgSSB3
aWxsIHNlbmQgc29tZSBvcHRpbWl6YXRpb25zLgoKPiBJdCBzZWVtcyB0aGUgTVAxNSBzaW5nbGUg
ZXRoZXJuZXQgY29uZmlnIGJpdGZpZWxkIGlzIGF0IG9mZnNldCAxNi4KPiBNUDEzIGhhcyB0d28g
Yml0ZmllbGRzLCBvbmUgYXQgb2Zmc2V0IDE2LCB0aGUgb3RoZXIgYXQgb2Zmc2V0IDI0IC4KPgo+
IEFsbCB5b3UgbmVlZCB0byBkbyBpcyBmaWd1cmUgb3V0IHdoaWNoIG9mIHRoZSB0d28gTUFDcyB5
b3UgYXJlIAo+IGNvbmZpZ3VyaW5nLCBhbmQgdGhlbiBzaGlmdCB0aGUgYml0ZmllbGQgbWFzayBi
eSAxNiBvciAyNCwgc2luY2UgdGhlIAo+IGJpdHMgYXJlIGF0IHRoZSBzYW1lIG9mZnNldCBmb3Ig
Ym90aCBiaXRmaWVsZHMuCj4KPiBTZWUgdGhlIG1hdGNoaW5nIHVwc3RyZWFtIFUtQm9vdCBjb21t
aXQgZm9yIGhvdyB0aGlzIHNoaWZ0IGNhbiBiZSBkb25lOgo+IGE0NDBkMTljNmM5MSAoIm5ldDog
ZHdjX2V0aF9xb3M6IEFkZCBEVCBwYXJzaW5nIGZvciBTVE0zMk1QMTN4eCAKPiBwbGF0Zm9ybSIp
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
