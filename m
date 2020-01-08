Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06293133C90
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2020 09:03:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2844C36B0B;
	Wed,  8 Jan 2020 08:03:55 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA350C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 08:03:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00883lPd117939;
 Wed, 8 Jan 2020 02:03:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578470627;
 bh=e7cuocncCbuxjywazcX7HKTb/Mw4T5KMNhkOUHettWc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nu7E+puxSqcLXcZZxc2CNxBQS58QZpLRQGpsElGO+SspowlPonvmYOddgUHYoVo+y
 Bq3ABNJIPEyu6k5jzK+YJL+MC5bk2neg4ERCXDu1OqdndapvLKha4RF2IKj4gY4W8J
 +vVEQRS7VIdllGZsU13DRAuLCMmQj7hHHp1Ocskw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00883lBA104600
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 Jan 2020 02:03:47 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 02:03:46 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 02:03:46 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00883i5s040553;
 Wed, 8 Jan 2020 02:03:44 -0600
To: Fabrice Gasnier <fabrice.gasnier@st.com>, <jic23@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
References: <20200107114125.6095-1-peter.ujfalusi@ti.com>
 <5146b085-d92d-7230-9a05-87926711dafa@st.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <8e706545-958d-1c34-9d6d-addd4cb6af25@ti.com>
Date: Wed, 8 Jan 2020 10:04:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5146b085-d92d-7230-9a05-87926711dafa@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: Use
 dma_request_chan() instead dma_request_slave_channel()
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

SGkgRmFicmljZSwKCk9uIDA3LzAxLzIwMjAgMTkuMTUsIEZhYnJpY2UgR2FzbmllciB3cm90ZToK
PiBPbiAxLzcvMjAgMTI6NDEgUE0sIFBldGVyIFVqZmFsdXNpIHdyb3RlOgo+PiBkbWFfcmVxdWVz
dF9zbGF2ZV9jaGFubmVsKCkgaXMgYSB3cmFwcGVyIG9uIHRvcCBvZiBkbWFfcmVxdWVzdF9jaGFu
KCkKPj4gZWF0aW5nIHVwIHRoZSBlcnJvciBjb2RlLgo+Pgo+PiBCeSB1c2luZyBkbWFfcmVxdWVz
dF9jaGFuKCkgZGlyZWN0bHkgdGhlIGRyaXZlciBjYW4gc3VwcG9ydCBkZWZlcnJlZAo+PiBwcm9i
aW5nIGFnYWluc3QgRE1BLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBVamZhbHVzaSA8cGV0
ZXIudWpmYWx1c2lAdGkuY29tPgo+PiAtLS0KPj4gSGksCj4+Cj4+IENoYW5nZXMgc2luY2UgdjE6
Cj4+IC0gRmFsbCBiYWNrIHRvIElSUSBtb2RlIG9ubHkgaW4gY2FzZSBvZiBFTk9ERVYKPj4KPj4g
UmVnYXJkcywKPj4gUGV0ZXIKPiAKPiBIaSBQZXRlciwKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRj
aCwKPiAKPiBJbiBjYXNlIHlvdSBzZW5kIGFub3RoZXIgdmVyc2lvbi4uLiBJJ3ZlIGp1c3QgYSBt
aW5vciBzdWdnZXN0aW9uCj4gcmVnYXJkaW5nIHRoZSBjb21tZW50IChzZWUgYWZ0ZXIpLiBBcGFy
dCBmcm9tIHRoYXQsIHlvdSBjYW4gYWRkIG15OgoKVGhhbmtzLCBJJ2xsIHRha2UgeW91ciBzdWdn
ZXN0ZWQgdXBkYXRlIGFuZCBzZW5kIHYzLgoKPiBBY2tlZC1ieTogRmFicmljZSBHYXNuaWVyIDxm
YWJyaWNlLmdhc25pZXJAc3QuY29tPgo+IAo+IEJlc3QgUmVnYXJkcywKPiBGYWJyaWNlCj4gCj4+
Cj4+ICBkcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMgfCAxNiArKysrKysrKysrKysrKy0tCj4+
ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMuYyBiL2RyaXZlcnMvaWlvL2Fk
Yy9zdG0zMi1hZGMuYwo+PiBpbmRleCAzYjI5MWQ3MjcwMWMuLmRmNWY1ZDYxZjlmOSAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy5jCj4+ICsrKyBiL2RyaXZlcnMvaWlv
L2FkYy9zdG0zMi1hZGMuYwo+PiBAQCAtMTc0Niw5ICsxNzQ2LDIxIEBAIHN0YXRpYyBpbnQgc3Rt
MzJfYWRjX2RtYV9yZXF1ZXN0KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCj4+ICAJc3RydWN0
IGRtYV9zbGF2ZV9jb25maWcgY29uZmlnOwo+PiAgCWludCByZXQ7Cj4+ICAKPj4gLQlhZGMtPmRt
YV9jaGFuID0gZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCgmaW5kaW9fZGV2LT5kZXYsICJyeCIp
Owo+PiAtCWlmICghYWRjLT5kbWFfY2hhbikKPj4gKwlhZGMtPmRtYV9jaGFuID0gZG1hX3JlcXVl
c3RfY2hhbigmaW5kaW9fZGV2LT5kZXYsICJyeCIpOwo+PiArCWlmIChJU19FUlIoYWRjLT5kbWFf
Y2hhbikpIHsKPj4gKwkJcmV0ID0gUFRSX0VSUihhZGMtPmRtYV9jaGFuKTsKPj4gKwkJaWYgKHJl
dCAhPSAtRU5PREVWKSB7Cj4+ICsJCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCj4+ICsJCQkJ
ZGV2X2VycigmaW5kaW9fZGV2LT5kZXYsCj4+ICsJCQkJCSJETUEgY2hhbm5lbCByZXF1ZXN0IGZh
aWxlZCB3aXRoICVkXG4iLAo+PiArCQkJCQlyZXQpOwo+PiArCQkJcmV0dXJuIHJldDsKPj4gKwkJ
fQo+PiArCj4+ICsJCS8qIElnbm9yZSBlcnJvcnMgdG8gZmFsbCBiYWNrIHRvIElSUSBtb2RlICov
Cj4gCQkgICAgICAgICAgICAgICBeCj4gCQkgICAgICAgICAgZXJyb3IKPiBhbHRlcm5hdGUgc3Vn
Z2VzdGlvbjoKPiAJCS8qIERNQSBpcyBvcHRpb25hbDogZmFsbCBiYWNrIHRvIElSUSBtb2RlICov
CgpNYWtlcyBtb3JlIHNlbnNlIGluIHRoZSBjb250ZXh0LgoKPiAKPj4gKwkJYWRjLT5kbWFfY2hh
biA9IE5VTEw7Cj4+ICAJCXJldHVybiAwOwo+PiArCX0KPj4gIAo+PiAgCWFkYy0+cnhfYnVmID0g
ZG1hX2FsbG9jX2NvaGVyZW50KGFkYy0+ZG1hX2NoYW4tPmRldmljZS0+ZGV2LAo+PiAgCQkJCQkg
U1RNMzJfRE1BX0JVRkZFUl9TSVpFLAo+PgoKLSBQw6l0ZXIKClRleGFzIEluc3RydW1lbnRzIEZp
bmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNp
bmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
