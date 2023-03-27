Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D76C9D43
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 10:12:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E334C6A5F6;
	Mon, 27 Mar 2023 08:12:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB98DC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 08:11:59 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9C6281C0015;
 Mon, 27 Mar 2023 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1679904719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhvzASfzINt429FFDENdwaX1DAN8o/J7JPa/K12PqeE=;
 b=KtBVpLqLxvlJs8VA5ludhzfGeipr1FWpr3sHAGZ3b3nWk8iyPaq8kzNPhZGhJmjiod+8LB
 rvro547hpD376hvjvWR5ia9QivFHApEOtdEN/7R6yW+iNlxTv/8NIHzCb4XFbPRI+udoJz
 0KCOyrK19k/RKZ7RyyFC7yWknSlFCg6rjdMu4UX4tOFUpfPF6e8ZgRFKvUk6f3iBk5yKfA
 D28+bEjlL3UkXOEF9j4pPpHoID2r+79ciMCxRHNYoUlGqH4gQCttfI9kjplPGiQTReJKGQ
 56COzZAup502YD32YBhgNaW1Qk9QtcgwZqZBilBN0x2L6G21Nn9RXGdENtlR0g==
Date: Mon, 27 Mar 2023 10:11:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20230327101156.0ec2816a@xps-13>
In-Reply-To: <fcb600af-88dc-55a7-917e-4cf4673c2973@foss.st.com>
References: <20230324160918.826452-1-christophe.kerello@foss.st.com>
 <20230324172528.4d3ccd4b@xps-13>
 <f4c32aa5-e5b1-6465-7708-ef0281baf0af@foss.st.com>
 <fcb600af-88dc-55a7-917e-4cf4673c2973@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: richard@nod.at, linux-stm32@st-md-mailman.stormreply.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: do not support
	EDO mode
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBN
b24sIDI3IE1hciAyMDIzIDEwOjAyOjEzICswMjAwOgoKPiBIZWxsbyBNaXF1ZWwsCj4gCj4gT24g
My8yNC8yMyAxNzozNCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdyb3RlOgo+ID4gSGVsbG8gTWlxdWVs
LAo+ID4gCj4gPiBPbiAzLzI0LzIzIDE3OjI1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4g
SGkgQ2hyaXN0b3BoZSwKPiA+Pgo+ID4+IGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3
cm90ZSBvbiBGcmksIDI0IE1hciAyMDIzIDE3OjA5OjE4ICswMTAwOgo+ID4+ICAKPiA+Pj4gRk1D
MiBjb250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQgRURPIG1vZGUgKHRpbWluZ3MgbW9kZSA0IGFu
ZCA1KS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJp
c3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gPj4+IEZpeGVzOiAyY2Q0NTdmMzI4YzEgKCJt
dGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGFkZCBTVE0zMiBGTUMyIE5BTkQgPj4+IGZsYXNoIGNv
bnRyb2xsZXIgZHJpdmVyIikKPiA+Pj4gLS0tCj4gPj4+IMKgIGRyaXZlcnMvbXRkL25hbmQvcmF3
L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMyArKysKPiA+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMgPj4+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9u
YW5kLmMKPiA+Pj4gaW5kZXggNWQ2MjcwNDhjNDIwLi4zYWJiNjNkMDBhMGIgMTAwNjQ0Cj4gPj4+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4+IEBAIC0xNTMxLDYg
KzE1MzEsOSBAQCBzdGF0aWMgaW50ID4+PiBzdG0zMl9mbWMyX25mY19zZXR1cF9pbnRlcmZhY2Uo
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKPiA+Pj4gwqDCoMKgwqDCoCBpZiAo
SVNfRVJSKHNkcnQpKQo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoc2Ry
dCk7Cj4gPj4+ICvCoMKgwqAgaWYgKHNkcnQtPnRSQ19taW4gPCAzMDAwMCkgIAo+ID4+Cj4gPj4g
V2hlbiBpbnRyb2R1Y2luZyBOVi1ERFIgc3VwcG9ydCB3ZSBhcyB3ZWxsIGFkZGVkIGEgdGltaW5n
cy5tb2RlIGZpZWxkLAo+ID4+IHBlcmhhcHMgeW91IGNvdWxkIHVzZSBpdD8gIAo+ID4gCj4gPiBZ
ZXMsIEkgY2FuIHVzZSBpdC4gSXQgd2lsbCBiZSBkb25lIGluIFYyLgo+ID4gCj4gPiBSZWdhcmRz
LAo+ID4gQ2hyaXN0b3BoZSBLZXJlbGxvLgo+ID4gICAKPiAKPiBJIGhhZCBhIGxvb2sgYXQgS2Vy
bmVsIExUUywgYW5kIHRpbWluZ3MubW9kZSB3YXMgaW50cm9kdWNlZCBvbiBLZXJuZWwgTFRTIDUu
MTAuIEFzIHRoaXMgcGF0Y2ggaGFzIGFsc28gdG8gYmUgYXBwbGllZCBvbiBLZXJuZWwgTFRTIDUu
NCwgbXkgcHJvcG9zYWwgaXMgdG8gc2VuZCBhIG5ldyBwYXRjaCBzZXQuIFRoZSBmaXJzdCBwYXRj
aCB3aWxsIGJlIHRoZSBjdXJyZW50IHBhdGNoIChmaXggZm9yIGFsbCBLZXJuZWwgTFRTKSBhbmQg
dGhlIHNlY29uZCBwYXRjaCB3aWxsIHVzZSB0aW1pbmdzLm1vZGUgaW5zdGVhZCBvZiBjaGVja2lu
ZyB0UkNfbWluIHRpbWluZ3MgZm9yIG5leHQgS2VybmVsIGRlbGl2ZXJ5LiBJcyB0aGlzIHByb3Bv
c2FsIGFjY2VwdGFibGU/CgpXb3JrcyBmb3IgbWUhCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
