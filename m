Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6712F4CFD
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jan 2021 15:21:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B75CEC5660F;
	Wed, 13 Jan 2021 14:21:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9442CC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 14:21:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10DEBu3l003195; Wed, 13 Jan 2021 15:21:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=X0MuUVG1nzIodFAT/Xpr7pm9K5Pm0TPf5ydlMJ1xAAk=;
 b=s0QDXl6nWpmsJeYvjL1lvta/Qe1pm4YowJfxokVG0xTJdvp675bxEvdsd5HbHpiciAZX
 G7ODzISfY0loo9Mwx9crnbQFL/DfGBuy86MK/VnMS7PpeYK6SVqmov/zbZJcwRH9Mhyx
 63aioAoDpfwE7HFv0zcQORrdiFMKIA9NuwtkiiD/SWVCZHXAAi/hr73jLnyAH8foT7hy
 CkmKveS7GMASCVgMCyPw+tKEr0bmkErpQSDXhVIQ5/i3djGYjEQEtmTfeVnIuUziHU96
 iMqP97hOaUUfP4RHxU5XWTGPf2unGqKfcrdNXfPCkZLR9whyEJFYUuM5hgNoDzoqKpXi Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gx787r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 15:21:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CDAC10002A;
 Wed, 13 Jan 2021 15:21:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E11525C0DF;
 Wed, 13 Jan 2021 15:21:29 +0100 (CET)
Received: from lmecxl0504.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 15:21:28 +0100
To: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>
References: <20210105140718.122752-1-marex@denx.de>
 <CAPDyKFoQfm2ZtPdsZSZtOCDH-FJqNzihYqZny-vUdK4Q4tWTzQ@mail.gmail.com>
 <b83c1112-010b-a40f-319f-84c755424b0f@denx.de>
 <CAPDyKFo5Sqxj31owrnmz1sTZqgW_PtZM2H=pDPBz+9hc0W0hHA@mail.gmail.com>
 <77dd612b-23f0-1f77-797a-9cde512926e3@denx.de>
From: Yann GAUTIER <yann.gautier@foss.st.com>
Message-ID: <f91fbdfc-453d-78a6-970a-5d6eecd443b2@foss.st.com>
Date: Wed, 13 Jan 2021 15:21:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <77dd612b-23f0-1f77-797a-9cde512926e3@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_07:2021-01-13,
 2021-01-13 signatures=0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] [RFC] mmc: mmci: Add support for probing
 bus voltage level translator
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

T24gMS8xMy8yMSAxMjo1MiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMS8xMy8yMSAxMjoz
OCBQTSwgVWxmIEhhbnNzb24gd3JvdGU6Cj4gWy4uLl0KPj4+Pj4gwqDCoCBzdGF0aWMgaW50IG1t
Y2lfb2ZfcGFyc2Uoc3RydWN0IGRldmljZV9ub2RlICpucCwgc3RydWN0IG1tY19ob3N0IAo+Pj4+
PiAqbW1jKQo+Pj4+PiDCoMKgIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtbWNp
X2hvc3QgKmhvc3QgPSBtbWNfcHJpdihtbWMpOwo+Pj4+PiBAQCAtMTkxMyw3ICsxOTczLDcgQEAg
c3RhdGljIGludCBtbWNpX29mX3BhcnNlKHN0cnVjdCBkZXZpY2Vfbm9kZSAKPj4+Pj4gKm5wLCBz
dHJ1Y3QgbW1jX2hvc3QgKm1tYykKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChvZl9nZXRf
cHJvcGVydHkobnAsICJzdCxuZWctZWRnZSIsIE5VTEwpKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGhvc3QtPmNsa19yZWdfYWRkIHw9IE1DSV9TVE0zMl9DTEtfTkVH
RURHRTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChvZl9nZXRfcHJvcGVydHkobnAsICJz
dCx1c2UtY2tpbiIsIE5VTEwpKQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBo
b3N0LT5jbGtfcmVnX2FkZCB8PSBNQ0lfU1RNMzJfQ0xLX1NFTENLSU47Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1tY2lfcHJvYmVfbGV2ZWxfdHJhbnNsYXRvcihtbWMpOwo+
Pj4+Cj4+Pj4gSSB0aGluayB5b3UgY2FuIG1ha2UgdGhpcyBjaGFuZ2UgYml0IGxlc3MgaW52YXNp
dmUuIFJhdGhlciB0aGFuIGhhdmluZwo+Pj4+IHRvIHNodWZmbGUgY29kZSBhcm91bmQgaW4gLT5w
cm9iZSgpLCBJIHN1Z2dlc3QgeW91IGNhbGwKPj4+PiBtbWNpX3Byb2JlX2xldmVsX3RyYW5zbGF0
b3IoKSBvdXRzaWRlIGFuZCBhZnRlciBtbWNpX29mX3BhcnNlKCkgaGFzCj4+Pj4gYmVlbiBjYWxs
ZWQuCj4+Pj4KPj4+PiBJbiB0aGlzIHdheSwgeW91IGNhbiBhbHNvIHByb3ZpZGUgbW1jaV9wcm9i
ZV9sZXZlbF90cmFuc2xhdG9yKCkgd2l0aCBhCj4+Pj4gc3RydWN0IG1tY2lfaG9zdCAqLCByYXRo
ZXIgdGhhbiBoYXZpbmcgdG8gcGljayBpdCB1cCBmcm9tCj4+Pj4gbW1jX3ByaXYobW1jKSwgaWYg
eW91IHNlZSB3aGF0IEkgbWVhbi4KPj4+Pgo+Pj4+IE9mIGNvdXJzZSwgdGhpcyBhbHNvIG1lYW5z
IGluIG1tY2lfcHJvYmVfbGV2ZWxfdHJhbnNsYXRvcigpIHlvdSB3aWxsCj4+Pj4gaGF2ZSB0byBj
aGVjayBpZiBNQ0lfU1RNMzJfQ0xLX1NFTENLSU4gaGFzIGJlZW4gc2V0LCBhbmQgaWYgbm90IHRo
ZW4KPj4+PiBkbyBhbiBlYXJseSByZXR1cm4uCj4+Pgo+Pj4gVGVzdGluZyB0aGUgdHJhbnNsYXRv
ciBwcmVzZW5jZSB3aGVuIGNoZWNraW5nIHdoZXRoZXIgaXRzIGVuYWJsZWQgaW4gRFQKPj4+IHNl
ZW1zIGxpa2UgdGhlIHJpZ2h0IHBsYWNlLCBidXQgdGhhdCdzIHJlYWxseSBqdXN0IGFuIGltcGxl
bWVudGF0aW9uIAo+Pj4gZGV0YWlsLgo+Pj4KPj4+IEkgYW0gbW9yZSBpbnRlcmVzdGVkIGluIGtu
b3dpbmcgd2hldGhlciBhZGRpbmcKPj4+IG1tY2lfcHJvYmVfbGV2ZWxfdHJhbnNsYXRvcigpIGlz
IGV2ZW4gYWNjZXB0YWJsZSBpbiB0aGUgZmlyc3QgcGxhY2UuIAo+Pj4gSXMgaXQgPwo+Pgo+PiBI
b25lc3RseSwgSSBkb24ndCBrbm93Lgo+Pgo+PiBJIHRoaW5rIEkgbmVlZCB0byBkZWZlciB0aGF0
IHF1ZXN0aW9uIHRvIExpbnVzIFdhbGxlaWouIEFuZCBvZiBjb3Vyc2UsCj4+IGl0IHdvdWxkIGJl
IG5pY2UgdG8gZ2V0IHRoZSBvcGluaW9uIGZyb20gTHVkb3ZpYyBhcyB3ZWxsLgo+IAo+IEdvb2Qs
IHRoYXQncyB3aGF0IEkgd2FzIGhvcGluZyBmb3IgdG9vLgoKSGksCgpMdWRvdmljIGlzIG91dCBv
ZiBvZmZpY2UgdGhpcyB3ZWVrLgoKVGhlIGZlYXR1cmUgb2YgZGV0ZWN0aW5nIGEgbGV2ZWwgdHJh
bnNsYXRvciBzZWVtcyB0byBiZSBxdWl0ZSBnZW5lcmljLCAKYW5kIG5vdCBkZWRpY2F0ZWQgdG8g
TU1DSSBkcml2ZXIgb3IgdGhlIFNUIGRlZGljYXRlZCBjb2RlLCBhbmQgd2l0aCBuZXcgCnN0LCog
cHJvcGVydGllcy4gSXQgbWF5IGJlIGluIGdlbmVyaWMgbW1jIGNvZGUuIEJ1dCBJJ2xsIGxldCBM
aW51cyAKY29tbWVudCBhYm91dCB0aGF0LgoKSSBhbHNvIHdvbmRlciBpZiB0aGlzIEhXIGRldGVj
dGlvbiBzaG91bGQgYmUgZG9uZSBpbiBrZXJuZWwsIG9yIGlmIGl0IApzaG91bGQgYmUgZG9uZSBp
biBCb290bG9hZGVyLiBCdXQgaXQgbWF5IGJlIG1vcmUgY29tcGxleCwgdG8gYWRkIHRoZSAKc3Qs
dXNlX2NraW4gaW4ga2VybmVsIERUIGlmIGJvb3Rsb2FkZXIgZGV0ZWN0cyB0aGlzIHRyYW5zbGF0
b3IuCgoKUmVnYXJkcywKWWFubgoKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IExpbnV4LXN0bTMyIG1haWxpbmcgbGlzdAo+IExpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
