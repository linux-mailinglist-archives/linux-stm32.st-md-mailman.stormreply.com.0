Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B95158B0550
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 11:05:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49852C6DD6D;
	Wed, 24 Apr 2024 09:05:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9AD8C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 09:05:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B16620011;
 Wed, 24 Apr 2024 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713949544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zvGO6wU6nfYU3CkBpCdWWvYmaCRqlnSLXYCRyUMQSHk=;
 b=UNPCHPP3Y0cB0c0DMvt6fosro3QkCwIgQAj1fSJrI8V9T/1B7gT2LfZ5Qu+SZdKiQ6Ky1q
 GTYCqb9aCIeDI4YkLXEY//Rayxy9ROkV2BnZUz2dAD6koRfYdA7Lk2hMml4v8LNNg6410w
 nm0tcKWKft5xD3DW2amnqxy43S10uLE3vEZgX5ck0Zc/eK9fkIrfS6QpDdS9cH5RduhVT/
 B+WvICl8pCyTMSAU2EkAGkJXDUDldrMul1x7iW6UQsIeqk+7dzEQn16pBaknwe6vGYZGz2
 pbQzVA+ja2DG9FekX1vWMl+J+EiVApMsJPUl4ScDR2OV4S+7jXZnDhyVMcOlqA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 24 Apr 2024 11:06:18 +0200
Message-Id: <20240424-rzn1-gmac1-v4-0-852a5f2ce0c0@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIrLKGYC/23NQQ6DIBQE0KsY1qWBL1TpqvdoulD4KEmFBoyxN
 d69xJWmXU4mb2YhCaPDRK7FQiJOLrngcxCngui+8R1SZ3ImwEAwwYDGj+e0GxrN6aWW2taVKg1
 DksEronXzNnYnHkfqcR7JIze9S2OI7+1l4lv/b3DilFHZIrRQK2FqfWtDGJ/On3UYtqEJ9lgdM
 GRcKd0IacHqSv3icoe5POAy46blYEELwbg54nVdv1gmcb0qAQAA
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: devicetree@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/5] net: stmmac: Add support for
 RZN1 GMAC devices
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

SGVsbG8gZXZlcnlvbmUsCgpUaGlzIGlzIHZlcnNpb24gZm91ciBvZiBteSBzZXJpZXMgdGhhdCBh
ZGRzIHN1cHBvcnQgZm9yIGEgR2lnYWJpdCBFdGhlcm5ldApjb250cm9sbGVyIGZlYXR1cmVkIGlu
IHRoZSBSZW5lc2FzIHI5YTA2ZzAzMiBTb0MsIG9mIHRoZSBSWi9OMSBmYW1pbHkuIFRoaXMKR01B
QyBkZXZpY2UgaXMgYmFzZWQgb24gYSBTeW5vcHN5cyBJUCBhbmQgaXMgY29tcGF0aWJsZSB3aXRo
IHRoZSBzdG1tYWMgZHJpdmVyLgoKTXkgZm9ybWVyIGNvbGxlYWd1ZSBDbMOpbWVudCBMw6lnZXIg
b3JpZ2luYWxseSBzZW50IGEgc2VyaWVzIGZvciB0aGlzIGRyaXZlciwKYnV0IGFuIGlzc3VlIGlu
IGJyaW5naW5nIHVwIHRoZSBQQ1MgY2xvY2sgaGFkIGJsb2NrZWQgdGhlIHVwc3RyZWFtaW5nCnBy
b2Nlc3MuIFRoaXMgaXNzdWUgaGFzIHNpbmNlIGJlZW4gcmVzb2x2ZWQgYnkgdGhlIGZvbGxvd2lu
ZyBzZXJpZXM6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAzMjYtcnhjX2J1Z2Zp
eC12Ni0wLTI0YTc0ZTVjNzYxZkBib290bGluLmNvbS8KClRoaXMgc2VyaWVzIGNvbnNpc3RzIG9m
IGEgZGV2aWNldHJlZSBiaW5kaW5nIGRlc2NyaWJpbmcgdGhlIFJaTjEgR01BQwpjb250cm9sbGVy
IElQLCBhIG5vZGUgZm9yIHRoZSBHTUFDMSBkZXZpY2UgaW4gdGhlIHI5YTA2ZzAzMiBTb0MgZGV2
aWNlCnRyZWUsIGFuZCB0aGUgR01BQyBkcml2ZXIgaXRzZWxmIHdoaWNoIGlzIGEgZ2x1ZSBsYXll
ciBpbiBzdG1tYWMuCgpUaGVyZSBhcmUgYWxzbyB0d28gcGF0Y2hlcyBieSBSdXNzZWxsIHRoYXQg
aW1wcm92ZSBwY3MgaW5pdGlhbGl6YXRpb24gaGFuZGxpbmcKaW4gc3RtbWFjLgoKQmVzdCBSZWdh
cmRzLAoKUm9tYWluIEdhbnRvaXMKCi0tLQpDaGFuZ2VzIGluIHY0OgotIFJlbW92ZWQgdGhlIHNl
Y29uZCBwYXJhbWV0ZXJzIG9mIHRoZSBuZXcgcGNzX2luaXQvZXhpdCgpIGNhbGxiYWNrcwotIFJl
bW92ZWQgdW5uZWNlc3NhcnkgaW50ZXJydXB0LXBhcmVudCByZWZlcmVuY2UgaW4gZ21hYzEgZGV2
aWNlIG5vZGUKLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDE1
LXJ6bjEtZ21hYzEtdjMtMC1hYjEyZjJjNDQwMWRAYm9vdGxpbi5jb20KCkNoYW5nZXMgaW4gdjM6
Ci0gRml4ZWQgYSB0eXBvIGluIHRoZSBzb2NmcGdhIHBhdGNoCi0gTGluayB0byB2MjogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDQwOS1yem4xLWdtYWMxLXYyLTAtNzljYTQ1ZjJmYzc5
QGJvb3RsaW4uY29tCgpDaGFuZ2VzIGluIHYyOgotIEFkZCBwY3NfaW5pdC9leGl0IGNhbGxiYWNr
cyBpbiBzdG1tYWMgdG8gc29sdmUgcmFjZSBjb25kaXRpb24KLSBVc2UgcGNzX2luaXQvZXhpdCBj
YWxsYmFja3MgaW4gZHdtYWNfc29jZnBnYSBnbHVlIGxheWVyCi0gTWlzY2VsbGFuZW91cyBkZXZp
Y2UgdHJlZSBiaW5kaW5nIGNvcnJlY3Rpb25zCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI0MDQwMi1yem4xLWdtYWMxLXYxLTAtNWJlMmIyODk0ZDhjQGJvb3RsaW4u
Y29tCgotLS0KQ2zDqW1lbnQgTMOpZ2VyICgzKToKICAgICAgZHQtYmluZGluZ3M6IG5ldDogcmVu
ZXNhcyxyem4xLWdtYWM6IERvY3VtZW50IFJaL04xIEdNQUMgc3VwcG9ydAogICAgICBuZXQ6IHN0
bW1hYzogYWRkIHN1cHBvcnQgZm9yIFJaL04xIEdNQUMKICAgICAgQVJNOiBkdHM6IHI5YTA2ZzAz
MjogZGVzY3JpYmUgR01BQzEKClJ1c3NlbGwgS2luZyAoT3JhY2xlKSAoMik6CiAgICAgIG5ldDog
c3RtbWFjOiBpbnRyb2R1Y2UgcGNzX2luaXQvcGNzX2V4aXQgc3RtbWFjIG9wZXJhdGlvbnMKICAg
ICAgbmV0OiBzdG1tYWM6IGR3bWFjLXNvY2ZwZ2E6IHVzZSBwY3NfaW5pdC9wY3NfZXhpdAoKIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sIHwgIDY2ICsr
KysrKysrKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICA2ICsrCiBhcmNoL2FybS9ib290L2R0cy9yZW5lc2FzL3I5YTA2ZzAzMi5kdHNp
ICAgICAgICAgICB8ICAxOCArKysrCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9LY29uZmlnICAgICAgICB8ICAxMiArKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL01ha2VmaWxlICAgICAgIHwgICAxICsKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLXJ6bjEuYyAgIHwgIDg2ICsrKysrKysrKysrKysrKysrCiAuLi4vbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNvY2ZwZ2EuYyAgICB8IDEwNyArKysrKysr
KysrLS0tLS0tLS0tLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19tYWluLmMgIHwgIDE0ICsrKwogaW5jbHVkZS9saW51eC9zdG1tYWMuaCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKwogOSBmaWxlcyBjaGFuZ2VkLCAyNTggaW5zZXJ0aW9ucygr
KSwgNTQgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogMWMwNGI0NmNiZGRkYzc4ODJlZWI2
NzE1MjEwMzVlYTg4NDI0NWI5ZgpjaGFuZ2UtaWQ6IDIwMjQwNDAyLXJ6bjEtZ21hYzEtNjg1Y2Y4
NzkzZDBlCgpCZXN0IHJlZ2FyZHMsCi0tIApSb21haW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNA
Ym9vdGxpbi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
