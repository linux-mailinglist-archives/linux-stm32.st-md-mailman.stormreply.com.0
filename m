Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D75BD1AF
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Sep 2022 18:00:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB17EC04003;
	Mon, 19 Sep 2022 16:00:28 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 774D7C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 16:00:27 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB70A24000E;
 Mon, 19 Sep 2022 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1663603227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4w2H0/aVozaHmubnqFnPjiPTuYGSRzmbJ5Wwl6IDQwM=;
 b=Lcv42Ss9HGpIaCPVGZlsqSX3b4RETBixGo4uKB9QrhoufMMLiAxBu08X17z+G4slmrlwN9
 Z6WowHP6ZO5LMXhxmBydcyUHnj54Jq2E3Mj4uVzL1yZstEYPbO4zJNE5J4XnvQ0h7POLr8
 oSAVOOn21UXyjWZKkBGyiyp3sXrL7L8tfC7N5kWrIg/0GuF+sF8/rL/SPppLiv8tquBLre
 c5kwjH+1qwDO5GwgW93QEETcLp6ugYlLjWklnhej2XFyve0vxTaS2mL0BsR7l+LoEuJzLp
 76RsJ5bA3HANiTyTGPiCUSrFbvWdg3bkXLJdQgX7i4ZgC5a+FUR6nlXpiNXjqw==
Date: Mon, 19 Sep 2022 18:00:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jack Wang <jinpu.wang@ionos.com>
Message-ID: <20220919180022.2c80e2b7@xps-13>
In-Reply-To: <20220825075338.35338-2-jinpu.wang@ionos.com>
References: <20220825075338.35338-1-jinpu.wang@ionos.com>
 <20220825075338.35338-2-jinpu.wang@ionos.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Cai Huoqing <cai.huoqing@linux.dev>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] mtd: rawnand: stm32_fmc2: Fix
 dma_map_sg error check
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

SGkgSmFjaywKCmppbnB1LndhbmdAaW9ub3MuY29tIHdyb3RlIG9uIFRodSwgMjUgQXVnIDIwMjIg
MDk6NTM6MzcgKzAyMDA6Cgo+IGRtYV9tYXBfc2cgcmV0dXJuIDAgb24gZXJyb3IsIGluIGNhc2Ug
b2YgZXJyb3IgcmV0dXJuIC1FSU8uCj4gCj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogTWF4aW1l
IENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBBbGV4YW5kcmUgVG9y
Z3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+IENjOiBQaGlsaXBwIFphYmVsIDxw
LnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9w
aGUua2VyZWxsb0Bmb3NzLnN0LmNvbT4KPiBDYzogQ2FpIEh1b3FpbmcgPGNhaS5odW9xaW5nQGxp
bnV4LmRldj4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+
IEZpeGVzOiAyY2Q0NTdmMzI4YzEgKCJtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGFkZCBTVE0z
MiBGTUMyIE5BTkQgZmxhc2ggY29udHJvbGxlciBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEph
Y2sgV2FuZyA8amlucHUud2FuZ0Bpb25vcy5jb20+CgpJJ2xsIGFwcGx5IHRoaXMgc2VyaWVzIHNv
IEkgbmVlZCB0byByZS1hZGQgQ2hyaXN0b3BoZSdzIHRhZyBzZW50IG9uIHRoZQpwYXRjaCBhbG9u
ZSAod2hpY2ggaXMgaWRlbnRpY2FsIGFzIGZhciBhcyBJIHNlZSk6CgpSZXZpZXdlZC1ieTogQ2hy
aXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cgo+IC0tLQo+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDggKysrKystLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IGluZGV4IDg3YzFjN2RkOTdlYi4uYTBj
ODI1YWYxOWZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJf
bmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiBA
QCAtODYyLDggKzg2Miw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfeGZlcihzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLCBjb25zdCB1OCAqYnVmLAo+ICAKPiAgCXJldCA9IGRtYV9tYXBfc2co
bmZjLT5kZXYsIG5mYy0+ZG1hX2RhdGFfc2cuc2dsLAo+ICAJCQkgZWNjc3RlcHMsIGRtYV9kYXRh
X2Rpcik7Cj4gLQlpZiAocmV0IDwgMCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJaWYgKCFyZXQpCj4g
KwkJcmV0dXJuIC1FSU87Cj4gIAo+ICAJZGVzY19kYXRhID0gZG1hZW5naW5lX3ByZXBfc2xhdmVf
c2coZG1hX2NoLCBuZmMtPmRtYV9kYXRhX3NnLnNnbCwKPiAgCQkJCQkgICAgZWNjc3RlcHMsIGRt
YV90cmFuc2Zlcl9kaXIsCj4gQEAgLTg5Myw4ICs4OTMsMTAgQEAgc3RhdGljIGludCBzdG0zMl9m
bWMyX25mY194ZmVyKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpidWYsCj4gIAo+
ICAJCXJldCA9IGRtYV9tYXBfc2cobmZjLT5kZXYsIG5mYy0+ZG1hX2VjY19zZy5zZ2wsCj4gIAkJ
CQkgZWNjc3RlcHMsIGRtYV9kYXRhX2Rpcik7Cj4gLQkJaWYgKHJldCA8IDApCj4gKwkJaWYgKCFy
ZXQpIHsKPiArCQkJcmV0ID0gLUVJTzsKPiAgCQkJZ290byBlcnJfdW5tYXBfZGF0YTsKPiArCQl9
Cj4gIAo+ICAJCWRlc2NfZWNjID0gZG1hZW5naW5lX3ByZXBfc2xhdmVfc2cobmZjLT5kbWFfZWNj
X2NoLAo+ICAJCQkJCQkgICBuZmMtPmRtYV9lY2Nfc2cuc2dsLAoKClRoYW5rcywKTWlxdcOobApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
