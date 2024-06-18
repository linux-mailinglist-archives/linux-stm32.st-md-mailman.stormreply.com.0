Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C927290C532
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 11:11:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A9EAC78001;
	Tue, 18 Jun 2024 09:11:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD83BC5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 09:11:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I6Z9Yu004223;
 Tue, 18 Jun 2024 11:10:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mZ2gz1uO27QN7pXr1aHkYNUz1eKbUVDgHMdiHyPJKlI=; b=G9NxefmJuyB0GvV2
 KOENsiD6laEfu4yo/CqfY466TRBnafFJnl8yv6Ayhuq5CpMuYk8gzgb3LWd3VTRj
 /pYT7B20oQsadjXWZi3BFK/PYgi6oI4ZR0NUe6DvhJR96U3MtkKuphMM3xWBKSvs
 mLotnNBd/J5amNgQQ8BYkqgaVoZR5FewmNYgwcOy1JnvKJxcOB/nU5ZVowA7lEEp
 qRofcPWgCuG8JPw9NlvDdyiQcUBEhv5Tq7NJ9n2zI/wx3PC/A44s0O0BBZZ7I39r
 d17IWMBDBxSnT3nWbE1AZBny1FFqgActjbdpirhhLm6jsb+saN4ViiNF5BXz5255
 TQX9Gg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys1uct15y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 11:10:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2A8894002D;
 Tue, 18 Jun 2024 11:10:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10A4D212FD7;
 Tue, 18 Jun 2024 11:09:38 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 18 Jun
 2024 11:09:37 +0200
Message-ID: <8c3f1696-d67c-4960-ad3a-90461c896aa5@foss.st.com>
Date: Tue, 18 Jun 2024 11:09:36 +0200
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
 <09010b02-fb55-4c4b-9d0c-36bd0b370dc8@foss.st.com>
 <39d35f6d-4f82-43af-883b-a574b8a67a1a@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <39d35f6d-4f82-43af-883b-a574b8a67a1a@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
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

SGkgTWFyZWssCgpPbiA2LzE3LzI0IDE3OjU3LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzE3
LzI0IDE6MjMgUE0sIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4KPiBIaSwKPgo+Pj4+ICtz
dGF0aWMgaW50IHN0bTMybXAyX2NvbmZpZ3VyZV9zeXNjZmcoc3RydWN0IHBsYXRfc3RtbWFjZW5l
dF9kYXRhIAo+Pj4+ICpwbGF0X2RhdCkKPj4+PiArewo+Pj4+ICvCoMKgwqAgc3RydWN0IHN0bTMy
X2R3bWFjICpkd21hYyA9IHBsYXRfZGF0LT5ic3BfcHJpdjsKPj4+PiArwqDCoMKgIHUzMiByZWcg
PSBkd21hYy0+bW9kZV9yZWc7Cj4+Pj4gK8KgwqDCoCBpbnQgdmFsID0gMDsKPj4+PiArCj4+Pj4g
K8KgwqDCoCBzd2l0Y2ggKHBsYXRfZGF0LT5tYWNfaW50ZXJmYWNlKSB7Cj4+Pj4gK8KgwqDCoCBj
YXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9NSUk6Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+
Pj4KPj4+IGR3bWFjLT5lbmFibGVfZXRoX2NrIGRvZXMgbm90IGFwcGx5IHRvIE1JSSBtb2RlID8g
V2h5ID8KPj4KPj4gSXQgaXMgbGlrZSBNUDEgYW5kIE1QMTMsIG5vdGhpbmcgdG8gc2V0IGluIHN5
c2NmZyByZWdpc3RlciBmb3IgY2FzZSAKPj4gTUlJIG1vZGUgd28gY3J5c3RhbC4KPgo+IEhhdmUg
YSBsb29rIGF0IFNUTTMyTVAxNXh4IFJNMDQzNiBGaWd1cmUgODMuIFBlcmlwaGVyYWwgY2xvY2sg
Cj4gZGlzdHJpYnV0aW9uIGZvciBFdGhlcm5ldC4KPgo+IElmIFJDQyAodG9wLWxlZnQgY29ybmVy
IG9mIHRoZSBmaWd1cmUpIGdlbmVyYXRlcyAyNSBNSHogTUlJIGNsb2NrIAo+ICh5ZWxsb3cgbGlu
ZSkgb24gZXRoX2Nsa19mYiAodG9wLXJpZ2h0IGNvcm5lciksIGNhbiBJIHNldCAKPiBFVEhfUkVG
X0NMS19TRUwgdG8gcG9zaXRpb24gJzEnIGFuZCBFVEhfU0VMWzJdIHRvICcwJyBhbmQgZmVlZCBF
VEggCj4gKHJpZ2h0IHNpZGUpIGNsa19yeF9pIGlucHV0IHdpdGggMjUgTUh6IGNsb2NrIHRoYXQg
d2F5ID8KPgo+IEkgc2VlbXMgbGlrZSB0aGlzIHNob3VsZCBiZSBwb3NzaWJsZSwgYXQgbGVhc3Qg
dGhlb3JldGljYWxseS4gQ2FuIHlvdSAKPiBjaGVjayB3aXRoIHRoZSBoYXJkd2FyZS9zaWxpY29u
IHBlb3BsZSA/Ck5vIGl0IGlzIG5vdCBwb3NzaWJsZSAoaXQgd2lsbCB3b3JrIGlmIHNwZWVkIChh
bmQgZnJlcXVlbmN5KSBpcyBmaXhlZMKgIAoyNU1oej0xMDBNYnBzLCBidXQgZm9yIHNwZWVkIDEw
TWJwcyAoMiw1TUh6KSBpdCB3aWxsIG5vdCB3b3JrLiAoeW91IGNhbiAKc2VlIHRoYW4gZGl2aXNl
ciBhcmUgb25seSBmb3IgUk1JSSBtb2RlKQo+Cj4gQXMgYSByZXN1bHQsIHRoZSBNSUkvUk1JSSBt
b2RlIHdvdWxkIGJlaGF2ZSBpbiBhIHZlcnkgc2ltaWxhciB3YXksIGFuZCAKPiBzbyB3b3VsZCBH
TUlJL1JHTUlJIG1vZGUgYmVoYXZlIGluIGEgdmVyeSBzaW1pbGFyIHdheS4gRWZmZWN0aXZlbHkg
eW91IAo+IHdvdWxkIGVuZCB1cCB3aXRoIHRoaXMgKG5vdGljZSB0aGUgZmFsbHRocm91Z2ggc3Rh
dGVtZW50cyk6Cj4KPiArwqDCoMKgIGNhc2UgUEhZX0lOVEVSRkFDRV9NT0RFX1JNSUk6Cj4gK8Kg
wqDCoMKgwqDCoMKgIHZhbCA9IFNZU0NGR19FVEhDUl9FVEhfU0VMX1JNSUk7Cj4gK8KgwqDCoMKg
wqDCoMKgIGZhbGx0aHJvdWdoOwo+ICvCoMKgwqAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVfTUlJ
Ogo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZHdtYWMtPmVuYWJsZV9ldGhfY2spCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdmFsIHw9IFNZU0NGR19FVEhDUl9FVEhfUkVGX0NMS19TRUw7Cj4gK8Kg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+ICsKPiArwqDCoMKgIGNhc2UgUEhZX0lOVEVSRkFDRV9NT0RF
X1JHTUlJOgo+ICvCoMKgwqAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUlfSUQ6Cj4gK8Kg
wqDCoCBjYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSV9SWElEOgo+ICvCoMKgwqAgY2FzZSBQ
SFlfSU5URVJGQUNFX01PREVfUkdNSUlfVFhJRDoKPiArwqDCoMKgwqDCoMKgwqAgdmFsID0gU1lT
Q0ZHX0VUSENSX0VUSF9TRUxfUkdNSUk7Cj4gK8KgwqDCoMKgwqDCoMKgIGZhbGx0aHJvdWdoOwo+
ICvCoMKgwqAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVfR01JSToKPiArwqDCoMKgwqDCoMKgwqAg
aWYgKGR3bWFjLT5lbmFibGVfZXRoX2NrKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCB8
PSBTWVNDRkdfRVRIQ1JfRVRIX0NMS19TRUw7Cj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Cj4g
Wy4uLl0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
