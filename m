Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3D39339D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 May 2021 18:23:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3DD1C5718D;
	Thu, 27 May 2021 16:23:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCC79C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 16:23:21 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D745CFF806;
 Thu, 27 May 2021 16:23:18 +0000 (UTC)
Date: Thu, 27 May 2021 18:23:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <patrice.chotard@foss.st.com>
Message-ID: <20210527182317.38d5edc6@xps13>
In-Reply-To: <20210527161252.16620-4-patrice.chotard@foss.st.com>
References: <20210527161252.16620-1-patrice.chotard@foss.st.com>
 <20210527161252.16620-4-patrice.chotard@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Linux-stm32] [PATCH v3 3/3] mtd: spinand: add SPI-NAND MTD
	resume handler
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

SGkgUGF0cmljZSwKCisgUHJhdHl1c2gKCjxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+IHdy
b3RlIG9uIFRodSwgMjcgTWF5IDIwMjEgMTg6MTI6NTIgKzAyMDA6Cgo+IEZyb206IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IAo+IEFmdGVyIHBvd2VyIHVw
LCBhbGwgU1BJIE5BTkQncyBibG9ja3MgYXJlIGxvY2tlZC4gT25seSByZWFkIG9wZXJhdGlvbnMK
PiBhcmUgYWxsb3dlZCwgd3JpdGUgYW5kIGVyYXNlIG9wZXJhdGlvbnMgYXJlIGZvcmJpZGRlbi4K
PiBUaGUgU1BJIE5BTkQgZnJhbWV3b3JrIHVubG9ja3MgYWxsIHRoZSBibG9ja3MgZHVyaW5nIGl0
cyBpbml0aWFsaXphdGlvbi4KPiAKPiBEdXJpbmcgYSBzdGFuZGJ5IGxvdyBwb3dlciwgdGhlIG1l
bW9yeSBpcyBwb3dlcmVkIGRvd24sIGxvc2luZyBpdHMKPiBjb25maWd1cmF0aW9uLgo+IER1cmlu
ZyB0aGUgcmVzdW1lLCB0aGUgUVNQSSBkcml2ZXIgc3RhdGUgaXMgcmVzdG9yZWQgYnV0IHRoZSBT
UEkgTkFORAo+IGZyYW1ld29yayBkb2VzIG5vdCByZWNvbmZpZ3VyZWQgdGhlIG1lbW9yeS4KPiAK
PiBUaGlzIHBhdGNoIGFkZHMgU1BJLU5BTkQgTVREIFBNIGhhbmRsZXJzIGZvciByZXN1bWUgb3Bz
Lgo+IFNQSSBOQU5EIHJlc3VtZSBvcCByZS1pbml0aWFsaXplcyBTUEkgTkFORCBmbGFzaCB0byBp
dHMgcHJvYmVkIHN0YXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8
Y2hyaXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4g
djM6Cj4gICAtIEFkZCBzcGluYW5kX3JlYWRfY2ZnKCkgY2FsbCB0byByZXBvcHVsYXRlIGNhY2hl
Cj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAgIC0gQWRkIGhlbHBlciBzcGluYW5kX2Jsb2NrX3VubG9j
aygpLgo+ICAgLSBBZGQgc3BpbmFuZF9lY2NfZW5hYmxlKCkgY2FsbC4KPiAgIC0gUmVtb3ZlIHNv
bWUgZGV2X2VycigpLgo+ICAgLSBGaXggY29tbWl0J3MgdGl0bGUgYW5kIG1lc3NhZ2UuCj4gCj4g
IGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPiBpbmRleCAxZjY5OWFkODRmMWIuLmUzZmNiY2YzODFjMyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPiBAQCAtMTA5OSw2ICsxMDk5LDM4IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9ibG9j
a191bmxvY2soc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICAJcmV0dXJuIHJldDsK
PiAgfQo+ICAKPiArc3RhdGljIHZvaWQgc3BpbmFuZF9tdGRfcmVzdW1lKHN0cnVjdCBtdGRfaW5m
byAqbXRkKQo+ICt7Cj4gKwlzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQgPSBtdGRfdG9f
c3BpbmFuZChtdGQpOwo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQgPSBzcGluYW5kX3Jlc2V0X29w
KHNwaW5hbmQpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm47Cj4gKwo+ICsJcmV0ID0gc3BpbmFu
ZF9yZWFkX2NmZyhzcGluYW5kKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuOwo+ICsKPiArCXJl
dCA9IHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJsZShzcGluYW5kKTsKPiArCWlmIChyZXQpCj4gKwkJ
cmV0dXJuOwo+ICsKPiArCXJldCA9IHNwaW5hbmRfdXBkX2NmZyhzcGluYW5kLCBDRkdfT1RQX0VO
QUJMRSwgMCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybjsKPiArCj4gKwlyZXQgPSBzcGluYW5k
X21hbnVmYWN0dXJlcl9pbml0KHNwaW5hbmQpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm47Cj4g
Kwo+ICsJcmV0ID0gc3BpbmFuZF9ibG9ja191bmxvY2soc3BpbmFuZCk7Cj4gKwlpZiAocmV0KQo+
ICsJCXJldHVybjsKPiArCj4gKwlzcGluYW5kX2VjY19lbmFibGUoc3BpbmFuZCwgZmFsc2UpOwo+
ICt9CgpTb3JyeSBmb3Igbm90IGJlaW5nIGNsZWFyLCBidXQgSSB0aGluayB3aGF0IFByYXR5dXNo
IG1lYW50IHdhcyB0aGF0CnlvdSBjb3VsZCBjcmVhdGUgYSBoZWxwZXIgZG9pbmcgYWxsIHRoZSBj
b21tb24gaW5pdGlhbGl6YXRpb25zIGJldHdlZW4Kc3BpbmFuZF9pbml0KCkgYW5kIHNwaW5hbmRf
cmVzdW1lKCkgYW5kIGNhbGwgaXQgZnJvbSB0aGVzZSBwbGFjZXMgdG8KYXZvaWQgY29kZSBkdXBs
aWNhdGlvbi4gSGlzIGNvbW1lbnQgc29tZWhvdyBvdXRjbGFzc2VkIG1pbmUgYXMgSSBvbmx5CmZv
Y3VzZWQgb24gdGhlIHVubG9jayBwYXJ0ICh3aGljaCBJIHRoaW5rIGlzIGNsZWFyZXIgYW55d2F5
LCBwbGVhc2Uga2VlcAppdCBsaWtlIHRoYXQpLgoKPiArCj4gIHN0YXRpYyBpbnQgc3BpbmFuZF9p
bml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiAgewo+ICAJc3RydWN0IGRldmlj
ZSAqZGV2ID0gJnNwaW5hbmQtPnNwaW1lbS0+c3BpLT5kZXY7Cj4gQEAgLTExODYsNiArMTIxOCw3
IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFu
ZCkKPiAgCW10ZC0+X2Jsb2NrX2lzcmVzZXJ2ZWQgPSBzcGluYW5kX210ZF9ibG9ja19pc3Jlc2Vy
dmVkOwo+ICAJbXRkLT5fZXJhc2UgPSBzcGluYW5kX210ZF9lcmFzZTsKPiAgCW10ZC0+X21heF9i
YWRfYmxvY2tzID0gbmFuZGRldl9tdGRfbWF4X2JhZF9ibG9ja3M7Cj4gKwltdGQtPl9yZXN1bWUg
PSBzcGluYW5kX210ZF9yZXN1bWU7Cj4gIAo+ICAJaWYgKG5hbmQtPmVjYy5lbmdpbmUpIHsKPiAg
CQlyZXQgPSBtdGRfb29ibGF5b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQpOwoKVGhhbmtzLApNaXF1
w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
