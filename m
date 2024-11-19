Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6D9D24E9
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 12:35:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F8AEC7A836;
	Tue, 19 Nov 2024 11:35:20 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CB86C7A824
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVl-0004gg-E2
 for linux-stm32@st-md-mailman.stormreply.com; Tue, 19 Nov 2024 12:35:13 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVk-001YfH-2i
 for linux-stm32@st-md-mailman.stormreply.com;
 Tue, 19 Nov 2024 12:35:12 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 89BC8377069
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:12 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id CFA0D377035;
 Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 6601b311;
 Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:34:59 +0100
MIME-Version: 1.0
Message-Id: <20241119-lxa-tac-gen3-v1-2-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=4/0nP6y039SdOp5+OOU7PlcTIP04z82jYwEbyNDvpjM=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnPHfmcPHax0Degh2+FdA7T9xZcMkb5yvqAREbe
 ZeoVU9z3OeJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZzx35gAKCRAoOKI+ei28
 b8jCB/wIKQpO5H7/AStDUmRAXNbzh+Z1Ng3wVpPv8z9yDOsbw0acb7kZ+h0xjdYH3JNEU5U+RcD
 rvvRj+D8foe59+27NWoyKAA1a5jWzDNogKluwXv+E75rceFWHOAk+H3fG8bR4jco9yp9PxXc8n6
 OeS4lf+yRcoEVl1QP42+bBeWNU5Q+OXERlZ3C9CHB8SHdpV4mPqvS1zwSEOxhRRImic2iz2UdzR
 qzJIOdsxBxHL2vNXEnovyKIDcj8XdDivyOWm7ZdvSWhbZpVm4Wopo6wfC71PaIM+g1AYHNv9HO5
 WB5LcO2zB7UEm2wh3MO75xVaSrGiRwXYCF422WsYBufx1aDG
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
Subject: [Linux-stm32] [PATCH 2/6] ARM: dts: stm32: lxa-tac: extend the
	alias table
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

RnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgoKU29tZSBvZiB0
aGUgdXNlcnNwYWNlIHNvZnR3YXJlIGFuZCB0ZXN0cyBkZXBlbmQgb24gdGhlIGNhbi9pMmMvc3Bp
CmRldmljZXMgaGF2aW5nIHRoZSBzYW1lIG5hbWUgb24gZXZlcnkgYm9vdC4gVGhpcyBtYXkgbm90
IGFsd2F5cyBiZSB0aGUKY2FzZSBiYXNlZCBvbiBlLmcuIHBhcmFsbGVsIHByb2JlIG9yZGVyLgoK
QXNzaWduIHN0YXRpYyBkZXZpY2UgbnVtYmVycyB0byBhbGwgY2FuL2kyYy9zcGkgZGV2aWNlcy4K
ClNpZ25lZC1vZmYtYnk6IExlb25hcmQgR8O2aHJzIDxsLmdvZWhyc0BwZW5ndXRyb25peC5kZT4K
U2lnbmVkLW9mZi1ieTogTWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBwZW5ndXRyb25peC5kZT4KLS0t
CiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kgfCA4ICsrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eGMtbHhhLXRhYy5kdHNpIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJtcDE1eGMtbHhhLXRhYy5kdHNpCmluZGV4IGFiZTRjN2ZlNzY3OGYyODAxNjgz
ZTA5OTVkYWRiZmVjY2U0MzRlODEuLmE5NzcwODQyM2VjOGYyZWUyYzQ3MWIwN2ZmOWRmYWMxOWU2
MDViM2IgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXhjLWx4YS10
YWMuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0
c2kKQEAgLTE2LDEyICsxNiwyMCBAQAogCiAvIHsKIAlhbGlhc2VzIHsKKwkJY2FuMCA9ICZtX2Nh
bjE7CisJCWNhbjEgPSAmbV9jYW4yOwogCQlldGhlcm5ldDAgPSAmZXRoZXJuZXQwOwogCQlldGhl
cm5ldDEgPSAmcG9ydF91cGxpbms7CiAJCWV0aGVybmV0MiA9ICZwb3J0X2R1dDsKKwkJaTJjMCA9
ICZpMmMxOworCQlpMmMxID0gJmkyYzQ7CisJCWkyYzIgPSAmaTJjNTsKIAkJbW1jMSA9ICZzZG1t
YzI7CiAJCXNlcmlhbDAgPSAmdWFydDQ7CiAJCXNlcmlhbDEgPSAmdXNhcnQzOworCQlzcGkwID0g
JnNwaTI7CisJCXNwaTEgPSAmc3BpNDsKKwkJc3BpMiA9ICZzcGk1OwogCX07CiAKIAljaG9zZW4g
ewoKLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
