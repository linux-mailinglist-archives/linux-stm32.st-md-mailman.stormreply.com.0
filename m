Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B82CA46901
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 19:10:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 426BDC7A832;
	Wed, 26 Feb 2025 18:10:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5269BC7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 18:10:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QFHewT022188;
 Wed, 26 Feb 2025 19:10:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rG1C6cXlzhh7ZHVodv74JTH3XP7VRDVgNV9VI18sWQA=; b=3yKEGCAk+JFFurwh
 A/VoQvxQfCKgGyaGnzIscwH3s+avLqtQF9jyGAM7Q8HJo1+YCqdsXZAMdn8BP6u/
 CeXYiF+QLc6DLfZWZr0z2+xXkt5/4va74qko67jNOQgFE6cDu8BFXGe+0EmG7kSY
 cTEDQGf4LYCbfka9Mb/BNB7kEMSiZon8GDaI0vs3xl8EZtCv4EiqcP1gjNirbfk2
 qWlBZj0kXIRiWf8ZTnl0oKuRrc/VFvJ4rDL7FbLciaLu+5Xcv16F26YZY2+P5bAe
 6zbx1fpBdjFOxQQruEsjc5SyOeM+AMyApBDu9C1ch9uB4RUvlydBagM5dlqsKkat
 06y4xA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psrea92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 19:10:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 86625400C8;
 Wed, 26 Feb 2025 19:09:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10BB54FF132;
 Wed, 26 Feb 2025 17:54:13 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 17:54:12 +0100
Message-ID: <248f63ff-b6ec-4f58-8a96-7aee2fcd6038@foss.st.com>
Date: Wed, 26 Feb 2025 17:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Clement LE GOFFIC
 <clement.legoffic@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-7-9d049c65330a@foss.st.com>
 <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
 <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
 <b57e3c9e-244e-435b-8a7b-cf90f3a973b3@kernel.org>
 <988667a4-4bc0-4594-8dfd-a7b652b149b2@foss.st.com>
 <55beb3e7-65ac-4145-adae-fb064378c78d@kernel.org>
 <8cdc7e52-f9e2-4fc9-be68-0dd72a25ee1b@foss.st.com>
Content-Language: en-US
In-Reply-To: <8cdc7e52-f9e2-4fc9-be68-0dd72a25ee1b@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 7/9] ARM: dts: stm32: add Hardware debug
 port (HDP) on stm32mp25
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

CgpPbiAyLzI2LzI1IDE2OjMwLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IAo+IAo+IE9uIDIv
MjYvMjUgMTY6MDgsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIDI2LzAyLzIwMjUg
MTA6MzMsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGhk
cDogcGluY3RybEA0NDA5MDAwMCB7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29t
cGF0aWJsZSA9ICJzdCxzdG0zMm1wLWhkcCI7Cj4+Pj4+Pgo+Pj4+Pj4gU28gaGVyZSBhZ2FpbiAt
IHlvdSBoYXZlIHN0bTMybXAyNTEgU29DLCBidXQgdXNlIGVudGlyZWx5IGRpZmZlcmVudAo+Pj4+
Pj4gY29tcGF0aWJsZS4KPj4+Pj4KPj4+Pj4gT2sgc28gSSB3aWxsIHVzZSAic3Qsc3RtMzJtcDE1
LWhkcCIKPj4+Pgo+Pj4+Cj4+Pj4gVGhpcyBtZWFucyB0aGlzIGlzIHN0bTMybXAxNSBTb0MuIEkg
ZG8gbm90IHNlZSBzdWNoIFNvQyBvbiBsaXN0IG9mIHlvdXIKPj4+PiBTb0NzIGluIGJpbmRpbmdz
LiBXaGF0J3MgbW9yZSwgdGhlcmUgYXJlIG5vIGJpbmRpbmdzIGZvciBvdGhlciBTb0MKPj4+PiBj
b21wb25lbnRzIGZvciBzdG0zMm1wMTUhCj4+Pgo+Pj4gWWVzIHN0bTMybXAxNSBpcyBub3QgYSAi
cmVhbCBTb0MiLiBJIGFncmVlIHRoYXQgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUKPj4+IFNUTTMy
IHN0b3J5IHdlIGRpZG4ndCBoYXZlIGEgY2xlYXIgcnVsZS92aWV3IHRvIGNvcnJlY3RseSBuYW1p
bmcgb3VyCj4+PiBjb21wYXRpYmxlLiBXZSB0cmllZCB0byBpbXByb3ZlIHRoZSBzaXR1YXRpb24g
dG8gYXZvaWQgY29tcGF0aWJsZSBsaWtlCj4+PiAic3Qsc3RtMzIiLCAic3Qsc3RtMzJtcCIgb3Ig
InN0LHN0bTMybXAxIi4gU28gd2UgaW50cm9kdWNlZAo+Pj4gInN0LHN0bTMybXAxMyIsICJzdCxz
dG0zMm1wMTUiIG9yICJzdCxzdG0zMm1wMjUiIGZvciBuZXcgZHJpdmVycy4gU28geWVzCj4+PiBp
dCByZXByZXNlbnRzIGEgU29DIGZhbWlseSBhbmQgbm90IGEgcmVhbCBTb0MuIFdlIGhhdmVuJ3Qg
aGFkIG11Y2gKPj4+IG5lZ2F0aXZlIGZlZWRiYWNrIGl0Lgo+Pj4KPj4+IEJ1dCwgaWYgaXQncyBu
b3QgY2xlYW4gdG8gZG8gaXQgaW4gdGhpcyB3YXksIGxldHMgZGVmaW5lIFNvQyBjb21wYXRpYmxl
Cj4+PiBmb3IgYW55IG5ldyBkcml2ZXIuCj4+Cj4+IENvbXBhdGlibGVzIGFyZSBmb3IgaGFyZHdh
cmUuCj4+Cj4+PiBGb3IgdGhlIEhEUCBjYXNlIGl0IGlzOiAic3Qsc3RtMzJtcDE1NyIgYW5kIHVz
ZWQgZm9yIFNUTTMyTVAxMywKPj4+IFNUTTMyTVAxNSBlbmQgU1RNMzJNUDI1IFNvQyBmYW1pbGll
cyAoaWYgZHJpdmVyIGlzIHRoZSBzYW1lIGZvciBhbGwKPj4+IHRob3NlIFNvQ3MpLgo+Pgo+PiBO
bywgaXQncyB0aHJlZSBjb21wYXRpYmxlcywgYmVjYXVzZSB5b3UgaGF2ZSB0aHJlZSBTb0NzLiBC
VFcsIHdyaXRpbmcKPj4gYmluZGluZ3MgKGFuZCBvbmxpbmUgcmVzb3VyY2VzIGFuZCBwcmV2aW91
cyByZXZpZXdzIGFuZCBteSB0YWxrcykgYXJlCj4+IHNheWluZyB0aGF0LCBzbyB3ZSBkbyBub3Qg
YXNrIGZvciBhbnl0aGluZyBuZXcgaGVyZSwgYW55dGhpbmcgZGlmZmVyZW50Lgo+PiBBdCBsZWFz
dCBub3QgbmV3IHdoZW4gbG9va2luZyBhdCBsYXN0IDUgeWVhcnMsIGJlY2F1c2UgMTAgeWVhcnMg
YWdvIG1hbnkKPj4gcnVsZXMgd2VyZSByZWxheGVkLi4uCj4gCj4gU28gYWRkaW5nIDMgdGltZXMg
dGhlIHNhbWUgSVAgaW4gMyBkaWZmZXJlbnQgU29DcyBpbXBsaWVzIHRvIGhhdmUgMyAKPiBkaWZm
ZXJlbnQgY29tcGF0aWJsZXMuIFNvIGVhY2ggdGltZSB3ZSB1c2UgdGhpcyBzYW1lIElQIGluIGEg
bmV3IFNvQywgd2UgCj4gaGF2ZSB0byBhZGQgYSBuZXcgY29tcGF0aWJsZS4gTXkgKHdyb25nKSB1
bmRlcnN0YW5kaW5nIHdhczogYXMgd2UgaGF2ZSAKPiB0aGUgc2FtZSBJUCAoc2FtZSBoYXJkd2Fy
ZSkgaW4gZWFjaCBTb0Mgd2UgaGF2ZSB0aGUgc2FtZSBjb21wYXRpYmxlIChhbmQgCj4gSVAgaW50
ZWdyYXRpb24gZGlmZmVyZW5jZXMgKGNsb2NrcywgaW50ZXJydXB0cykgYXJlIGhhbmRsZWQgYnkg
RFQgCj4gcHJvcGVydGllcy4KCkp1c3QgdG8gY29tcGxldGUsIHJlYWRpbmcgdGhlIExpbnV4IGtl
cm5lbCBkb2MsIGFzIGRldmljZSBhcmUgc2FtZSB3ZSAKd2lsbCB1c2UgZmFsbGJhY2tzIGxpa2Ug
dGhpczoKCk1QMTU6IGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDE1MS1oZHAiOwpNUDEzOiBjb21w
YXRpYmxlID0gInN0LHN0bTMybXAxMzEtaGRwIiwgInN0LHN0bTMybXAxNTEtaGRwIjsKTVAyNTog
Y29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUxLWhkcCIsICJzdCxzdG0zMm1wMTUxLWhkcCI7Cgo+
IAo+Pgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEtyenlzenRvZgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
