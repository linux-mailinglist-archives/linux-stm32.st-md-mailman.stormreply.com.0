Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 911BB587D1
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 18:59:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E0F5C0B787;
	Thu, 27 Jun 2019 16:59:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72145C0BA8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 16:59:10 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5789AFF813;
 Thu, 27 Jun 2019 16:59:04 +0000 (UTC)
Date: Thu, 27 Jun 2019 18:59:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20190627185901.6247a77c@xps13>
In-Reply-To: <1561128480-14531-1-git-send-email-christophe.kerello@st.com>
References: <1561128480-14531-1-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: increase DMA
 completion timeouts
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
LmNvbT4gd3JvdGUgb24gRnJpLCAyMSBKdW4KMjAxOSAxNjo0ODowMCArMDIwMDoKCj4gV2hlbiB0
aGUgc3lzdGVtIGlzIG92ZXJsb2FkZWQsIERNQSBkYXRhIHRyYW5zZmVyIGNvbXBsZXRpb24gb2Nj
dXJzIGFmdGVyCj4gMTAwbXMuIEluY3JlYXNlIHRoZSB0aW1lb3V0cyB0byBsZXQgaXQgdGhlIHRp
bWUgdG8gY29tcGxldGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERlbGF1bmF5IDxhbWVs
aWUuZGVsYXVuYXlAc3QuY29tPgoKVGhlIGZpcnN0IFNvQiBzaG91bGQgYmUgdGhlIGF1dGhvcidz
LiBFaXRoZXIgQW1lbGllIGlzIHRoZSBhdXRob3IgYW5kCnlvdSBzaG91bGQgdXNlICdnaXQgY29t
bWl0IC0tYW1lbmQgLS1hdXRob3I9Li4uIiBvciBzaGUgaXMgbm90IGFuZApzaG91bGQgYmUgZHJv
cHBlZCAodW5sZXNzIHNoZSBzZW5kcyB0aGUgcGF0Y2ggd2hpY2ggaXMgeW91cnMsIGFuZCBpbgp0
aGlzIGNhc2UgaGVyIG5hbWUgc2hvdWxkIGFwcGVhciBzZWNvbmQpLgoKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgNCArKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiBpbmRleCA0YWFiZWEyLi5jN2Y3YzZmIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiBAQCAtOTgxLDcgKzk4MSw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl94ZmVyKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNv
bnN0IHU4ICpidWYsCj4gIAo+ICAJLyogV2FpdCBETUEgZGF0YSB0cmFuc2ZlciBjb21wbGV0aW9u
ICovCj4gIAlpZiAoIXdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmZm1jMi0+ZG1hX2RhdGFf
Y29tcGxldGUsCj4gLQkJCQkJIG1zZWNzX3RvX2ppZmZpZXMoMTAwKSkpIHsKPiArCQkJCQkgbXNl
Y3NfdG9famlmZmllcyg1MDApKSkgewo+ICAJCWRldl9lcnIoZm1jMi0+ZGV2LCAiZGF0YSBETUEg
dGltZW91dFxuIik7Cj4gIAkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hbGwoZG1hX2NoKTsKPiAgCQly
ZXQgPSAtRVRJTUVET1VUOwo+IEBAIC05OTAsNyArOTkwLDcgQEAgc3RhdGljIGludCBzdG0zMl9m
bWMyX3hmZXIoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwKPiAgCS8qIFdh
aXQgRE1BIEVDQyB0cmFuc2ZlciBjb21wbGV0aW9uICovCj4gIAlpZiAoIXdyaXRlX2RhdGEgJiYg
IXJhdykgewo+ICAJCWlmICghd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZmbWMyLT5kbWFf
ZWNjX2NvbXBsZXRlLAo+IC0JCQkJCQkgbXNlY3NfdG9famlmZmllcygxMDApKSkgewo+ICsJCQkJ
CQkgbXNlY3NfdG9famlmZmllcyg1MDApKSkgewoKSUlSQyBJIGFscmVhZHkgYXNrZWQgeW91IHRo
aXMgYnV0IGNvdWxkIHlvdSBwbGVhc2UgbWFrZSBhIGRlZmluZSBhbmQgYXQKdGhlIHNhbWUgdGlt
ZSBtYWtlIGl0IDEwMDAgbXMsIEkgZG9uJ3Qgc2VlIHRoZSBwb2ludCBpbiBiZWluZyBjbG9zZQp0
byB0aGUgbWF4aW11bSBsYXRlbmN5LiBJZiB0aGlzIGlzIHJlYWNoZWQsIHlvdXIgdHJhbnNmZXIg
d2FzCnNjcmV3ZWQgYWxyZWFkeSwgdGhlcmUgaXMgbm8gcGVyZm9ybWFuY2UgaW1wYWN0IGhlcmUu
CgpTb3JyeSBmb3IgdGhlIGxhdGUgbm90aWNlIGJ1dCBJIHdpbGwgY2xvc2UgdGhlIG5hbmQvbmV4
dCBicmFuY2gKdG9tb3Jyb3csIHNvIEknbGwgcXVldWUgeW91ciB2MiBvbmx5IGlmIEkgcmVjZWl2
ZSBpdCBzb29uIGVub3VnaCA6KQoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
