Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 613BA77F1F7
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 10:20:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16D7EC6B475;
	Thu, 17 Aug 2023 08:20:35 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 283EFC6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 08:20:33 +0000 (UTC)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRHsd2ryWztSb0;
 Thu, 17 Aug 2023 16:16:53 +0800 (CST)
Received: from [10.67.108.26] (10.67.108.26) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 16:20:30 +0800
Message-ID: <db4a6afa-62d1-b652-9e4a-b8f8bccde8e2@huawei.com>
Date: Thu, 17 Aug 2023 16:20:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, <andersson@kernel.org>,
 <mathieu.poirier@linaro.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <linux-remoteproc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20230802095128.995428-1-chenjiahao16@huawei.com>
 <15e381f6-aabd-8a3a-7911-4e64828b0fdc@foss.st.com>
 <97ed3bff-424c-3df3-47ed-e74c34412813@huawei.com>
 <6114a65d-699c-72da-4f9a-dbb5e1c58fd4@foss.st.com>
From: "chenjiahao (C)" <chenjiahao16@huawei.com>
In-Reply-To: <6114a65d-699c-72da-4f9a-dbb5e1c58fd4@foss.st.com>
X-Originating-IP: [10.67.108.26]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
Subject: Re: [Linux-stm32] [PATCH -next] remoteproc: stm32: Clean up
 redundant dev_err_probe()
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

Ck9uIDIwMjMvOC8xNyAxNTowMiwgQXJuYXVkIFBPVUxJUVVFTiB3cm90ZToKPgo+IE9uIDgvMTcv
MjMgMDQ6MzMsIGNoZW5qaWFoYW8gKEMpIHdyb3RlOgo+PiBPbiAyMDIzLzgvMTYgMjA6NDYsIEFy
bmF1ZCBQT1VMSVFVRU4gd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiA4LzIvMjMgMTE6NTEsIENo
ZW4gSmlhaGFvIHdyb3RlOgo+Pj4+IFJlZmVycmluZyB0byBwbGF0Zm9ybV9nZXRfaXJxKCkncyBk
ZWZpbml0aW9uLCB0aGUgcmV0dXJuIHZhbHVlIGhhcwo+Pj4+IGFscmVhZHkgYmVlbiBjaGVja2Vk
IGlmIHJldCA8IDAsIGFuZCBwcmludGVkIHZpYSBkZXZfZXJyX3Byb2JlKCkuCj4+Pj4gQ2FsbGlu
ZyBkZXZfZXJyX3Byb2JlKCkgb25lIG1vcmUgdGltZSBvdXRzaWRlIHBsYXRmb3JtX2dldF9pcnEo
KQo+Pj4+IGlzIG9idmlvdXNseSByZWR1bmRhbnQuCj4+Pj4KPj4+PiBSZW1vdmluZyBkZXZfZXJy
X3Byb2JlKCkgb3V0c2lkZSBwbGF0Zm9ybV9nZXRfaXJxKCkgdG8gY2xlYW4gdXAKPj4+PiBhYm92
ZSBwcm9ibGVtLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBKaWFoYW8gPGNoZW5qaWFo
YW8xNkBodWF3ZWkuY29tPgo+Pj4+IC0tLQo+Pj4+ICDCoCBkcml2ZXJzL3JlbW90ZXByb2Mvc3Rt
MzJfcnByb2MuYyB8IDIgKy0KPj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZW1vdGVwcm9j
L3N0bTMyX3Jwcm9jLmMgYi9kcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnByb2MuYwo+Pj4+IGlu
ZGV4IDk4MjM0YjQ0ZjAzOC4uYTA5ZWViODNlYTVjIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMv
cmVtb3RlcHJvYy9zdG0zMl9ycHJvYy5jCj4+Pj4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL3N0
bTMyX3Jwcm9jLmMKPj4+PiBAQCAtNzE0LDcgKzcxNCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcnBy
b2NfcGFyc2VfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+Pj4+ICpwZGV2LAo+Pj4+ICDCoCDC
oMKgwqDCoMKgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4+Pj4gIMKgwqDCoMKg
wqAgaWYgKGlycSA9PSAtRVBST0JFX0RFRkVSKQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIGlycSwgImZhaWxlZCB0byBnZXQgaW50ZXJydXB0XG4iKTsKPj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGlycTsKPj4+IFRoZSBJUlEgaXMgb3B0aW9uYWwgc28g
dXNpbmcgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCBzZWVtcyBhIGJldHRlciBvcHRpb24KPj4+
IHRvIG1lLgo+Pj4KPj4+IC3CoMKgwqDCoMKgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwg
MCk7Cj4+PiArwqDCoMKgwqDCoCBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKHBkZXYs
IDApOwo+PiBIaSwKPj4KPj4gVGhhbmtzIGZvciB5b3VyIHJlbWluZGluZy4KPj4KPj4gSXQgc2Vl
bXMgdGhhdCBwbGF0Zm9ybV9nZXRfaXJxIGlzIG5vdGhpbmcgbW9yZSB0aGFuIHBsYXRmb3JtX2dl
dF9pcnFfb3B0aW9uYWwsCj4+IGV4Y2VwdCB3cmFwcGluZyBhIGRldl9lcnJfcHJvYmUgZm9yIGVy
cm9yIGNvZGUgY2hlY2tpbmcuIFNvIHVzaW5nIHRoZSBmb3JtZXIKPj4gb25lIHNob3VsZCBhbHNv
IGJlIE9LLgo+Pgo+PiBPciBoYXZlIEkgbWlzc2VkIGFueXdoZXJlIGVsc2U/Cj4gVGhlIG1haW4g
ZGlmZmVyZW5jZSBpcyB0aGF0IHBsYXRmb3JtX2dldF9pcnEgcHJpbnRzIGFuIGVycm9yIG1lc3Nh
Z2UsIHdoaWxlCj4gcGxhdGZvcm1fZ2V0X2lycSBqdXN0IHJldHVybnMgd2l0aG91dCBwcmludC4K
Pgo+Cj4gVGhlIElSUSBpcyBvcHRpb25hbCwgSXQgd291bGQgYmUgYmV0dGVyIHRvIG9ubHkgaW5j
bHVkZSB0cmFjZXMgdGhhdCBpcyBuZWNlc3NhcnkKPiBhbmQgdXNlZnVsIGZvciBkZWJ1Z2dpbmcg
cHVycG9zZXMuCgpNYWtlIHNlbnNlLiBJIHdpbGwgdXBkYXRlIGEgdjIgcGF0Y2ggc29vbi4KClRo
YW5rcwoKPgo+IEJlc3QgUmVnYXJkcywKPiBBcm5hdWQKPgo+Cj4+IEJlc3QgUmVnYXJkcywKPj4g
SmlhaGFvCj4+Cj4+Pj4gIMKgwqDCoMKgwqAgaWYgKGlycSA9PSAtRVBST0JFX0RFRkVSKQo+Pj4+
ICDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIGlycSwgImZhaWxlZCB0
byBnZXQgaW50ZXJydXB0XG4iKTsKPj4+IFRoYW5rcywKPj4+IEFybmF1ZAo+Pj4KPj4+PiAgwqAg
wqDCoMKgwqDCoCBpZiAoaXJxID4gMCkgewo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0g
ZGV2bV9yZXF1ZXN0X2lycShkZXYsIGlycSwgc3RtMzJfcnByb2Nfd2RnLCAwLApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
