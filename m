Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBAB49B12A
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 11:11:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CDBCC5F1D5;
	Tue, 25 Jan 2022 10:11:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D94CC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 10:11:56 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B2D6C000F;
 Tue, 25 Jan 2022 10:11:53 +0000 (UTC)
Date: Tue, 25 Jan 2022 11:11:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20220125111152.4fa65ee4@xps13>
In-Reply-To: <20220105135734.271313-4-christophe.kerello@foss.st.com>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-4-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH 3/3] nvmem: core: Fix a conflict between
 MTD and NVMEM on wp-gpios property
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBX
ZWQsIDUgSmFuIDIwMjIgMTQ6NTc6MzQgKzAxMDA6CgpTb3JyeSBmb3IgdGhlIHRpbWUgaXQgdG9v
ayBtZSB0byByZXZpZXcgdGhpcyBwYXRjaHNldC4KCj4gV3AtZ3Bpb3MgcHJvcGVydHkgY2FuIGJl
IHVzZWQgb24gTlZNRU4gbm9kZXMgYW5kIHRoZSBzYW1lIHByb3BlcnR5IGNhbgo+IGJlIGFsc28g
dXNlZCBvbiBNVEQgTkFORCBub2Rlcy4gSW4gY2FzZSBvZiB0aGUgd3AtZ3Bpb3MgcHJvcGVydHkg
aXMKPiBkZWZpbmVkIGF0IE5BTkQgbGV2ZWwgbm9kZSwgdGhlIEdQSU8gbWFuYWdlbWVudCBpcyBk
b25lIGF0IE5BTkQgZHJpdmVyCj4gbGV2ZWwuIFdyaXRlIHByb3RlY3QgaXMgZGlzYWJsZWQgd2hl
biB0aGUgZHJpdmVyIGlzIHByb2JlZCBvciByZXN1bWVkCj4gYW5kIGlzIGVuYWJsZWQgd2hlbiB0
aGUgZHJpdmVyIGlzIHJlbGVhc2VkIG9yIHN1c3BlbmRlZC4KPiAKPiBXaGVuIG5vIHBhcnRpdGlv
bnMgYXJlIGRlZmluZWQgaW4gdGhlIE5BTkQgRFQgbm9kZSwgdGhlbiB0aGUgTkFORCBEVCBub2Rl
Cj4gd2lsbCBiZSBwYXNzZWQgdG8gTlZNRU0gZnJhbWV3b3JrLiBJZiB3cC1ncGlvcyBwcm9wZXJ0
eSBpcyBkZWZpbmVkIGluCj4gdGhpcyBub2RlLCB0aGUgR1BJTyByZXNvdXJjZSBpcyB0YWtlbiB0
d2ljZSBhbmQgdGhlIE5BTkQgY29udHJvbGxlcgo+IGRyaXZlciBmYWlscyB0byBwcm9iZS4KPiAK
PiBJdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBzZXQgY29uZmlnLT53cF9ncGlvIGF0IE1URCBsZXZl
bCBiZWZvcmUgY2FsbGluZwo+IG52bWVtX3JlZ2lzdGVyIGZ1bmN0aW9uIGJ1dCBOVk1FTSBmcmFt
ZXdvcmsgd2lsbCB0b2dnbGVkIHRoaXMgR1BJTyBvbgoKdG9nZ2xlCgo+IGVhY2ggd3JpdGUgd2hl
biB0aGlzIEdQSU8gc2hvdWxkIG9ubHkgYmUgY29udHJvbGxlZCBhdCBOQU5EIGxldmVsIGRyaXZl
cgo+IHRvIGVuc3VyZSB0aGF0IHRoZSBXcml0ZSBQcm90ZWN0IGhhcyBub3QgYmVlbiBlbmFibGVk
Lgo+IAo+IEFzIE1URCBmcmFtZXdvcmsgaXMgb25seSB1c2luZyBOVk1FTiBmcmFtZXdvcmsgaW4g
cmVhZCBvbmx5LCBhIHdheSB0byBmaXgKCk5WTUVNCgo+IHRoaXMgY29uZmxpY3QgaXMgdG8gZ2V0
IHRoZSBHUElPIHJlc291cmNlIGF0IE5WTUVNIGxldmVsIG9ubHkgaWYgcmVnX3dyaXRlCj4gQVBJ
IGlzIGRlZmluZWQuIFRoaXMgR1BJTyBpcyBvbmx5IHRvZ2dsZWQgaWYgcmVnX3dyaXRlIG9wcyBp
cyBkZWZpbmVkLgoKVGhlIHNvbHV0aW9uIGxvb2tzIGEgYml0IGhhY2tpc2ggdG8gbWUuCgpUaGUg
bnZtZW1fY29uZmlnIHN0cnVjdHVyZSBhbHJlYWR5IGNvbnRhaW5zIGEgZmllbGQgbmFtZWQgd3Bf
Z3BpbyB3aGljaApzZWVtIHRvIGltcGx5IHRoYXQgY2FsbGVycyBjYW4gcHJvdmlkZSBhIHdwX2dw
aW8gaGFuZGxlIHRoZXJlIGlmIHRoZXkKd2FudC4gQnV0IHlldCB0aGUgbnZtZW0gY29yZSBpZ25v
cmVzIGlmIG5vIGdwaW8gd2FzIHByb3ZpZGVkIGFuZCB3aWxsCnRyeSB0byBnZXQgb25lIGFueXdh
eS4gU2hvdWxkbid0IHRoaXMgYmVoYXZpb3IgYmUgY2hhbmdlZD8KClRoZXJlIGFyZSBhbHJlYWR5
IGEgYmlnIG51bWJlciBvZiBjYWxsZXJzIGZvciBudm1lbV9yZWdpc3RlcigpIHNvIEkKdW5kZXJz
dGFuZCBpdCBtaWdodCBiZSBhIGJpdCB0ZWRpb3VzIHRvIGp1c3QgZHJvcCB0aGUgZWxzZSBwYXJ0
IG9mCnRoYXQgY29uZGl0aW9uLCBidXQgbWF5YmUgd2UgY2FuIHByb3ZpZGUgYSBkdW1teSBjb29r
aWUgaW50byB0aGUKd3BfZ3BpbyBmaWVsZCB3aGljaCB3b3VsZCBiZSBpbnRlcnByZXRlZCBhczog
ImRvbid0IG1lc3Mgd2l0aCBpdCIuIE9yCnBlcmhhcHMgYW4gYWRkaXRpb25hbCBmbGFnIHNvbWV3
aGVyZSBlbHNlIGp1c3QgdG8gY2xlYXJseSBza2lwIHRoZQp3cF9ncGlvIHRoaW5nIGVudGlyZWx5
PwoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxs
b0Bmb3NzLnN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9udm1lbS9jb3JlLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL252bWVtL2NvcmUuYyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4gaW5kZXgg
ZTc2NWQzZDA1NDJlLi5lMTFjNzRkYjY0ZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9udm1lbS9j
b3JlLmMKPiArKysgYi9kcml2ZXJzL252bWVtL2NvcmUuYwo+IEBAIC03NjksNyArNzY5LDcgQEAg
c3RydWN0IG52bWVtX2RldmljZSAqbnZtZW1fcmVnaXN0ZXIoY29uc3Qgc3RydWN0IG52bWVtX2Nv
bmZpZyAqY29uZmlnKQo+ICAKPiAgCWlmIChjb25maWctPndwX2dwaW8pCj4gIAkJbnZtZW0tPndw
X2dwaW8gPSBjb25maWctPndwX2dwaW87Cj4gLQllbHNlCj4gKwllbHNlIGlmIChjb25maWctPnJl
Z193cml0ZSkKPiAgCQludm1lbS0+d3BfZ3BpbyA9IGdwaW9kX2dldF9vcHRpb25hbChjb25maWct
PmRldiwgIndwIiwKPiAgCQkJCQkJICAgIEdQSU9EX09VVF9ISUdIKTsKPiAgCWlmIChJU19FUlIo
bnZtZW0tPndwX2dwaW8pKSB7CgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
