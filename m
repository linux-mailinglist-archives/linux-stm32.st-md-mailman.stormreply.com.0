Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E83F385D8AA
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 14:04:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1323C6C859;
	Wed, 21 Feb 2024 13:04:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AA3BC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 13:04:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59B55E0012;
 Wed, 21 Feb 2024 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708520645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HVv/irSZsVEd7MEnAXEKn02UcIst/9mjY7zWWotaAA=;
 b=GNa/TLIvrmKwcJiM1BoXd/8/HU7QEh7sVmGZPiKI2vsnY3woLYMhp1/3JXGbu0Ip9Ck9u7
 2UmukJX4O2IudlUI3YtW0Vr+zMVRojXi80H5u0W0n7vq0epLfR5PU+BjzzKE5v63p8jJHa
 YVqRHmLCEB7F454fsGvX7agRfcjStaTIeH29XIt8jqqT2IBu70JVajiIQUpWOD+Wo6WaIU
 twVKw/EOfKtLlxQKvIQiBQuOZNz00rOQyx4dLmFVNAYIMYzzZYcZQiKGU0Ts6xRwiGvzX8
 25XoSEHmO+uYmW1p8ocPFvdPc4rVV5hplamUOoHBAfv8Dz0ONXkOjj5CL5R3DA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 21 Feb 2024 14:04:24 +0100
MIME-Version: 1.0
Message-Id: <20240221-rxc_bugfix-v4-7-4883ee1cc7b1@bootlin.com>
References: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com>
In-Reply-To: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 7/7] net: pcs: rzn1-miic: Init RX
 clock early if MAC requires it
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
YW50b2lzQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMg
fCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMg
Yi9kcml2ZXJzL25ldC9wY3MvcGNzLXJ6bjEtbWlpYy5jCmluZGV4IGQ5M2Y4NGZiYjFmZC4uOGE2
ODNjNzZhMGYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9wY3MvcGNzLXJ6bjEtbWlpYy5jCisr
KyBiL2RyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMKQEAgLTI3OSwxMCArMjc5LDM4IEBA
IHN0YXRpYyBpbnQgbWlpY192YWxpZGF0ZShzdHJ1Y3QgcGh5bGlua19wY3MgKnBjcywgdW5zaWdu
ZWQgbG9uZyAqc3VwcG9ydGVkLAogCXJldHVybiAtRUlOVkFMOwogfQogCitzdGF0aWMgaW50IG1p
aWNfcHJlX2luaXQoc3RydWN0IHBoeWxpbmtfcGNzICpwY3MpCit7CisJc3RydWN0IG1paWNfcG9y
dCAqbWlpY19wb3J0ID0gcGh5bGlua19wY3NfdG9fbWlpY19wb3J0KHBjcyk7CisJc3RydWN0IG1p
aWMgKm1paWMgPSBtaWljX3BvcnQtPm1paWM7CisJdTMyIHZhbCwgbWFzazsKKworCS8qIFN0YXJ0
IFJYIGNsb2NrIGlmIHJlcXVpcmVkICovCisJaWYgKHBjcy0+cnhjX2Fsd2F5c19vbikgeworCQkv
KiBJbiBNSUkgdGhyb3VnaCBtb2RlLCB0aGUgY2xvY2sgc2lnbmFscyB3aWxsIGJlIGRyaXZlbiBi
eSB0aGUKKwkJICogZXh0ZXJuYWwgUEhZLCB3aGljaCBtaWdodCBub3QgYmUgaW5pdGlhbGl6ZWQg
eWV0LiBTZXQgUk1JSQorCQkgKiBhcyBkZWZhdWx0IG1vZGUgdG8gZW5zdXJlIHRoYXQgYSByZWZl
cmVuY2UgY2xvY2sgc2lnbmFsIGlzCisJCSAqIGdlbmVyYXRlZC4KKwkJICovCisJCW1paWNfcG9y
dC0+aW50ZXJmYWNlID0gUEhZX0lOVEVSRkFDRV9NT0RFX1JNSUk7CisKKwkJdmFsID0gRklFTERf
UFJFUChNSUlDX0NPTlZDVFJMX0NPTlZfTU9ERSwgQ09OVl9NT0RFX1JNSUkpIHwKKwkJICAgICAg
RklFTERfUFJFUChNSUlDX0NPTlZDVFJMX0NPTlZfU1BFRUQsIENPTlZfTU9ERV8xMDBNQlBTKTsK
KwkJbWFzayA9IE1JSUNfQ09OVkNUUkxfQ09OVl9NT0RFIHwgTUlJQ19DT05WQ1RSTF9DT05WX1NQ
RUVEOworCisJCW1paWNfcmVnX3JtdyhtaWljLCBNSUlDX0NPTlZDVFJMKG1paWNfcG9ydC0+cG9y
dCksIG1hc2ssIHZhbCk7CisKKwkJbWlpY19jb252ZXJ0ZXJfZW5hYmxlKG1paWMsIG1paWNfcG9y
dC0+cG9ydCwgMSk7CisJfQorCisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cGh5bGlua19wY3Nfb3BzIG1paWNfcGh5bGlua19vcHMgPSB7CiAJLnBjc192YWxpZGF0ZSA9IG1p
aWNfdmFsaWRhdGUsCiAJLnBjc19jb25maWcgPSBtaWljX2NvbmZpZywKIAkucGNzX2xpbmtfdXAg
PSBtaWljX2xpbmtfdXAsCisJLnBjc19wcmVfaW5pdCA9IG1paWNfcHJlX2luaXQsCiB9OwogCiBz
dHJ1Y3QgcGh5bGlua19wY3MgKm1paWNfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IGRldmljZV9ub2RlICpucCkKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
