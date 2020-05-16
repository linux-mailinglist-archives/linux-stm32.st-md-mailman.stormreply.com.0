Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF601D6314
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2020 19:30:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A36C36B20;
	Sat, 16 May 2020 17:30:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71A59C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2020 17:30:48 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA81E2065C;
 Sat, 16 May 2020 17:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589650247;
 bh=sy/ZwK4XLIWwnJ1X2r/NS7nH5MIkDalgPGtw2Za22Cg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZAO9rW0QLWqZYrooCxJIjDBdwAhuUHzT/l6jU1YUon2n+JAYT+1laLXlRkfEiA4S4
 IXt7UXY2xcvrGd58Yhy0+D3c9jcLumHvktP2IGjxC6jn9gDUZmouB6T9clhXwxEUOJ
 mgf3FuBHRk+5c5ZtQEV9PeLGxJd24EpNWYJKnppc=
Date: Sat, 16 May 2020 18:30:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Message-ID: <20200516183041.79b4dd74@archlinux>
In-Reply-To: <BN6PR03MB3347D0598B1700D1A5C6974C99BD0@BN6PR03MB3347.namprd03.prod.outlook.com>
References: <20200514131710.84201-1-alexandru.ardelean@analog.com>
 <20200514131710.84201-8-alexandru.ardelean@analog.com>
 <BN6PR03MB33472A1B559F98E3BDCAB40B99BD0@BN6PR03MB3347.namprd03.prod.outlook.com>
 <1d89df334b08486e73ca181cf9035d9af8fbccf2.camel@analog.com>
 <BN6PR03MB3347D0598B1700D1A5C6974C99BD0@BN6PR03MB3347.namprd03.prod.outlook.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "ak@it-klinger.de" <ak@it-klinger.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>, "Ardelean,
 Alexandru" <alexandru.Ardelean@analog.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 7/8] iio: core: simplify alloc
	alignment code
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

T24gRnJpLCAxNSBNYXkgMjAyMCAxMjozNzoyOCArMDAwMAoiU2EsIE51bm8iIDxOdW5vLlNhQGFu
YWxvZy5jb20+IHdyb3RlOgoKPiA+IEZyb206IEFyZGVsZWFuLCBBbGV4YW5kcnUgPGFsZXhhbmRy
dS5BcmRlbGVhbkBhbmFsb2cuY29tPgo+ID4gU2VudDogRnJlaXRhZywgMTUuIE1haSAyMDIwIDEz
OjQ4Cj4gPiBUbzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1z
dG0zMkBzdC1tZC0KPiA+IG1haWxtYW4uc3Rvcm1yZXBseS5jb207IFNhLCBOdW5vIDxOdW5vLlNh
QGFuYWxvZy5jb20+OyBsaW51eC0KPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWlp
b0B2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBsdWRvdmljLmRlc3JvY2hlc0BtaWNyb2NoaXAuY29t
OyBuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb207Cj4gPiBhbGV4YW5kcmUudG9yZ3VlQHN0LmNv
bTsgYWtAaXQta2xpbmdlci5kZTsgamljMjNAa2VybmVsLm9yZzsKPiA+IGV1Z2VuLmhyaXN0ZXZA
bWljcm9jaGlwLmNvbTsgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbTsKPiA+IGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDcvOF0gaWlvOiBj
b3JlOiBzaW1wbGlmeSBhbGxvYyBhbGlnbm1lbnQgY29kZQo+ID4gCj4gPiBPbiBGcmksIDIwMjAt
MDUtMTUgYXQgMDc6MTIgKzAwMDAsIFNhLCBOdW5vIHdyb3RlOiAgCj4gPiA+IEhleSBBbGV4LAo+
ID4gPgo+ID4gPiBKdXN0IGEgc21hbGwgcXVlc3Rpb24uLi4KPiA+ID4gIAo+ID4gPiA+IEZyb206
IGxpbnV4LWlpby1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWlpby0gIAo+ID4gb3duZXJA
dmdlci5rZXJuZWwub3JnPiAgCj4gPiA+ID4gT24gQmVoYWxmIE9mIEFsZXhhbmRydSBBcmRlbGVh
bgo+ID4gPiA+IFNlbnQ6IERvbm5lcnN0YWcsIDE0LiBNYWkgMjAyMCAxNToxNwo+ID4gPiA+IFRv
OiBsaW51eC1paW9Admdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7ICAKPiA+IGxpbnV4LSAgCj4gPiA+ID4gc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbTsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+ID4gPiA+IENjOiBsdWRv
dmljLmRlc3JvY2hlc0BtaWNyb2NoaXAuY29tOyBldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb207
Cj4gPiA+ID4gamljMjNAa2VybmVsLm9yZzsgbmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tOwo+
ID4gPiA+IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tOyBhbGV4YW5kcmUudG9yZ3VlQHN0
LmNvbTsKPiA+ID4gPiBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tOyBha0BpdC1rbGluZ2VyLmRl
OyBBcmRlbGVhbiwgQWxleGFuZHJ1Cj4gPiA+ID4gPGFsZXhhbmRydS5BcmRlbGVhbkBhbmFsb2cu
Y29tPgo+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MiA3LzhdIGlpbzogY29yZTogc2ltcGxpZnkg
YWxsb2MgYWxpZ25tZW50IGNvZGUKPiA+ID4gPgo+ID4gPiA+IFRoZXJlIHdhcyBhIHJlY2VudCBk
aXNjdXNzaW9uIGFib3V0IHRoaXMgY29kZToKPiA+ID4gPiAgIGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC0KPiA+ID4gPiAgCj4gPiBpaW8v
MjAyMDAzMjIxNjUzMTcuMGIxZjA2NzRAYXJjaGxpbnV4L19fOyEhQTNOaThDUzB5MlkhcGdkVVNh
eUpDZnhNaUUgIAo+ID4gPiA+IHc4RnB2MExrRVp1ckNTa1gwc0VjTG5YZURTQ0xtaHB1MXhvbnQ2
LXZCUWozWmJDdyQKPiA+ID4gPgo+ID4gPiA+IFRoaXMgbG9va3MgbGlrZSBhIGdvb2QgdGltZSB0
byByZXdvcmsgdGhpcywgc2luY2UgYW55IGlzc3VlcyBhYm91dCBpdAo+ID4gPiA+IHNob3VsZCBw
b3AtdXAgdW5kZXIgdGVzdGluZywgYmVjYXVzZSB0aGUgaWlvX2RldiBpcyBoYXZpbmcgYSBiaXQg
b2YgYW4KPiA+ID4gPiBvdmVyaGF1bCBhbmQgc3R1ZmYgYmVpbmcgbW92ZWQgdG8gaWlvX2Rldl9w
cml2Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEFyZGVsZWFuIDxh
bGV4YW5kcnUuYXJkZWxlYW5AYW5hbG9nLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVy
cy9paW8vaW5kdXN0cmlhbGlvLWNvcmUuYyB8IDEwICsrKy0tLS0tLS0KPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbmR1c3RyaWFsaW8tY29yZS5jIGIvZHJpdmVycy9p
aW8vaW5kdXN0cmlhbGlvLQo+ID4gPiA+IGNvcmUuYwo+ID4gPiA+IGluZGV4IGExYjI5ZTBmOGZk
Ni4uNzY3MWQzNmVmYWU3IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvaWlvL2luZHVzdHJp
YWxpby1jb3JlLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2lpby9pbmR1c3RyaWFsaW8tY29yZS5j
Cj4gPiA+ID4gQEAgLTE1MTQsMTMgKzE1MTQsOSBAQCBzdHJ1Y3QgaWlvX2RldiAqaWlvX2Rldmlj
ZV9hbGxvYyhpbnQgIAo+ID4gc2l6ZW9mX3ByaXYpICAKPiA+ID4gPiAgCXN0cnVjdCBpaW9fZGV2
ICpkZXY7Cj4gPiA+ID4gIAlzaXplX3QgYWxsb2Nfc2l6ZTsKPiA+ID4gPgo+ID4gPiA+IC0JYWxs
b2Nfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgaWlvX2Rldl9vcGFxdWUpOwo+ID4gPiA+IC0JaWYgKHNp
emVvZl9wcml2KSB7Cj4gPiA+ID4gLQkJYWxsb2Nfc2l6ZSA9IEFMSUdOKGFsbG9jX3NpemUsIElJ
T19BTElHTik7Cj4gPiA+ID4gLQkJYWxsb2Nfc2l6ZSArPSBzaXplb2ZfcHJpdjsKPiA+ID4gPiAt
CX0KPiA+ID4gPiAtCS8qIGVuc3VyZSAzMi1ieXRlIGFsaWdubWVudCBvZiB3aG9sZSBjb25zdHJ1
Y3QgPyAqLwo+ID4gPiA+IC0JYWxsb2Nfc2l6ZSArPSBJSU9fQUxJR04gLSAxOwo+ID4gPiA+ICsJ
YWxsb2Nfc2l6ZSA9IEFMSUdOKHNpemVvZihzdHJ1Y3QgaWlvX2Rldl9vcGFxdWUpLCBJSU9fQUxJ
R04pOwo+ID4gPiA+ICsJaWYgKHNpemVvZl9wcml2KQo+ID4gPiA+ICsJCWFsbG9jX3NpemUgKz0g
QUxJR04oc2l6ZW9mX3ByaXYsIElJT19BTElHTik7ICAKPiA+ID4KPiA+ID4gRG8gd2UgYWN0dWFs
bHkgbmVlZCB0byBkbyB0aGUgYEFMSUdOYCBhZ2Fpbj8gSXQgc2VlbXMgdG8gbWUgdGhhdCAgCj4g
PiBgYWxsb2Nfc2l6ZSAgCj4gPiA+ICs9IHNpemVvZl9wcml2YAo+ID4gPiB3b3VsZCBiZSBlbm91
Z2ggb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZyBvYnZpb3VzPyAgCj4gPiAKPiA+IFdlbGwsIGl0
J3Mgbm90IGFsd2F5cyBjbGVhciB3aGF0IHZhbHVlICdzaXplb2ZfcHJpdicgaGFzLCBhbmQgd2hl
dGhlciBpdCBpcwo+ID4gcHJvdmlkZWQgYWxyZWFkeSBhbGlnbmVkLgo+ID4gVGhlIHJlcXVpcmVt
ZW50IGlzIHVzdWFsbHkgdGhhdCB0aGlzIGRhdGEgYmUgY2FjaGVsaW5lIGFsaWduZWQuCj4gPiAK
PiA+IFNvLCBzaXplb2Yoc3RydWN0IGlpb19kZXZfb3BhcXVlKSBpcyBhbGlnbmVkIGFscmVhZHkg
YSBmZXcgbGluZXMgYWJvdmUsIGJ1dAo+ID4gdGhlCj4gPiBwcml2YXRlIGluZm9ybWF0aW9uIHNo
b3VsZCBhbHNvIGJlIGFsaWduZWQgW2dpdmVuIHRoYXQgaXQncyBhbiB1bmtub3duIHZhbHVlCj4g
PiBwcm92aWRlZCBieSB0aGUgZHJpdmVyXS4KPiA+IEkgdGhpbmsgdGhpcyBpcyBtb3N0bHkgaW1w
b3J0YW50LCBpZiB3ZSBuZWVkIHRvIGRvIERNQSBhY2Nlc3MgdG8gYnVmZmVycwo+ID4gYWxsb2Nh
dGVkIG9uIHRoZSBkcml2ZXIncyBzdGF0ZS1zdHJ1Y3QsIHdoaWNoIGlzIGFsbG9jYXRlZCBoZXJl
LCBhbmQgd2hpY2ggaXMKPiA+IHVzdWFsbHkgcHJvdmlkZWQgYXMgc2l6ZW9mX3ByaXYuICAKPiAK
PiBZZXMsIEFGQUlVIHRoaXMgaXMgdG8gZ3VhcmFudGVlIHRoYXQgdGhlIHByaXYgc3RydWN0IHdp
bGwgc3RhcnQgYXQgYW4gYWRkcmVzcyB0aGF0IGlzIAo+IERNQSBzYWZlIChjYWNoZWxpbmUtYWxp
Z25lZCkuIEhlbmNlLCBpZiB0aGVyZSBpcyBhbnkgZGF0YSBpbiAncHJpdicgdGhhdCBuZWVkcyB0
byBiZSBETUEKPiBzYWZlLCB3ZSBhcmUgZmluZS4uLgo+IAo+IFdlbGwsIEkgd2FzIGFsc28gbWlz
cmVhZGluZyB0aGUgY29kZS4gU3RpbGwsIEkgdGhpbmsgaXQgc2hvdWxkIGxvb2sgc29tZXRoaW5n
IGxpa2U6Cj4gCj4gYGBgYAo+IGFsbG9jX3NpemUgPSBzaXplb2Yoc3RydWN0IGlpb19kZXZfb3Bh
cXVlKQo+IGlmIChzaXplb2ZfcHJpdikKPiAJYWxsb2Nfc2l6ZSArPSBBTElHTihhbGxvY19zaXpl
LCBJSU9fQUxJR04pOwo+IGBgYGAKPiAKPiBJZiB0aGVyZSBpcyBubyBwcml2LCBJIHRoaW5rIHdl
IGRvbid0IG5lZWQgdGhlIHBhZGRpbmcgYnl0ZXMuLi4KQWdyZWVkIC0gbm8gbmVlZCB0byBndWFy
YW50ZWUgYWxpZ25tZW50IG9mIHNvbWV0aGluZyB0aGF0IGRvZXNuJ3QgZXhpc3QgOikKCj4gCj4g
LSBOdW5vIFPDoQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
