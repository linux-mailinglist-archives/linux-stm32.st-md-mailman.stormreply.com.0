Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0E9D24E8
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 12:35:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55271C7A834;
	Tue, 19 Nov 2024 11:35:20 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78B16C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVl-0004gI-1S
 for linux-stm32@st-md-mailman.stormreply.com; Tue, 19 Nov 2024 12:35:13 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVk-001Yf0-22
 for linux-stm32@st-md-mailman.stormreply.com;
 Tue, 19 Nov 2024 12:35:12 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 550EC377065
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:12 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id B201E377033;
 Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 4f931d1b;
 Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:34:58 +0100
MIME-Version: 1.0
Message-Id: <20241119-lxa-tac-gen3-v1-1-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=po5CXcX3jorgEXwSQF/93cCwkgDI9gDb0IppJ1bPcSQ=;
 b=owGbwMvMwMWoYbHIrkp3Tz7jabUkhnSb8ifKwh2t2t95JF/NOiVsmDzJJaurfZq0psCp1pUiK
 fX9bzs6GY1ZGBi5GGTFFFkCHHa1PdjGcldzj108zCBWJpApDFycAjARQ3H2/0496Sxz/1U363W8
 6/p/9lbhvDXSPgKHPNuDG/fLpp2rX6Z/smzbNu3H32ztYoo5tp0/dbbVR/jt7QoGD1ZtuX+uscs
 t416ciDmj9//coivNxvNqRJ8V+/TJZix+GxNhrr3scfY/yWlHchpkovy/Kaz7yLJOQ+WhzPr1f+
 KzOf1zpkjsO7Lzk0dbyf38oKgVJXoehfuOxr5g+OmySOGcpN3nifNbN/c+uBItzNmSOnHdnY2vX
 j1cKZrHKVoc3Tylavd9wTPR1vmPtswQOOXEKtJpZG/LyJBqcKfBas/5Yi6rf3O4pXqr5FVXfGXK
 uyrbYLZjX4cwB/ufv/u2iXdZLhPun1kZXyChXfjrx8lTAA==
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de,
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/6] ARM: dts: stm32: lxa-tac: disable the
	real time clock
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

RnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgoKVGhlIFJUQyB3
YXMgZW5hYmxlZCB1bmRlciB0aGUgZmFsc2UgYXNzdW1wdGlvbiB0aGF0IHRoZSBTb00gYWxyZWFk
eQpjb250YWlucyBhIHN1aXRhYmxlIDMyLjc2OCBrSHogY3J5c3RhbC4KCkl0IGRvZXMgaG93ZXZl
ciBub3QgY29udGFpbiBzdWNoIGEgY3J5c3RhbCBhbmQgc2luY2Ugbm9uZSBpcyBmaXR0ZWQKZXh0
ZXJuYWxseSB0byB0aGUgU29NIHRoZSBSVEMgY2FuIG5vdCBiZSB1c2VkIG9uIHRoZSBoYXJkd2Fy
ZS4KClJlZmxlY3QgdGhhdCBpbiB0aGUgZGV2aWNldHJlZS4KClNpZ25lZC1vZmYtYnk6IExlb25h
cmQgR8O2aHJzIDxsLmdvZWhyc0BwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogTWFyYyBL
bGVpbmUtQnVkZGUgPG1rbEBwZW5ndXRyb25peC5kZT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXhj
LWx4YS10YWMuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXhjLWx4YS10YWMu
ZHRzaQppbmRleCBjODdmZDk2Y2JkOTE4OTdiYjcyNGEyMzU2ODllNDI1ZjdkYmYzOWY2Li5hYmU0
YzdmZTc2NzhmMjgwMTY4M2UwOTk1ZGFkYmZlY2NlNDM0ZTgxIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJtcDE1eGMtbHhhLXRhYy5kdHNpCkBAIC0zNzksMTAgKzM3OSw2IEBAIHJl
Z3VsYXRvcnMgewogCX07CiB9OwogCi0mcnRjIHsKLQlzdGF0dXMgPSAib2theSI7Ci19OwotCiAm
c2RtbWMyIHsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAib3BlbmRyYWluIiwgInNsZWVw
IjsKIAlwaW5jdHJsLTAgPSA8JnNkbW1jMl9iNF9waW5zX2EgJnNkbW1jMl9kNDdfcGluc19iPjsK
Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
