Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBFD1BACCC
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 20:33:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 876C5C36B0C;
	Mon, 27 Apr 2020 18:33:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E6D0C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 18:33:19 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2C647FF806;
 Mon, 27 Apr 2020 18:33:15 +0000 (UTC)
Date: Mon, 27 Apr 2020 20:33:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200427203314.798b3c4e@xps13>
In-Reply-To: <1586966256-29548-8-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-8-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 07/12] mtd: rawnand: stm32_fmc2: cleanup
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

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKMjAyMCAxNzo1NzozMSArMDIwMDoKCj4gVGhpcyBw
YXRjaCByZW5hbWVzIGZ1bmN0aW9ucyBhbmQgbG9jYWwgdmFyaWFibGVzIHRvIGJlIHJlYWR5IHRv
IHVzZQo+IHN0bTMyX2ZtYzIgc3RydWN0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4KPiAtLS0KCj4gLXN0YXRpYyBp
bnQgc3RtMzJfZm1jMl9zZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50
IGNoaXBuciwKPiAtCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX2RhdGFfaW50ZXJmYWNlICpj
b25mKQo+ICtzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3NldHVwX2ludGVyZmFjZShzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+ICsJCQkJCSAgY29uc3Qgc3RydWN0IG5hbmRf
ZGF0YV9pbnRlcmZhY2UgKmNmKQoKSSBzdXBwb3NlIHlvdSBzL2NvbmYvY2YvIGJlY2F1c2Ugb2Yg
dGhlIDgwIGNoYXJzIGJvdW5kYXJ5LiBJbiB0aGlzIGNhc2UKSSBkb24ndCBtaW5kIGNyb3NzaW5n
IGl0LCBJIGRvbid0IHRoaW5rIGl0IGlzIGJldHRlciB0byByZW5hbWUgdGhlCmNvbmYgcGFyYW1l
dGVyIGZvciB0aGlzIHJlYXNvbi4KCj4gIHsKPiAgCWNvbnN0IHN0cnVjdCBuYW5kX3Nkcl90aW1p
bmdzICpzZHJ0Owo+ICAKPiAtCXNkcnQgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjb25mKTsKPiAr
CXNkcnQgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjZik7Cj4gIAlpZiAoSVNfRVJSKHNkcnQpKQo+
ICAJCXJldHVybiBQVFJfRVJSKHNkcnQpOwo+ICAKPiAgCWlmIChjaGlwbnIgPT0gTkFORF9EQVRB
X0lGQUNFX0NIRUNLX09OTFkpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+IC0Jc3RtMzJfZm1jMl9jYWxj
X3RpbWluZ3MoY2hpcCwgc2RydCk7Cj4gLQlzdG0zMl9mbWMyX3RpbWluZ3NfaW5pdChjaGlwKTsK
PiArCXN0bTMyX2ZtYzJfbmZjX2NhbGNfdGltaW5ncyhjaGlwLCBzZHJ0KTsKPiArCXN0bTMyX2Zt
YzJfbmZjX3RpbWluZ3NfaW5pdChjaGlwKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKClsu
Li5dCgo+ICAKPiAtc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfZm1jMl9kcml2
ZXIgPSB7Cj4gLQkucHJvYmUJPSBzdG0zMl9mbWMyX3Byb2JlLAo+IC0JLnJlbW92ZQk9IHN0bTMy
X2ZtYzJfcmVtb3ZlLAo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9mbWMy
X25mY19kcml2ZXIgPSB7Cj4gKwkucHJvYmUJPSBzdG0zMl9mbWMyX25mY19wcm9iZSwKPiArCS5y
ZW1vdmUJPSBzdG0zMl9mbWMyX25mY19yZW1vdmUsCj4gIAkuZHJpdmVyCT0gewo+IC0JCS5uYW1l
ID0gInN0bTMyX2ZtYzJfbmFuZCIsCj4gLQkJLm9mX21hdGNoX3RhYmxlID0gc3RtMzJfZm1jMl9t
YXRjaCwKPiAtCQkucG0gPSAmc3RtMzJfZm1jMl9wbV9vcHMsCj4gKwkJLm5hbWUgPSAic3RtMzJf
Zm1jMl9uZmMiLAo+ICsJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX2ZtYzJfbmZjX21hdGNoLAo+
ICsJCS5wbSA9ICZzdG0zMl9mbWMyX25mY19wbV9vcHMsCj4gIAl9LAo+ICB9Owo+IC1tb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKHN0bTMyX2ZtYzJfZHJpdmVyKTsKPiArbW9kdWxlX3BsYXRmb3JtX2Ry
aXZlcihzdG0zMl9mbWMyX25mY19kcml2ZXIpOwo+ICAKPiAtTU9EVUxFX0FMSUFTKCJwbGF0Zm9y
bTpzdG0zMl9mbWMyX25hbmQiKTsKPiArTU9EVUxFX0FMSUFTKCJwbGF0Zm9ybTpzdG0zMl9mbWMy
X25mYyIpOwo+ICBNT0RVTEVfQVVUSE9SKCJDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUu
a2VyZWxsb0BzdC5jb20+Iik7Cj4gLU1PRFVMRV9ERVNDUklQVElPTigiU1RNaWNyb2VsZWN0cm9u
aWNzIFNUTTMyIEZNQzIgbmFuZCBkcml2ZXIiKTsKPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJTVE1p
Y3JvZWxlY3Ryb25pY3MgU1RNMzIgRk1DMiBuZmMgZHJpdmVyIik7CgpJIHdvdWxkIHByZWZlcjog
cy9uZmMvTkZDLyBoZXJlIHBsZWFzZS4KCj4gIE1PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKCldp
dGggdGhlc2UgdHdvIG5pdHMsCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
