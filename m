Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A0A690C96
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 16:14:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F94AC6A5EA;
	Thu,  9 Feb 2023 15:14:33 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BA2BC6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 15:14:31 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32FF2100006;
 Thu,  9 Feb 2023 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675955671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1T2buUEtUaS4iwijK+9hDQD5MTQSBYcjfGbgwJHtZo=;
 b=aZ1JEgynImYFrGvJgTcRxJ6Bpcv2W4DpjJ/aY65E2KUSnT+hEERXUwbanWLyc//F82Uy8f
 Lvd3PSTuHd6a/6GeszmypOvPjs1XXW2b177bSOyEMYakIzCAji0ZetUwYKqk3uthc2Dti1
 hUEJEpwS+0VHMYdP2+SL8H/PPPJgVfDsJ0la5nuH5abHSI20kJsITBHecKopYY5EgzLbOC
 QQB76kY1xL/ymHGGjYQ8N6jZPil/S4Zybi4+KtMkOE8rCJucVfnifNB6lu5MLmW2ayh2jH
 FChxWMw2r9KNMro2jlM3AKqtxEAgVIiAv7UChRO73BZuRgbni/uH5+nVv2AceQ==
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>
Date: Thu,  9 Feb 2023 16:16:29 +0100
Message-Id: <20230209151632.275883-4-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209151632.275883-1-clement.leger@bootlin.com>
References: <20230209151632.275883-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 3/6] net: stmmac: add support to
	provide pcs from platform data
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

QWRkIGEgcGNzIGZpZWxkIGluIHBsYXRmb3JtX2RhdGEgdG8gYWxsb3cgcHJvdmlkaW5nIHBsYXRm
b3JtIGRhdGEuIFRoaXMgaXMKZ29pbmcgdG8gYmUgdXNlZCBieSB0aGUgInJlbmVzYXMscnpuMS1n
bWFjIiBjb21wYXRpYmxlIGRyaXZlciB3aGljaCBjYW4gbWFrZQp1c2Ugb2YgYSBQQ1MuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ci0t
LQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDMg
KysrCiBpbmNsdWRlL2xpbnV4L3N0bW1hYy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCmluZGV4IDlhODcyMTIyN2Ix
Ny4uOGJmNWY3M2ViNGM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9zdG1tYWNfbWFpbi5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hY19tYWluLmMKQEAgLTcyOTUsNiArNzI5NSw5IEBAIGludCBzdG1tYWNfZHZy
X3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldmljZSwKIAkJCWdvdG8gZXJyb3JfeHBjc19zZXR1cDsK
IAl9CiAKKwlpZiAocHJpdi0+cGxhdC0+cGNzKQorCQlwcml2LT5ody0+cGh5bGlua19wY3MgPSBw
cml2LT5wbGF0LT5wY3M7CisKIAlyZXQgPSBzdG1tYWNfcGh5X3NldHVwKHByaXYpOwogCWlmIChy
ZXQpIHsKIAkJbmV0ZGV2X2VycihuZGV2LCAiZmFpbGVkIHRvIHNldHVwIHBoeSAoJWQpXG4iLCBy
ZXQpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zdG1tYWMuaCBiL2luY2x1ZGUvbGludXgv
c3RtbWFjLmgKaW5kZXggYTE1MjY3OGI4MmI3Li4xMDRiM2QxMTAxYzAgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbGludXgvc3RtbWFjLmgKKysrIGIvaW5jbHVkZS9saW51eC9zdG1tYWMuaApAQCAtMjcz
LDUgKzI3Myw2IEBAIHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSB7CiAJYm9vbCB1c2VfcGh5
X3dvbDsKIAlib29sIHNwaF9kaXNhYmxlOwogCWJvb2wgc2VyZGVzX3VwX2FmdGVyX3BoeV9saW5r
dXA7CisJc3RydWN0IHBoeWxpbmtfcGNzICpwY3M7CiB9OwogI2VuZGlmCi0tIAoyLjM5LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
