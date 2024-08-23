Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4BB95C558
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 08:23:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40E32C71287;
	Fri, 23 Aug 2024 06:23:10 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DFF8C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 06:23:02 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wqqjk4t4CzyQQ8;
 Fri, 23 Aug 2024 14:22:18 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 4EBDD140137;
 Fri, 23 Aug 2024 14:23:00 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 23 Aug 2024 14:22:59 +0800
Message-ID: <765ccc96-a48c-8a7a-ebf4-344fec67d95f@huawei.com>
Date: Fri, 23 Aug 2024 14:22:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20240820123707.1788370-1-ruanjinjie@huawei.com>
 <ZsdR-G9S5nYbQX4s@finisterre.sirena.org.uk>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ZsdR-G9S5nYbQX4s@finisterre.sirena.org.uk>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] spi: stm32-qspi: Simpify resource
	lookup
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

CgpPbiAyMDI0LzgvMjIgMjI6NTgsIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gVHVlLCBBdWcgMjAs
IDIwMjQgYXQgMDg6Mzc6MDdQTSArMDgwMCwgSmluamllIFJ1YW4gd3JvdGU6Cj4+IFVzZSB0aGUg
ZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZSgpIGhlbHBlciBpbnN0ZWFkIG9m
Cj4+IGNhbGxpbmcgcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZSgpIGFuZCBkZXZtX2lvcmVt
YXBfcmVzb3VyY2UoKQo+PiBzZXBhcmF0ZWx5Lgo+IAo+IFRoaXMgYnJlYWtzIGJvb3Qgb24gdGhl
IEF2ZW5nZXI5NiBib2FyZCwgaXQgY2F1c2VzIGEgTlVMTCBwb2ludGVyCj4gZGVyZWZlcmVuY2U6
Cj4gCj4gWyAgICAyLjM1MDQ4MF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMCB3aGVuIHJlYWQKPiAKPiAu
Li4KPiAKPiBbICAgIDIuNjk1Nzg3XSBDYWxsIHRyYWNlOgo+IFsgICAgMi42OTU4MDddICBzdG0z
Ml9xc3BpX3Byb2JlIGZyb20gcGxhdGZvcm1fcHJvYmUrMHg1Yy8weGIwCj4gWyAgICAyLjcwMzkx
NF0gIHBsYXRmb3JtX3Byb2JlIGZyb20gcmVhbGx5X3Byb2JlKzB4YzgvMHgyYzgKPiBbICAgIDIu
NzA5Mjg0XSAgcmVhbGx5X3Byb2JlIGZyb20gX19kcml2ZXJfcHJvYmVfZGV2aWNlKzB4ODgvMHgx
OWMKPiBbICAgIDIuNzE1MTQ1XSAgX19kcml2ZXJfcHJvYmVfZGV2aWNlIGZyb20gZHJpdmVyX3By
b2JlX2RldmljZSsweDMwLzB4MTA0Cj4gCj4gaHR0cHM6Ly9sYXZhLnNpcmVuYS5vcmcudWsvc2No
ZWR1bGVyL2pvYi82NTA3OTIKPiAKPj4gLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnlu
YW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAicXNwaSIpOwo+PiAtCXFzcGktPmlvX2Jhc2UgPSBk
ZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOwo+PiArCXFzcGktPmlvX2Jhc2UgPSBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsICJxc3BpIik7Cj4+ICAJaWYg
KElTX0VSUihxc3BpLT5pb19iYXNlKSkKPj4gIAkJcmV0dXJuIFBUUl9FUlIocXNwaS0+aW9fYmFz
ZSk7Cj4+ICAKPj4gIAlxc3BpLT5waHlzX2Jhc2UgPSByZXMtPnN0YXJ0Owo+PiAgCj4+IC0JcmVz
ID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgInFz
cGlfbW0iKTsKPj4gLQlxc3BpLT5tbV9iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwg
cmVzKTsKPj4gKwlxc3BpLT5tbV9iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNl
X2J5bmFtZShwZGV2LCAicXNwaV9tbSIpOwo+PiAgCWlmIChJU19FUlIocXNwaS0+bW1fYmFzZSkp
Cj4+ICAJCXJldHVybiBQVFJfRVJSKHFzcGktPm1tX2Jhc2UpOwo+IAo+IEkgY2FuJ3QgaWRlbnRp
ZnkgYW55IG9idmlvdXMgZXJyb3IgaGVyZSwgdGhlc2UgbG9vayBsaWtlIGEgZGlyZWN0Cj4gc3Vi
c2l0dXRpb24gLSB0aGUgaW1wbGVtZW50YXRpb24gb2YgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jl
c291cmNlX2J5bmFtZSgpCj4gbG9va3MgdG8gYmUgdGhlIHNhbWUgYXMgdGhlIHJlcGxhY2VkIGNv
ZGUgYW5kIGRldiBpcyBzZXQgdG8gJnBkZXYtPmRldgo+IGJ1dCBJJ20gc2VlaW5nIHRoZSBhYm92
ZSBiZWhhdmlvdXIuCgpTb3JyeSwgZnJvbSBsa3BAaW50ZWwuY29t77yMSSBpZGVudGlmeSB0aGF0
IHRoZSAicmVzIiByZXR1cm5lZCBieQpwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKCkgaXMg
dXNlZCBieSAicXNwaS0+cGh5c19iYXNlID0KcmVzLT5zdGFydDsiIGxhdGVy77yMc28gdGhlIGRl
dm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUoKSBpcyBub3QKaW5hcHBsaWNhYmxl
IGhlcmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
