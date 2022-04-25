Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7170C50DC8C
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 11:28:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2493FC5F1F1;
	Mon, 25 Apr 2022 09:28:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85BC0C5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 09:28:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23P5rMlb025856;
 Mon, 25 Apr 2022 11:28:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xzfdAwXhD1J621ynPxY+pBpZRTwVQStxyQW8pm3u5eM=;
 b=PepbvLH3wmLSWRGwLGslXk/MZ0p4yUv0dUI4zB2YCjev5UScVwahoCeOYffB+bDoycs/
 9mkfo7DVLPtJ8j8o84Uwv9W5A+L4bnyUOI0yfQMtYM9PFyjlEPqE8uXSMJltB+Q6kPo+
 8c3qOyABQnmZl/zdPOUpcteayd+R8NdZRJMMarz3w8RQM0rwb1QcVDXlNwVSRx+pDwAh
 LQt2tvbGrcGrWBEjBoRoZWS/j+oJUpXTZg27RvuFWhSwVlFx4k5W+BLc22pAHVUQyx1c
 T9kg4aiivBmEAWwJz2CEpCzMhQs6jG7BNFESWz0ha4VKwhUWzFsgrI+P0ZGJW4h2Us51 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm8t1fwq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 11:28:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09B4D100038;
 Mon, 25 Apr 2022 11:28:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 351682171C1;
 Mon, 25 Apr 2022 11:28:04 +0200 (CEST)
Received: from [10.48.1.150] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 25 Apr
 2022 11:28:03 +0200
Message-ID: <442677d2-7e9f-14f0-4b5a-1f98a8f40c8a@foss.st.com>
Date: Mon, 25 Apr 2022 11:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-gpio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220422143608.226580-1-fabien.dessenne@foss.st.com>
 <c48500cd-50be-1d70-2f2c-02c2dcede1eb@denx.de>
From: Fabien DESSENNE <fabien.dessenne@foss.st.com>
In-Reply-To: <c48500cd-50be-1d70-2f2c-02c2dcede1eb@denx.de>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_05,2022-04-22_01,2022-02-23_01
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: improve bank clocks
	management
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

SGkgTWFyZWsKCgpPbiAyMi8wNC8yMDIyIDE4OjI2LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA0
LzIyLzIyIDE2OjM2LCBGYWJpZW4gRGVzc2VubmUgd3JvdGU6Cj4+IEluc3RlYWQgb2YgZW5hYmxp
bmcvZGlzYWJsaW5nIHRoZSBjbG9jayBhdCBlYWNoIElPIGNvbmZpZ3VyYXRpb24gdXBkYXRlLAo+
PiBqdXN0IGtlZXAgdGhlIGNsb2NrIGVuYWJsZWQgZnJvbSB0aGUgcHJvYmUuCj4+IFRoaXMgbWFr
ZXMgdGhpbmdzIHNpbXBsZXIgYW5kIG1vcmUgZWZmaWNpZW50IChlLmcuIHRoZSB0aW1lIHJlcXVp
cmVkIHRvCj4+IHRvZ2dsZSBhbiBvdXRwdXQgSU8gaXMgZHJhc3RpY2FsbHkgZGVjcmVhc2VkKSB3
aXRob3V0IHNpZ25pZmljYW50bHkKPj4gaW5jcmVhc2luZyB0aGUgcG93ZXIgY29uc3VtcHRpb24u
Cj4gCj4gWy4uLl0KPiAKPj4gwqAgc3RhdGljIHN0cnVjdCBpcnFfZG9tYWluICpzdG0zMl9wY3Ry
bF9nZXRfaXJxX2RvbWFpbihzdHJ1Y3QgCj4+IGRldmljZV9ub2RlICpucCkKPj4gQEAgLTE1NzUs
NiArMTUzNywxMCBAQCBpbnQgc3RtMzJfcGN0bF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBzdG0zMl9ncGlvbGli
X3JlZ2lzdGVyX2JhbmsocGN0bCwgY2hpbGQpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAocmV0KSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2Zfbm9k
ZV9wdXQoY2hpbGQpOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9y
IChpID0gMDsgaSA8IHBjdGwtPm5iYW5rczsgaSsrKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBjdGwtPmJhbmtzW2ldLmNs
ayk7Cj4+ICsKPiAKPiBUaGVyZSBhcmUgY2xrX2J1bGtfKigpIGZ1bmN0aW9ucywgbWF5YmUgeW91
IGNhbiB1c2UgdGhvc2UgdG8gZ2V0IHJpZCBvZiAKPiB0aGVzZSBsb29wcyA/CgpUaGlzIHNvdW5k
cyBnb29kcywgYnV0IGNoZWNraW5nIG1vcmUgaW4gZGV0YWlscyBJIHNlZSB0aGF0IG1vdmluZyB0
byB0aGUgCididWxrJyBpbXBsZW1lbnRhdGlvbiB3b3VsZCByZXF1aXJlIHRvIG1vdmUgdGhlIGNs
ayBpbmZvcm1hdGlvbiBmcm9tIHRoZSAKInN0cnVjdCBzdG0zMl9ncGlvX2JhbmsgKmJhbmtzIiBt
ZW1iZXIgdG8gaXRzIHBhcmVudCAic3RydWN0IHN0bTMyX3BpbmN0cmwiLgoKVGhpcyB3b3VsZCBt
YWtlIHRoZSBjbGsgZGV2aWNlIGluZm9ybWF0aW9uIHN0b3JlZCBpbiBhIGRpZmZlcmVudCAKc3Ry
dWN0dXJlIGZyb20gdGhlIG90aGVyIGRldmljZS1yZWxhdGVkIGluZm9ybWF0aW9uIChiYXNlIGFk
ZHJlc3MsIHJlc2V0IApjb250cm9sLCAuLi4pLiBJdCdzIGJldHRlciB0byBrZWVwIGFsbCB0aG9z
ZSBpbmZvcm1hdGlvbiB0b2dldGhlciBpbiB0aGUgCnNhbWUgc3RydWN0LgoKQXMgYW5vdGhlciBk
cmF3YmFjayB3ZSB3b3VsZCBsb29zZSBhY2Nlc3MgdG8gJ2NsaycgZnJvbSBhbnkgZnVuY3Rpb24g
CnRoYXQgaGF2ZSAnYmFuaycgKG9yICdzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwJykgYXMgaW5wdXQg
cGFyYW1ldGVyIChlLmcuIApzdG0zMl9ncGlvX2dldCgpIGNhbGxlZCBmcm9tIGdwaW9saWIpLgoK
U28gSSByZWFsbHkgcHJlZmVyIHRvIGtlZXAgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24uCgpC
UgpGYWJpZW4KCj4gCj4gVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
