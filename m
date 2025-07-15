Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C844B14879
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF6AC3F932;
	Tue, 29 Jul 2025 06:48:55 +0000 (UTC)
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net
 (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 484C0C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 10:10:04 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 15 Jul 2025 18:09:35 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 15 Jul 2025 18:09:35 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <1b975a3e-ae1c-4354-90db-1f8d7ff567d3@kernel.org>
References: <20250528041455.878-1-weishangjuan@eswincomputing.com>
 <20250528041634.912-1-weishangjuan@eswincomputing.com>
 <1b975a3e-ae1c-4354-90db-1f8d7ff567d3@kernel.org>
MIME-Version: 1.0
Message-ID: <2e8343eb.34d0.1980d8fa817.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgA3WxHfKHZon0WwAA--.12412W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEEDGh1MO8oigAAso
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com, 0x1207@gmail.com,
 kuba@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, inochiama@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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

RGVhcsKgS3J6eXN6dG9mIEtvemxvd3NraSwKClRoYW5rIHlvdSBmb3IgeW91ciBwcm9mZXNzaW9u
YWwgYW5kIHZhbHVhYmxlIHN1Z2dlc3Rpb25zLgpPdXIgcXVlc3Rpb24gaXMgZW1iZWRkZWQgYmVs
b3cgeW91ciBjb21tZW50LgoKQmVzdCByZWdhcmRzLAoKCkxpIFpoaQpFc3dpbiBDb21wdXRpbmcK
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzJdIGV0aGVybmV0OiBlc3dpbjogQWRkIGVpYzc3
MDAgZXRoZXJuZXQgZHJpdmVyCj4gRGF0ZTogVGh1LCAzIEp1bCAyMDI1IDExOjUzOjMzICswMjAw
CVt0aHJlYWQgb3ZlcnZpZXddCj4gTWVzc2FnZS1JRDogPGYwOTZhZmExLTI2MGUtNGY4Yy04NTk1
LTNiNDE0MjViMjk2NEBrZXJuZWwub3JnPiAocmF3KQo+IEluLVJlcGx5LVRvOiA8MjAyNTA3MDMw
OTIwMTUuMTIwMC0xLXdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gT24gMDMvMDcv
MjAyNSAxMToyMCwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+ICsJ
cmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgocGRldi0+ZGV2Lm9mX25vZGUsICJlc3dp
bixzeXNjcmdfY3NyIiwgMSwKPiA+ICsJCQkJCSAmaHNwX2FjbGtfY3RybF9vZmZzZXQpOwo+ID4g
KwlpZiAocmV0KQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LCAi
Y2FuJ3QgZ2V0IGhzcF9hY2xrX2N0cmxfb2Zmc2V0XG4iKTsKPiA+ICsKPiA+ICsJcmVnbWFwX3Jl
YWQoZHdjX3ByaXYtPmNyZ19yZWdtYXAsIGhzcF9hY2xrX2N0cmxfb2Zmc2V0LCAmaHNwX2FjbGtf
Y3RybF9yZWdzZXQpOwo+ID4gKwloc3BfYWNsa19jdHJsX3JlZ3NldCB8PSAoRUlDNzcwMF9IU1Bf
QUNMS19DTEtFTiB8IEVJQzc3MDBfSFNQX0FDTEtfRElWU09SKTsKPiA+ICsJcmVnbWFwX3dyaXRl
KGR3Y19wcml2LT5jcmdfcmVnbWFwLCBoc3BfYWNsa19jdHJsX29mZnNldCwgaHNwX2FjbGtfY3Ry
bF9yZWdzZXQpOwo+ID4gKwo+ID4gPiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4
KHBkZXYtPmRldi5vZl9ub2RlLCAiZXN3aW4sc3lzY3JnX2NzciIsIDIsCj4gPiArCQkJCQkgJmhz
cF9jZmdfY3RybF9vZmZzZXQpOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiY2FuJ3QgZ2V0IGhzcF9jZmdfY3RybF9vZmZzZXRcbiIp
Owo+ID4gKwo+ID4gKwlyZWdtYXBfd3JpdGUoZHdjX3ByaXYtPmNyZ19yZWdtYXAsIGhzcF9jZmdf
Y3RybF9vZmZzZXQsIEVJQzc3MDBfSFNQX0NGR19DVFJMX1JFR1NFVCk7Cj4gPiArCj4gPiArCWR3
Y19wcml2LT5oc3BfcmVnbWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShwZGV2
LT5kZXYub2Zfbm9kZSwKPiA+ICsJCQkJCQkJICAgICAgICJlc3dpbixoc3Bfc3BfY3NyIik7Cj4g
Cj4gVGhlcmUgaXMgbm8gc3VjaCBwcm9wZXJ0eS4gSSBhbHJlYWR5IHNhaWQgYXQgdjIgeW91IGNh
bm5vdCBoYXZlCj4gdW5kb2N1bWVudGVkIEFCSS4KPiAKClRoZSBwcm9wZXJ0aWVzIGluIHRoZSBZ
QU1MIGZpbGUgdXNlIGRhc2hlcywgd2hpbGUgdGhlIGRyaXZlciB1c2VzIHVuZGVyc2NvcmVzLCBy
ZXN1bHRpbmcgaW4gYW4gaW5jb25zaXN0ZW5jeS4gVGhpcyB3aWxsIGJlIGNvcnJlY3RlZCBpbiB0
aGUgbmV4dCBwYXRjaC4gSXMgdGhpcyBjb3JyZWN0PwoKPiA+ICsJaWYgKElTX0VSUihkd2NfcHJp
di0+aHNwX3JlZ21hcCkpCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQ
VFJfRVJSKGR3Y19wcml2LT5oc3BfcmVnbWFwKSwKPiA+ICsJCQkJIkZhaWxlZCB0byBnZXQgaHNw
X3NwX2NzciByZWdtYXBcbiIpOwo+ID4gKwo+ID4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3Uz
Ml9pbmRleChwZGV2LT5kZXYub2Zfbm9kZSwgImVzd2luLGhzcF9zcF9jc3IiLCAyLAo+IAo+IE5B
Swo+IAo+ID4gKwkJCQkJICZldGhfcGh5X2N0cmxfb2Zmc2V0KTsKPiA+ICsJaWYgKHJldCkKPiA+
ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgImNhbid0IGdldCBldGhf
cGh5X2N0cmxfb2Zmc2V0XG4iKTsKPiA+ICsKPiA+ICsJcmVnbWFwX3JlYWQoZHdjX3ByaXYtPmhz
cF9yZWdtYXAsIGV0aF9waHlfY3RybF9vZmZzZXQsICZldGhfcGh5X2N0cmxfcmVnc2V0KTsKPiA+
ICsJZXRoX3BoeV9jdHJsX3JlZ3NldCB8PSAoRUlDNzcwMF9FVEhfVFhfQ0xLX1NFTCB8IEVJQzc3
MDBfRVRIX1BIWV9JTlRGX1NFTEkpOwo+ID4gKwlyZWdtYXBfd3JpdGUoZHdjX3ByaXYtPmhzcF9y
ZWdtYXAsIGV0aF9waHlfY3RybF9vZmZzZXQsIGV0aF9waHlfY3RybF9yZWdzZXQpOwo+ID4gKwo+
ID4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChwZGV2LT5kZXYub2Zfbm9kZSwg
ImVzd2luLGhzcF9zcF9jc3IiLCAzLAo+ID4gKwkJCQkJICZldGhfYXhpX2xwX2N0cmxfb2Zmc2V0
KTsKPiA+ICsJaWYgKHJldCkKPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYs
IHJldCwgImNhbid0IGdldCBldGhfYXhpX2xwX2N0cmxfb2Zmc2V0XG4iKTsKPiA+ICsKPiA+ICsJ
cmVnbWFwX3dyaXRlKGR3Y19wcml2LT5oc3BfcmVnbWFwLCBldGhfYXhpX2xwX2N0cmxfb2Zmc2V0
LCBFSUM3NzAwX0VUSF9DU1lTUkVRX1ZBTCk7Cj4gPiArCj4gPiArCXBsYXRfZGF0LT5jbGtfdHhf
aSA9IGRldm1fY2xrX2dldF9lbmFibGVkKCZwZGV2LT5kZXYsICJ0eCIpOwo+ID4gKwlpZiAoSVNf
RVJSKHBsYXRfZGF0LT5jbGtfdHhfaSkpCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRl
di0+ZGV2LCBQVFJfRVJSKHBsYXRfZGF0LT5jbGtfdHhfaSksCj4gPiArCQkJCSJlcnJvciBnZXR0
aW5nIHR4IGNsb2NrXG4iKTsKPiA+ICsKPiA+ICsJcGxhdF9kYXQtPmZpeF9tYWNfc3BlZWQgPSBl
aWM3NzAwX3Fvc19maXhfc3BlZWQ7Cj4gPiArCXBsYXRfZGF0LT5zZXRfY2xrX3R4X3JhdGUgPSBz
dG1tYWNfc2V0X2Nsa190eF9yYXRlOwo+ID4gKwlwbGF0X2RhdC0+YnNwX3ByaXYgPSBkd2NfcHJp
djsKPiA+ICsKPiA+ICsJcmV0ID0gc3RtbWFjX2R2cl9wcm9iZSgmcGRldi0+ZGV2LCBwbGF0X2Rh
dCwgJnN0bW1hY19yZXMpOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJv
YmUoJnBkZXYtPmRldiwgcmV0LCAiRmFpbGVkIHRvIGRyaXZlciBwcm9iZVxuIik7Cj4gPiArCj4g
PiArCXJldHVybiByZXQ7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIGVpYzc3MDBfZHdtYWNfbWF0Y2hbXSA9IHsKPiA+ICsJeyAuY29tcGF0aWJsZSA9
ICJlc3dpbixlaWM3NzAwLXFvcy1ldGgiIH0sCj4gPiArCXsgfQo+ID4gK307Cj4gPiArTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgZWljNzcwMF9kd21hY19tYXRjaCk7Cj4gPiArCj4gPiArc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZWljNzcwMF9kd21hY19kcml2ZXIgPSB7Cj4gKwkucHJv
YmUgID0gZWljNzcwMF9kd21hY19wcm9iZSwKPiArCS5yZW1vdmUgPSBzdG1tYWNfcGx0ZnJfcmVt
b3ZlLAo+ICsJLmRyaXZlciA9IHsKPiArCQkubmFtZSAgICAgICAgICAgPSAiZWljNzcwMC1ldGgt
ZHdtYWMiLAo+ICsJCS5wbSAgICAgICAgICAgICA9ICZzdG1tYWNfcGx0ZnJfcG1fb3BzLAo+ICsJ
CS5vZl9tYXRjaF90YWJsZSA9IGVpYzc3MDBfZHdtYWNfbWF0Y2gsCj4gKwl9LAo+ICt9Owo+ICtt
b2R1bGVfcGxhdGZvcm1fZHJpdmVyKGVpYzc3MDBfZHdtYWNfZHJpdmVyKTsKPiArCj4gK01PRFVM
RV9BVVRIT1IoIkVzd2luIik7Cj4gCj4gRHJvcCwgdGhhdCdzIG5vdCBhIHBlcnNvbi4KPiAKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
