Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF7C822F74
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 15:28:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8ECDC6C83C;
	Wed,  3 Jan 2024 14:28:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D18CC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 14:28:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 043CD6000D;
 Wed,  3 Jan 2024 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704292109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmed1jEpoZI+pixYHArlZGQKHPpdNarPzqdiGktR7JI=;
 b=NLIgcVMNlWi0/VrDdnLc+QqsaPfWKXhZvk1NqViiDyZoMs1+PEZ28REKDlv2RaCmv99Ia7
 O3cKXIDjObnrrQ3k0kn9fwsvvKqeQYbdKq+GSSSPXeT6XihHjUEddonlcvdgea4nUuiYj3
 FfWkiCOgoXFtcJjzjK2S9E9j3GmrLOlKufDkFOhe7QRchKn+MgCN8eO0Z8lB6sJEzSZtQ3
 h4YuROcxNvOczQb+kJni36zKsewpgKSiObzwFvhwbiPjq3rGXm0z+aQI92ISmJuj5KketI
 D1tZS5HrIcfnYpp1E8jLoIKm6Ii3WoXpr7EpCo0gY1IqmDHEW5buHcXJxCOeYQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Wed,  3 Jan 2024 15:28:25 +0100
Message-ID: <20240103142827.168321-6-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103142827.168321-1-romain.gantois@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Marek Vasut <marex@denx.de>, Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 5/5] net: pcs: rzn1-miic: Init RX clock
	early if MAC requires it
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
QGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMgfCAxOCAr
KysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMg
Yi9kcml2ZXJzL25ldC9wY3MvcGNzLXJ6bjEtbWlpYy5jCmluZGV4IDk3MTM5YzA3MTMwZi4uYmY3
OTY0OTFiODI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9wY3MvcGNzLXJ6bjEtbWlpYy5jCisr
KyBiL2RyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMKQEAgLTI3MSwxMiArMjcxLDIwIEBA
IHN0YXRpYyB2b2lkIG1paWNfbGlua191cChzdHJ1Y3QgcGh5bGlua19wY3MgKnBjcywgdW5zaWdu
ZWQgaW50IG1vZGUsCiBzdGF0aWMgaW50IG1paWNfdmFsaWRhdGUoc3RydWN0IHBoeWxpbmtfcGNz
ICpwY3MsIHVuc2lnbmVkIGxvbmcgKnN1cHBvcnRlZCwKIAkJCSBjb25zdCBzdHJ1Y3QgcGh5bGlu
a19saW5rX3N0YXRlICpzdGF0ZSkKIHsKLQlpZiAocGh5X2ludGVyZmFjZV9tb2RlX2lzX3JnbWlp
KHN0YXRlLT5pbnRlcmZhY2UpIHx8Ci0JICAgIHN0YXRlLT5pbnRlcmZhY2UgPT0gUEhZX0lOVEVS
RkFDRV9NT0RFX1JNSUkgfHwKLQkgICAgc3RhdGUtPmludGVyZmFjZSA9PSBQSFlfSU5URVJGQUNF
X01PREVfTUlJKQotCQlyZXR1cm4gMTsKKwlpbnQgcmV0ID0gMTsKIAotCXJldHVybiAtRUlOVkFM
OworCWlmICghcGh5X2ludGVyZmFjZV9tb2RlX2lzX3JnbWlpKHN0YXRlLT5pbnRlcmZhY2UpICYm
CisJICAgIHN0YXRlLT5pbnRlcmZhY2UgIT0gUEhZX0lOVEVSRkFDRV9NT0RFX1JNSUkgJiYKKwkg
ICAgc3RhdGUtPmludGVyZmFjZSAhPSBQSFlfSU5URVJGQUNFX01PREVfTUlJKQorCQlyZXR1cm4g
LUVJTlZBTDsKKworCWlmIChwY3MtPnJ4Y19hbHdheXNfb24pIHsKKwkJcmV0ID0gbWlpY19jb25m
aWcocGNzLCAwLCBzdGF0ZS0+aW50ZXJmYWNlLCBOVUxMLCBmYWxzZSk7CisJCWlmIChyZXQpCisJ
CQlwcl9lcnIoIkVycm9yOiBGYWlsZWQgdG8gaW5pdCBSWCBjbG9jayBpbiBSWk4xIE1JSUMgUENT
ISIpOworCX0KKworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGh5bGlu
a19wY3Nfb3BzIG1paWNfcGh5bGlua19vcHMgPSB7Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
