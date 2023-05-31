Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E77C717C12
	for <lists+linux-stm32@lfdr.de>; Wed, 31 May 2023 11:36:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA45EC6A614;
	Wed, 31 May 2023 09:36:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86833C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 09:36:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V8kCnB010455; Wed, 31 May 2023 11:36:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hFgvWKp9AkqMETCzWF1uuwNa6TGEkd66obojMjzOdX0=;
 b=ZNKS+OFUVlYlkILXVQ4+QwcvKCMdgjFP50mKjh2xHFA685Yl3/NCBIMpQkMEN+I2NeGx
 p2oxw3G19bJJzcpYBVm3NfREz1PxpDQEluQSwNRsKDiCMJz2+X+t1cXoe/JyX7bpwG9f
 +LlrFTVwMl6Z+mpb7oKbpeIlLQz6/1zQFQoUq9xEXjz5tdggbgrvMyEdb6eiWBa+V1yb
 CdtlmC3q2wdIHiSAtdls9bIxhzupo6pM7TCFzLB1yvoX2jhNkf295y1qFNiijTjuHxzl
 7VOw4fPVAkgPlv+GI4sjmVAzSj+Jj7AEWhov7WpyyUWpanGFFi8ifNZk9sLGhm2p56D6 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qx314re86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 11:36:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61756100034;
 Wed, 31 May 2023 11:36:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4DC2C2248B5;
 Wed, 31 May 2023 11:36:23 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 31 May
 2023 11:36:22 +0200
Message-ID: <9409594f-0ae0-9a96-4eaa-4fdbecd2656f@foss.st.com>
Date: Wed, 31 May 2023 11:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Amelie Delaunay <amelie.delaunay@foss.st.com>,
 <linux-rtc@vger.kernel.org>
References: <20230518003311.415018-1-marex@denx.de>
 <4a24cd14-9cca-7499-a0d3-37f7e4c3b087@foss.st.com>
 <eb76a6e9-150a-5daf-75fd-7574c36714f8@denx.de>
 <be0aeb7e-d278-7d0e-9fdf-9974ea5a14e1@foss.st.com>
 <d9c1809f-7359-58f8-4cdf-95f957256e55@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <d9c1809f-7359-58f8-4cdf-95f957256e55@denx.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_05,2023-05-30_01,2023-05-22_02
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
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

SGkgTWFyZWsKCk9uIDUvMzAvMjMgMjE6NTQsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDUvMzAv
MjMgMTc6MTgsIEFtZWxpZSBEZWxhdW5heSB3cm90ZToKPj4gT24gNS8zMC8yMyAxNjoxMywgTWFy
ZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiA1LzMwLzIzIDE2OjAyLCBBbWVsaWUgRGVsYXVuYXkgd3Jv
dGU6Cj4+Pj4gSGkgTWFyZWssCj4+Pgo+Pj4gSGVsbG8gQW1lbGllLAo+Pj4KPj4+PiBPbiA1LzE4
LzIzIDAyOjMzLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+Pj4gVGhlIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTEuZHRzaSBzcGVjaWZpZXMgb25lIGludGVycnVwdCBmb3IgdGhlCj4+Pj4+IFJU
QyBub2RlLCB3aGlsZSB0aGUgZXhwZWN0YXRpb24gb2YgdGhlIFJUQyBkcml2ZXIgaXMgdHdvIGlu
dGVycnVwdHMgb24KPj4+Pj4gU1RNMzJNUDE1eHggU29DLCBvbmUgY29ubmVjdGVkIHRvIEdJQyBp
bnRlcnJ1cHQgY29udHJvbGxlciBhbmQgYW5vdGhlcgo+Pj4+PiBvbmUgdG8gRVhUSS4gUGVyIFNU
TTMyTVAxNXh4IHJlZmVyZW5jZSBtYW51YWwsIHRoZSB0d28gaW50ZXJydXB0cyAKPj4+Pj4gc2Vy
dmUKPj4+Pj4gdGhlIHNhbWUgcHVycG9zZSwgZXhjZXB0IHRoZSBFWFRJIG9uZSBjYW4gYWxzbyB3
YWtlIHRoZSBzeXN0ZW0gdXAuIFRoZQo+Pj4+PiBFWFRJIGRyaXZlciBhbHJlYWR5IGludGVybmFs
bHkgaGFuZGxlcyB0aGlzIEdJQyBhbmQgRVhUSSBkdWFsaXR5IGFuZAo+Pj4+PiBtYXBzIHRoZSBF
WFRJIGludGVycnVwdCBvbnRvIEdJQyBkdXJpbmcgcnVudGltZSwgYW5kIG9ubHkgdXNlcyB0aGUg
Cj4+Pj4+IEVYVEkKPj4+Pj4gZm9yIHdha2UgdXAgZnVuY3Rpb25hbGl0eS4KPj4+Pj4KPj4+Pj4g
VGhlcmVmb3JlLCBmaXggdGhlIGRyaXZlciBzdWNoIHRoYXQgaWYgb24gU1RNMzJNUDE1eHggdGhl
cmUgaXMgb25seSAKPj4+Pj4gb25lCj4+Pj4+IGludGVycnVwdCBzcGVjaWZpZWQgaW4gdGhlIERU
LCB1c2UgdGhhdCBpbnRlcnJ1cHQgYXMgRVhUSSBpbnRlcnJ1cHQgCj4+Pj4+IGFuZAo+Pj4+PiBz
ZXQgaXQgYXMgd2FrZSB1cCBzb3VyY2UuCj4+Pj4+Cj4+Pj4+IFRoaXMgZml4ZXMgdGhlIGZvbGxv
d2luZyB3YXJuaW5nIGluIHRoZSBrZXJuZWwgbG9nIG9uIFNUTTMyTVAxNXh4Ogo+Pj4+PiAiCj4+
Pj4+IHN0bTMyX3J0YyA1YzAwNDAwMC5ydGM6IGVycm9yIC1FTlhJTzogSVJRIGluZGV4IDEgbm90
IGZvdW5kCj4+Pj4+IHN0bTMyX3J0YyA1YzAwNDAwMC5ydGM6IGFsYXJtIGNhbid0IHdha2UgdXAg
dGhlIHN5c3RlbTogLTYKPj4+Pj4gIgo+Pj4+Pgo+Pj4+PiBUaGlzIGFsc28gZml4ZXMgdGhlIHN5
c3RlbSB3YWtlIHVwIHZpYSBidWlsdC1pbiBSVEMgdXNpbmcgZS5nLjoKPj4+Pj4gJCBydGN3YWtl
IC1zIDUgLW0gbWVtCj4+Pj4+Cj4+Pj4+IEZpeGVzOiBiNzIyNTJiNjU4MGMgKCJydGM6IHN0bTMy
OiBhZGQgc3RtMzJtcDEgcnRjIHN1cHBvcnQiKQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBW
YXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+Pj4gLS0tCj4+Pj4+IENjOiBBbGVzc2FuZHJvIFp1bW1v
IDxhLnp1bW1vQHRvd2VydGVjaC5pdD4KPj4+Pj4gQ2M6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4KPj4+Pj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFs
ZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+Pj4+IENjOiBBbWVsaWUgREVMQVVOQVkgPGFt
ZWxpZS5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4+Pj4gQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNv
cXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPj4+Pj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+Pj4+PiBDYzogbGludXgtcnRjQHZnZXIua2VybmVsLm9yZwo+Pj4+PiBD
YzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4+PiAtLS0KPj4+
Pj4gwqAgZHJpdmVycy9ydGMvcnRjLXN0bTMyLmMgfCA5ICsrKysrLS0tLQo+Pj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXN0bTMyLmMgYi9kcml2ZXJzL3J0Yy9ydGMtc3Rt
MzIuYwo+Pj4+PiBpbmRleCAyMjljYjI4NDdjYzQ4Li43Mjk5NGI5Zjk1MzE5IDEwMDY0NAo+Pj4+
PiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYwo+Pj4+PiArKysgYi9kcml2ZXJzL3J0Yy9y
dGMtc3RtMzIuYwo+Pj4+PiBAQCAtNzgwLDE0ICs3ODAsMTUgQEAgc3RhdGljIGludCBzdG0zMl9y
dGNfcHJvYmUoc3RydWN0IAo+Pj4+PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+Pj4+IMKgwqDC
oMKgwqAgcmV0ID0gZGV2aWNlX2luaXRfd2FrZXVwKCZwZGV2LT5kZXYsIHRydWUpOwo+Pj4+PiDC
oMKgwqDCoMKgIGlmIChydGMtPmRhdGEtPmhhc193YWtlaXJxKSB7Cj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoCBydGMtPndha2VpcnFfYWxhcm0gPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDEpOwo+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgcnRjLT53YWtlaXJxX2FsYXJtID0gcGxhdGZvcm1fZ2V0X2lycV9v
cHRpb25hbChwZGV2LCAxKTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChydGMtPndha2Vp
cnFfYWxhcm0gPiAwKSB7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGRl
dl9wbV9zZXRfZGVkaWNhdGVkX3dha2VfaXJxKCZwZGV2LT5kZXYsCj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
dGMtPndha2VpcnFfYWxhcm0pOwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAocnRjLT53YWtlaXJxX2FsYXJtID09IC1FUFJPQkVf
REVGRVIpIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gcnRjLT53YWtl
aXJxX2FsYXJtOwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocnRjLT53YWtlaXJx
X2FsYXJtID09IC1FUFJPQkVfREVGRVIpCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byBlcnI7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0ID0gZGV2X3BtX3NldF93YWtlX2lycSgmcGRldi0+ZGV2LCBydGMtPmlycV9hbGFybSk7
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+PiDCoMKg
wqDCoMKgIGlmIChyZXQpCj4+Pj4KPj4+PiBJbiBvdXIgZG93bnN0cmVhbSBbMV0sIGRlZGljYXRl
ZCB3YWtldXAgaXJxIG1hbmFnZW1lbnQgaXMgZHJvcHBlZDogCj4+Pj4gaXQgaXMgbmVpdGhlciBk
ZXNjcmliZWQgaW4gc3Qsc3RtMzItcnRjIGJpbmRpbmdzIG5vciB1c2VkIGluIAo+Pj4+IFNUTTMy
RngsIFNUTTMySHgsIFNUTTMyTVAxeCBkZXZpY2UgdHJlZXMuCj4+Pj4gVGhlIHBvaW50ZWQgcGF0
Y2ggaXMgZ29pbmcgdG8gYmUgdXBzdHJlYW1lZC4KPj4+Pgo+Pj4+IFsxXSAKPj4+PiBodHRwczov
L2dpdGh1Yi5jb20vU1RNaWNyb2VsZWN0cm9uaWNzL2xpbnV4L2NvbW1pdC81YTQ1ZTFmMTAwZDU5
YzMzYjZiNTBmZTk4YzBmNjI4NjJiZDZmM2QyCj4+Pgo+Pj4gV29uJ3QgdGhhdCBicmVhayBjb21w
YXRpYmlsaXR5IHdpdGggRFRzIHdoaWNoIGRvIHVzZSB0d28gaW50ZXJydXB0cyAKPj4+IGVudHJp
ZXMgPwo+Pgo+PiBJIGRpZG4ndCBmaW5kIGFueSBEVHMgdXNpbmcgU1RNMzIgUlRDIHdpdGggdHdv
IGludGVycnVwdHMuIERpZCBJIG1pc3MgCj4+IHNvbWV0aGluZz8KPiAKPiBJIGFtIG5vdCBhd2Fy
ZSBvZiBhbnkgZWl0aGVyIChJIGFsc28gZGlkIGNoZWNrIGEgY291cGxlIG9mIHJlcG9zaXRvcmll
cyAKPiB0byBiZSBzdXJlKSAuIEhvd2V2ZXIsIHRoZSBEVCBpcyBhbiBBQkkgLCBzbyB0aGVyZSBt
aWdodCBiZSB1c2VycyB3ZSBkbyAKPiBub3Qga25vdyBhYm91dCwgd2hvIG1pZ2h0IGJlIHVuYWJs
ZSB0byB1cGRhdGUgdGhlaXIgRFRzICwgYW5kIHdobyB3b3VsZCAKPiBiZSBicm9rZW4gYnkgZHJv
cHBpbmcgdGhlIHN1cHBvcnQgZm9yIHR3byBpbnRlcnJ1cHRzLgoKQ3VycmVudGx5IGlmIHBlb3Bs
ZSB1c2UgMiBpbnRlcnJ1cHRzIGluIHRoZWlyIERUIHdpdGggYW4gdXAgdG8gZGF0ZSAKa2VybmVs
IEkgZG9uJ3QgdGhpbmsgaXQgd29ya3MgZmluZS4gQXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgTVAx
IHN0b3J5LCAyIAppbnRlcnJ1cHRzIHdlcmUgbmVlZGVkIHRvIHdha2V1cCBzeXN0ZW0gZnJvbSBM
UFNUT1A6IG9uZSBmb3IgR0lDIGFuZCB0aGUgCm90aGVyIG9uZSBmb3IgRVhUSS4gQnV0IHNpbmNl
IG1heWJlIDIgeWVhcnMsIEVYVEkgYW5kIEdJQyBpbnRlcnJ1cHRzIGFyZSAKZGlyZWN0bHkgbGlu
a2VkIGluc2lkZSB0aGUgRVhUSSBkcml2ZXIuIFNvIG5vdywgZGV2aWNlcyBvbmx5IG5lZWQgdG8g
CnRha2Ugb25lIGludGVycnVwdC4gV2l0aCB0aGlzIGltcGxlbWVudGF0aW9uIGlmIG9uZSBkZXZp
Y2UgdXNlcyAyIAppbnRlcnJ1cHRzIGluIHRoZWlyIERUIHRoZW4gdGhlIEdJQyBpbnRlcnJ1cHQg
d2lsbCBiZSBtYXBwZWQgdHdvIHRpbWVzLiAKU28gSSB0aGluayB0aGF0IGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24gaW4gUlRDIGRyaXZlciBpcyBicm9rZW4gYW5kIGl0IApzaG91bGQgYmUgYWxpZ25l
ZCB3aXRoICJuZXciIEVYVEkgaW1wbGVtZW50YXRpb24uIE5vdGUgYWxzbyB0aGF0IHRoZSB1c2Ug
Cm9mIDIgaW50ZXJydXB0cyBoYXMgbmV2ZXIgYmVlbiBkb2N1bWVudGVkIGluIGR0LWJpbmRpbmdz
IGRvY3VtZW50YXRpb24uCgpBYm92ZSB3b3JkcyBhcmUgZm9yIFNUTTMyIE1QVSBwcm9kdWN0cyBG
b3IgU1RNMzIgTUNVIHByb2R1Y3RzIFJUQyBpcyAKb25seSBtYXBwZWQgdG8gdGhlIEVYVEkgKG5v
dCB0byB0aGUgTlZJQykgc28gbm8gbmVlZHMgdG8gaGFuZGxlIHR3byAKaW50ZXJydXB0cy4KCkFs
ZXgKCgo+IE9uIHRoZSBvdGhlciBoYW5kLCBJIG9ubHkgdXNlIG9uZSBpbnRlcnJ1cHQgYW55d2F5
LCBzbyBJIGFtIG5vdCBhZmZlY3RlZCAKPiBhbmQgSSBkb24ndCBoYXZlIGEgc3Ryb25nIHByZWZl
cmVuY2UgcmVnYXJkaW5nIHdoaWNoIHBhdGNoIGdldHMgaW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
