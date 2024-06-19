Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 113CE90E4C5
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 09:43:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0924C78001;
	Wed, 19 Jun 2024 07:43:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B148BC5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 07:43:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J7QKhf006854;
 Wed, 19 Jun 2024 09:43:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 di+SFQRmDgPvKMWT6Avy9+LOTjR2HwG3kwmIyd/HWss=; b=bQYIK2BVaJri3TYl
 Mx9sEnwEywh9t7P2P9uEBpVr9z0M2NJ8+BqVkU4DX3Yd0O4nuuiuiN/gbbsujcmz
 PFJMEPSU1RyqjHdHjVrOQl6Wi/nwyh6rpyhcZ1+ojawgwQ2NSXo+9LoumV7TaG+n
 kPuvrorX22uMVDsct3j7jaW9F+qOeCdYWylExJKWRhE4vJs/K3lv4aqWVUkbG0yI
 CSL1HfPRS9vRRPN5CJIwwiO/m6g45zD8TQ2qHY9O9hOEBHIwhQcTwdBHqWtYLYH5
 DpIjOLBgrNUc1P0abkwJ53f7R1W9NL4JGDbt0yfTxlKjeqjKx3onsE/EWHlABaz3
 4crI/Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yuj9t1u0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 09:43:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9017D40048;
 Wed, 19 Jun 2024 09:42:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3253210F6D;
 Wed, 19 Jun 2024 09:41:42 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 19 Jun
 2024 09:41:39 +0200
Message-ID: <aee3f6d2-6a44-4de6-9348-f83c4107188f@foss.st.com>
Date: Wed, 19 Jun 2024 09:41:38 +0200
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
 <8c3f1696-d67c-4960-ad3a-90461c896aa5@foss.st.com>
 <3dee3c8a-12f0-42bd-acdf-8008da795467@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <3dee3c8a-12f0-42bd-acdf-8008da795467@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
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

SGkgTWFyZWssCgpPbiA2LzE4LzI0IDE3OjAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzE4
LzI0IDExOjA5IEFNLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgo+Cj4gSGksCj4KPj4+Pj4+
ICtzdGF0aWMgaW50IHN0bTMybXAyX2NvbmZpZ3VyZV9zeXNjZmcoc3RydWN0IHBsYXRfc3RtbWFj
ZW5ldF9kYXRhIAo+Pj4+Pj4gKnBsYXRfZGF0KQo+Pj4+Pj4gK3sKPj4+Pj4+ICvCoMKgwqAgc3Ry
dWN0IHN0bTMyX2R3bWFjICpkd21hYyA9IHBsYXRfZGF0LT5ic3BfcHJpdjsKPj4+Pj4+ICvCoMKg
wqAgdTMyIHJlZyA9IGR3bWFjLT5tb2RlX3JlZzsKPj4+Pj4+ICvCoMKgwqAgaW50IHZhbCA9IDA7
Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIHN3aXRjaCAocGxhdF9kYXQtPm1hY19pbnRlcmZhY2Up
IHsKPj4+Pj4+ICvCoMKgwqAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVfTUlJOgo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pgo+Pj4+PiBkd21hYy0+ZW5hYmxlX2V0aF9jayBkb2Vz
IG5vdCBhcHBseSB0byBNSUkgbW9kZSA/IFdoeSA/Cj4+Pj4KPj4+PiBJdCBpcyBsaWtlIE1QMSBh
bmQgTVAxMywgbm90aGluZyB0byBzZXQgaW4gc3lzY2ZnIHJlZ2lzdGVyIGZvciBjYXNlIAo+Pj4+
IE1JSSBtb2RlIHdvIGNyeXN0YWwuCj4+Pgo+Pj4gSGF2ZSBhIGxvb2sgYXQgU1RNMzJNUDE1eHgg
Uk0wNDM2IEZpZ3VyZSA4My4gUGVyaXBoZXJhbCBjbG9jayAKPj4+IGRpc3RyaWJ1dGlvbiBmb3Ig
RXRoZXJuZXQuCj4+Pgo+Pj4gSWYgUkNDICh0b3AtbGVmdCBjb3JuZXIgb2YgdGhlIGZpZ3VyZSkg
Z2VuZXJhdGVzIDI1IE1IeiBNSUkgY2xvY2sgCj4+PiAoeWVsbG93IGxpbmUpIG9uIGV0aF9jbGtf
ZmIgKHRvcC1yaWdodCBjb3JuZXIpLCBjYW4gSSBzZXQgCj4+PiBFVEhfUkVGX0NMS19TRUwgdG8g
cG9zaXRpb24gJzEnIGFuZCBFVEhfU0VMWzJdIHRvICcwJyBhbmQgZmVlZCBFVEggCj4+PiAocmln
aHQgc2lkZSkgY2xrX3J4X2kgaW5wdXQgd2l0aCAyNSBNSHogY2xvY2sgdGhhdCB3YXkgPwo+Pj4K
Pj4+IEkgc2VlbXMgbGlrZSB0aGlzIHNob3VsZCBiZSBwb3NzaWJsZSwgYXQgbGVhc3QgdGhlb3Jl
dGljYWxseS4gQ2FuIAo+Pj4geW91IGNoZWNrIHdpdGggdGhlIGhhcmR3YXJlL3NpbGljb24gcGVv
cGxlID8KPj4gTm8gaXQgaXMgbm90IHBvc3NpYmxlIChpdCB3aWxsIHdvcmsgaWYgc3BlZWQgKGFu
ZCBmcmVxdWVuY3kpIGlzIGZpeGVkIAo+PiAyNU1oej0xMDBNYnBzLCBidXQgZm9yIHNwZWVkIDEw
TWJwcyAoMiw1TUh6KSBpdCB3aWxsIG5vdCB3b3JrLgo+Cj4gQ291bGQgdGhlIHBsbDRfcF9jayBv
ciBwbGwzX3FfY2sgZ2VuZXJhdGUgZWl0aGVyIDI1IE1IeiBvciAyLjUgTUh6IGFzIAo+IG5lZWRl
ZCBpbiB0aGF0IGNhc2UgPyBUaGVuIGl0IHdvdWxkIHdvcmssIHJpZ2h0ID8KClllcyB5b3UgY2Fu
IHNldCBmcmVxdWVuY3kgeW91IHdhbnQgZm9yIHBsbDQgb3IgcGxsMywgaWYgeW91IHNldCAyNU1I
eiAKYW5kIGF1dG8tbmVnb3RpYXRpb24gb2Ygc3BlZWQgaXMgMTAwTWJwcyBpdCBzaG91bGQgd29y
ayAocGFkIEVUSF9DSyBvZiAKMjVNSHogY2xvY2sgdGhlIFBIWSBhbmQgZXRoX2Nsa19mYiBzZXQg
dG8gMjVNSHogZm9yIGNsa19SWCkKCmJ1dCBpZiBhdXRvbmVnIG9mIHNwZWVkIGlzIDEwTWJwcywg
dGhlbiAyLjVNSHogaXMgbmVlZGVkIGZvciBjbGtfUlggKHlvdSAKd2lsbCBwcm92aWRlIDI1TWh6
KS4gRm9yIFJNSUkgY2FzZSwgZnJlcXVlbmN5IGZyb20gcGxsIChldGhfY2xrX2ZiKSBpcyAKYXV0
b21hdGljYWxseSBhZGp1c3QgaW4gZnVuY3Rpb24gb2Ygc3BlZWQgdmFsdWUsIHRoYW5rcyB0byBk
aXZpc2VyIC8yLCAKLzIwIHdpdGggbWFjX3NwZWVkX28uCgo+Cj4+ICh5b3UgY2FuIHNlZSB0aGFu
IGRpdmlzZXIgYXJlIG9ubHkgZm9yIFJNSUkgbW9kZSkKPgo+IERvIHlvdSByZWZlciB0byAvMiBh
bmQgLzIwIGRpdmlkZXJzIHRvIHRoZSBsZWZ0IG9mIG1hY19zcGVlZF9vWzBdID8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
