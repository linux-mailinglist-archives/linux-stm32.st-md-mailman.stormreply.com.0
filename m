Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 563F277F0D5
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 09:02:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C4B4C6B475;
	Thu, 17 Aug 2023 07:02:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3D8AC6B45F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 07:02:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37H2xhQf011907; Thu, 17 Aug 2023 09:02:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=mcOlTFofgoUpQNGHoCKfDBf2Ru3FFC1zH+ZUKjGlA6A=; b=hM
 KsVp5Krkb/6dnnHZ9iuYC2vKYzsumx5CgJGwzdfUVmqGqxLAXFfngMmazMZhgQ1w
 FL8vPTtss/2tbi2mukKci5K/YmUDZk8+QC71B5upKmpaSeOqSOqRtAS6Ixod43lW
 oFhR3caLalYVFCdbtajxcpj1BfzhqHS2y0BpejxYSWVlqYcTFwLq9iuJ2bDAVZCR
 X2upioNGz+fi8KDrG5wkkM7vmg2yaPpo6OBHUBAP6GTDQ3BmkjIy4eEVTNIHb/wE
 KFjysTXEFKItTmEbr/gJYwhGbojtmu6tx+wgBIlbSLn8trANlYxHNfLr5SibPEwT
 iBmrKf2zzXGM/Znm8+7g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3shb8p1251-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Aug 2023 09:02:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60039100053;
 Thu, 17 Aug 2023 09:02:19 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57C732105BB;
 Thu, 17 Aug 2023 09:02:19 +0200 (CEST)
Received: from [10.201.22.206] (10.201.22.206) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 17 Aug
 2023 09:02:18 +0200
Message-ID: <6114a65d-699c-72da-4f9a-dbb5e1c58fd4@foss.st.com>
Date: Thu, 17 Aug 2023 09:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "chenjiahao (C)" <chenjiahao16@huawei.com>, <andersson@kernel.org>,
 <mathieu.poirier@linaro.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <linux-remoteproc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20230802095128.995428-1-chenjiahao16@huawei.com>
 <15e381f6-aabd-8a3a-7911-4e64828b0fdc@foss.st.com>
 <97ed3bff-424c-3df3-47ed-e74c34412813@huawei.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <97ed3bff-424c-3df3-47ed-e74c34412813@huawei.com>
X-Originating-IP: [10.201.22.206]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_03,2023-08-15_02,2023-05-22_02
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA4LzE3LzIzIDA0OjMzLCBjaGVuamlhaGFvIChDKSB3cm90ZToKPiAKPiBPbiAyMDIzLzgv
MTYgMjA6NDYsIEFybmF1ZCBQT1VMSVFVRU4gd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiA4LzIvMjMg
MTE6NTEsIENoZW4gSmlhaGFvIHdyb3RlOgo+Pj4gUmVmZXJyaW5nIHRvIHBsYXRmb3JtX2dldF9p
cnEoKSdzIGRlZmluaXRpb24sIHRoZSByZXR1cm4gdmFsdWUgaGFzCj4+PiBhbHJlYWR5IGJlZW4g
Y2hlY2tlZCBpZiByZXQgPCAwLCBhbmQgcHJpbnRlZCB2aWEgZGV2X2Vycl9wcm9iZSgpLgo+Pj4g
Q2FsbGluZyBkZXZfZXJyX3Byb2JlKCkgb25lIG1vcmUgdGltZSBvdXRzaWRlIHBsYXRmb3JtX2dl
dF9pcnEoKQo+Pj4gaXMgb2J2aW91c2x5IHJlZHVuZGFudC4KPj4+Cj4+PiBSZW1vdmluZyBkZXZf
ZXJyX3Byb2JlKCkgb3V0c2lkZSBwbGF0Zm9ybV9nZXRfaXJxKCkgdG8gY2xlYW4gdXAKPj4+IGFi
b3ZlIHByb2JsZW0uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBKaWFoYW8gPGNoZW5qaWFo
YW8xNkBodWF3ZWkuY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJf
cnByb2MuYyB8IDIgKy0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJf
cnByb2MuYyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9zdG0zMl9ycHJvYy5jCj4+PiBpbmRleCA5ODIz
NGI0NGYwMzguLmEwOWVlYjgzZWE1YyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvcmVtb3RlcHJv
Yy9zdG0zMl9ycHJvYy5jCj4+PiArKysgYi9kcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnByb2Mu
Ywo+Pj4gQEAgLTcxNCw3ICs3MTQsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3Jwcm9jX3BhcnNlX2R0
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPj4+ICpwZGV2LAo+Pj4gwqAgwqDCoMKgwqDCoCBpcnEg
PSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+Pj4gwqDCoMKgwqDCoCBpZiAoaXJxID09IC1F
UFJPQkVfREVGRVIpCj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBpcnEsICJmYWlsZWQgdG8gZ2V0IGludGVycnVwdFxuIik7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIGlycTsKPj4gVGhlIElSUSBpcyBvcHRpb25hbCBzbyB1c2luZyBwbGF0Zm9ybV9nZXRf
aXJxX29wdGlvbmFsIHNlZW1zIGEgYmV0dGVyIG9wdGlvbgo+PiB0byBtZS4KPj4KPj4gLcKgwqDC
oMKgwqAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPj4gK8KgwqDCoMKgwqAgaXJx
ID0gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbChwZGV2LCAwKTsKPiAKPiBIaSwKPiAKPiBUaGFu
a3MgZm9yIHlvdXIgcmVtaW5kaW5nLgo+IAo+IEl0IHNlZW1zIHRoYXQgcGxhdGZvcm1fZ2V0X2ly
cSBpcyBub3RoaW5nIG1vcmUgdGhhbiBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsLAo+IGV4Y2Vw
dCB3cmFwcGluZyBhIGRldl9lcnJfcHJvYmUgZm9yIGVycm9yIGNvZGUgY2hlY2tpbmcuIFNvIHVz
aW5nIHRoZSBmb3JtZXIKPiBvbmUgc2hvdWxkIGFsc28gYmUgT0suCj4gCj4gT3IgaGF2ZSBJIG1p
c3NlZCBhbnl3aGVyZSBlbHNlPwoKVGhlIG1haW4gZGlmZmVyZW5jZSBpcyB0aGF0IHBsYXRmb3Jt
X2dldF9pcnEgcHJpbnRzIGFuIGVycm9yIG1lc3NhZ2UsIHdoaWxlCnBsYXRmb3JtX2dldF9pcnEg
anVzdCByZXR1cm5zIHdpdGhvdXQgcHJpbnQuCgoKVGhlIElSUSBpcyBvcHRpb25hbCwgSXQgd291
bGQgYmUgYmV0dGVyIHRvIG9ubHkgaW5jbHVkZSB0cmFjZXMgdGhhdCBpcyBuZWNlc3NhcnkKYW5k
IHVzZWZ1bCBmb3IgZGVidWdnaW5nIHB1cnBvc2VzLgoKQmVzdCBSZWdhcmRzLApBcm5hdWQKCgo+
IAo+IEJlc3QgUmVnYXJkcywKPiBKaWFoYW8KPiAKPj4+IMKgwqDCoMKgwqAgaWYgKGlycSA9PSAt
RVBST0JFX0RFRkVSKQo+Pj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBpcnEsICJmYWlsZWQgdG8gZ2V0IGludGVycnVwdFxuIik7Cj4+IFRoYW5rcywKPj4gQXJuYXVk
Cj4+Cj4+PiDCoCDCoMKgwqDCoMKgIGlmIChpcnEgPiAwKSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgZXJyID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGlycSwgc3RtMzJfcnByb2Nfd2RnLCAwLApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
