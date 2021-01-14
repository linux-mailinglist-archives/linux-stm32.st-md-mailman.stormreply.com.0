Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 362272F5E6C
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 11:13:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA2E5C56635;
	Thu, 14 Jan 2021 10:13:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9281C5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 10:13:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EAD3r7016690; Thu, 14 Jan 2021 11:13:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sVesANlBEQEMySIkYMC5c1ewT46wm1qfoPp6x/8L7CY=;
 b=f897wr/crCD6+1OR/xizgszd1H6fYzJZeXOb2w6A6NurinHySN00zVN2muwlxutNitoe
 c3YQ4mfMgkpv4MjDTXQJdbUs57WtlNS1vYhWYtISM64kk5YPPKj7W7V8SOG/Uoo0Ntzp
 6ibP0JbEtRZi/X6wIK3zCvZOdgHWTPer0hl4YMNnr5MKXUtYR9CLglxa7vcEeAeOL0cz
 A/oKVUf27eluND42Y4S0iCyKDUEWCYh25LPheNbQth4NZZEwbquB5Q08megoexAPCU61
 2FC/Lj5iDZd3TjAd7rZcG5tr35tRj5lFWBOrxfgH01e5eD53yyzIlk3niVzJ+byryph3 RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35yp3y1n00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 11:13:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78FC910002A;
 Thu, 14 Jan 2021 11:13:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D81322D214;
 Thu, 14 Jan 2021 11:13:07 +0100 (CET)
Received: from lmecxl0504.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 11:13:06 +0100
To: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>
References: <20210105140718.122752-1-marex@denx.de>
 <CAPDyKFoQfm2ZtPdsZSZtOCDH-FJqNzihYqZny-vUdK4Q4tWTzQ@mail.gmail.com>
 <b83c1112-010b-a40f-319f-84c755424b0f@denx.de>
 <CAPDyKFo5Sqxj31owrnmz1sTZqgW_PtZM2H=pDPBz+9hc0W0hHA@mail.gmail.com>
 <77dd612b-23f0-1f77-797a-9cde512926e3@denx.de>
 <f91fbdfc-453d-78a6-970a-5d6eecd443b2@foss.st.com>
 <ccef7ae4-8cd7-4434-9632-917a4fb92f53@denx.de>
From: Yann GAUTIER <yann.gautier@foss.st.com>
Message-ID: <ad4a108e-81f1-daf5-9921-9884ed06d237@foss.st.com>
Date: Thu, 14 Jan 2021 11:13:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ccef7ae4-8cd7-4434-9632-917a4fb92f53@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_03:2021-01-13,
 2021-01-14 signatures=0
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

T24gMS8xMy8yMSAzOjQ1IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAxLzEzLzIxIDM6MjEg
UE0sIFlhbm4gR0FVVElFUiB3cm90ZToKPj4gT24gMS8xMy8yMSAxMjo1MiBQTSwgTWFyZWsgVmFz
dXQgd3JvdGU6Cj4+PiBPbiAxLzEzLzIxIDEyOjM4IFBNLCBVbGYgSGFuc3NvbiB3cm90ZToKPj4+
IFsuLi5dCj4+Pj4+Pj4gwqDCoCBzdGF0aWMgaW50IG1tY2lfb2ZfcGFyc2Uoc3RydWN0IGRldmlj
ZV9ub2RlICpucCwgc3RydWN0IAo+Pj4+Pj4+IG1tY19ob3N0ICptbWMpCj4+Pj4+Pj4gwqDCoCB7
Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtbWNpX2hvc3QgKmhvc3QgPSBtbWNf
cHJpdihtbWMpOwo+Pj4+Pj4+IEBAIC0xOTEzLDcgKzE5NzMsNyBAQCBzdGF0aWMgaW50IG1tY2lf
b2ZfcGFyc2Uoc3RydWN0IGRldmljZV9ub2RlIAo+Pj4+Pj4+ICpucCwgc3RydWN0IG1tY19ob3N0
ICptbWMpCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChvZl9nZXRfcHJvcGVydHkobnAs
ICJzdCxuZWctZWRnZSIsIE5VTEwpKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaG9zdC0+Y2xrX3JlZ19hZGQgfD0gTUNJX1NUTTMyX0NMS19ORUdFREdFOwo+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAob2ZfZ2V0X3Byb3BlcnR5KG5wLCAic3QsdXNlLWNr
aW4iLCBOVUxMKSkKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBob3N0LT5j
bGtfcmVnX2FkZCB8PSBNQ0lfU1RNMzJfQ0xLX1NFTENLSU47Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbW1jaV9wcm9iZV9sZXZlbF90cmFuc2xhdG9yKG1tYyk7Cj4+Pj4+
Pgo+Pj4+Pj4gSSB0aGluayB5b3UgY2FuIG1ha2UgdGhpcyBjaGFuZ2UgYml0IGxlc3MgaW52YXNp
dmUuIFJhdGhlciB0aGFuIAo+Pj4+Pj4gaGF2aW5nCj4+Pj4+PiB0byBzaHVmZmxlIGNvZGUgYXJv
dW5kIGluIC0+cHJvYmUoKSwgSSBzdWdnZXN0IHlvdSBjYWxsCj4+Pj4+PiBtbWNpX3Byb2JlX2xl
dmVsX3RyYW5zbGF0b3IoKSBvdXRzaWRlIGFuZCBhZnRlciBtbWNpX29mX3BhcnNlKCkgaGFzCj4+
Pj4+PiBiZWVuIGNhbGxlZC4KPj4+Pj4+Cj4+Pj4+PiBJbiB0aGlzIHdheSwgeW91IGNhbiBhbHNv
IHByb3ZpZGUgbW1jaV9wcm9iZV9sZXZlbF90cmFuc2xhdG9yKCkgCj4+Pj4+PiB3aXRoIGEKPj4+
Pj4+IHN0cnVjdCBtbWNpX2hvc3QgKiwgcmF0aGVyIHRoYW4gaGF2aW5nIHRvIHBpY2sgaXQgdXAg
ZnJvbQo+Pj4+Pj4gbW1jX3ByaXYobW1jKSwgaWYgeW91IHNlZSB3aGF0IEkgbWVhbi4KPj4+Pj4+
Cj4+Pj4+PiBPZiBjb3Vyc2UsIHRoaXMgYWxzbyBtZWFucyBpbiBtbWNpX3Byb2JlX2xldmVsX3Ry
YW5zbGF0b3IoKSB5b3Ugd2lsbAo+Pj4+Pj4gaGF2ZSB0byBjaGVjayBpZiBNQ0lfU1RNMzJfQ0xL
X1NFTENLSU4gaGFzIGJlZW4gc2V0LCBhbmQgaWYgbm90IHRoZW4KPj4+Pj4+IGRvIGFuIGVhcmx5
IHJldHVybi4KPj4+Pj4KPj4+Pj4gVGVzdGluZyB0aGUgdHJhbnNsYXRvciBwcmVzZW5jZSB3aGVu
IGNoZWNraW5nIHdoZXRoZXIgaXRzIGVuYWJsZWQgCj4+Pj4+IGluIERUCj4+Pj4+IHNlZW1zIGxp
a2UgdGhlIHJpZ2h0IHBsYWNlLCBidXQgdGhhdCdzIHJlYWxseSBqdXN0IGFuIAo+Pj4+PiBpbXBs
ZW1lbnRhdGlvbiBkZXRhaWwuCj4+Pj4+Cj4+Pj4+IEkgYW0gbW9yZSBpbnRlcmVzdGVkIGluIGtu
b3dpbmcgd2hldGhlciBhZGRpbmcKPj4+Pj4gbW1jaV9wcm9iZV9sZXZlbF90cmFuc2xhdG9yKCkg
aXMgZXZlbiBhY2NlcHRhYmxlIGluIHRoZSBmaXJzdCAKPj4+Pj4gcGxhY2UuIElzIGl0ID8KPj4+
Pgo+Pj4+IEhvbmVzdGx5LCBJIGRvbid0IGtub3cuCj4+Pj4KPj4+PiBJIHRoaW5rIEkgbmVlZCB0
byBkZWZlciB0aGF0IHF1ZXN0aW9uIHRvIExpbnVzIFdhbGxlaWouIEFuZCBvZiBjb3Vyc2UsCj4+
Pj4gaXQgd291bGQgYmUgbmljZSB0byBnZXQgdGhlIG9waW5pb24gZnJvbSBMdWRvdmljIGFzIHdl
bGwuCj4+Pgo+Pj4gR29vZCwgdGhhdCdzIHdoYXQgSSB3YXMgaG9waW5nIGZvciB0b28uCj4+Cj4+
IEhpLAo+Pgo+PiBMdWRvdmljIGlzIG91dCBvZiBvZmZpY2UgdGhpcyB3ZWVrLgo+Pgo+PiBUaGUg
ZmVhdHVyZSBvZiBkZXRlY3RpbmcgYSBsZXZlbCB0cmFuc2xhdG9yIHNlZW1zIHRvIGJlIHF1aXRl
IGdlbmVyaWMsIAo+PiBhbmQgbm90IGRlZGljYXRlZCB0byBNTUNJIGRyaXZlciBvciB0aGUgU1Qg
ZGVkaWNhdGVkIGNvZGUsIGFuZCB3aXRoIAo+PiBuZXcgc3QsKiBwcm9wZXJ0aWVzLiBJdCBtYXkg
YmUgaW4gZ2VuZXJpYyBtbWMgY29kZS4gQnV0IEknbGwgbGV0IExpbnVzIAo+PiBjb21tZW50IGFi
b3V0IHRoYXQuCj4+Cj4+IEkgYWxzbyB3b25kZXIgaWYgdGhpcyBIVyBkZXRlY3Rpb24gc2hvdWxk
IGJlIGRvbmUgaW4ga2VybmVsLCBvciBpZiBpdCAKPj4gc2hvdWxkIGJlIGRvbmUgaW4gQm9vdGxv
YWRlci4gQnV0IGl0IG1heSBiZSBtb3JlIGNvbXBsZXgsIHRvIGFkZCB0aGUgCj4+IHN0LHVzZV9j
a2luIGluIGtlcm5lbCBEVCBpZiBib290bG9hZGVyIGRldGVjdHMgdGhpcyB0cmFuc2xhdG9yLgo+
IAo+IExldHMgbm90IGF0dGVtcHQgdG8gaGlkZSBpbm9idmlvdXMgZnVuY3Rpb25hbGl0eSBpbiBi
b290bG9hZGVycywgdGhlIAo+IGtlcm5lbCBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2YgYm9vdGxv
YWRlciB3aGVyZSBwb3NzaWJsZS4gQW5kIGhlcmUgaXQgCj4gaXMgY2xlYXJseSBhbmQgZWFzaWx5
IHBvc3NpYmxlLgoKT0sgZm9yIHRoaXMgcGFydCwgSSB1bmRlcnN0YW5kIGl0IHdpbGwgYmUgYmV0
dGVyIG5vdCB0byBoaWRlIHRoaXMgaW4gCmJvb3Rsb2FkZXIuCgpUaGVyZSBpcyBzdGlsbCB0aGUg
cHJldmlvdXMgcG9pbnQgZm9yIHdoaWNoIExpbnVzIG1heSBoZWxwLgoKUmVnYXJkcywKWWFubgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
