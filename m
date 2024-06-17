Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232B90ACDB
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 13:24:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD501C6B45B;
	Mon, 17 Jun 2024 11:24:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D10FAC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 11:24:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H8QOdR013701;
 Mon, 17 Jun 2024 13:24:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ihd8JZG+nI+ageiVBS3hq5sjCegkaeHknt9LK/X6/1M=; b=ux4Jf4p+Y3hysvf7
 F+iuZ1qR8apPHEwU+kNDncimJCJWMDlMnXr02oMQ83nzurKCa45K9GvP6sK52p/f
 GEVbbk4alTESbn8+x2X7+4bYe3HWryK/qhuhNn4TySFvDwIriF8CtdY0M5yrZ+AP
 zC/mOeiZcJskKOKcMSJsBDiBKxQ73YdmY711H92TpQU/4ydBMZpIU6w6xmTtg/U6
 76Sf6Muq/tjjb08ogee9FBt2Mg8VgdVM6Cch9LlPnvelW2urWGx+VT1/jkg6/VcA
 nPcvFkr/UyumtAlIrH1NHFvKpBqqWjyj3mAUMqeoNc+Mk5l+aOjlA52LO9Cv46yZ
 2hd+OA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys035e84u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2024 13:24:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0FA104002D;
 Mon, 17 Jun 2024 13:24:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 809252132CA;
 Mon, 17 Jun 2024 13:23:37 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 17 Jun
 2024 13:23:36 +0200
Message-ID: <09010b02-fb55-4c4b-9d0c-36bd0b370dc8@foss.st.com>
Date: Mon, 17 Jun 2024 13:23:35 +0200
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
References: <20240614130812.72425-1-christophe.roullier@foss.st.com>
 <20240614130812.72425-3-christophe.roullier@foss.st.com>
 <4c2f1bac-4957-4814-bf62-816340bd9ff6@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <4c2f1bac-4957-4814-bf62-816340bd9ff6@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_10,2024-06-17_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH 2/2] net: stmmac: dwmac-stm32: stm32: add management of
 stm32mp25 for stm32
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

SGkgTWFyZWssCgpPbiA2LzE0LzI0IDE1OjU4LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzE0
LzI0IDM6MDggUE0sIENocmlzdG9waGUgUm91bGxpZXIgd3JvdGU6Cj4KPiBbLi4uXQo+Cj4+ICtz
dGF0aWMgaW50IHN0bTMybXAyX2NvbmZpZ3VyZV9zeXNjZmcoc3RydWN0IHBsYXRfc3RtbWFjZW5l
dF9kYXRhIAo+PiAqcGxhdF9kYXQpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHN0bTMyX2R3bWFj
ICpkd21hYyA9IHBsYXRfZGF0LT5ic3BfcHJpdjsKPj4gK8KgwqDCoCB1MzIgcmVnID0gZHdtYWMt
Pm1vZGVfcmVnOwo+PiArwqDCoMKgIGludCB2YWwgPSAwOwo+PiArCj4+ICvCoMKgwqAgc3dpdGNo
IChwbGF0X2RhdC0+bWFjX2ludGVyZmFjZSkgewo+PiArwqDCoMKgIGNhc2UgUEhZX0lOVEVSRkFD
RV9NT0RFX01JSToKPj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Cj4gZHdtYWMtPmVuYWJsZV9l
dGhfY2sgZG9lcyBub3QgYXBwbHkgdG8gTUlJIG1vZGUgPyBXaHkgPwoKSXQgaXMgbGlrZSBNUDEg
YW5kIE1QMTMsIG5vdGhpbmcgdG8gc2V0IGluIHN5c2NmZyByZWdpc3RlciBmb3IgY2FzZSBNSUkg
Cm1vZGUgd28gY3J5c3RhbC4KCj4KPj4gK8KgwqDCoCBjYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9H
TUlJOgo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGR3bWFjLT5lbmFibGVfZXRoX2NrKQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwgfD0gU1lTQ0ZHX0VUSENSX0VUSF9DTEtfU0VMOwo+PiAr
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVf
Uk1JSToKPj4gK8KgwqDCoMKgwqDCoMKgIHZhbCA9IFNZU0NGR19FVEhDUl9FVEhfU0VMX1JNSUk7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZHdtYWMtPmVuYWJsZV9ldGhfY2spCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHZhbCB8PSBTWVNDRkdfRVRIQ1JfRVRIX1JFRl9DTEtfU0VMOwo+PiAr
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVf
UkdNSUk6Cj4+ICvCoMKgwqAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUlfSUQ6Cj4+ICvC
oMKgwqAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUlfUlhJRDoKPj4gK8KgwqDCoCBjYXNl
IFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSV9UWElEOgo+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0g
U1lTQ0ZHX0VUSENSX0VUSF9TRUxfUkdNSUk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZHdtYWMt
PmVuYWJsZV9ldGhfY2spCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCB8PSBTWVNDRkdf
RVRIQ1JfRVRIX0NMS19TRUw7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoCBk
ZWZhdWx0Ogo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihkd21hYy0+ZGV2LCAiTW9kZSAlcyBu
b3Qgc3VwcG9ydGVkIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGh5X21vZGVzKHBsYXRf
ZGF0LT5tYWNfaW50ZXJmYWNlKSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBEbyBub3QgbWFuYWdl
IG90aGVycyBpbnRlcmZhY2VzICovCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsK
Pj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBkZXZfZGJnKGR3bWFjLT5kZXYsICJNb2RlICVz
IiwgcGh5X21vZGVzKHBsYXRfZGF0LT5tYWNfaW50ZXJmYWNlKSk7Cj4+ICsKPj4gK8KgwqDCoCAv
KsKgIHNlbGVjdCBQVFAgKElFRUUxNTg4KSBjbG9jayBzZWxlY3Rpb24gZnJvbSBSQ0MgCj4+IChj
a19rZXJfZXRoeHB0cCkgKi8KPgo+IERyb3AgZXh0cmEgbGVhZGluZyBzcGFjZS4KPiBTZW50ZW5j
ZSBzdGFydHMgd2l0aCBjYXBpdGFsIGxldHRlci4Kb2sKPgo+PiArwqDCoMKgIHZhbCB8PSBTWVND
RkdfRVRIQ1JfRVRIX1BUUF9DTEtfU0VMOwo+PiArCj4+ICvCoMKgwqAgLyogVXBkYXRlIEVUSENS
IChzZXQgcmVnaXN0ZXIpICovCj4+ICvCoMKgwqAgcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhk
d21hYy0+cmVnbWFwLCByZWcsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBT
WVNDRkdfTVAyX0VUSF9NQVNLLCB2YWwpOwo+PiArfQo+PiArCj4+IMKgIHN0YXRpYyBpbnQgc3Rt
MzJtcDFfc2V0X21vZGUoc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0X2RhdCkKPj4g
wqAgewo+PiDCoMKgwqDCoMKgIGludCByZXQ7Cj4+IEBAIC0yOTIsNiArMzQ2LDIxIEBAIHN0YXRp
YyBpbnQgc3RtMzJtcDFfc2V0X21vZGUoc3RydWN0IAo+PiBwbGF0X3N0bW1hY2VuZXRfZGF0YSAq
cGxhdF9kYXQpCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHN0bTMybXAxX2NvbmZpZ3VyZV9wbWNyKHBs
YXRfZGF0KTsKPj4gwqAgfQo+PiDCoCArc3RhdGljIGludCBzdG0zMm1wMl9zZXRfbW9kZShzdHJ1
Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0KQo+PiArewo+PiArwqDCoMKgIGludCBy
ZXQ7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSBzdG0zMm1wMV9zZWxlY3RfZXRoY2tfZXh0ZXJuYWwo
cGxhdF9kYXQpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Owo+PiArCj4+ICvCoMKgwqAgcmV0ID0gc3RtMzJtcDFfdmFsaWRhdGVfZXRoY2tfcmF0ZShw
bGF0X2RhdCk7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBy
ZXQ7Cj4KPgo+IElzIGl0IG5lY2Vzc2FyeSB0byBkdXBsaWNhdGUgdGhpcyBlbnRpcmUgZnVuY3Rp
b24gaW5zdGVhZCBvZiBzb21lOgo+Cj4gaWYgKGlzX21wMikKPiDCoCByZXR1cm4gc3RtMzJtcDJf
Y29uZmlndXJlX3N5c2NmZyhwbGF0X2RhdCk7Cj4gZWxzZQo+IMKgIHJldHVybiBzdG0zMm1wMV9j
b25maWd1cmVfc3lzY2ZnKHBsYXRfZGF0KTsKPgo+ID8Kb2sgSSB3b3VsZCBsaWtlIHRvIGF2b2lk
IHRvIHVzZSBpc19tcDIgYm9vbGVhbiBidXQgeW91IGFyZSByaWdodCBpdCBpcyAKc2ltcGxpZnkg
dmlzaWJpbGl0eSBvZiB0aGUgY29kZS4KPgo+PiArwqDCoMKgIHJldHVybiBzdG0zMm1wMl9jb25m
aWd1cmVfc3lzY2ZnKHBsYXRfZGF0KTsKPj4gK30KPj4gKwo+PiDCoCBzdGF0aWMgaW50IHN0bTMy
bWN1X3NldF9tb2RlKHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQpCj4+IMKg
IHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjID0gcGxhdF9kYXQtPmJz
cF9wcml2Owo+PiBAQCAtMzQ4LDEyICs0MTcsNiBAQCBzdGF0aWMgaW50IHN0bTMyX2R3bWFjX3Bh
cnNlX2RhdGEoc3RydWN0IAo+PiBzdG0zMl9kd21hYyAqZHdtYWMsCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gUFRSX0VSUihkd21hYy0+Y2xrX3J4KTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKg
IC3CoMKgwqAgaWYgKGR3bWFjLT5vcHMtPnBhcnNlX2RhdGEpIHsKPj4gLcKgwqDCoMKgwqDCoMKg
IGVyciA9IGR3bWFjLT5vcHMtPnBhcnNlX2RhdGEoZHdtYWMsIGRldik7Cj4+IC3CoMKgwqDCoMKg
wqDCoCBpZiAoZXJyKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+PiAt
wqDCoMKgIH0KPj4gLQo+PiDCoMKgwqDCoMKgIC8qIEdldCBtb2RlIHJlZ2lzdGVyICovCj4+IMKg
wqDCoMKgwqAgZHdtYWMtPnJlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUo
bnAsICJzdCxzeXNjb24iKTsKPj4gwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGR3bWFjLT5yZWdtYXAp
KQo+PiBAQCAtMzY1LDIwICs0MjgsMTQgQEAgc3RhdGljIGludCBzdG0zMl9kd21hY19wYXJzZV9k
YXRhKHN0cnVjdCAKPj4gc3RtMzJfZHdtYWMgKmR3bWFjLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIGVycjsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIC3CoMKgwqAgZHdtYWMtPm1vZGVfbWFz
ayA9IFNZU0NGR19NUDFfRVRIX01BU0s7Cj4+IC3CoMKgwqAgZXJyID0gb2ZfcHJvcGVydHlfcmVh
ZF91MzJfaW5kZXgobnAsICJzdCxzeXNjb24iLCAyLCAKPj4gJmR3bWFjLT5tb2RlX21hc2spOwo+
PiAtwqDCoMKgIGlmIChlcnIpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChkd21hYy0+b3BzLT5p
c19tcDEzKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIlN5c2NvbmZp
ZyByZWdpc3RlciBtYXNrIG11c3QgYmUgc2V0IAo+PiAoJWQpXG4iLCBlcnIpOwo+PiAtwqDCoMKg
wqDCoMKgwqAgZWxzZQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZGJnKGRldiwgIldh
cm5pbmcgc3lzY29uZmlnIHJlZ2lzdGVyIG1hc2sgbm90IHNldFxuIik7Cj4+IC3CoMKgwqAgfQo+
PiArwqDCoMKgIGlmIChkd21hYy0+b3BzLT5wYXJzZV9kYXRhKQo+PiArwqDCoMKgwqDCoMKgwqAg
ZXJyID0gZHdtYWMtPm9wcy0+cGFyc2VfZGF0YShkd21hYywgZGV2KTsKPgo+IFdoeSBpcyB0aGlz
IGNoYW5nZSBoZXJlID8gV2hhdCBpcyB0aGUgcHVycG9zZSA/Cj4gVGhpcyBzaG91bGQgYmUgZG9j
dW1lbnRlZCBpbiBjb21taXQgbWVzc2FnZSB0b28uCj4KPiBUaGUgaW5kaXJlY3QgY2FsbCBpcyBu
b3QgbmVjZXNzYXJ5IGVpdGhlciwgc2ltcGx5IGRvCj4KPiBpZiAoaXNfbXAyKQo+IMKgIHJldHVy
biBlcnI7Cj4KPiAuLi4gZG8gbXAxNS8xMyBzdHVmZiBoZXJlIC4uLgo+Cj4gcmV0dXJuIGVycjsK
UmlnaHQsIHdpdGggdXNlIG9mIGlzX21wMiB2YXJpYWJsZSBpdCBpcyBtb3JlIHNpbXBsZQo+Cj4g
Wy4uLl0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
