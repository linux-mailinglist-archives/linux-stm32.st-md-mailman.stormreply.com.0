Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854D319B03
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 09:09:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E99D7C57B5A;
	Fri, 12 Feb 2021 08:09:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D9BBC57B58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 08:09:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11C86l2M029175; Fri, 12 Feb 2021 09:08:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DHLRE2UmB8C4wlDYI8k7uWIN7I9RjaZ2KYe3yihptMU=;
 b=SgPTIN9lqgwaVVpkZ+RZC5gItARGIhGqsdMWlXL1ng4qFgK0ZH84btADnmv2q3JCF1Kz
 Dmm8a8gSrwSDMO0D/E6d5q5JaEgv4K3d87myhQStAeUWyuC7qJOksxTAQBeSwdOWURPx
 ADunrwMYfVxgYkq92XrWDWIargGuzOOt21Smh5SMBGs+RR4AUNP8Ppm3HJlgp8Wl1L3L
 qpyzqABA08S0MaSiIztNlXwubfAVtZjlMe/h6QK33DVRHc1uo3jFzQ+SGyQzc+mgnteI
 Qp8BlbUt3PgDCwhlMPga9upVHJ81MNFkgF1QFs9PlyRuIRW2bpgZ5t0JkMJYhHd8OGUg jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hravbcje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 09:08:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCD72100034;
 Fri, 12 Feb 2021 09:08:41 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B967B219D40;
 Fri, 12 Feb 2021 09:08:41 +0100 (CET)
Received: from lmecxl0572.lme.st.com (10.75.127.121) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Feb
 2021 09:08:40 +0100
To: Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue
 <alexandre.torgue@st.com>, Etienne Carriere <etienne.carriere@st.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, <marex@denx.de>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <20210126090120.19900-3-gabriel.fernandez@foss.st.com>
 <161285764074.418021.15522379930579131077@swboyd.mtv.corp.google.com>
From: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <5cc12945-0347-820c-1125-30ab4a947a00@foss.st.com>
Date: Fri, 12 Feb 2021 09:08:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <161285764074.418021.15522379930579131077@swboyd.mtv.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG1NODE5.st.com (10.75.127.66) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-12_02:2021-02-12,
 2021-02-12 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 02/14] clk: stm32mp1: merge
 'ck_hse_rtc' and 'ck_rtc' into one clock
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

Ck9uIDIvOS8yMSA5OjAwIEFNLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4gUXVvdGluZyBnYWJyaWVs
LmZlcm5hbmRlekBmb3NzLnN0LmNvbSAoMjAyMS0wMS0yNiAwMTowMTowOCkKPj4gRnJvbTogR2Fi
cmllbCBGZXJuYW5kZXogPGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tPgo+Pgo+PiAnY2tf
cnRjJyBoYXMgbXVsdGlwbGUgY2xvY2tzIGFzIGlucHV0IChja19oc2ksIGNrX2xzaSwgYW5kIGNr
X2hzZSkuCj4+IEEgZGl2aWRlciBpcyBhdmFpbGFibGUgb25seSBvbiB0aGUgc3BlY2lmaWMgcnRj
IGlucHV0IGZvciBja19oc2UuCj4+IFRoaXMgTWVyZ2Ugd2lsbCBmYWNpbGl0YXRlIHRvIGhhdmUg
YSBtb3JlIGNvaGVyZW50IGNsb2NrIHRyZWUKPj4gaW4gbm8gdHJ1c3RlZCAvIHRydXN0ZWQgd29y
bGQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5h
bmRlekBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9jbGsvY2xrLXN0bTMybXAxLmMg
fCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvY2xrLXN0bTMybXAxLmMgYi9kcml2ZXJzL2Nsay9jbGstc3RtMzJtcDEu
Ywo+PiBpbmRleCAzNWQ1YWVlOGY5YjAuLjBlMWQ0NDI3YThkZiAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9jbGsvY2xrLXN0bTMybXAxLmMKPj4gKysrIGIvZHJpdmVycy9jbGsvY2xrLXN0bTMybXAx
LmMKPj4gQEAgLTI0NSw3ICsyNDUsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGRzaV9z
cmNbXSA9IHsKPj4gICB9Owo+PiAgIAo+PiAgIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgcnRj
X3NyY1tdID0gewo+PiAtICAgICAgICJvZmYiLCAiY2tfbHNlIiwgImNrX2xzaSIsICJja19oc2Vf
cnRjIgo+PiArICAgICAgICJvZmYiLCAiY2tfbHNlIiwgImNrX2xzaSIsICJja19oc2UiCj4+ICAg
fTsKPj4gICAKPj4gICBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG1jbzFfc3JjW10gPSB7Cj4+
IEBAIC0xMDMxLDYgKzEwMzEsNDIgQEAgc3RhdGljIHN0cnVjdCBjbGtfaHcgKmNsa19yZWdpc3Rl
cl9ja3RpbShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKm5hbWUsCj4+ICAgICAgICAg
IHJldHVybiBodzsKPj4gICB9Cj4+ICAgCj4+ICsvKiBUaGUgZGl2aWRlciBvZiBSVEMgY2xvY2sg
Y29uY2VybnMgb25seSBja19oc2UgY2xvY2sgKi8KPj4gKyNkZWZpbmUgSFNFX1JUQyAzCj4+ICsK
Pj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIGNsa19kaXZpZGVyX3J0Y19yZWNhbGNfcmF0ZShzdHJ1
Y3QgY2xrX2h3ICpodywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpCj4+ICt7Cj4+ICsgICAgICAgaWYg
KGNsa19od19nZXRfcGFyZW50KGh3KSA9PSBjbGtfaHdfZ2V0X3BhcmVudF9ieV9pbmRleChodywg
SFNFX1JUQykpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gY2xrX2RpdmlkZXJfb3BzLnJlY2Fs
Y19yYXRlKGh3LCBwYXJlbnRfcmF0ZSk7Cj4+ICsKPj4gKyAgICAgICByZXR1cm4gcGFyZW50X3Jh
dGU7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBsb25nIGNsa19kaXZpZGVyX3J0Y19yb3VuZF9yYXRl
KHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnByYXRlKQo+PiArewo+PiAr
ICAgICAgIGlmIChjbGtfaHdfZ2V0X3BhcmVudChodykgPT0gY2xrX2h3X2dldF9wYXJlbnRfYnlf
aW5kZXgoaHcsIEhTRV9SVEMpKQo+IFRoaXMgY2xrIG9wIGNhbiBiZSBjYWxsZWQgYXQgYmFzaWNh
bGx5IGFueSB0aW1lLiBNYXliZSB0aGlzIHNob3VsZCB1c2UKPiB0aGUgZGV0ZXJtaW5lIHJhdGUg
b3AgYW5kIHRoZW4gbG9vayB0byBzZWUgd2hhdCB0aGUgcGFyZW50IGlzIHRoYXQgY29tZXMKPiBp
biB2aWEgdGhlIHJhdGUgcmVxdWVzdCBzdHJ1Y3R1cmU/IE9yIGlzIHRoZSBpbnRlbnRpb24gdG8g
a2VlcCB0aGlzCj4gcGlubmVkIHRvIG9uZSBwYXJ0aWN1bGFyIHBhcmVudD8gTG9va2luZyBhdCB0
aGlzIHJpZ2h0IG5vdyBpdCBkb2Vzbid0Cj4gcmVhbGx5IG1ha2UgbXVjaCBzZW5zZSB3aHkgdGhl
IGN1cnJlbnQgcGFyZW50IHN0YXRlIHNob3VsZCBwbGF5IGludG8KPiB3aGF0IHJhdGUgdGhlIGNs
ayBjYW4gcm91bmQgdG8sIHVubGVzcyB0aGVyZSBpcyBzb21lIG1vcmUgY2xrIGZsYWdzCj4gZ29p
bmcgb24gdGhhdCBjb25zdHJhaW4gdGhlIGFiaWxpdHkgdG8gY2hhbmdlIHRoaXMgY2xrJ3MgcGFy
ZW50LgoKWWVzIHRoZSBpbnRlbnRpb24gaXMgdG8ga2VlcCB0aGlzIHBpbm5lZCBmb3Igb25lIHBh
cnRpY3VsYXIgcGFyZW50LgoKVGhpcyBkaXZpZGVyIGlzIG9ubHkgYXBwbGllZCBvbiB0aGUgNHRo
IGlucHV0IG9mIHRoZSBNVVggb2YgdGhlIFJUQyBhbmQKCmRvZXNuJ3QgYWZmZWN0IHRoZSBIU0Ug
ZnJlcXVlbmN5IGZvciBhbGwgdGhlIHN5c3RlbS4KCgpPc2NpbGxhdG9ycwogwqAtLS0tLQp8IGxz
ZSB8LS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tPiBja19sc2UKIMKgLS0tLS3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8CiDCoC0tLS0twqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfAp8IGxzaSB8LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0t
PiBja19sc2kKIMKgLS0tLS3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgfAogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIHwKIMKgLS0tLS3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgfAp8IGhzZSB8LS0tLSstLS0tLS0tfC0tLXwtLS0tLS0tLS0t
LS0tLS0tPiBja19oc2UKIMKgLS0tLS3CoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHzCoMKgIHwKIMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAg
fFwgbXV4CiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHzCoMKgIHzCoCBPRkYg
LS0+fCBcCiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHzCoMKgIHzCoMKgwqDC
oMKgwqDCoMKgIHzCoCBcwqDCoMKgwqAgZ2F0ZQogwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDC
oMKgwqDCoCB8wqDCoCAtLS0tLS0tLS0+fMKgIHzCoMKgwqDCoCAtLS0KIMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgfC0tLT58
wqDCoCB8LS0+IGNrX3J0YwogwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoCAtLS0t
LS0tLS0tLS0tPnzCoCB8wqDCoMKgwqAgLS0tCiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKg
IC0tLS0tLS0tLS0twqDCoMKgwqDCoCB8wqAgfAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtLS0t
fCAlIDEgdG8gNjQgfC0tLT58IC8KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0t
LS0tLS0tLS0twqDCoMKgwqAgfC8KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkaXZpZGVyCgpJIG1hbmFnZSB0aGUgUlRDIHdpdGggYSBjbG9jayBjb21wb3NpdGUgd2l0aCBh
IGdhdGUgYSBtdXggYW5kIGEgc3BlY2lmaWMgCnJhdGUgb3BzIGZvciBoc2UgaW5wdXQuCgpUaGF0
IHdoeSBpIG5lZWQgdG8gdGhlIHBhcmVudCBzdGF0ZS4KCkJlc3QgUmVnYXJkcwoKR2FicmllbAoK
Cj4+ICsgICAgICAgICAgICAgICByZXR1cm4gY2xrX2RpdmlkZXJfb3BzLnJvdW5kX3JhdGUoaHcs
IHJhdGUsIHByYXRlKTsKPj4gKwo+PiArICAgICAgIHJldHVybiAqcHJhdGU7Cj4+ICt9Cj4+ICsK
Pj4gK3N0YXRpYyBpbnQgY2xrX2RpdmlkZXJfcnRjX3NldF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3
LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpCj4+ICt7Cj4+ICsgICAgICAgaWYgKGNsa19o
d19nZXRfcGFyZW50KGh3KSA9PSBjbGtfaHdfZ2V0X3BhcmVudF9ieV9pbmRleChodywgSFNFX1JU
QykpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gY2xrX2RpdmlkZXJfb3BzLnNldF9yYXRlKGh3
LCByYXRlLCBwYXJlbnRfcmF0ZSk7Cj4+ICsKPj4gKyAgICAgICByZXR1cm4gcGFyZW50X3JhdGU7
Cj4+ICt9Cj4+ICsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
