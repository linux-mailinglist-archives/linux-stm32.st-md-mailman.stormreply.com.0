Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27231734E5C
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 10:46:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B861FC6B454;
	Mon, 19 Jun 2023 08:46:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20891C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 10:05:32 +0000 (UTC)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686909931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQ1+xbvMnidBmGeXT0nP+KHmlPyfa+N1kU3ye5N9Y2M=;
 b=Sicjf9ks2PJoF/K2iAiEzxbRBrNIvgpB0mTA1GqD4eEWaZ/tLOB7KOSnyaLhISAEocTwyv
 RPPNUS3DqAW37JRUxacbu68edCx2UY30ktDi8ZHWIPaU3ya2meksVLKyBsbYx8Z9NbUvDu
 TufohlkapBs05jQMj4Z1KYsaobvwW/QyXoaLG2TKo6rfGryl2XQ/dTwFIZfZAjjr+0dl3Z
 uho3Q9qfYJAsLMrKUaCReSYe1T/RMrWJp3tNl2W3+RR20V7o1YE5iN3C/mCGPEeHFOqnDc
 FRadOLh+++SFziNFZf4WOF9z9MFgLm/RUxOx94IdYHQeAe/56hJzx92ZbJ5n1w==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83BF520003;
 Fri, 16 Jun 2023 10:05:30 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Fri, 16 Jun 2023 12:04:02 +0200
Message-ID: <20230616100409.164583-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616100409.164583-1-alexis.lothore@bootlin.com>
References: <20230616100409.164583-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Jun 2023 08:46:47 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Subject: [Linux-stm32] [PATCH net-next 1/8] net: stmmac: add IP-specific
	callbacks for auxiliary snapshot
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

RnJvbTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KClNpbmNl
IGF1eGlsaWFyeSBzbmFwc2hvdHMgY29uZmlndXJhdGlvbiByZWdpc3RlcnMgbWF5IGJlIGRpZmZl
cmVudApkZXBlbmRpbmcgdGhlIERXTUFDIElQLCB3ZSBuZWVkIGEgc3BlY2lmaWMgc2V0IG9mIGNh
bGxiYWNrcyB0bwotIGNvbmZpZ3VyZSB0aW1lc3RhbXAgc25hcHNob3QgdHJpZ2dlcnMKLSBjbGVh
ciB0aGUgc25hcHNob3RzIEZJRk8KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxl
eGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvaHdpZi5oIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2h3
aWYuaCBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2h3aWYuaAppbmRleCA2
ZWU3Y2YwN2NmZDcuLmQwYjJmMTM1MTBhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvaHdpZi5oCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2h3aWYuaApAQCAtNDE5LDYgKzQxOSwxMCBAQCBzdHJ1Y3Qgc3RtbWFjX29wcyB7
CiAJdm9pZCAoKmZwZV9zZW5kX21wYWNrZXQpKHZvaWQgX19pb21lbSAqaW9hZGRyLAogCQkJCSBl
bnVtIHN0bW1hY19tcGFja2V0X3R5cGUgdHlwZSk7CiAJaW50ICgqZnBlX2lycV9zdGF0dXMpKHZv
aWQgX19pb21lbSAqaW9hZGRyLCBzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KTsKKwkvKiBBdXhpbGlh
cnkgc25hcHNob3RzICovCisJdm9pZCAoKmV4dHRzX2NvbmZpZ3VyZSkodm9pZCBfX2lvbWVtICpp
b2FkZHIsIGludCBleHRfc25hcHNob3RfbnVtLAorCQkJCWJvb2wgb24sIHN0cnVjdCBuZXRfZGV2
aWNlICpkZXYpOworCWludCAoKmNsZWFyX3NuYXBzaG90X2ZpZm8pKHZvaWQgX19pb21lbSAqaW9h
ZGRyKTsKIH07CiAKICNkZWZpbmUgc3RtbWFjX2NvcmVfaW5pdChfX3ByaXYsIF9fYXJncy4uLikg
XApAQCAtNTIzLDYgKzUyNywxMCBAQCBzdHJ1Y3Qgc3RtbWFjX29wcyB7CiAJc3RtbWFjX2RvX3Zv
aWRfY2FsbGJhY2soX19wcml2LCBtYWMsIGZwZV9zZW5kX21wYWNrZXQsIF9fYXJncykKICNkZWZp
bmUgc3RtbWFjX2ZwZV9pcnFfc3RhdHVzKF9fcHJpdiwgX19hcmdzLi4uKSBcCiAJc3RtbWFjX2Rv
X2NhbGxiYWNrKF9fcHJpdiwgbWFjLCBmcGVfaXJxX3N0YXR1cywgX19hcmdzKQorI2RlZmluZSBz
dG1tYWNfZXh0dHNfY29uZmlndXJlKF9fcHJpdiwgX19hcmdzLi4uKSBcCisJc3RtbWFjX2RvX3Zv
aWRfY2FsbGJhY2soX19wcml2LCBtYWMsIGV4dHRzX2NvbmZpZ3VyZSwgX19hcmdzKQorI2RlZmlu
ZSBzdG1tYWNfY2xlYXJfc25hcHNob3RfZmlmbyhfX3ByaXYsIF9fYXJncy4uLikgXAorCXN0bW1h
Y19kb19jYWxsYmFjayhfX3ByaXYsIG1hYywgY2xlYXJfc25hcHNob3RfZmlmbywgX19hcmdzKQog
CiAvKiBQVFAgYW5kIEhXIFRpbWVyIGhlbHBlcnMgKi8KIHN0cnVjdCBzdG1tYWNfaHd0aW1lc3Rh
bXAgewotLSAKMi40MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
