Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D92B3E2C1
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Sep 2025 14:26:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 740A9C349C2;
	Mon,  1 Sep 2025 12:26:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51CF5C36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Sep 2025 12:26:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F4188C8F1CA;
 Mon,  1 Sep 2025 12:26:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CD7A060699;
 Mon,  1 Sep 2025 12:26:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63DFD1C22D4DC; 
 Mon,  1 Sep 2025 14:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1756729575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jfBjyfo26o556nYIaOxd76pUYR9GB6/0sA+87NT+4x8=;
 b=rt1Rbw3zcTPUue49SXLIRf8FXerPpqAtXDyHoC58kowt+IPGCOJ+OZT6GwaYpKB3VcBESO
 O7+GzFBF5/XLeDvNylSecqCeOT2ErTYO1HIDMfZ80tL6fVmgg8PGhcJfFpRY/lRZjO9Fa8
 DpPv1GehPdVDoKFYXNMOzrofvqyv3wAbAQirDvZJSfh7GJBYCqsF/7cH7AGO8eCOETDQn3
 YIK0YzbPnLqb5cMv328PCfDFiQXQXpIHX6pnkSqekDVkaQLa/Zlqi2YesVNDWuXNC24tiN
 xd4ELJxe3crX/UqryFGTPxfN2WeZ6tLSaEUs8wrhWR7qXrILNpykFWmVQ5SaTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20250812-fix-dma-overlapping-v1-1-c3bf81d79de7@foss.st.com>
References: <20250812-fix-dma-overlapping-v1-1-c3bf81d79de7@foss.st.com>
Message-Id: <175672956825.48300.17672070424508952641.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
Cc: stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: avoid
 overlapping mappings on ECC buffer
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

T24gVHVlLCAxMiBBdWcgMjAyNSAwOToyNjo1OCArMDIwMCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdy
b3RlOgo+IEF2b2lkIGJlbG93IG92ZXJsYXBwaW5nIG1hcHBpbmdzIGJ5IHVzaW5nIGEgY29udGln
dW91cwo+IG5vbi1jYWNoZWFibGUgYnVmZmVyLgo+IAo+IFsgICAgNC4wNzc3MDhdIERNQS1BUEk6
IHN0bTMyX2ZtYzJfbmZjIDQ4ODEwMDAwLm5hbmQtY29udHJvbGxlcjogY2FjaGVsaW5lIHRyYWNr
aW5nIEVFWElTVCwKPiBvdmVybGFwcGluZyBtYXBwaW5ncyBhcmVuJ3Qgc3VwcG9ydGVkCj4gWyAg
ICA0LjA4OTEwM10gV0FSTklORzogQ1BVOiAxIFBJRDogNDQgYXQga2VybmVsL2RtYS9kZWJ1Zy5j
OjU2OCBhZGRfZG1hX2VudHJ5KzB4MjNjLzB4MzAwCj4gWyAgICA0LjA5NzA3MV0gTW9kdWxlcyBs
aW5rZWQgaW46Cj4gWyAgICA0LjEwMDEwMV0gQ1BVOiAxIFBJRDogNDQgQ29tbToga3dvcmtlci91
NDoyIE5vdCB0YWludGVkIDYuMS44MiAjMQo+IFsgICAgNC4xMDYzNDZdIEhhcmR3YXJlIG5hbWU6
IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMjU3RiBWQUxJRDEgU05PUiAvIE1CMTcwNCAoTFBE
RFI0IFBvd2VyIGRpc2NyZXRlKSArIE1CMTcwMyArIE1CMTcwOCAoU05PUiBNQjE3MzApIChEVCkK
PiBbICAgIDQuMTE4ODI0XSBXb3JrcXVldWU6IGV2ZW50c191bmJvdW5kIGRlZmVycmVkX3Byb2Jl
X3dvcmtfZnVuYwo+IFsgICAgNC4xMjQ2NzRdIHBzdGF0ZTogNjAwMDAwMDUgKG5aQ3YgZGFpZiAt
UEFOIC1VQU8gLVRDTyAtRElUIC1TU0JTIEJUWVBFPS0tKQo+IFsgICAgNC4xMzE2MjRdIHBjIDog
YWRkX2RtYV9lbnRyeSsweDIzYy8weDMwMAo+IFsgICAgNC4xMzU2NThdIGxyIDogYWRkX2RtYV9l
bnRyeSsweDIzYy8weDMwMAo+IFsgICAgNC4xMzk3OTJdIHNwIDogZmZmZjgwMDAwOWRiYjQ5MAo+
IFsgICAgNC4xNDMwMTZdIHgyOTogZmZmZjgwMDAwOWRiYjRhMCB4Mjg6IDAwMDAwMDAwMDQwMDgw
MjIgeDI3OiBmZmZmODAwMDA5OGE2MDAwCj4gWyAgICA0LjE1MDE3NF0geDI2OiAwMDAwMDAwMDAw
MDAwMDAwIHgyNTogZmZmZjgwMDAwOTllNzAwMCB4MjQ6IGZmZmY4MDAwMDk5ZTdkZTgKPiBbICAg
IDQuMTU3MjMxXSB4MjM6IDAwMDAwMDAwZmZmZmZmZmYgeDIyOiAwMDAwMDAwMDAwMDAwMDAwIHgy
MTogZmZmZjgwMDAwOThhNmEyMAo+IFsgICAgNC4xNjQzODhdIHgyMDogZmZmZjAwMDA4MDk2NDE4
MCB4MTk6IGZmZmY4MDAwMDk4MTliYTAgeDE4OiAwMDAwMDAwMDAwMDAwMDA2Cj4gWyAgICA0LjE3
MTU0NV0geDE3OiA2MzYxNzI3NDIwNjU2ZTY5IHgxNjogNmM2NTY4NjM2MTYzMjAzYSB4MTU6IDcy
NjU2YzZjNmY3Mjc0NmUKPiBbICAgIDQuMTc4NjAyXSB4MTQ6IDZmNjMyZDY0NmU2MTZlMmUgeDEz
OiBmZmZmODAwMDA5ODMyZjU4IHgxMjogMDAwMDAwMDAwMDAwMDRlYwo+IFsgICAgNC4xODU3NTld
IHgxMTogMDAwMDAwMDAwMDAwMDFhNCB4MTA6IGZmZmY4MDAwMDk4OGFmNTggeDkgOiBmZmZmODAw
MDA5ODMyZjU4Cj4gWyAgICA0LjE5MjkxNl0geDggOiAwMDAwMDAwMGZmZmZlZmZmIHg3IDogZmZm
ZjgwMDAwOTg4YWY1OCB4NiA6IDgwMDAwMDAwZmZmZmYwMDAKPiBbICAgIDQuMTk5OTcyXSB4NSA6
IDAwMDAwMDAwMDAwMGJmZjQgeDQgOiAwMDAwMDAwMDAwMDAwMDAwIHgzIDogMDAwMDAwMDAwMDAw
MDAwMAo+IFsgICAgNC4yMDcxMjhdIHgyIDogMDAwMDAwMDAwMDAwMDAwMCB4MSA6IDAwMDAwMDAw
MDAwMDAwMDAgeDAgOiBmZmZmMDAwMDgxMmQyYzQwCj4gWyAgICA0LjIxNDE4NV0gQ2FsbCB0cmFj
ZToKPiBbICAgIDQuMjE2NjA1XSAgYWRkX2RtYV9lbnRyeSsweDIzYy8weDMwMAo+IFsgICAgNC4y
MjAzMzhdICBkZWJ1Z19kbWFfbWFwX3NnKzB4MTk4LzB4MzUwCj4gWyAgICA0LjIyNDM3M10gIF9f
ZG1hX21hcF9zZ19hdHRycysweGEwLzB4MTEwCj4gWyAgICA0LjIyODQxMV0gIGRtYV9tYXBfc2df
YXR0cnMrMHgxMC8weDJjCj4gWyAgICA0LjIzMjI0N10gIHN0bTMyX2ZtYzJfbmZjX3hmZXIuaXNy
YS4wKzB4MWM4LzB4M2ZjCj4gWyAgICA0LjIzNzA4OF0gIHN0bTMyX2ZtYzJfbmZjX3NlcV9yZWFk
X3BhZ2UrMHhjOC8weDE3NAo+IFsgICAgNC4yNDIxMjddICBuYW5kX3JlYWRfb29iKzB4MWQ0LzB4
OGUwCj4gWyAgICA0LjI0NTg2MV0gIG10ZF9yZWFkX29vYl9zdGQrMHg1OC8weDg0Cj4gWyAgICA0
LjI0OTU5Nl0gIG10ZF9yZWFkX29vYisweDkwLzB4MTUwCj4gWyAgICA0LjI1MzIzMV0gIG10ZF9y
ZWFkKzB4NjgvMHhhYwo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoK
WzEvMV0gbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBhdm9pZCBvdmVybGFwcGluZyBtYXBwaW5n
cyBvbiBFQ0MgYnVmZmVyCiAgICAgIGNvbW1pdDogNTEzYzQwZTU5ZDVhNDE0YWI3NjNhOWM4NDc5
NzUzNGI1ZThjMjA4ZAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4
LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJv
Ym90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
