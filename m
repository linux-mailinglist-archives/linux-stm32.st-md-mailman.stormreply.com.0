Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 650A9841F71
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 10:28:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 284EBC6DD9D;
	Tue, 30 Jan 2024 09:28:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D73A4C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 09:28:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFB8D60004;
 Tue, 30 Jan 2024 09:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706606900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3gKaAiVBHTky8x6tO+lB4wo7nzgYAtCMdg1nH6ZUPFM=;
 b=mrdnLgptKHzGeU00hlkrhRzHICkwGQ2dIHWouMrJCgEKRY6HwBxIxa6NqoTVYsD4j9Itej
 0WfIjhI4K3XzQ7o1GOUC4o7DARIUFztoEJqY/cvrEG1vwo/6d4VvLweo0O0OSZUEcA4pF0
 6dY1KM9huhedRbcBZbk+K35KRmFbtC80Adkl43kDaOtvQJM3m81bMON1sQSX9FoCQwxXaq
 5973v+/qVloAKXPE9S6CFuEDktqikwZxlsOAuAdLMndsnKjNOIhiq/CW508PGEliHR+gpE
 OzNZBNTdxt80LAJeE42T69O9hopzGQxC+EbPrW/VaNA6C7es7u3ZEoWNOaJbxw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Jan 2024 10:28:42 +0100
MIME-Version: 1.0
Message-Id: <20240130-rxc_bugfix-v2-7-5e6c3168e5f0@bootlin.com>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
In-Reply-To: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 7/7] net: pcs: rzn1-miic: Init RX
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
YXJkd2FyZSwgdGh1cyBiZWZvcmUgaXQgY2FsbHMKcGh5bGlua19zdGFydC4KCkNoZWNrIHRoZSBy
eGNfYWx3YXlzX29uIHBjcyBmbGFnIGFuZCBlbmFibGUgdGhlIGNsb2NrIHNpZ25hbCBkdXJpbmcg
dGhlCmxpbmsgdmFsaWRhdGlvbiBwaGFzZS4KClJlcG9ydGVkLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWFybS1rZXJuZWwvMjAyMzAxMTYxMDM5MjYuMjc2ODY5LTQtY2xlbWVudC5sZWdlckBi
b290bGluLmNvbS8KU2lnbmVkLW9mZi1ieTogUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lz
QGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMgfCAxNiAr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMgYi9kcml2ZXJzL25ldC9wY3Mv
cGNzLXJ6bjEtbWlpYy5jCmluZGV4IGQ5M2Y4NGZiYjFmZC4uN2NhMTBiNzMzMGVmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL25ldC9wY3MvcGNzLXJ6bjEtbWlpYy5jCisrKyBiL2RyaXZlcnMvbmV0L3Bj
cy9wY3MtcnpuMS1taWljLmMKQEAgLTI3OSwxMCArMjc5LDI2IEBAIHN0YXRpYyBpbnQgbWlpY192
YWxpZGF0ZShzdHJ1Y3QgcGh5bGlua19wY3MgKnBjcywgdW5zaWduZWQgbG9uZyAqc3VwcG9ydGVk
LAogCXJldHVybiAtRUlOVkFMOwogfQogCitzdGF0aWMgaW50IG1paWNfcHJlX2luaXQoc3RydWN0
IHBoeWxpbmtfcGNzICpwY3MsCisJCQkgcGh5X2ludGVyZmFjZV90IGludGVyZmFjZSkKK3sKKwlp
bnQgcmV0ID0gMDsKKworCS8qIFN0YXJ0IFJYIGNsb2NrIGlmIHJlcXVpcmVkICovCisJaWYgKHBj
cy0+cnhjX2Fsd2F5c19vbikgeworCQlyZXQgPSBtaWljX2NvbmZpZyhwY3MsIDAsIGludGVyZmFj
ZSwgTlVMTCwgZmFsc2UpOworCQlpZiAocmV0KQorCQkJcHJfZXJyKCJFcnJvcjogRmFpbGVkIHRv
IGluaXQgUlggY2xvY2sgaW4gUlpOMSBNSUlDIFBDUyEiKTsKKwl9CisKKwlyZXR1cm4gcmV0Owor
fQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBoeWxpbmtfcGNzX29wcyBtaWljX3BoeWxpbmtfb3Bz
ID0gewogCS5wY3NfdmFsaWRhdGUgPSBtaWljX3ZhbGlkYXRlLAogCS5wY3NfY29uZmlnID0gbWlp
Y19jb25maWcsCiAJLnBjc19saW5rX3VwID0gbWlpY19saW5rX3VwLAorCS5wY3NfcHJlX2luaXQg
PSBtaWljX3ByZV9pbml0LAogfTsKIAogc3RydWN0IHBoeWxpbmtfcGNzICptaWljX2NyZWF0ZShz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCgotLSAKMi40My4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
