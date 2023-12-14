Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B47B8137CF
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 18:13:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C1FDC6B45B;
	Thu, 14 Dec 2023 17:13:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09A04C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 17:13:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BEFknrP009412; Thu, 14 Dec 2023 18:12:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:content-transfer-encoding:mime-version; s=
 selector1; bh=K1A/PPNJBGqkruf8X8nVhc1/sg7nXB8ln3XDnZhh2B0=; b=ZK
 W4NG7CAR9E7mB1Zc39RfsI5XhrgZoMHpLE7ZXNd77c5lcOREZ4zZ2DKxSsROHzpI
 +YIbCIII20Mykc6BhTIGKen698cnupimeGgMTbk1I+VgJoK9cNxf8xB9t8vtVafR
 v5AuyNrzQXkuekspHya2StNpF4iuVUwzRiMD7nHuJuuNTqUa/ugNh6q99Gq4dsQ8
 v77W3S8JtmZFkZSHlzn4L6HLdJgg9W2gZhrsNEGZe0wbjr2uz6jZOf392vppDF6m
 Pypc0dtyWJ01kMqwD3Hsjs3znulEfJbockN/eehlpuC6woFe1qEB7fTTlWOILX9G
 cph3ctGHoWMgC1yCnS+w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvgf1xash-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Dec 2023 18:12:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17E2F100053;
 Thu, 14 Dec 2023 18:12:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E8252291A9;
 Thu, 14 Dec 2023 18:12:49 +0100 (CET)
Received: from [192.168.8.15] (10.201.20.114) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Dec
 2023 18:12:48 +0100
Message-ID: <72700f397d32f6a81164aafbf6f9d30b510672cf.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Date: Thu, 14 Dec 2023 18:12:46 +0100
In-Reply-To: <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
 <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Originating-IP: [10.201.20.114]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_11,2023-12-14_01,2023-05-22_02
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pinctrl: stm32: fix GPIO level
 interrupts
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

T24gTW9uLCAyMDIzLTEyLTA0IGF0IDE1OjMzIC0wNTAwLCBCZW4gV29sc2llZmZlciB3cm90ZToK
PiBUaGUgU1RNMzIgZG9lc24ndCBzdXBwb3J0IEdQSU8gbGV2ZWwgaW50ZXJydXB0cyBpbiBoYXJk
d2FyZSwgc28gdGhlCj4gZHJpdmVyIHRyaWVzIHRvIGVtdWxhdGUgdGhlbSB1c2luZyBlZGdlIGlu
dGVycnVwdHMsIGJ5IHJldHJpZ2dlcmluZyB0aGUKPiBpbnRlcnJ1cHQgaWYgbmVjZXNzYXJ5IGJh
c2VkIG9uIHRoZSBwaW4gc3RhdGUgYWZ0ZXIgdGhlIGhhbmRsZXIKPiBmaW5pc2hlcy4KPiAKPiBD
dXJyZW50bHksIHRoaXMgZnVuY3Rpb25hbGl0eSBkb2VzIG5vdCB3b3JrIGJlY2F1c2UgdGhlIGly
cWNoaXAgdXNlcwo+IGhhbmRsZV9lZGdlX2lycSgpLCB3aGljaCBkb2Vzbid0IHJ1biB0aGUgaXJx
X2VvaSgpIG9yIGlycV91bm1hc2soKQo+IGNhbGxiYWNrcyBhZnRlciBoYW5kbGluZyB0aGUgaW50
ZXJydXB0LiBUaGlzIHBhdGNoIGZpeGVzIHRoaXMgYnkgdXNpbmcKPiBoYW5kbGVfbGV2ZWxfaXJx
KCkgZm9yIGxldmVsIGludGVycnVwdHMsIHdoaWNoIGNhdXNlcyBpcnFfdW5tYXNrKCkgdG8gYmUK
PiBjYWxsZWQgdG8gcmV0cmlnZ2VyIHRoZSBpbnRlcnJ1cHQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QmVuIFdvbHNpZWZmZXIgPGJlbi53b2xzaWVmZmVyQGhlZnJpbmcuY29tPgo+IC0tLQo+IMKgZHJp
dmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYyB8IDMgKysrCj4gwqAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9z
dG0zMi9waW5jdHJsLXN0bTMyLmMgYi9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0z
Mi5jCj4gaW5kZXggNjAzZjkwMGU4OGMxLi5mYjk1MzI2MDFjYmIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYwo+ICsrKyBiL2RyaXZlcnMvcGluY3Ry
bC9zdG0zMi9waW5jdHJsLXN0bTMyLmMKPiBAQCAtMzQ4LDEyICszNDgsMTUgQEAgc3RhdGljIGlu
dCBzdG0zMl9ncGlvX3NldF90eXBlKHN0cnVjdCBpcnFfZGF0YSAqZCwgdW5zaWduZWQgaW50IHR5
cGUpCj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgSVJRX1RZUEVfRURHRV9SSVNJTkc6Cj4gwqDCoMKg
wqDCoMKgwqDCoGNhc2UgSVJRX1RZUEVfRURHRV9GQUxMSU5HOgo+IMKgwqDCoMKgwqDCoMKgwqBj
YXNlIElSUV9UWVBFX0VER0VfQk9USDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aXJxX3NldF9oYW5kbGVyX2xvY2tlZChkLCBoYW5kbGVfZWRnZV9pcnEpOwoKSGksCnRoaXMgcGF0
Y2ggY2F1c2VzIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGFuZCBjcmFzaGVzIHRoZSBrZXJu
ZWwgYm9vdCBvbiBTVE0zMiBNUFUncywKZWl0aGVyIFNUTTMyTVAxM3gsIFNUTTMyTVAxNXggYW5k
IHRoZSBuZXcgU1RNMzJNUDI1eC4KClBsZWFzZSBkbyBub3QgbWVyZ2UgaXQgYXMgaXMuCgpUaGlz
IHBpbmN0cmwtc3RtMzIgZHJpdmVyIGlzIHNoYXJlZCBiZXR3ZWVuIFNUTTMyIE1DVXMgYW5kIE1Q
VXMuCkluIGJvdGggY2FzZXMgdGhlIEVYVEkgaXMgdGhlIHBhcmVudCBpbnRlcnJ1cHQgY29udHJv
bGxlciBvZiB0aGlzIHBpbmN0cmwsIGJ1dCBkZXNwaXRlCnRoZSBmYWN0IHRoYXQgdGhlcmUgaXMg
YSBzaW5nbGUgZmlsZSBpcnEtc3RtMzItZXh0aS5jLCBpdCBjb250YWlucyB0d28gaW5kZXBlbmRl
bnQKZHJpdmVycywgb25lIGZvciBNQ1VzIGFuZCB0aGUgb3RoZXIgZm9yIE1QVXMuClN3YXBwaW5n
IGluIHRoaXMgZnVuY3Rpb24gdGhlIGlycV9kZXNjOjpoYW5kbGVfaXJxIGJldHdlZW4gaGFuZGxl
X2VkZ2VfaXJxKCkgYW5kCmhhbmRsZV9sZXZlbF9pcnEoKSBpcyBwcm9iYWJseSBmaW5lIGZvciBN
Q1UgKEkgaGF2ZSBub3QgdGVzdGVkIGl0KS4KQnV0IG9uIE1QVXMgdGhlIGRlZmF1bHQgaGFuZGxl
ciBpcyBoYW5kbGVfZmFzdGVvaV9pcnEoKTsgc2hvdWxkIG5vdCBiZSBjaGFuZ2VkIGhlcmUuCgpD
aGVja2luZyBxdWlja2x5IC4uLiB0aGlzIGZ1bmN0aW9uIGNhbGxzIGlycV9jaGlwX3NldF90eXBl
X3BhcmVudCgpIGF0IHRoZSB2ZXJ5IGVuZC4KSXQgd2lsbCBpbiB0dXJuIGNhbGwgRVhUSSdzIGly
cV9zZXRfdHlwZSgpLCB3aGljaCBoYXMgZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucyBmb3IgTUNV
CmFuZCBNUFUuCkJ5IG1vdmluZyB0aGlzIGhhbmRsZXIgc3dhcCBpbiB0aGUgTUNVIHNwZWNpZmlj
IHN0bTMyX2lycV9zZXRfdHlwZSgpIGl0IHdpbGwgbm90IGltcGFjdApNUFVzLgoKQmVzdCBSZWdh
cmRzLApBbnRvbmlvCgoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBhcmVudF90
eXBlID0gdHlwZTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKg
wqDCoMKgwqDCoMKgwqBjYXNlIElSUV9UWVBFX0xFVkVMX0hJR0g6Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlycV9zZXRfaGFuZGxlcl9sb2NrZWQoZCwgaGFuZGxlX2xldmVsX2ly
cSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwYXJlbnRfdHlwZSA9IElSUV9U
WVBFX0VER0VfUklTSU5HOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7
Cj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgSVJRX1RZUEVfTEVWRUxfTE9XOgo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpcnFfc2V0X2hhbmRsZXJfbG9ja2VkKGQsIGhhbmRsZV9sZXZl
bF9pcnEpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGFyZW50X3R5cGUgPSBJ
UlFfVFlQRV9FREdFX0ZBTExJTkc7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBi
cmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgZGVmYXVsdDoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
