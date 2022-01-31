Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 795FD4A487F
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jan 2022 14:43:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2093EC5EC43;
	Mon, 31 Jan 2022 13:43:14 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F2C3C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 13:43:13 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8F55A200014;
 Mon, 31 Jan 2022 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643636592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNzzdrv2WUeULNwAyESjeTV+GL3fcftB5PM2h9pueek=;
 b=McTkn4xGuStHaGZwMMzwEHdXEZ1ZTskZtYmiln/jpDbssu2slFXlEV0LkL+BjV1Csi94cy
 9TAoEDRKoFgK8o8b+26uxzMYFbqL3EsqyKjcjPu5iI+T7Dh6DRmHzr7zbhBvFvureek5L/
 9j/d0wKtOMG8f/th0CbBOcF/rGk46muyGCzJeghyKaqufm7fHi36K62rU+SDmKYBXbrqxM
 lIYN4k8ATVj/mEXwnVfqp0O0/aKlOqxLVb0U7umRvs6JOiIRznkOhckJWye/Uxd3p4i9Gl
 JYhRsEVxixoBHmncpmVbF2B8JcDv36S8ZniYGtWZ8dzuAUbt7c4aFH2KcxDIVA==
Date: Mon, 31 Jan 2022 14:43:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20220131144309.0ffe7cc8@xps13>
In-Reply-To: <20220131095755.8981-5-christophe.kerello@foss.st.com>
References: <20220131095755.8981-1-christophe.kerello@foss.st.com>
 <20220131095755.8981-5-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, vigneshr@ti.com,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH v2 4/4] mtd: core: Fix a conflict between
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

SGkgVmlnbmVzaCwgVHVkb3J5LCBQcmF0eXVzaCwKCisgVHVkb3IgYW5kIFByYXR5dXNoCgpjaHJp
c3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20gd3JvdGUgb24gTW9uLCAzMSBKYW4gMjAyMiAxMDo1
Nzo1NSArMDEwMDoKCj4gV3AtZ3Bpb3MgcHJvcGVydHkgY2FuIGJlIHVzZWQgb24gTlZNRU0gbm9k
ZXMgYW5kIHRoZSBzYW1lIHByb3BlcnR5IGNhbgo+IGJlIGFsc28gdXNlZCBvbiBNVEQgTkFORCBu
b2Rlcy4gSW4gY2FzZSBvZiB0aGUgd3AtZ3Bpb3MgcHJvcGVydHkgaXMKPiBkZWZpbmVkIGF0IE5B
TkQgbGV2ZWwgbm9kZSwgdGhlIEdQSU8gbWFuYWdlbWVudCBpcyBkb25lIGF0IE5BTkQgZHJpdmVy
Cj4gbGV2ZWwuIFdyaXRlIHByb3RlY3QgaXMgZGlzYWJsZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHBy
b2JlZCBvciByZXN1bWVkCj4gYW5kIGlzIGVuYWJsZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHJlbGVh
c2VkIG9yIHN1c3BlbmRlZC4KPiAKPiBXaGVuIG5vIHBhcnRpdGlvbnMgYXJlIGRlZmluZWQgaW4g
dGhlIE5BTkQgRFQgbm9kZSwgdGhlbiB0aGUgTkFORCBEVCBub2RlCj4gd2lsbCBiZSBwYXNzZWQg
dG8gTlZNRU0gZnJhbWV3b3JrLiBJZiB3cC1ncGlvcyBwcm9wZXJ0eSBpcyBkZWZpbmVkIGluCj4g
dGhpcyBub2RlLCB0aGUgR1BJTyByZXNvdXJjZSBpcyB0YWtlbiB0d2ljZSBhbmQgdGhlIE5BTkQg
Y29udHJvbGxlcgo+IGRyaXZlciBmYWlscyB0byBwcm9iZS4KPiAKPiBBIG5ldyBCb29sZWFuIGZs
YWcgbmFtZWQgc2tpcF93cF9ncGlvIGhhcyBiZWVuIGFkZGVkIGluIG52bWVtX2NvbmZpZy4KPiBJ
biBjYXNlIHNraXBfd3BfZ3BpbyBpcyBzZXQsIGl0IG1lYW5zIHRoYXQgdGhlIEdQSU8gaXMgaGFu
ZGxlZCBieSB0aGUKPiBwcm92aWRlci4gTGV0cyBzZXQgdGhpcyBmbGFnIGluIE1URCBsYXllciB0
byBhdm9pZCB0aGUgY29uZmxpY3Qgb24KPiB3cF9ncGlvcyBwcm9wZXJ0eS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkY29yZS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUu
YyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IGluZGV4IDcwZjQ5MmRjZTE1OC4uZTZkMjUxNTk0
ZGVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL210ZGNvcmUuYwo+IEBAIC01NDYsNiArNTQ2LDcgQEAgc3RhdGljIGludCBtdGRfbnZtZW1f
YWRkKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAJY29uZmlnLnN0cmlkZSA9IDE7Cj4gIAljb25m
aWcucmVhZF9vbmx5ID0gdHJ1ZTsKPiAgCWNvbmZpZy5yb290X29ubHkgPSB0cnVlOwo+ICsJY29u
ZmlnLnNraXBfd3BfZ3BpbyA9IHRydWU7Cj4gIAljb25maWcubm9fb2Zfbm9kZSA9ICFvZl9kZXZp
Y2VfaXNfY29tcGF0aWJsZShub2RlLCAibnZtZW0tY2VsbHMiKTsKPiAgCWNvbmZpZy5wcml2ID0g
bXRkOwo+ICAKPiBAQCAtODMzLDYgKzgzNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbnZtZW1fZGV2aWNl
ICptdGRfb3RwX252bWVtX3JlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+ICAJY29uZmln
Lm93bmVyID0gVEhJU19NT0RVTEU7Cj4gIAljb25maWcudHlwZSA9IE5WTUVNX1RZUEVfT1RQOwo+
ICAJY29uZmlnLnJvb3Rfb25seSA9IHRydWU7Cj4gKwljb25maWcuc2tpcF93cF9ncGlvID0gdHJ1
ZTsKPiAgCWNvbmZpZy5yZWdfcmVhZCA9IHJlZ19yZWFkOwo+ICAJY29uZmlnLnNpemUgPSBzaXpl
Owo+ICAJY29uZmlnLm9mX25vZGUgPSBucDsKClRMRFI6IFRoZXJlIGlzIGEgY29uZmxpY3QgYmV0
d2VlbiBNVEQgYW5kIE5WTUVNLCB3aG8gc2hvdWxkIGhhbmRsZSB0aGUKV1AgcGluIHdoZW4gdGhl
cmUgaXMgb25lPyBBdCBsZWFzdCBmb3IgcmF3IE5BTkQgZGV2aWNlcywgSSBkb24ndCB3YW50CnRo
ZSBOVk1FTSBjb3JlIHRvIGhhbmRsZSB0aGUgd3AgcGluLiBTbyB3ZSd2ZSBpbnRyb2R1Y2VkIHRo
aXMKc2tpcF93cF9ncGlvIG52bWVtIGNvbmZpZyBvcHRpb24uIEJ1dCB0aGVyZSBhcmUgdHdvIHBs
YWNlcyB3aGVyZSB0aGlzCmJvb2xlYW4gY2FuIGJlIHNldCBhbmQgb25lIG9mIHRoZXNlIGlzIGZv
ciBvdHAgcmVnaW9ucyAoc2VlIGFib3ZlKS4gSW4KdGhpcyBjYXNlLCBJIGRvbid0IGtub3cgaWYg
aXQgaXMgc2FmZSBvciBpZiBDRkkvU1BJLU5PUiByZWx5IG9uIHRoZQpudm1lbSBwcm90ZWN0aW9u
LiBQbGVhc2UgdGVsbCB1cyBpZiB5b3UgdGhpbmsgdGhpcyBpcyBmaW5lIGZvciB5b3UuCgpUaGFu
a3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
