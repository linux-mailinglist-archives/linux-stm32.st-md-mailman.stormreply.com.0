Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27519522C84
	for <lists+linux-stm32@lfdr.de>; Wed, 11 May 2022 08:46:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB936C03FC3;
	Wed, 11 May 2022 06:46:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E16DEC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 06:46:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B4hxSG021004;
 Wed, 11 May 2022 08:45:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : subject
 : from : to : cc : in-reply-to : references : content-type :
 content-transfer-encoding : date : mime-version; s=selector1;
 bh=9YYnwNfMMp9aQpgH4lmO552ifYtlfvbBnjgFiJluffU=;
 b=cxDlvgTRxykxPoFoXt2jquDUKz3zJrNbAYkJFegkgL+zwXF6sA51FRSnYjQt5AWGA0/n
 pDopkqerMw3z2hAComH3g8i8Ql56TSj7ukGM7lNvGwAvZXEgt/2WB9Fy1f0hGWV2jf07
 yyWV4MSssrmhKrjjb21j4RiVf0sDpsn69upFZM4hueqoxQhZ1hnXWjhhi+x8WI3llclo
 s9IorcdMgaQZxSUYtUt9ttw8RuOfS9qjWM1mzMHFltnM36ZaepZriFtuZD+Z5+nJ+AAm
 KvkguFN0TUL+D1jwMPWqcl03189Z4HXcgamzKodZ61wy3J4B6NhyCGEkMWStDcjOzCfi Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kw5ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 08:45:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30F2410002A;
 Wed, 11 May 2022 08:45:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 277A020FA2D;
 Wed, 11 May 2022 08:45:56 +0200 (CEST)
Received: from [192.168.8.15] (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 11 May
 2022 08:45:54 +0200
Message-ID: <05d9a88de4a7c415545043fab1e577e7f6151b8c.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Marc Zyngier <maz@kernel.org>
In-Reply-To: <878rr96xuo.wl-maz@kernel.org>
References: <20220510164123.557921-1-antonio.borneo@foss.st.com>
 <878rr96xuo.wl-maz@kernel.org>
Date: Wed, 11 May 2022 08:39:43 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.44.1 
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_02,2022-05-10_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Loic Pallardy <loic.pallardy@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/7] irqchip/stm32-exti: set_affinity
 return IRQ_SET_MASK_OK_DONE if no parent
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

SGkgTWFyYywKCk9uIFR1ZSwgMjAyMi0wNS0xMCBhdCAxOTozNCArMDEwMCwgTWFyYyBaeW5naWVy
IHdyb3RlOgo+IEFudG9uaW8sCj4gCj4gT24gVHVlLCAxMCBNYXkgMjAyMiAxNzo0MToxNyArMDEw
MCwKPiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5zdC5jb20+IHdyb3RlOgo+
ID4gCj4gPiBGcm9tOiBMdWRvdmljIEJhcnJlIDxsdWRvdmljLmJhcnJlQGZvc3Muc3QuY29tPgo+
ID4gCj4gPiBJZiBubyBwYXJlbnQsIHRoZXJlIGlzIG5vIHNwZWNpZmljIGFjdGlvbiB0byBkbyBp
bgo+ID4gc3RtMzIgaXJxY2hpcCwgYW5kIHNvIHJldHVybiBJUlFfU0VUX01BU0tfT0tfRE9ORS4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJyZUBmb3Nz
LnN0LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5l
b0Bmb3NzLnN0LmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4
dGkuYyB8IDIgKy0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4
dGkuYwo+ID4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYwo+ID4gaW5kZXggOWQx
OGY0NzA0MGViLi4xMGM5Yzc0MmMyMTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAv
aXJxLXN0bTMyLWV4dGkuYwo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zdG0zMi1leHRp
LmMKPiA+IEBAIC02MTQsNyArNjE0LDcgQEAgc3RhdGljIGludCBzdG0zMl9leHRpX2hfc2V0X2Fm
ZmluaXR5KHN0cnVjdAo+ID4gaXJxX2RhdGEgKmQsCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGQt
PnBhcmVudF9kYXRhLT5jaGlwKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gaXJxX2NoaXBfc2V0X2FmZmluaXR5X3BhcmVudChkLCBkZXN0LAo+ID4gZm9yY2UpOwo+
ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+ID4gK8KgwqDCoMKgwqDC
oMKgcmV0dXJuIElSUV9TRVRfTUFTS19PS19ET05FOwo+ID4gwqB9Cj4gPiDCoAo+ID4gwqBzdGF0
aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX2V4dGlfaF9zdXNwZW5kKHZvaWQpCj4gCj4gPHJh
bnQ+Cj4gQ2FuIHlvdSAqcGxlYXNlKiB1c2UgYSBjb3Zlci1sZXR0ZXIgd2hlbiBzZW5kaW5nIG1v
cmUgdGhhdCBhIHNpbmdsZQo+IHBhdGNoPyBJIGV4cGVjdCB0aGVyZSBpcyBhbiBvdmVyYXJjaGlu
ZyBtb3RpdmUgdG8gdGhpcyBzZXJpZXMuIFdoZXJlCj4gaXMgaXQgZGVzY3JpYmVkPwo+IAo+IEFs
c28sIHBsZWFzZSBsb29rIGF0IHRoZSB3YXkgdGhlIHN1YmplY3QgbGluZXMgYXJlIHdyaXR0ZW4g
Zm9yIG1vc3QKPiBpcnFjaGlwIHBhdGNoZXM6Cj4gCj4gaXJxY2hpcC9mb286IEZyb2JpZnkgdGhl
IGJhciBjYWxsYmFjayByZXR1cm4gdmFsdWUKPiAKPiBOb3RlIHRoZSBjYXBpdGFsIGxldHRlciBh
ZnRlciB0aGUgJzonLCBhbmQgdGhlIGZhY3QgdGhhdCBpdCBzdGFydHMKPiB3aXRoIGEgdmVyYi4g
SGVyZSwgSSB3b3VsZCBoYXZlIGxpa2VkIHRvIHNlZToKPiAKPiBpcnFjaGlwL3N0bTMyLWV4dGk6
IEZpeCBzZXRfYWZmaW5pdHkoKSByZXR1cm4gdmFsdWUKPiAKPiBhbmQgbGVhdmUgdGhlIG1lYXQg
b2YgdGhlIGRlc2NyaXB0aW9uIHRvIHRoZSBjb21taXQgbG9nIChpbnN0ZWFkIG9mCj4gc2F5aW5n
IHRoZSBleGFjdCBzYW1lIHRoaW5nIHR3aWNlKS4KPiA8L3JhbnQ+Cgp0aGFua3MgZm9yIHlvdXIg
cmV2aWV3IGFuZCB0aGUgaGludHMgb24gdGhpcyBzZXJpZXMuCkkgd2lsbCBzaG9ydGx5IHNlbmQg
YSBWMi4KClJlZ2FyZHMsCkFudG9uaW8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
