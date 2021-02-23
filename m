Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDC0322ECB
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Feb 2021 17:34:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CF6CC5718F;
	Tue, 23 Feb 2021 16:34:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFA2FC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Feb 2021 16:34:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11NGRP62029750; Tue, 23 Feb 2021 17:34:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qiJao0/ysEkLSzLZfmMgPEk3xL+/xnEzNXWUrVhuTVU=;
 b=ToHT2D+u0wDc4hioDucSyBWmV0zXH74Oh+UAjfRElR7m8WnM+Z3luTIglZ4USsw/qwwC
 vhHgjcJCoQEmvFjcAaD/bsCR5eGqa4iUgr9TVvyymD3Vy3KBkxUJJZZy0AB398ZIGgxk
 1YLHBX6yCYHkP3Lhv05P/5ugdAYZH6oi3aP/3Iaw3A83hU2D1kp5mHJwYKj/lYeuX3+s
 qhq+jJrC/BNs29vExKQOPDFFDzGi4VJWY4/6xTTyxg8ZCjcBLMl3V8uHBa0z9RAVwbWI
 87tPweZwHXNJJ2rM6/73Y/qovVRVzwoHuI0bFOWLmdFtlHgAYOJuvbWyYhR6HDvNNXnE SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36tree6a2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 17:34:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67FA010002A;
 Tue, 23 Feb 2021 17:34:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 41BC62252A5;
 Tue, 23 Feb 2021 17:34:13 +0100 (CET)
Received: from lmecxl0572.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Feb
 2021 17:34:12 +0100
To: Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue
 <alexandre.torgue@st.com>, Etienne Carriere <etienne.carriere@st.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, <marex@denx.de>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <20210126090120.19900-3-gabriel.fernandez@foss.st.com>
 <161285764074.418021.15522379930579131077@swboyd.mtv.corp.google.com>
 <5cc12945-0347-820c-1125-30ab4a947a00@foss.st.com>
 <161369805767.1254594.5233096495913117772@swboyd.mtv.corp.google.com>
From: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <b66530be-2b01-0306-ad56-af00e8e1d0a5@foss.st.com>
Date: Tue, 23 Feb 2021 17:34:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <161369805767.1254594.5233096495913117772@swboyd.mtv.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-23_08:2021-02-23,
 2021-02-23 signatures=0
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

Ck9uIDIvMTkvMjEgMjoyNyBBTSwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+IFF1b3RpbmcgZ2Ficmll
bC5mZXJuYW5kZXpAZm9zcy5zdC5jb20gKDIwMjEtMDItMTIgMDA6MDg6NDApCj4+IE9uIDIvOS8y
MSA5OjAwIEFNLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4+PiBRdW90aW5nIGdhYnJpZWwuZmVybmFu
ZGV6QGZvc3Muc3QuY29tICgyMDIxLTAxLTI2IDAxOjAxOjA4KQo+Pj4+IEZyb206IEdhYnJpZWwg
RmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBmb3NzLnN0LmNvbT4KPj4+Pgo+Pj4+ICdja19y
dGMnIGhhcyBtdWx0aXBsZSBjbG9ja3MgYXMgaW5wdXQgKGNrX2hzaSwgY2tfbHNpLCBhbmQgY2tf
aHNlKS4KPj4+PiBBIGRpdmlkZXIgaXMgYXZhaWxhYmxlIG9ubHkgb24gdGhlIHNwZWNpZmljIHJ0
YyBpbnB1dCBmb3IgY2tfaHNlLgo+Pj4+IFRoaXMgTWVyZ2Ugd2lsbCBmYWNpbGl0YXRlIHRvIGhh
dmUgYSBtb3JlIGNvaGVyZW50IGNsb2NrIHRyZWUKPj4+PiBpbiBubyB0cnVzdGVkIC8gdHJ1c3Rl
ZCB3b3JsZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJy
aWVsLmZlcm5hbmRlekBmb3NzLnN0LmNvbT4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL2Nsay9j
bGstc3RtMzJtcDEuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
Cj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLXN0bTMybXAxLmMgYi9kcml2
ZXJzL2Nsay9jbGstc3RtMzJtcDEuYwo+Pj4+IGluZGV4IDM1ZDVhZWU4ZjliMC4uMGUxZDQ0Mjdh
OGRmIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsay1zdG0zMm1wMS5jCj4+Pj4gKysr
IGIvZHJpdmVycy9jbGsvY2xrLXN0bTMybXAxLmMKPj4+PiBAQCAtMjQ1LDcgKzI0NSw3IEBAIHN0
YXRpYyBjb25zdCBjaGFyICogY29uc3QgZHNpX3NyY1tdID0gewo+Pj4+ICAgIH07Cj4+Pj4gICAg
Cj4+Pj4gICAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBydGNfc3JjW10gPSB7Cj4+Pj4gLSAg
ICAgICAib2ZmIiwgImNrX2xzZSIsICJja19sc2kiLCAiY2tfaHNlX3J0YyIKPj4+PiArICAgICAg
ICJvZmYiLCAiY2tfbHNlIiwgImNrX2xzaSIsICJja19oc2UiCj4+Pj4gICAgfTsKPj4+PiAgICAK
Pj4+PiAgICBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG1jbzFfc3JjW10gPSB7Cj4+Pj4gQEAg
LTEwMzEsNiArMTAzMSw0MiBAQCBzdGF0aWMgc3RydWN0IGNsa19odyAqY2xrX3JlZ2lzdGVyX2Nr
dGltKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbmFtZSwKPj4+PiAgICAgICAgICAg
cmV0dXJuIGh3Owo+Pj4+ICAgIH0KPj4+PiAgICAKPj4+PiArLyogVGhlIGRpdmlkZXIgb2YgUlRD
IGNsb2NrIGNvbmNlcm5zIG9ubHkgY2tfaHNlIGNsb2NrICovCj4+Pj4gKyNkZWZpbmUgSFNFX1JU
QyAzCj4+Pj4gKwo+Pj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBjbGtfZGl2aWRlcl9ydGNfcmVj
YWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpCj4+Pj4g
K3sKPj4+PiArICAgICAgIGlmIChjbGtfaHdfZ2V0X3BhcmVudChodykgPT0gY2xrX2h3X2dldF9w
YXJlbnRfYnlfaW5kZXgoaHcsIEhTRV9SVEMpKQo+Pj4+ICsgICAgICAgICAgICAgICByZXR1cm4g
Y2xrX2RpdmlkZXJfb3BzLnJlY2FsY19yYXRlKGh3LCBwYXJlbnRfcmF0ZSk7Cj4+Pj4gKwo+Pj4+
ICsgICAgICAgcmV0dXJuIHBhcmVudF9yYXRlOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMg
bG9uZyBjbGtfZGl2aWRlcl9ydGNfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWdu
ZWQgbG9uZyByYXRlLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgKnByYXRlKQo+Pj4+ICt7Cj4+Pj4gKyAgICAgICBpZiAoY2xrX2h3X2dl
dF9wYXJlbnQoaHcpID09IGNsa19od19nZXRfcGFyZW50X2J5X2luZGV4KGh3LCBIU0VfUlRDKSkK
Pj4+IFRoaXMgY2xrIG9wIGNhbiBiZSBjYWxsZWQgYXQgYmFzaWNhbGx5IGFueSB0aW1lLiBNYXli
ZSB0aGlzIHNob3VsZCB1c2UKPj4+IHRoZSBkZXRlcm1pbmUgcmF0ZSBvcCBhbmQgdGhlbiBsb29r
IHRvIHNlZSB3aGF0IHRoZSBwYXJlbnQgaXMgdGhhdCBjb21lcwo+Pj4gaW4gdmlhIHRoZSByYXRl
IHJlcXVlc3Qgc3RydWN0dXJlPyBPciBpcyB0aGUgaW50ZW50aW9uIHRvIGtlZXAgdGhpcwo+Pj4g
cGlubmVkIHRvIG9uZSBwYXJ0aWN1bGFyIHBhcmVudD8gTG9va2luZyBhdCB0aGlzIHJpZ2h0IG5v
dyBpdCBkb2Vzbid0Cj4+PiByZWFsbHkgbWFrZSBtdWNoIHNlbnNlIHdoeSB0aGUgY3VycmVudCBw
YXJlbnQgc3RhdGUgc2hvdWxkIHBsYXkgaW50bwo+Pj4gd2hhdCByYXRlIHRoZSBjbGsgY2FuIHJv
dW5kIHRvLCB1bmxlc3MgdGhlcmUgaXMgc29tZSBtb3JlIGNsayBmbGFncwo+Pj4gZ29pbmcgb24g
dGhhdCBjb25zdHJhaW4gdGhlIGFiaWxpdHkgdG8gY2hhbmdlIHRoaXMgY2xrJ3MgcGFyZW50Lgo+
PiBZZXMgdGhlIGludGVudGlvbiBpcyB0byBrZWVwIHRoaXMgcGlubmVkIGZvciBvbmUgcGFydGlj
dWxhciBwYXJlbnQuCj4+Cj4+IFRoaXMgZGl2aWRlciBpcyBvbmx5IGFwcGxpZWQgb24gdGhlIDR0
aCBpbnB1dCBvZiB0aGUgTVVYIG9mIHRoZSBSVEMgYW5kCj4+Cj4+IGRvZXNuJ3QgYWZmZWN0IHRo
ZSBIU0UgZnJlcXVlbmN5IGZvciBhbGwgdGhlIHN5c3RlbS4KPj4KPj4KPj4gT3NjaWxsYXRvcnMK
Pj4gICDCoC0tLS0tCj4+IHwgbHNlIHwtLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0+
IGNrX2xzZQo+PiAgIMKgLS0tLS3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+
ICAgwqAtLS0tLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPj4gfCBsc2kgfC0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLT4gY2tfbHNpCj4+ICAgwqAtLS0tLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCB8Cj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIHwKPj4gICDCoC0tLS0twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIHwKPj4gfCBoc2UgfC0tLS0rLS0tLS0tLXwtLS18LS0tLS0tLS0tLS0tLS0tLT4gY2tf
aHNlCj4+ICAgwqAtLS0tLcKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqAgfAo+PiAgIMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgfFwg
bXV4Cj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoCB8wqDCoCB8wqAgT0ZG
IC0tPnwgXAo+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqAgfMKg
wqDCoMKgwqDCoMKgwqAgfMKgIFzCoMKgwqDCoCBnYXRlCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqDCoMKgwqDCoCB8wqDCoCAtLS0tLS0tLS0+fMKgIHzCoMKgwqDCoCAtLS0KPj4gICDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIHwtLS0+fMKgwqAgfC0tPiBja19ydGMKPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgwqDCoMKgIC0tLS0tLS0tLS0tLS0+fMKgIHzCoMKgwqDCoCAtLS0KPj4gICDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoMKgIC0tLS0tLS0tLS0twqDCoMKgwqDCoCB8wqAgfAo+PiAgIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLS0tLXwgJSAxIHRvIDY0IHwtLS0+fCAvCj4+ICAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLS0tLS0tLS0tLS3CoMKgwqDCoCB8Lwo+PiAgIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkaXZpZGVyCj4+Cj4+IEkgbWFuYWdl
IHRoZSBSVEMgd2l0aCBhIGNsb2NrIGNvbXBvc2l0ZSB3aXRoIGEgZ2F0ZSBhIG11eCBhbmQgYSBz
cGVjaWZpYwo+PiByYXRlIG9wcyBmb3IgaHNlIGlucHV0Lgo+Pgo+PiBUaGF0IHdoeSBpIG5lZWQg
dG8gdGhlIHBhcmVudCBzdGF0ZS4KPj4KPiBTbyB3b3VsZCB1c2luZyBkZXRlcm1pbmVfcmF0ZSBv
cCBpbnN0ZWFkIG9mIHJvdW5kX3JhdGUgb3AgaGVscCBoZXJlPyBUaGF0Cj4gd2lsbCBwcm92aWRl
IHRoZSBjdXJyZW50IHBhcmVudCByYXRlIGFuZCBodyBwb2ludGVyIGluIHRoZSByYXRlIHJlcXVl
c3QKPiBzdHJ1Y3R1cmUuCgp5ZXMgdSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4sIGkgd2lsbCBz
ZW5kIHlvdSBhIHYzLgoKTWFueSBUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
