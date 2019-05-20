Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A47632AF2D
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 09:07:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 648E3C5978C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 07:07:43 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFA38C06FAB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 09:21:55 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0EEAD27CBFAFCBE3E065;
 Mon, 20 May 2019 17:21:52 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.180) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 20 May 2019
 17:21:41 +0800
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-kernel@vger.kernel.org>
References: <20190520091315.27898-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <57ffbd01-2624-e7b4-bd27-d93cd49fbc9f@huawei.com>
Date: Mon, 20 May 2019 17:19:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190520091315.27898-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.177.19.180]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 27 May 2019 07:07:42 +0000
Cc: Hulk Robot <hulkci@huawei.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] hwtracing: stm: fix vfree()
	nonexistent vm_area
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

c29ycnksIHNlbmQgd3JvbmcgdmVyc2lvbizCoCBwbGVhc2UgaWdub3JlLgoKT24gMjAxOS81LzIw
IDE3OjEzLCBLZWZlbmcgV2FuZyB3cm90ZToKPiBJZiBkZXZpY2VfYWRkKCkgaW4gc3RtX3JlZ2lz
dGVyX2RldmljZSgpIGZhaWxzLCBzdG1fZGV2aWNlX3JlbGVhc2UoKQo+IGlzIGNhbGxlZCB0byBm
cmVlIHN0bSwgZnJlZSBzdG0gYWdhaW4gb24gZXJyX2RldmljZSBwYXRoIHdpbGwgdHJpZ2dlcgo+
IGZvbGxvd2luZyB3YXJuaW5nLAo+Cj4gICBUcnlpbmcgdG8gdmZyZWUoKSBub25leGlzdGVudCB2
bSBhcmVhICgwMDAwMDAwMDU0YjVlN2JjKQo+ICAgV0FSTklORzogQ1BVOiAwIFBJRDogNjAwNCBh
dCBtbS92bWFsbG9jLmM6MTU5NSBfX3Z1bm1hcCsweDcyLzB4NDgwIG1tL3ZtYWxsb2MuYzoxNTk0
Cj4gICBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogcGFuaWNfb25fd2FybiBzZXQgLi4uCj4g
ICBDUFU6IDAgUElEOiA2MDA0IENvbW06IHN5ei1leGVjdXRvci4wIFRhaW50ZWQ6IEcgICAgICAg
ICBDIDUuMS4wKyAjMjgKPiAgIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBG
WCArIFBJSVgsIDE5OTYpLCBCSU9TIDEuMTAuMi0xdWJ1bnR1MSAwNC8wMS8yMDE0Cj4gICBDYWxs
IFRyYWNlOgo+ICAgIF9fdmZyZWUrMHgyYS8weDgwIG1tL3ZtYWxsb2MuYzoxNjU4Cj4gICAgX3Zm
cmVlKzB4NDkvMHg3MCBtbS92bWFsbG9jLmM6MTY4OAo+ICAgIHN0bV9yZWdpc3Rlcl9kZXZpY2Ur
MHgyOTUvMHgzMzAgW3N0bV9jb3JlXQo+ICAgIGR1bW15X3N0bV9pbml0KzB4ZmUvMHgxZTAgW2R1
bW15X3N0bV0KPiAgICBkb19vbmVfaW5pdGNhbGwrMHhiOS8weDNiNSBpbml0L21haW4uYzo5MTQK
PiAgICBkb19pbml0X21vZHVsZSsweGUwLzB4MzMwIGtlcm5lbC9tb2R1bGUuYzozNDY4Cj4gICAg
bG9hZF9tb2R1bGUrMHgzOGViLzB4NDI3MCBrZXJuZWwvbW9kdWxlLmM6MzgxOQo+ICAgIF9fZG9f
c3lzX2Zpbml0X21vZHVsZSsweDE2Mi8weDE5MCBrZXJuZWwvbW9kdWxlLmM6MzkwOQo+ICAgIGRv
X3N5c2NhbGxfNjQrMHg3Mi8weDJhMCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzoyOTgKPiAgICBl
bnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0OS8weGJlCj4KPiBPbmx5IGZyZWUgc3Rt
IG9uY2UgaWYgZGV2aWNlX2FkZCgpIGZhaWxzIHRvIGZpeCBpdC4KPgo+IFJlcG9ydGVkLWJ5OiBI
dWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2Fu
ZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaHd0cmFjaW5n
L3N0bS9jb3JlLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb3Jl
LmMgYi9kcml2ZXJzL2h3dHJhY2luZy9zdG0vY29yZS5jCj4gaW5kZXggZTU1YjkwMjU2MGRlLi43
YjJhYjdiMmNjNGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvc3RtL2NvcmUuYwo+
ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb3JlLmMKPiBAQCAtODY0LDYgKzg2NCw3IEBA
IHN0YXRpYyB2b2lkIHN0bV9kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAlz
dHJ1Y3Qgc3RtX2RldmljZSAqc3RtID0gdG9fc3RtX2RldmljZShkZXYpOwo+ICAKPiAgCXZmcmVl
KHN0bSk7Cj4gKwlzdG0tPmRhdGEtPnN0bSA9IE5VTEw7Cj4gIH0KPiAgCj4gIGludCBzdG1fcmVn
aXN0ZXJfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgc3RydWN0IHN0bV9kYXRhICpzdG1f
ZGF0YSwKPiBAQCAtOTMzLDcgKzkzNCw4IEBAIGludCBzdG1fcmVnaXN0ZXJfZGV2aWNlKHN0cnVj
dCBkZXZpY2UgKnBhcmVudCwgc3RydWN0IHN0bV9kYXRhICpzdG1fZGF0YSwKPiAgCS8qIG1hdGNo
ZXMgZGV2aWNlX2luaXRpYWxpemUoKSBhYm92ZSAqLwo+ICAJcHV0X2RldmljZSgmc3RtLT5kZXYp
Owo+ICBlcnJfZnJlZToKPiAtCXZmcmVlKHN0bSk7Cj4gKwlpZiAoc3RtLT5kYXRhLT5zdG0pCj4g
KwkJdmZyZWUoc3RtKTsKPiAgCj4gIAlyZXR1cm4gZXJyOwo+ICB9CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
