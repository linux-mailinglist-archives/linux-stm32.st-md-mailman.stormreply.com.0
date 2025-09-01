Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6F5B3E2C3
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Sep 2025 14:26:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80C8AC349C2;
	Mon,  1 Sep 2025 12:26:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFB53C3F949
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Sep 2025 12:26:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 66A9A1A0D2B;
 Mon,  1 Sep 2025 12:26:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E86060699;
 Mon,  1 Sep 2025 12:26:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 533BE1C22D935; 
 Mon,  1 Sep 2025 14:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1756729576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SFNATNLdkkhOB5Wp70sKdHDjY39hB6qXWiRzlnD4aTQ=;
 b=bFhzcgjyq8a1r+ZKtRxUtY4dg0rai4FuY7GOmJcUuWg6W3UMSRflyHOmvhZi4nyF9sV40q
 CHwCU7T5UCZAtb3g0f1aeq+gNSERRaebP/u2QlruxkarvrEt+ZMX4ciwccjhsAlBt0XtIO
 valKroBjETgrkxYAuOqZeipXma1Fww4vmArdEwJUx+SPh/o3LPd9qHyaPFv/pzGlHxt/SI
 6ZDBWED6Sm73oezo8vcc7U+2gOFmLESBSpyFbafu4ab1f4sFoWV2i9JOlO+AP5DYBWFSym
 tuBQm967OYg0BNnmTRuX8wIIm+pcp67E7KpWUCaknN2n4C3Kiowqxa9WH8tF9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20250812-fix-ecc-overwrite-v1-1-6585c55c88b0@foss.st.com>
References: <20250812-fix-ecc-overwrite-v1-1-6585c55c88b0@foss.st.com>
Message-Id: <175672957522.48300.12612690456292698217.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:15 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
Cc: stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: fix ECC
	overwrite
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

T24gVHVlLCAxMiBBdWcgMjAyNSAwOTozMDowOCArMDIwMCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdy
b3RlOgo+IEluIGNhc2UgT09CIHdyaXRlIGlzIHJlcXVlc3RlZCBkdXJpbmcgYSBkYXRhIHdyaXRl
LCBFQ0MgaXMgY3VycmVudGx5Cj4gbG9zdC4gQXZvaWQgdGhpcyBpc3N1ZSBieSBvbmx5IHdyaXRp
bmcgaW4gdGhlIGZyZWUgc3BhcmUgYXJlYS4KPiBUaGlzIGlzc3VlIGhhcyBiZWVuIHNlZW4gd2l0
aCBhIFlBRkZTMiBmaWxlIHN5c3RlbS4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGZpeCBFQ0Mgb3ZlcndyaXRlCiAg
ICAgIGNvbW1pdDogODExYzBkYTQ1NDJkZjNjMDY1ZjZjYjg0M2NlZDY4NzgwZTI3YmI0NAoKUGF0
Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpw
YXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0
aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
