Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337D8537EA
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 18:31:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41BE5C6DD69;
	Tue, 13 Feb 2024 17:31:13 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC29BC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 17:31:12 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TZ7YZ34sxz6JB0N;
 Wed, 14 Feb 2024 01:27:14 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id A7393140DD5;
 Wed, 14 Feb 2024 01:31:11 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 17:31:11 +0000
Date: Tue, 13 Feb 2024 17:31:10 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Message-ID: <20240213173110.00007855@Huawei.com>
In-Reply-To: <e03968102b92b3711808eb532685bc9e05fc3c8d.camel@gmail.com>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-5-a2373cd72d36@baylibre.com>
 <c06dfa1ecf88b07ef467ad7c08667d0cab400613.camel@gmail.com>
 <CAMknhBEU=iMzpE_P0KePL4cZZktBOGHRXaEox5a7XcVjXDT+Dg@mail.gmail.com>
 <e03968102b92b3711808eb532685bc9e05fc3c8d.camel@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 5/5] iio: adc: ad7380: use
	spi_optimize_message()
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

T24gVHVlLCAxMyBGZWIgMjAyNCAxNzowODoxOSArMDEwMApOdW5vIFPDoSA8bm9uYW1lLm51bm9A
Z21haWwuY29tPiB3cm90ZToKCj4gT24gVHVlLCAyMDI0LTAyLTEzIGF0IDA5OjI3IC0wNjAwLCBE
YXZpZCBMZWNobmVyIHdyb3RlOgo+ID4gT24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMzo0N+KAr0FN
IE51bm8gU8OhIDxub25hbWUubnVub0BnbWFpbC5jb20+IHdyb3RlOiAgCj4gPiA+IAo+ID4gPiBP
biBNb24sIDIwMjQtMDItMTIgYXQgMTc6MjYgLTA2MDAsIERhdmlkIExlY2huZXIgd3JvdGU6ICAK
PiA+ID4gPiBUaGlzIG1vZGlmaWVzIHRoZSBhZDczODAgQURDIGRyaXZlciB0byB1c2Ugc3BpX29w
dGltaXplX21lc3NhZ2UoKSB0bwo+ID4gPiA+IG9wdGltaXplIHRoZSBTUEkgbWVzc2FnZSBmb3Ig
dGhlIGJ1ZmZlcmVkIHJlYWQgb3BlcmF0aW9uLiBTaW5jZSBidWZmZXJlZAo+ID4gPiA+IHJlYWRz
IHJldXNlIHRoZSBzYW1lIFNQSSBtZXNzYWdlIGZvciBlYWNoIHJlYWQsIHRoaXMgY2FuIGltcHJv
dmUKPiA+ID4gPiBwZXJmb3JtYW5jZSBieSByZWR1Y2luZyB0aGUgb3ZlcmhlYWQgb2Ygc2V0dGlu
ZyB1cCBzb21lIHBhcnRzIHRoZSBTUEkKPiA+ID4gPiBtZXNzYWdlIGluIGVhY2ggc3BpX3N5bmMo
KSBjYWxsLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIExlY2huZXIgPGRs
ZWNobmVyQGJheWxpYnJlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiDCoGRyaXZlcnMvaWlvL2Fk
Yy9hZDczODAuYyB8IDUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0KPiA+ID4gPiAtLS0tCj4gPiA+ID4gLQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDQ1IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaWlvL2FkYy9hZDczODAuYyBiL2RyaXZlcnMvaWlvL2FkYy9hZDczODAuYwo+ID4g
PiA+IGluZGV4IGFiZDc0NmFlZjg2OC4uNWM1ZDI2NDJhNDc0IDEwMDY0NAo+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvaWlvL2FkYy9hZDczODAuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9h
ZDczODAuYwo+ID4gPiA+IEBAIC0xMzMsNiArMTMzLDcgQEAgc3RydWN0IGFkNzM4MF9zdGF0ZSB7
Cj4gPiA+ID4gwqDCoMKgwqDCoCBzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpOwo+ID4gPiA+IMKgwqDC
oMKgwqAgc3RydWN0IHJlZ3VsYXRvciAqdnJlZjsKPiA+ID4gPiDCoMKgwqDCoMKgIHN0cnVjdCBy
ZWdtYXAgKnJlZ21hcDsKPiA+ID4gPiArwqDCoMKgwqAgc3RydWN0IHNwaV9tZXNzYWdlICptc2c7
Cj4gPiA+ID4gwqDCoMKgwqDCoCAvKgo+ID4gPiA+IMKgwqDCoMKgwqDCoCAqIERNQSAodGh1cyBj
YWNoZSBjb2hlcmVuY3kgbWFpbnRlbmFuY2UpIHJlcXVpcmVzIHRoZQo+ID4gPiA+IMKgwqDCoMKg
wqDCoCAqIHRyYW5zZmVyIGJ1ZmZlcnMgdG8gbGl2ZSBpbiB0aGVpciBvd24gY2FjaGUgbGluZXMu
Cj4gPiA+ID4gQEAgLTIzMSwxOSArMjMyLDU1IEBAIHN0YXRpYyBpbnQgYWQ3MzgwX2RlYnVnZnNf
cmVnX2FjY2VzcyhzdHJ1Y3QgaWlvX2Rldgo+ID4gPiA+ICppbmRpb19kZXYsIHUzMiByZWcsCj4g
PiA+ID4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+ID4gPiA+IMKgfQo+ID4gPiA+IAo+ID4gPiA+
ICtzdGF0aWMgaW50IGFkNzM4MF9idWZmZXJfcHJlZW5hYmxlKHN0cnVjdCBpaW9fZGV2ICppbmRp
b19kZXYpCj4gPiA+ID4gK3sKPiA+ID4gPiArwqDCoMKgwqAgc3RydWN0IGFkNzM4MF9zdGF0ZSAq
c3QgPSBpaW9fcHJpdihpbmRpb19kZXYpOwo+ID4gPiA+ICvCoMKgwqDCoCBzdHJ1Y3Qgc3BpX3Ry
YW5zZmVyICp4ZmVyOwo+ID4gPiA+ICvCoMKgwqDCoCBpbnQgcmV0Owo+ID4gPiA+ICsKPiA+ID4g
PiArwqDCoMKgwqAgc3QtPm1zZyA9IHNwaV9tZXNzYWdlX2FsbG9jKDEsIEdGUF9LRVJORUwpOwo+
ID4gPiA+ICvCoMKgwqDCoCBpZiAoIXN0LT5tc2cpCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPiA+ID4gPiArCj4gPiA+ID4gK8KgwqDCoMKgIHhmZXIg
PSBsaXN0X2ZpcnN0X2VudHJ5KCZzdC0+bXNnLT50cmFuc2ZlcnMsIHN0cnVjdCBzcGlfdHJhbnNm
ZXIsCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHRyYW5zZmVyX2xpc3QpOwo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKgwqAg
eGZlci0+Yml0c19wZXJfd29yZCA9IHN0LT5jaGlwX2luZm8tPmNoYW5uZWxzWzBdLnNjYW5fdHlw
ZS5yZWFsYml0czsKPiA+ID4gPiArwqDCoMKgwqAgeGZlci0+bGVuID0gNDsKPiA+ID4gPiArwqDC
oMKgwqAgeGZlci0+cnhfYnVmID0gc3QtPnNjYW5fZGF0YS5yYXc7Cj4gPiA+ID4gKwo+ID4gPiA+
ICvCoMKgwqDCoCByZXQgPSBzcGlfb3B0aW1pemVfbWVzc2FnZShzdC0+c3BpLCBzdC0+bXNnKTsK
PiA+ID4gPiArwqDCoMKgwqAgaWYgKHJldCkgewo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3BpX21lc3NhZ2VfZnJlZShzdC0+bXNnKTsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gPiA+ID4gK8KgwqDCoMKgIH0KPiA+ID4gPiArCj4gPiA+
ID4gK8KgwqDCoMKgIHJldHVybiAwOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0
aWMgaW50IGFkNzM4MF9idWZmZXJfcG9zdGRpc2FibGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2Rl
dikKPiA+ID4gPiArewo+ID4gPiA+ICvCoMKgwqDCoCBzdHJ1Y3QgYWQ3MzgwX3N0YXRlICpzdCA9
IGlpb19wcml2KGluZGlvX2Rldik7Cj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKgwqDCoCBzcGlfdW5v
cHRpbWl6ZV9tZXNzYWdlKHN0LT5tc2cpOwo+ID4gPiA+ICvCoMKgwqDCoCBzcGlfbWVzc2FnZV9m
cmVlKHN0LT5tc2cpOwo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKgwqAgcmV0dXJuIDA7Cj4gPiA+
ID4gK30KPiA+ID4gPiArICAKPiA+ID4gCj4gPiA+IE5vdCBzdWNoIGEgYmlnIGRlYWwgYnV0IHVu
bGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcgd2UgY291bGQgaGF2ZSB0aGUKPiA+ID4gc3BpX21l
c3NhZ2UgKCsgdGhlIHRyYW5zZmVyKSBzdGF0aWNhbGx5IGFsbG9jYXRlZCBpbiBzdHJ1Y3QgYWQ3
MzgwX3N0YXRlIGFuZAo+ID4gPiBkbwo+ID4gPiB0aGUgb3B0aW1pemUgb25seSBvbmNlIGF0IHBy
b2JlIChuYXR1cmFsbHkgd2l0aCBwcm9wZXIgZGV2bSBhY3Rpb24gZm9yCj4gPiA+IHVub3B0aW1p
emUpLiBUaGVuIHdlIHdvdWxkIG5vdCBuZWVkIHRvIHRoaXMgZm9yIGV2ZXJ5IGJ1ZmZlciBlbmFi
bGUgKwo+ID4gPiBkaXNhYmxlLiBJCj4gPiA+IGtub3cgaW4gdGVybXMgb2YgcGVyZm9ybWFuY2Ug
aXQgd29uJ3QgbWF0dGVyIGJ1dCBpdCB3b3VsZCBiZSBsZXNzIGNvZGUgSQo+ID4gPiBndWVzcy4K
PiA+ID4gCj4gPiA+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/ICAKPiA+IAo+ID4gTm8sIHlvdXIg
dW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0IGZvciB0aGUgY3VycmVudCBzdGF0ZSBvZiBldmVyeXRo
aW5nCj4gPiBpbiB0aGlzIHNlcmllcy4gU28sIHdlIGNvdWxkIGRvIGFzIHlvdSBzdWdnZXN0LCBi
dXQgSSBoYXZlIGEgZmVlbGluZwo+ID4gdGhhdCBmdXR1cmUgYWRkaXRpb25zIHRvIHRoaXMgZHJp
dmVyIG1pZ2h0IHJlcXVpcmUgdGhhdCBpdCBnZXRzCj4gPiBjaGFuZ2VkIGJhY2sgdGhpcyB3YXkg
ZXZlbnR1YWxseS4gIAo+IAo+IEhtbSwgbm90IHJlYWxseSBzdXJlIGFib3V0IHRoYXQgYXMgY2hp
cF9pbmZvIHN0dWZmIGlzIGFsd2F5cyBvdXIgZnJpZW5kIDopLiBBbmQKPiBJJ20gYW55d2F5cyBv
ZiB0aGUgb3BpbmlvbiBvZiBrZWVwaW5nIHRoaW5ncyBzaW1wbGVyIGFuZCBzdGFydCB0byBldm9s
dmUgd2hlbgo+IHJlYWxseSBuZWVkZWQgKGJlY2F1c2Ugb2Z0ZW4gd2UgbmV2ZXIgcmVhbGx5IG5l
ZWQgdG8gZXZvbHZlKS4gQnV0IGJhaCwgYXMgSQo+IHNhaWQuLi4gdGhpcyBpcyByZWFsbHkgbm90
IGEgYmlnIGRlYWwuCj4gCk9vcHMgc2hvdWxkIGhhdmUgcmVhZCBOdW5vJ3MgcmV2aWV3IGJlZm9y
ZSByZXBseWluZyEKCkknZCByYXRoZXIgd2UgZW1iZWRkZWQgaXQgZm9yIG5vdyBhbmQgZGlkIHRo
ZSBvcHRpbWl6YXRpb24gYXQgcHJvYmUuCldoaWxzdCBpdCdzIGEgbG90IG9mIHdvcmsgcGVyIHRy
YW5zZmVyIGl0J3Mgbm90IGVub3VnaCB0byB3b3JyeSBhYm91dCBkZWxheWluZwppdCB1bnRpbCBw
cmVlbmFibGUoKS4gIEVhc3kgdG8gbWFrZSB0aGF0IG1vdmUgYW5kIHRha2UgaXQgZHluYW1pYyB3
aGVuCmRyaXZlciBjaGFuZ2VzIG5lZWQgaXQuICBJbiBtZWFudGltZSwgSSBkb24ndCB3YW50IGxv
dHMgb2Ygb3RoZXIgZHJpdmVycwpwaWNraW5nIHVwIHRoaXMgcGF0dGVybiB3aGVuIHRoZXkgbWF5
IG5ldmVyIG5lZWQgdGhlIGNvbXBsZXhpdHkgb2YKbWFraW5nIHRoaW5ncyBtb3JlIGR5bmFtaWMu
CgpKb25hdGhhbgoKPiAtIE51bm8gU8OhCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
