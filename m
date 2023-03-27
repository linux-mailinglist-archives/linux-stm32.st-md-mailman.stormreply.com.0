Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7656CA191
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 12:40:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A84AC6905A;
	Mon, 27 Mar 2023 10:40:27 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E74E4C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 10:40:25 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D7EA240007;
 Mon, 27 Mar 2023 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1679913625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZpY9DCD1mIaNAsPVXMMa+YinIpx3N0fqEpjuBj6oEgU=;
 b=haaZrui7oihw9UxnD9hWxKhhodZldU8nVgUk/o79O2xruhBzUpYSFboH3DBRS0CyahwMy/
 WAi/T/WcjNKw2MGa5Su6mZ4ODfaVfdIeaqJXbSy+CrpVGHbv0hz6pvN9MEvknGROezkFNn
 DF98wpGGvAI+10e5HBF8FDv7GiZYUAWzb1VOdfNmDI3eL7VVSAAzj7PrK2IYiMRR1NTClY
 TPDlzydssppIUJRlOZkDMPtUrtKfMBQ1fx27DF3DQtTr4oYIHomad1psshvFqiHii4cmpi
 q/3DPPOxo632nbi8TIIFZgzHBHvmPq+x7DjIEf+ibJNxVif6AiokjI9YKRPirQ==
Date: Mon, 27 Mar 2023 12:40:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Message-ID: <20230327124022.4bb32839@xps-13>
In-Reply-To: <a17cd888-ef4d-ced0-adba-c6a6abdba51a@linaro.org>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-2-christophe.kerello@foss.st.com>
 <a17cd888-ef4d-ced0-adba-c6a6abdba51a@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 1/2] mtd: rawnand: stm32_fmc2: do not
 support EDO mode
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNyBNYXIg
MjAyMyAxMToyOTo1NiArMDEwMDoKCj4gSGksCj4gCj4gT24gMy8yNy8yMyAxMDo0NywgQ2hyaXN0
b3BoZSBLZXJlbGxvIHdyb3RlOgo+ID4gRk1DMiBjb250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQg
RURPIG1vZGUgKHRpbWluZ3MgbW9kZSA0IGFuZCA1KS4KPiA+ICAgCj4gCj4gY29tbWl0IHN1Ympl
Y3QgYW5kIG1lc3NhZ2Ugc2hvdWxkIGJlIGluIGltcGVyYXRpdmUgbW9vZCwgc28gSSB3b3VsZAo+
IGNoYW5nZSB0aGUgY29tbWl0IHN1YmplY3QgdG8gIm10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjog
UmVtb3ZlCj4gdW5zdXBwb3J0ZWQgRURPIG1vZGUiIGFuZCB0aGUgbWVzc2FnZSB0byBzb21ldGhp
bmcgbGlrZSAiUmVtb3ZlIHRoZSBFRE8KPiBtb2RlIHN1cHBvcnQgZnJvbSBhcyB0aGUgRk1DMiBj
b250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQgdGhlIGZlYXR1cmUuIgo+IEV4dHJhIHBvaW50cyBp
ZiB5b3UgZGVzY3JpYmUgd2hhdCBoYXBwZW5lZCB3aGVuIHlvdSB1c2VkIHRpbWluZ3MgbW9kZSA0
Cj4gYW5kIDUgd2l0aCB0aGUgY3VycmVudCB2ZXJzaW9uIG9mIHRoZSBkcml2ZXIuCj4gCj4gTWlx
dWVsLCBjb3VsZCB5b3UgYWRkIENjIHRvIHN0YWJsZSB3aGVuIGFwcGx5aW5nPwo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCgpZZXMsIGFic29sdXRlbHkuCgo+IAo+ID4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4g
PiBGaXhlczogMmNkNDU3ZjMyOGMxICgibXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBhZGQgU1RN
MzIgRk1DMiBOQU5EIGZsYXNoIGNvbnRyb2xsZXIgZHJpdmVyIikgIAo+IAo+IFJldmlld2VkLWJ5
OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4gCj4gPiAtLS0KPiA+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDMgKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9z
dG0zMl9mbWMyX25hbmQuYwo+ID4gaW5kZXggNWQ2MjcwNDhjNDIwLi4zYWJiNjNkMDBhMGIgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiA+IEBAIC0xNTMx
LDYgKzE1MzEsOSBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3NldHVwX2ludGVyZmFjZShz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+ID4gIAlpZiAoSVNfRVJSKHNkcnQp
KQo+ID4gIAkJcmV0dXJuIFBUUl9FUlIoc2RydCk7Cj4gPiAgCj4gPiArCWlmIChzZHJ0LT50UkNf
bWluIDwgMzAwMDApCj4gPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiArCj4gPiAgCWlmIChj
aGlwbnIgPT0gTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkpCj4gPiAgCQlyZXR1cm4gMDsKPiA+
ICAgIAoKClRoYW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
