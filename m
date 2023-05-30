Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 892767166D3
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 17:18:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37E68C6A613;
	Tue, 30 May 2023 15:18:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33E1EC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 15:18:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UC6Xxj011803; Tue, 30 May 2023 17:18:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5TK4cBitjv4YwqRib8IC/BYem3TFu0lX9EPmhIMqG/s=;
 b=4uXEPIkE/ZJQpBli0ZJN7P8OzICMR/rxUxTKUGRjpH1UCJSg4YJBiUbAuFrjPfvonJrk
 HAG/ZxUuWWa91fKtbvgiHWf5DT7QC5wSUmjZ5WK+tt4wnJT7v9bsuO5g/yNfjhZXaN1f
 nXgNZ6Lu2+xgzUAbyXWZYciNIytqPCwiFZgDVZvehzWMtgCr+Arj/drvOh6k5XRYgyIL
 709CTsl1ub/dYgirgl3FZNYf+zWoHhhR1gorhrWSOCy06vpQovfck2flz54LxhELooGq
 nWdfkY+SZDMikdkMBGVHXRnUYRkmihcA9V3uPDOw61ODi5ollAhVtVLUVckQD8B6o1pr sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qvsnnrks4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 17:18:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9245A10002A;
 Tue, 30 May 2023 17:18:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89A0922F7BF;
 Tue, 30 May 2023 17:18:25 +0200 (CEST)
Received: from [10.201.20.208] (10.201.20.208) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 17:18:24 +0200
Message-ID: <be0aeb7e-d278-7d0e-9fdf-9974ea5a14e1@foss.st.com>
Date: Tue, 30 May 2023 17:18:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-rtc@vger.kernel.org>
References: <20230518003311.415018-1-marex@denx.de>
 <4a24cd14-9cca-7499-a0d3-37f7e4c3b087@foss.st.com>
 <eb76a6e9-150a-5daf-75fd-7574c36714f8@denx.de>
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <eb76a6e9-150a-5daf-75fd-7574c36714f8@denx.de>
X-Originating-IP: [10.201.20.208]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_11,2023-05-30_01,2023-05-22_02
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: Handle single EXTI IRQ as
	wake up source
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

T24gNS8zMC8yMyAxNjoxMywgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNS8zMC8yMyAxNjowMiwg
QW1lbGllIERlbGF1bmF5IHdyb3RlOgo+PiBIaSBNYXJlaywKPiAKPiBIZWxsbyBBbWVsaWUsCj4g
Cj4+IE9uIDUvMTgvMjMgMDI6MzMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gVGhlIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaSBzcGVjaWZpZXMgb25lIGludGVycnVwdCBmb3IgdGhl
Cj4+PiBSVEMgbm9kZSwgd2hpbGUgdGhlIGV4cGVjdGF0aW9uIG9mIHRoZSBSVEMgZHJpdmVyIGlz
IHR3byBpbnRlcnJ1cHRzIG9uCj4+PiBTVE0zMk1QMTV4eCBTb0MsIG9uZSBjb25uZWN0ZWQgdG8g
R0lDIGludGVycnVwdCBjb250cm9sbGVyIGFuZCBhbm90aGVyCj4+PiBvbmUgdG8gRVhUSS4gUGVy
IFNUTTMyTVAxNXh4IHJlZmVyZW5jZSBtYW51YWwsIHRoZSB0d28gaW50ZXJydXB0cyBzZXJ2ZQo+
Pj4gdGhlIHNhbWUgcHVycG9zZSwgZXhjZXB0IHRoZSBFWFRJIG9uZSBjYW4gYWxzbyB3YWtlIHRo
ZSBzeXN0ZW0gdXAuIFRoZQo+Pj4gRVhUSSBkcml2ZXIgYWxyZWFkeSBpbnRlcm5hbGx5IGhhbmRs
ZXMgdGhpcyBHSUMgYW5kIEVYVEkgZHVhbGl0eSBhbmQKPj4+IG1hcHMgdGhlIEVYVEkgaW50ZXJy
dXB0IG9udG8gR0lDIGR1cmluZyBydW50aW1lLCBhbmQgb25seSB1c2VzIHRoZSBFWFRJCj4+PiBm
b3Igd2FrZSB1cCBmdW5jdGlvbmFsaXR5Lgo+Pj4KPj4+IFRoZXJlZm9yZSwgZml4IHRoZSBkcml2
ZXIgc3VjaCB0aGF0IGlmIG9uIFNUTTMyTVAxNXh4IHRoZXJlIGlzIG9ubHkgb25lCj4+PiBpbnRl
cnJ1cHQgc3BlY2lmaWVkIGluIHRoZSBEVCwgdXNlIHRoYXQgaW50ZXJydXB0IGFzIEVYVEkgaW50
ZXJydXB0IGFuZAo+Pj4gc2V0IGl0IGFzIHdha2UgdXAgc291cmNlLgo+Pj4KPj4+IFRoaXMgZml4
ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIGluIHRoZSBrZXJuZWwgbG9nIG9uIFNUTTMyTVAxNXh4
Ogo+Pj4gIgo+Pj4gc3RtMzJfcnRjIDVjMDA0MDAwLnJ0YzogZXJyb3IgLUVOWElPOiBJUlEgaW5k
ZXggMSBub3QgZm91bmQKPj4+IHN0bTMyX3J0YyA1YzAwNDAwMC5ydGM6IGFsYXJtIGNhbid0IHdh
a2UgdXAgdGhlIHN5c3RlbTogLTYKPj4+ICIKPj4+Cj4+PiBUaGlzIGFsc28gZml4ZXMgdGhlIHN5
c3RlbSB3YWtlIHVwIHZpYSBidWlsdC1pbiBSVEMgdXNpbmcgZS5nLjoKPj4+ICQgcnRjd2FrZSAt
cyA1IC1tIG1lbQo+Pj4KPj4+IEZpeGVzOiBiNzIyNTJiNjU4MGMgKCJydGM6IHN0bTMyOiBhZGQg
c3RtMzJtcDEgcnRjIHN1cHBvcnQiKQo+Pj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+Cj4+PiAtLS0KPj4+IENjOiBBbGVzc2FuZHJvIFp1bW1vIDxhLnp1bW1vQHRv
d2VydGVjaC5pdD4KPj4+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlA
Ym9vdGxpbi5jb20+Cj4+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBm
b3NzLnN0LmNvbT4KPj4+IENjOiBBbWVsaWUgREVMQVVOQVkgPGFtZWxpZS5kZWxhdW5heUBmb3Nz
LnN0LmNvbT4KPj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5j
b20+Cj4+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBDYzog
bGludXgtcnRjQHZnZXIua2VybmVsLm9yZwo+Pj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9ydGMvcnRjLXN0bTMyLmMg
fCA5ICsrKysrLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXN0bTMyLmMg
Yi9kcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYwo+Pj4gaW5kZXggMjI5Y2IyODQ3Y2M0OC4uNzI5OTRi
OWY5NTMxOSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jCj4+PiArKysg
Yi9kcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYwo+Pj4gQEAgLTc4MCwxNCArNzgwLDE1IEBAIHN0YXRp
YyBpbnQgc3RtMzJfcnRjX3Byb2JlKHN0cnVjdCAKPj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikK
Pj4+IMKgwqDCoMKgwqAgcmV0ID0gZGV2aWNlX2luaXRfd2FrZXVwKCZwZGV2LT5kZXYsIHRydWUp
Owo+Pj4gwqDCoMKgwqDCoCBpZiAocnRjLT5kYXRhLT5oYXNfd2FrZWlycSkgewo+Pj4gLcKgwqDC
oMKgwqDCoMKgIHJ0Yy0+d2FrZWlycV9hbGFybSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMSk7
Cj4+PiArwqDCoMKgwqDCoMKgwqAgcnRjLT53YWtlaXJxX2FsYXJtID0gcGxhdGZvcm1fZ2V0X2ly
cV9vcHRpb25hbChwZGV2LCAxKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocnRjLT53YWtl
aXJxX2FsYXJtID4gMCkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZGV2
X3BtX3NldF9kZWRpY2F0ZWRfd2FrZV9pcnEoJnBkZXYtPmRldiwKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBydGMt
Pndha2VpcnFfYWxhcm0pOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgfSBlbHNlIGlmIChydGMtPndha2VpcnFfYWxhcm0gPT0gLUVQUk9CRV9ERUZFUikg
ewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gcnRjLT53YWtlaXJxX2FsYXJt
Owo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJ0Yy0+d2FrZWlycV9hbGFybSA9PSAt
RVBST0JFX0RFRkVSKQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVy
cjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIH0gZWxzZSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBkZXZfcG1fc2V0
X3dha2VfaXJxKCZwZGV2LT5kZXYsIHJ0Yy0+aXJxX2FsYXJtKTsKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4KPj4gSW4g
b3VyIGRvd25zdHJlYW0gWzFdLCBkZWRpY2F0ZWQgd2FrZXVwIGlycSBtYW5hZ2VtZW50IGlzIGRy
b3BwZWQ6IGl0IAo+PiBpcyBuZWl0aGVyIGRlc2NyaWJlZCBpbiBzdCxzdG0zMi1ydGMgYmluZGlu
Z3Mgbm9yIHVzZWQgaW4gU1RNMzJGeCwgCj4+IFNUTTMySHgsIFNUTTMyTVAxeCBkZXZpY2UgdHJl
ZXMuCj4+IFRoZSBwb2ludGVkIHBhdGNoIGlzIGdvaW5nIHRvIGJlIHVwc3RyZWFtZWQuCj4+Cj4+
IFsxXSAKPj4gaHR0cHM6Ly9naXRodWIuY29tL1NUTWljcm9lbGVjdHJvbmljcy9saW51eC9jb21t
aXQvNWE0NWUxZjEwMGQ1OWMzM2I2YjUwZmU5OGMwZjYyODYyYmQ2ZjNkMgo+IAo+IFdvbid0IHRo
YXQgYnJlYWsgY29tcGF0aWJpbGl0eSB3aXRoIERUcyB3aGljaCBkbyB1c2UgdHdvIGludGVycnVw
dHMgCj4gZW50cmllcyA/CgpJIGRpZG4ndCBmaW5kIGFueSBEVHMgdXNpbmcgU1RNMzIgUlRDIHdp
dGggdHdvIGludGVycnVwdHMuIERpZCBJIG1pc3MgCnNvbWV0aGluZz8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
