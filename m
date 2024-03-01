Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6186E469
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Mar 2024 16:34:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59E72C6DD6B;
	Fri,  1 Mar 2024 15:34:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E504C6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Mar 2024 15:34:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B3C51BF20E;
 Fri,  1 Mar 2024 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709307285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6LIsy4cmYZytxPJCTBqEXj+r87EQ9cGgcY4Fox5a48=;
 b=BiVVlX9W7Au059KYrwEXFL9D8p2hZurAT58wUJVvgByaXXhuvaCvH2/wSXvORLxvxUU4yR
 KoB+4+9lUtzM5wcJeXZd6DNtiTlLoXJdbbSbYFqTn2WF+P7PILutGZGIV5qERFRvkC/8vp
 YYx9CmA7tZ5mqzyodTzqVcxgOkh065n03B77razG2c38BYnFrNpAdy8teV/rwrqEEGFD2+
 HdYf2S/lDo+FPXqm5iImOLyDGytSj59cLHq0g5xiNngDKO+a0ObNo8lKf3JJbAftciJGiz
 EKSeRhNoSIo/GfaYWeVgnKNGimufAiscMZAamhul8/63gOhitqW4bhxiRKHy+A==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 01 Mar 2024 16:35:04 +0100
MIME-Version: 1.0
Message-Id: <20240301-rxc_bugfix-v5-7-8dac30230050@bootlin.com>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
In-Reply-To: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v5 7/7] net: pcs: rzn1-miic: Init RX
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
IGRldmljZV9ub2RlICpucCkKCi0tIAoyLjQzLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
