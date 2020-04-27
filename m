Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B361BAB9A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 19:47:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12702C36B0C;
	Mon, 27 Apr 2020 17:47:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15F92C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 17:47:51 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 94DDD20005;
 Mon, 27 Apr 2020 17:47:48 +0000 (UTC)
Date: Mon, 27 Apr 2020 19:47:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200427194747.224a2402@xps13>
In-Reply-To: <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage
 all errors cases at probe time
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
LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKMjAyMCAxNzo1NzoyOCArMDIwMDoKCj4gVGhpcyBw
YXRjaCBkZWZlcnMgaXRzIHByb2JlIHdoZW4gdGhlIGV4cGVjdGVkIHJlc2V0IGNvbnRyb2wgaXMg
bm90Cj4geWV0IHJlYWR5LiBUaGlzIHBhdGNoIGFsc28gaGFuZGxlcyBwcm9wZXJseSBhbGwgZXJy
b3JzIGNhc2VzIGF0IHByb2JlCj4gdGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMTMgKysrKysrKysrLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gaW5kZXggYjZkNDVjZC4uMGE5Njc5NyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gQEAgLTE5NjcsNyArMTk2Nywx
MSBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgCX0KPiAgCj4gIAlyc3RjID0gZGV2bV9yZXNldF9jb250cm9sX2dldChkZXYsIE5V
TEwpOwo+IC0JaWYgKCFJU19FUlIocnN0YykpIHsKPiArCWlmIChJU19FUlIocnN0YykpIHsKPiAr
CQlyZXQgPSBQVFJfRVJSKHJzdGMpOwo+ICsJCWlmIChyZXQgPT0gLUVQUk9CRV9ERUZFUikKPiAr
CQkJZ290byBlcnJfY2xrX2Rpc2FibGU7Cj4gKwl9IGVsc2Ugewo+ICAJCXJlc2V0X2NvbnRyb2xf
YXNzZXJ0KHJzdGMpOwo+ICAJCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0Yyk7Cj4gIAl9Cj4g
QEAgLTE5NzUsNyArMTk3OSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJLyogRE1BIHNldHVwICovCj4gIAlyZXQgPSBzdG0z
Ml9mbWMyX2RtYV9zZXR1cChmbWMyKTsKPiAgCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiAr
CQlnb3RvIGVycl9kbWFfc2V0dXA7Cj4gIAo+ICAJLyogRk1DMiBpbml0IHJvdXRpbmUgKi8KPiAg
CXN0bTMyX2ZtYzJfaW5pdChmbWMyKTsKPiBAQCAtMTk5Nyw3ICsyMDAxLDcgQEAgc3RhdGljIGlu
dCBzdG0zMl9mbWMyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkvKiBT
Y2FuIHRvIGZpbmQgZXhpc3RlbmNlIG9mIHRoZSBkZXZpY2UgKi8KPiAgCXJldCA9IG5hbmRfc2Nh
bihjaGlwLCBuYW5kLT5uY3MpOwo+ICAJaWYgKHJldCkKPiAtCQlnb3RvIGVycl9zY2FuOwo+ICsJ
CWdvdG8gZXJyX2RtYV9zZXR1cDsKPiAgCj4gIAlyZXQgPSBtdGRfZGV2aWNlX3JlZ2lzdGVyKG10
ZCwgTlVMTCwgMCk7Cj4gIAlpZiAocmV0KQo+IEBAIC0yMDEwLDcgKzIwMTQsNyBAQCBzdGF0aWMg
aW50IHN0bTMyX2ZtYzJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgZXJy
X2RldmljZV9yZWdpc3RlcjoKPiAgCW5hbmRfY2xlYW51cChjaGlwKTsKPiAgCj4gLWVycl9zY2Fu
Ogo+ICtlcnJfZG1hX3NldHVwOgo+ICAJaWYgKGZtYzItPmRtYV9lY2NfY2gpCj4gIAkJZG1hX3Jl
bGVhc2VfY2hhbm5lbChmbWMyLT5kbWFfZWNjX2NoKTsKPiAgCWlmIChmbWMyLT5kbWFfdHhfY2gp
Cj4gQEAgLTIwMjEsNiArMjAyNSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc2dfZnJlZV90YWJsZSgmZm1jMi0+ZG1hX2Rh
dGFfc2cpOwo+ICAJc2dfZnJlZV90YWJsZSgmZm1jMi0+ZG1hX2VjY19zZyk7Cj4gIAo+ICtlcnJf
Y2xrX2Rpc2FibGU6Cj4gIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZm1jMi0+Y2xrKTsKPiAgCj4g
IAlyZXR1cm4gcmV0OwoKSSBkaWRuJ3Qgc3BvdCBpdCBkdXJpbmcgbXkgZWFybGllciByZXZpZXdz
IGJ1dCBJIHJlYWxseSBwcmVmZXIgdXNpbmcKbGFiZWxzIGV4cGxhaW5pbmcgd2hhdCB5b3UgZG8g
dGhhbiBoYXZpbmcgdGhlIHNhbWUgbmFtZSBvZiB0aGUgZnVuY3Rpb24Kd2hpY2ggZmFpbGVkLiBU
aGlzIHdheSB5b3UgZG9uJ3QgaGF2ZSB0byByZXdvcmsgdGhlIGVycm9yIHBhdGggd2hlbgp5b3Ug
aGFuZGxlIGFuIGFkZGl0aW9uYWwgZXJyb3IuCgpTbywgd291bGQgeW91IG1pbmQgZG9pbmcgdGhp
cyBpbiB0d28gc3RlcHM6CgoxLwpSZXBsYWNlCgogICAgZXJyX3NjYW46Cgp3aXRoLCBlZy4KCiAg
ICByZWxlYXNlX2RtYV9vYmpzOgoKMi8KQWRkIGEKCiAgICBnb3RvIHJlbGVhc2VfZG1hX29ianM7
CgppbiAqX2RtYV9zZXR1cCgpIGVycm9yIHBhdGgsIGFuZCBkZWZpbmUgYW5kIHVzZSBhCgogICAg
cmVsZWFzZV9jbGsKCmxhYmVsIGxpa2UgeW91IGFscmVhZHkgZG8uCgoKVGhhbmtzLApNaXF1w6hs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
