Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF7AB33F3
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 11:48:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7213C78F92;
	Mon, 12 May 2025 09:47:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 035C8C78F91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 09:47:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C89UDZ025832;
 Mon, 12 May 2025 11:47:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Ms1fXKBupaGUiTVwfpWkhQXNp7DZ3MoY67STQUr4Cz0=; b=Ch9GgUxcId6fh8Xc
 XJy6kWTfTo6e0vHXJT3NUg9ODni8+jIS/QH2/6yWN1W6Qz2TtyZoc9cbKlsH5smy
 60vb5l9FLxVIubuvqaQTSitfCj0DuLrd4iP6XLxERxahAudIurp6crhLigYk+wIB
 nJcv3O8PpXRFJXN32k7CFD3ydXKc9HA9U2mNb5sUg91aFNzga+aJJ/GBRr8i1wu6
 82tte6GhGgbrmcUytT1rLg9rSJIBxQXrRYdzoSf/41wN4tMVD0dw4WlBM5xU75Cp
 lmZPjqm+dWSvSe6DofUy0xWDq/FGsGS+Epx2zeBOaTroAEir/DhBBafe/c9pJeKc
 9u0lXQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46hv7kphdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 May 2025 11:47:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B8A5740081;
 Mon, 12 May 2025 11:46:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92923ABE2DA;
 Mon, 12 May 2025 11:45:18 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 11:45:17 +0200
Message-ID: <66fb604a-ce90-41c4-9ce9-26fa1d81e0d2@foss.st.com>
Date: Mon, 12 May 2025 11:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Goran Radenovic <goran.radni@gmail.com>, Andrew Lunn <andrew@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
 <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
 <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_03,2025-05-09_01,2025-02-21_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] ARM: dts: stm32: add initial
 support for stm32mp157-ultra-fly-sbc board
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

SGkgR29yYW4KCk9uIDUvOC8yNSAxNToxMCwgR29yYW4gUmFkZW5vdmljIHdyb3RlOgo+IEhpIEFu
ZHJldywKPiAKPiB0aGFuayBZb3Ugb25jZSBhZ2FpbiBmb3IgaGVscGZ1bCBoaW50Lgo+IAo+IEFu
ZHJldyBMdW5uIHdyb3RlOgo+Pj4+PiArwqDCoMKgIHBoeS1oYW5kbGUgPSA8JnBoeTE+Owo+Pj4+
PiArCj4+Pj4+ICvCoMKgwqAgbWRpbyB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+Owo+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJzbnBzLGR3bWFjLW1kaW8iOwo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgcGh5MTogZXRoZXJuZXQtcGh5QDEgewo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWcgPSA8MT47Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVy
cnVwdC1wYXJlbnQgPSA8JmdwaW9kPjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
ZXJydXB0cyA9IDwwIElSUV9UWVBFX0VER0VfRkFMTElORz47Cj4+Pj4gUEhZIGludGVycnVwdHMg
YXJlIDk5JSB0aW1lIGxldmVsLCBub3QgZWRnZS4KPj4+IFRoYXQgaXMgY29ycmVjdCwgYnV0IEkg
YW0gZmFjaW5nIHN0cmFuZ2UgYmVoYXZpb3IsIHdoZW4gSSBzZXQKPj4+IElSUV9UWVBFX0xFVkVM
X0xPVy4KPj4+IE15IGJvYXJkIHN0b3BzIGJvb3RpbmcgYXQ6Cj4+Pgo+Pj4gW8KgwqDCoCAyLjM0
MzIzM10gV2FpdGluZyBmb3Igcm9vdCBkZXZpY2UgL2Rldi9tbWNibGswcDQuLi4KPj4+IFvCoMKg
IDEyLjYzODgxOF0gcGxhdGZvcm0gNWEwMDYwMDAudXNicGh5YzogZGVmZXJyZWQgcHJvYmUgcGVu
ZGluZwo+Pj4gW8KgwqAgMTIuNjQzMTkyXSBwbGF0Zm9ybSA0OTAwMDAwMC51c2Itb3RnOiBkZWZl
cnJlZCBwcm9iZSBwZW5kaW5nCj4+PiBbwqDCoCAxMi42NDkwMjldIHBsYXRmb3JtIDQ4MDAzMDAw
LmFkYzogZGVmZXJyZWQgcHJvYmUgcGVuZGluZwo+Pj4gW8KgwqAgMTIuNjU0Mjc3XSBwbGF0Zm9y
bSA1ODAwZDAwMC51c2I6IGRlZmVycmVkIHByb2JlIHBlbmRpbmcKPj4+IFvCoMKgIDEyLjY1OTc0
NF0gcGxhdGZvcm0gNTgwMGMwMDAudXNiOiBkZWZlcnJlZCBwcm9iZSBwZW5kaW5nCj4+PiBbwqDC
oCAxMi42NjUwODldIGFtYmEgNTgwMDUwMDAubW1jOiBkZWZlcnJlZCBwcm9iZSBwZW5kaW5nCj4+
PiBbwqDCoCAxMi42NzAyMzldIGFtYmEgNTgwMDcwMDAubW1jOiBkZWZlcnJlZCBwcm9iZSBwZW5k
aW5nCj4+PiBbwqDCoCAxMi42NzUxODVdIHBsYXRmb3JtIDUwMDI1MDAwLnZyZWZidWY6IGRlZmVy
cmVkIHByb2JlIHBlbmRpbmcKPj4+Cj4+PiBJIG11c3QgaW52ZXN0aWdhdGUgdGhpcy4gSWYgWW91
IGhhdmUgYW55IGlkZWEsIFlvdSBhcmUgd2VsY29tZSB0byAKPj4+IHNoYXJlIGl0Lgo+PiBDb3Vs
ZCBiZSBhbiBpbnRlcnJ1cHQgc3Rvcm0uIFRoZSBpbnRlcnJ1cHQgaXMgbm90IGdldHRpbmcgY2xl
YXJlZAo+PiBiZWNhdXNlIG9mIHNvbWV0aGluZyBtaXNzaW5nIGluIHRoZSBQSFkgZHJpdmVyLCBz
byBpdCBqdXN0IGZpcmVzIGFnYWluCj4+IGFuZCBhZ2Fpbi4KPiAKPiBBZnRlciBhIGJyaWVmIGlu
dmVzdGlnYXRpb24sIEkgdGVuZCB0byBhZ3JlZSB3aXRoIHlvdXIgYXNzZXNzbWVudCB0aGF0IAo+
IHRoZSBpc3N1ZSBsaWVzIGluIHRoZSBkcml2ZXLigJRsaWtlbHkgdGhlIHN0bW1hYyBkcml2ZXIg
4oCUIHdoaWNoIGlzIG91dHNpZGUgCj4gdGhlIHNjb3BlIG9mIG15IGNoYW5nZXMuCgpObywgdGhl
IG1kaW8gbm9kZSBpcyBkcml2ZW4gYnkgc3RtbWFjIGRyaXZlci4gVGhlIGlzc3VlIHdhcyBtYXli
ZSBtb3JlIApsaW5rZWQgYmV0d2VlbiBwaW5jdHJsIGRyaXZlciAvIGV4dGkgZHJpdmVyIHdoZXJl
IHRoZSBsZXZlbCB0cmlnZ2VyIGlzIApwcm9iYWJseSBub3Qgd2VsbCBtYW5hZ2VkIChncGlvIGlz
IGxldmVsIGJ1dCBleHRpIGRyaXZlciBtYW5hZ2UgZWRnZSAKaW50ZXJydXB0KS4gV2hlbiBzYXcg
dGhvc2UgZGVmZXJpbmcgcHJvYmVzLCBFWFRJIGRyaXZlcnMgYW5kIHBpbmN0cmwgCmRyaXZlcnMg
d2VyZSB3ZWxsIHByb2JlZCA/Cgo+IAo+IFRoZXJlZm9yZSwgSSB3b3VsZCBzdWdnZXN0IGtlZXBp
bmcgSVJRX1RZUEVfRURHRV9GQUxMSU5HIGZvciBub3csIG9yIAo+IGFsdGVybmF0aXZlbHkgbm90
IHVzaW5nIGEgaGFyZHdhcmUgSVJRIGF0IGFsbCBhbmQgZmFsbGluZyBiYWNrIHRvIAo+IHBvbGxp
bmcsIGFzIGRvbmUgaW4gc3RtMzJtcDE1eHgtZGt4LmR0c2kuCj4gCj4gQmVzdCByZWdhcmRzLAo+
IEdvcmFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
