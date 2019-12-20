Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2FC127A0F
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2019 12:36:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13B75C36B0C;
	Fri, 20 Dec 2019 11:36:20 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF515C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2019 11:36:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBKBaCQX082593;
 Fri, 20 Dec 2019 05:36:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576841772;
 bh=d8cyfo8OyAOfShKNXXpATI8DY9tGfXH5dt3KHImZgQo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hifFTbq4sjEBmMAUIuWwMNBNnNHRQNMbU0UdtVxaAT26c7HteBIB0mpHju8nnuYH2
 0B5jqJokNyHQVqX4YugMm6/fKRXQkLBPpp25VIIU/aME5FFpBBoJjCyFGeacy8SgH5
 YYplNFnVZ3cWCkO0A5I4xo5a30BYv5O6u2/QL2m0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBKBaBE3079658;
 Fri, 20 Dec 2019 05:36:11 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 20
 Dec 2019 05:36:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 20 Dec 2019 05:36:08 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBKBa64o011347;
 Fri, 20 Dec 2019 05:36:06 -0600
To: Fabrice Gasnier <fabrice.gasnier@st.com>, <lee.jones@linaro.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
References: <20191217105240.25648-1-peter.ujfalusi@ti.com>
 <a9184949-94e0-97fb-5fa8-77693e71e99a@st.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <bdfba9d1-d22b-fd55-2dce-1262017f1110@ti.com>
Date: Fri, 20 Dec 2019 13:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a9184949-94e0-97fb-5fa8-77693e71e99a@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: vkoul@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stm32-timers: Use dma_request_chan()
 instead dma_request_slave_channel()
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

SGkgRmFicmljZSwKCk9uIDIwLzEyLzIwMTkgMTAuNTQsIEZhYnJpY2UgR2FzbmllciB3cm90ZToK
PiBPbiAxMi8xNy8xOSAxMTo1MiBBTSwgUGV0ZXIgVWpmYWx1c2kgd3JvdGU6Cj4+IGRtYV9yZXF1
ZXN0X3NsYXZlX2NoYW5uZWwoKSBpcyBhIHdyYXBwZXIgb24gdG9wIG9mIGRtYV9yZXF1ZXN0X2No
YW4oKQo+PiBlYXRpbmcgdXAgdGhlIGVycm9yIGNvZGUuCj4+Cj4+IEJ5IHVzaW5nIGRtYV9yZXF1
ZXN0X2NoYW4oKSBkaXJlY3RseSB0aGUgZHJpdmVyIGNhbiBzdXBwb3J0IGRlZmVycmVkCj4+IHBy
b2JpbmcgYWdhaW5zdCBETUEuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFVqZmFsdXNpIDxw
ZXRlci51amZhbHVzaUB0aS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9tZmQvc3RtMzItdGltZXJz
LmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMjIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWZkL3N0bTMyLXRpbWVycy5jIGIvZHJpdmVycy9tZmQvc3RtMzItdGltZXJzLmMKPj4g
aW5kZXggZWZjZDRiOTgwYzk0Li4zNDc0N2U4YTRhNDAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bWZkL3N0bTMyLXRpbWVycy5jCj4+ICsrKyBiL2RyaXZlcnMvbWZkL3N0bTMyLXRpbWVycy5jCj4+
IEBAIC0xNjcsMTAgKzE2NywxMSBAQCBzdGF0aWMgdm9pZCBzdG0zMl90aW1lcnNfZ2V0X2Fycl9z
aXplKHN0cnVjdCBzdG0zMl90aW1lcnMgKmRkYXRhKQo+PiAgCXJlZ21hcF93cml0ZShkZGF0YS0+
cmVnbWFwLCBUSU1fQVJSLCAweDApOwo+PiAgfQo+PiAgCj4+IC1zdGF0aWMgdm9pZCBzdG0zMl90
aW1lcnNfZG1hX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gK3N0YXRpYyBpbnQgc3RtMzJf
dGltZXJzX2RtYV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ICAJCQkJICAgc3RydWN0IHN0
bTMyX3RpbWVycyAqZGRhdGEpCj4+ICB7Cj4+ICAJaW50IGk7Cj4+ICsJaW50IHJldCA9IDA7Cj4+
ICAJY2hhciBuYW1lWzRdOwo+PiAgCj4+ICAJaW5pdF9jb21wbGV0aW9uKCZkZGF0YS0+ZG1hLmNv
bXBsZXRpb24pOwo+PiBAQCAtMTc5LDE0ICsxODAsMjIgQEAgc3RhdGljIHZvaWQgc3RtMzJfdGlt
ZXJzX2RtYV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ICAJLyogT3B0aW9uYWwgRE1BIHN1
cHBvcnQ6IGdldCB2YWxpZCBETUEgY2hhbm5lbChzKSBvciBOVUxMICovCj4+ICAJZm9yIChpID0g
U1RNMzJfVElNRVJTX0RNQV9DSDE7IGkgPD0gU1RNMzJfVElNRVJTX0RNQV9DSDQ7IGkrKykgewo+
PiAgCQlzbnByaW50ZihuYW1lLCBBUlJBWV9TSVpFKG5hbWUpLCAiY2glMWQiLCBpICsgMSk7Cj4+
IC0JCWRkYXRhLT5kbWEuY2hhbnNbaV0gPSBkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKGRldiwg
bmFtZSk7Cj4+ICsJCWRkYXRhLT5kbWEuY2hhbnNbaV0gPSBkbWFfcmVxdWVzdF9jaGFuKGRldiwg
bmFtZSk7Cj4+ICAJfQo+PiAtCWRkYXRhLT5kbWEuY2hhbnNbU1RNMzJfVElNRVJTX0RNQV9VUF0g
PQo+PiAtCQlkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKGRldiwgInVwIik7Cj4+IC0JZGRhdGEt
PmRtYS5jaGFuc1tTVE0zMl9USU1FUlNfRE1BX1RSSUddID0KPj4gLQkJZG1hX3JlcXVlc3Rfc2xh
dmVfY2hhbm5lbChkZXYsICJ0cmlnIik7Cj4+IC0JZGRhdGEtPmRtYS5jaGFuc1tTVE0zMl9USU1F
UlNfRE1BX0NPTV0gPQo+PiAtCQlkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKGRldiwgImNvbSIp
Owo+PiArCWRkYXRhLT5kbWEuY2hhbnNbU1RNMzJfVElNRVJTX0RNQV9VUF0gPSBkbWFfcmVxdWVz
dF9jaGFuKGRldiwgInVwIik7Cj4+ICsJZGRhdGEtPmRtYS5jaGFuc1tTVE0zMl9USU1FUlNfRE1B
X1RSSUddID0gZG1hX3JlcXVlc3RfY2hhbihkZXYsICJ0cmlnIik7Cj4+ICsJZGRhdGEtPmRtYS5j
aGFuc1tTVE0zMl9USU1FUlNfRE1BX0NPTV0gPSBkbWFfcmVxdWVzdF9jaGFuKGRldiwgImNvbSIp
Owo+PiArCj4+ICsJZm9yIChpID0gU1RNMzJfVElNRVJTX0RNQV9DSDE7IGkgPCBTVE0zMl9USU1F
UlNfTUFYX0RNQVM7IGkrKykgewo+PiArCQlpZiAoSVNfRVJSKGRkYXRhLT5kbWEuY2hhbnNbaV0p
KSB7Cj4+ICsJCQlpZiAoUFRSX0VSUihkZGF0YS0+ZG1hLmNoYW5zW2ldKSA9PSAtRVBST0JFX0RF
RkVSKT4gKwkJCQlyZXQgPSAtRVBST0JFX0RFRkVSOwo+IAo+IEhpIFBldGVyLAo+IAo+IFRoYW5r
cyBmb3IgdGhlIHBhdGNoLAo+IAo+IEFzIHRoZSBETUEgaXMgb3B0aW9uYWwsIEknZCByYXRoZXIg
cHJlZmVyIHRvIGNoZWNrIGV4cGxpY2l0bHkgdGhlcmUncyBubwo+IGRldmljZSwgYW5kIHJldHVy
biBhbnkgb3RoZXIgZXJyb3IgY2FzZSwgYmFzaWNhbGx5Ogo+IAo+IAkJCWlmIChQVFJfRVJSKGRk
YXRhLT5kbWEuY2hhbnNbaV0pICE9IC1FTk9ERVYpCj4gCQkJCXJldHVybiBQVFJfRVJSKGRkYXRh
LT5kbWEuY2hhbnNbaV0pOwoKTXkgaW50ZW50aW9uIHdhcyB0byBzcGVjaWZpY2FsbHkgcGljayBh
bmQgaGFuZGxlIEVQUk9CRV9ERUZFUiB3aGlsZSBub3QKY2hhbmdpbmcgaG93IHRoZSBkcml2ZXIg
aGFuZGxlcyBvdGhlciBlcnJvcnMsIHdoZXRoZXIgaXQgYmVjYXVzZSB0aGVyZQppcyBubyBETUEg
Y2hhbm5lbCBzcGVjaWZpZWQgb3IgdGhlcmUgaXMgYSBmYWlsdXJlIHRvIGdldCB0aGUgY2hhbm5l
bC4KCkJ1dCBpZiB5b3UgcHJlZmVyIHRvIGlnbm9yZSBvbmx5IEVOT0RFViBhbmQgcmVwb3J0IG90
aGVyIGVycm9ycyB0aGVuIEkKY2FuIHNlbmQgdjIuCkl0IGNvdWxkIGV4cG9zZSBvdGhlcndpc2Ug
aWdub3JlZCBjb25maWd1cmF0aW9uIGVycm9yIChmcm9tIERUPykgYW5kIHRoZQpjaGFuZ2UgaW4g
dGhlIGRyaXZlciB3aWxsIGJlIGJsYW1lZCBmb3IgdGhlIHJlZ3Jlc3Npb24uCgpXb3VsZCBpdCBt
YWtlIHNlbnNlIHRvIGFkZCB0aGUgY2hhbmdlIHlvdSBzdWdnZXN0ZWQgYXMgYW4gaXRlcmF0aW9u
IG9uCnRvcCBvZiB0aGlzIHBhdGNoPwoKPiAKPj4gKwo+PiArCQkJZGRhdGEtPmRtYS5jaGFuc1tp
XSA9IE5VTEw7Cj4+ICsJCX0KPj4gKwl9Cj4+ICsKPj4gKwlyZXR1cm4gcmV0Owo+IAo+IFdpdGgg
dGhhdCwgcmV0dXJuIDAgaGVyZS4KPiAKPj4gIH0KPj4gIAo+PiAgc3RhdGljIHZvaWQgc3RtMzJf
dGltZXJzX2RtYV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2LAo+PiBAQCAtMjMwLDcgKzIzOSwx
MSBAQCBzdGF0aWMgaW50IHN0bTMyX3RpbWVyc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+PiAgCj4+ICAJc3RtMzJfdGltZXJzX2dldF9hcnJfc2l6ZShkZGF0YSk7Cj4+ICAK
Pj4gLQlzdG0zMl90aW1lcnNfZG1hX3Byb2JlKGRldiwgZGRhdGEpOwo+PiArCXJldCA9IHN0bTMy
X3RpbWVyc19kbWFfcHJvYmUoZGV2LCBkZGF0YSk7Cj4+ICsJaWYgKHJldCkgewo+PiArCQlzdG0z
Ml90aW1lcnNfZG1hX3JlbW92ZShkZXYsIGRkYXRhKTsKPiAKPiBXaXRoIHRoYXQsIHN0bTMyX3Rp
bWVyc19kbWFfcmVtb3ZlKCkgbGlrZWx5IG5lZWQgdG8gYmUgdXBkYXRlZDoKPiAKPiAtCQlpZiAo
ZGRhdGEtPmRtYS5jaGFuc1tpXSkKPiArCQlpZiAoIUlTX0VSUl9PUl9OVUxMKGRkYXRhLT5kbWEu
Y2hhbnNbaV0pKQo+IAkJCWRtYV9yZWxlYXNlX2NoYW5uZWwoZGRhdGEtPmRtYS5jaGFuc1tpXSk7
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IEZhYnJpY2UKPiAKPj4gKwkJcmV0dXJuIHJldDsKPj4gKwl9
Cj4+ICAKPj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkZGF0YSk7Cj4+ICAKPj4KCktp
bmQgcmVnYXJkcywKLSBQw6l0ZXIKClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtr
YWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUy
MS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
