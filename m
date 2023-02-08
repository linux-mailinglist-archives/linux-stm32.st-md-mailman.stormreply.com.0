Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29E68F36B
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 17:40:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7471DC6A5E9;
	Wed,  8 Feb 2023 16:40:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7E44C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 16:40:29 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A60E81BF211;
 Wed,  8 Feb 2023 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675874429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCj30NsK+6xPXdqbwOoZtwRO/ZUoDqTO5hHn+iKnF+o=;
 b=GTQjKeKP6jCXB+susoQC6r7Wao2poP1/a4Ob8/035exSTjKkF1n85RREgusN779F90UUSp
 VAD+NeoYQcdm/pZDqopInkA0VBppi35mawnAN1AiQBezpmMkBa6qjkO+kqxXeAOhM34RLA
 zgx8CfO5qDXiseFzrakMKFj1fQ5hryT90ocK92GhvDoR93YZC8CfYFDasvnnHIjDB0kARr
 psn2hP2/+EyIeEdbUZY5jol+oDQaeVv02aZx6QxRwC1jcmL4xlKHhLHMHJ6dreVIiUJ8BO
 2Rp3Q6RqOf4mEIor/Ahx883YWs1ka9LFFypyBrrtceDqIeQRCPr9ktk7Uj5tbw==
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
Date: Wed,  8 Feb 2023 17:42:00 +0100
Message-Id: <20230208164203.378153-4-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230208164203.378153-1-clement.leger@bootlin.com>
References: <20230208164203.378153-1-clement.leger@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 3/6] net: stmmac: add support to
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
b3JtIGRhdGEuIFRoaXMgaXMKZ29uaWcgdG8gYmUgdXNlZCBieSB0aGUgcmVuZXNhcyxyem4xLWdt
YWMgY29tcGF0aWJsZSBkcml2ZXIgd2hpY2ggY2FuIG1ha2UKdXNlIG9mIGEgUENTLgoKU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgotLS0K
IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAzICsr
KwogaW5jbHVkZS9saW51eC9zdG1tYWMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwppbmRleCA5YTg3MjEyMjdiMTcu
LjhiZjVmNzNlYjRjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9zdG1tYWNfbWFpbi5jCkBAIC03Mjk1LDYgKzcyOTUsOSBAQCBpbnQgc3RtbWFjX2R2cl9w
cm9iZShzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCiAJCQlnb3RvIGVycm9yX3hwY3Nfc2V0dXA7CiAJ
fQogCisJaWYgKHByaXYtPnBsYXQtPnBjcykKKwkJcHJpdi0+aHctPnBoeWxpbmtfcGNzID0gcHJp
di0+cGxhdC0+cGNzOworCiAJcmV0ID0gc3RtbWFjX3BoeV9zZXR1cChwcml2KTsKIAlpZiAocmV0
KSB7CiAJCW5ldGRldl9lcnIobmRldiwgImZhaWxlZCB0byBzZXR1cCBwaHkgKCVkKVxuIiwgcmV0
KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc3RtbWFjLmggYi9pbmNsdWRlL2xpbnV4L3N0
bW1hYy5oCmluZGV4IGExNTI2NzhiODJiNy4uMTA0YjNkMTEwMWMwIDEwMDY0NAotLS0gYS9pbmNs
dWRlL2xpbnV4L3N0bW1hYy5oCisrKyBiL2luY2x1ZGUvbGludXgvc3RtbWFjLmgKQEAgLTI3Myw1
ICsyNzMsNiBAQCBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgewogCWJvb2wgdXNlX3BoeV93
b2w7CiAJYm9vbCBzcGhfZGlzYWJsZTsKIAlib29sIHNlcmRlc191cF9hZnRlcl9waHlfbGlua3Vw
OworCXN0cnVjdCBwaHlsaW5rX3BjcyAqcGNzOwogfTsKICNlbmRpZgotLSAKMi4zOS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
