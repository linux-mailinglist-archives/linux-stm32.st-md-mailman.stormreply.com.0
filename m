Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3388C370
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 14:31:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 468F4C71289;
	Tue, 26 Mar 2024 13:31:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D612C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:31:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FF27C000F;
 Tue, 26 Mar 2024 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711459903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8MBjRw+XjYP4AGNDE/5givq5CD6fzEROYjULWNw0vo=;
 b=FZueqFr9RmmswTGwgbRXyC9hpG98yS0LOgqA3D1F6Hexn3H2g26L37s4mtXj7Sa5lPoQ2w
 0WpDpeuDj46jql5z50HokXFkfQ1ZDs9++uAuZQ7TaKBEMZxmcmgCn42AlLpz8haFAb79V8
 wwAaqJTOdb4V11YPyU/cD0b3SxEwO3Y8VZSJJ/VGeqkmq9iJ/AmLyo+GowyIUngG8B6K+h
 xQH+emovB5drOgVh/DBF9TDJgYtxv3579l4fpfYhxIi4EwO3I1amFTJCcAojnw/0TPK1Pr
 jtKua6Vh9RlBIY81N4t/azJQIeU5+K+H6jyguCjenTNyukUS95j8PbMqtyUcvg==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 26 Mar 2024 14:32:13 +0100
MIME-Version: 1.0
Message-Id: <20240326-rxc_bugfix-v6-7-24a74e5c761f@bootlin.com>
References: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
In-Reply-To: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND net-next v6 7/7] net: pcs: rzn1-miic:
 Init RX clock early if MAC requires it
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

VGhlIEdNQUMxIGNvbnRyb2xsZXIgaW4gdGhlIFJaTjEgSVAgcmVxdWlyZXMgdGhlIFJYIE1JSSBj
bG9jayBzaWduYWwgdG8gYmUKc3RhcnRlZCBiZWZvcmUgaXQgaW5pdGlhbGl6ZXMgaXRzIG93biBo
YXJkd2FyZSwgdGh1cyBiZWZvcmUgaXQgY2FsbHMKcGh5bGlua19zdGFydC4KCkltcGxlbWVudCB0
aGUgcGNzX3ByZV9pbml0KCkgY2FsbGJhY2sgc28gdGhhdCB0aGUgUlggY2xvY2sgc2lnbmFsIGNh
biBiZQplbmFibGVkIGVhcmx5IGlmIG5lY2Vzc2FyeS4KClJlcG9ydGVkLWJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMzAxMTYxMDM5MjYuMjc2ODY5LTQtY2xlbWVudC5s
ZWdlckBib290bGluLmNvbS8KU2lnbmVkLW9mZi1ieTogUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5n
YW50b2lzQGJvb3RsaW4uY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPgotLS0KIGRyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMgfCAyOCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMgYi9kcml2ZXJzL25ldC9w
Y3MvcGNzLXJ6bjEtbWlpYy5jCmluZGV4IDRiZDY2ZmRkZTM2Ny4uZDBhNzIyZDQzMzY4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC9wY3MvcGNzLXJ6bjEtbWlpYy5jCisrKyBiL2RyaXZlcnMvbmV0
L3Bjcy9wY3MtcnpuMS1taWljLmMKQEAgLTI3OSwxMCArMjc5LDM4IEBAIHN0YXRpYyBpbnQgbWlp
Y192YWxpZGF0ZShzdHJ1Y3QgcGh5bGlua19wY3MgKnBjcywgdW5zaWduZWQgbG9uZyAqc3VwcG9y
dGVkLAogCXJldHVybiAtRUlOVkFMOwogfQogCitzdGF0aWMgaW50IG1paWNfcHJlX2luaXQoc3Ry
dWN0IHBoeWxpbmtfcGNzICpwY3MpCit7CisJc3RydWN0IG1paWNfcG9ydCAqbWlpY19wb3J0ID0g
cGh5bGlua19wY3NfdG9fbWlpY19wb3J0KHBjcyk7CisJc3RydWN0IG1paWMgKm1paWMgPSBtaWlj
X3BvcnQtPm1paWM7CisJdTMyIHZhbCwgbWFzazsKKworCS8qIFN0YXJ0IFJYIGNsb2NrIGlmIHJl
cXVpcmVkICovCisJaWYgKHBjcy0+cnhjX2Fsd2F5c19vbikgeworCQkvKiBJbiBNSUkgdGhyb3Vn
aCBtb2RlLCB0aGUgY2xvY2sgc2lnbmFscyB3aWxsIGJlIGRyaXZlbiBieSB0aGUKKwkJICogZXh0
ZXJuYWwgUEhZLCB3aGljaCBtaWdodCBub3QgYmUgaW5pdGlhbGl6ZWQgeWV0LiBTZXQgUk1JSQor
CQkgKiBhcyBkZWZhdWx0IG1vZGUgdG8gZW5zdXJlIHRoYXQgYSByZWZlcmVuY2UgY2xvY2sgc2ln
bmFsIGlzCisJCSAqIGdlbmVyYXRlZC4KKwkJICovCisJCW1paWNfcG9ydC0+aW50ZXJmYWNlID0g
UEhZX0lOVEVSRkFDRV9NT0RFX1JNSUk7CisKKwkJdmFsID0gRklFTERfUFJFUChNSUlDX0NPTlZD
VFJMX0NPTlZfTU9ERSwgQ09OVl9NT0RFX1JNSUkpIHwKKwkJICAgICAgRklFTERfUFJFUChNSUlD
X0NPTlZDVFJMX0NPTlZfU1BFRUQsIENPTlZfTU9ERV8xMDBNQlBTKTsKKwkJbWFzayA9IE1JSUNf
Q09OVkNUUkxfQ09OVl9NT0RFIHwgTUlJQ19DT05WQ1RSTF9DT05WX1NQRUVEOworCisJCW1paWNf
cmVnX3JtdyhtaWljLCBNSUlDX0NPTlZDVFJMKG1paWNfcG9ydC0+cG9ydCksIG1hc2ssIHZhbCk7
CisKKwkJbWlpY19jb252ZXJ0ZXJfZW5hYmxlKG1paWMsIG1paWNfcG9ydC0+cG9ydCwgMSk7CisJ
fQorCisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGh5bGlua19wY3Nfb3Bz
IG1paWNfcGh5bGlua19vcHMgPSB7CiAJLnBjc192YWxpZGF0ZSA9IG1paWNfdmFsaWRhdGUsCiAJ
LnBjc19jb25maWcgPSBtaWljX2NvbmZpZywKIAkucGNzX2xpbmtfdXAgPSBtaWljX2xpbmtfdXAs
CisJLnBjc19wcmVfaW5pdCA9IG1paWNfcHJlX2luaXQsCiB9OwogCiBzdHJ1Y3QgcGh5bGlua19w
Y3MgKm1paWNfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpu
cCkKCi0tIAoyLjQ0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
