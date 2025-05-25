Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A748AAC3410
	for <lists+linux-stm32@lfdr.de>; Sun, 25 May 2025 13:07:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42831C78F6F;
	Sun, 25 May 2025 11:07:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA8FDC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 May 2025 11:07:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28E055C5AF5;
 Sun, 25 May 2025 11:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71763C4CEEA;
 Sun, 25 May 2025 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748171233;
 bh=qpXaGvujtarEfKk3BiIc4HM0wrXt417FYc6nr/MLq9I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=trQwOgRO3ZBurIDEXNGoXPzj74AfvQE1XK6bGsrIANWvbrjZnmGyGFYMeopZANPnE
 KmYX19dVAgxqsH3yI2zkZJh3mH/1zP48IP3bSQIBL4TS+0B0ooRou05sO69obTLaHN
 68bbcSKlAAWdjz2wXUVrtI6/N8p8NUn8GOL0PUnrSwwN5/WBL9iIMOfS8F3maHrAJR
 KEBLoYrZKtv8c5diphgYPxAJHdYs6LBlXv+ULmf4LrbZ5pJ/TkUFz/Y2aUu8OvWZ4A
 RkCvmOrCOpfCY/r3c/pJt83E5n8Qw9gMp1hHfqUK6gPbmb+8rZk3c81NprMUwhdF+Y
 Bios84jblFpKw==
Date: Sun, 25 May 2025 12:07:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Message-ID: <20250525120703.5dd89fc2@jic23-huawei>
In-Reply-To: <229cf78caaa7e9f2bb4cfa62c019acd51a1cd684.camel@gmail.com>
References: <20250515083101.3811350-1-nichen@iscas.ac.cn>
 <229cf78caaa7e9f2bb4cfa62c019acd51a1cd684.camel@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: andy@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>, nuno.sa@analog.com,
 u.kleine-koenig@baylibre.com, mcoquelin.stm32@gmail.com, tglx@linutronix.de,
 dlechner@baylibre.com, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: Fix race in
 installing chained IRQ handler
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

T24gVGh1LCAxNSBNYXkgMjAyNSAxMToyNjo1NiArMDEwMApOdW5vIFPDoSA8bm9uYW1lLm51bm9A
Z21haWwuY29tPiB3cm90ZToKCj4gT24gVGh1LCAyMDI1LTA1LTE1IGF0IDE2OjMxICswODAwLCBD
aGVuIE5pIHdyb3RlOgo+ID4gRml4IGEgcmFjZSB3aGVyZSBhIHBlbmRpbmcgaW50ZXJydXB0IGNv
dWxkIGJlIHJlY2VpdmVkIGFuZCB0aGUgaGFuZGxlcgo+ID4gY2FsbGVkIGJlZm9yZSB0aGUgaGFu
ZGxlcidzIGRhdGEgaGFzIGJlZW4gc2V0dXAsIGJ5IGNvbnZlcnRpbmcgdG8KPiA+IGlycV9zZXRf
Y2hhaW5lZF9oYW5kbGVyX2FuZF9kYXRhKCkuCj4gPiAKPiA+IEZpeGVzOiBkNThjNjdkMWQ4NTEg
KCJpaW86IGFkYzogc3RtMzItYWRjOiBhZGQgc3VwcG9ydCBmb3IgU1RNMzJNUDEiKQo+ID4gU2ln
bmVkLW9mZi1ieTogQ2hlbiBOaSA8bmljaGVuQGlzY2FzLmFjLmNuPgo+ID4gLS0tICAKPiAKPiBS
ZXZpZXdlZC1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KTG9va3MgZ29vZCB0byBt
ZSBhbmQgSSd2ZSBxdWV1ZWQgaXQgdXAgZm9yIGFmdGVyIHJjMS4gIElmIGFueQpTVCBmb2xrIGhh
dmUgdGltZSB0byB0YWtlIGEgbG9vayB0aGF0IHdvdWxkIGJlIGdyZWF0LgoKSm9uYXRoYW4KCj4g
Cj4gPiBDaGFuZ2Vsb2c6Cj4gPiAKPiA+IHYxIC0+IHYyOgo+ID4gCj4gPiAxLiBBZGQgRml4ZXMg
dGFnLgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jIHwgNyAr
KystLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUu
YyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtCj4gPiBjb3JlLmMKPiA+IGluZGV4IGJkMzQ1
ODk2NWJmZi4uMjFjMDRhOThiM2I2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9paW8vYWRjL3N0
bTMyLWFkYy1jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5j
Cj4gPiBAQCAtNDMwLDEwICs0MzAsOSBAQCBzdGF0aWMgaW50IHN0bTMyX2FkY19pcnFfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZQo+ID4gKnBkZXYsCj4gPiDCoAkJcmV0dXJuIC1FTk9NRU07
Cj4gPiDCoAl9Cj4gPiDCoAo+ID4gLQlmb3IgKGkgPSAwOyBpIDwgcHJpdi0+Y2ZnLT5udW1faXJx
czsgaSsrKSB7Cj4gPiAtCQlpcnFfc2V0X2NoYWluZWRfaGFuZGxlcihwcml2LT5pcnFbaV0sIHN0
bTMyX2FkY19pcnFfaGFuZGxlcik7Cj4gPiAtCQlpcnFfc2V0X2hhbmRsZXJfZGF0YShwcml2LT5p
cnFbaV0sIHByaXYpOwo+ID4gLQl9Cj4gPiArCWZvciAoaSA9IDA7IGkgPCBwcml2LT5jZmctPm51
bV9pcnFzOyBpKyspCj4gPiArCQlpcnFfc2V0X2NoYWluZWRfaGFuZGxlcl9hbmRfZGF0YShwcml2
LT5pcnFbaV0sCj4gPiArCQkJCQkJIHN0bTMyX2FkY19pcnFfaGFuZGxlciwKPiA+IHByaXYpOwo+
ID4gwqAKPiA+IMKgCXJldHVybiAwOwo+ID4gwqB9ICAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
