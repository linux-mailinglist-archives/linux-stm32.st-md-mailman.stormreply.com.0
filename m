Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1F9D24EB
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 12:35:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A8B8C7A83A;
	Tue, 19 Nov 2024 11:35:20 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EB95C7A827
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVl-0004hO-LE
 for linux-stm32@st-md-mailman.stormreply.com; Tue, 19 Nov 2024 12:35:13 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVk-001YfL-30
 for linux-stm32@st-md-mailman.stormreply.com;
 Tue, 19 Nov 2024 12:35:12 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 976DB37706B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:12 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id F29DA377036;
 Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id c96e1107;
 Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:35:00 +0100
MIME-Version: 1.0
Message-Id: <20241119-lxa-tac-gen3-v1-3-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=lUNKFRhW2UkaCb89yA9/rUW4JI9Xi4k+6AExYcnVVQo=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnPHfnm9EuEwt/tRjFfIpjwQLdKwYSVtGSwEc4T
 INmRMDHYBSJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZzx35wAKCRAoOKI+ei28
 b7VnCACKzGe+WQG3WTzwPAJ8bAvxWc0tn9KthZ6HijeH8YGh3eY2g0+dkNbiwbC30Kht6kSM4wH
 5bjigA6PKRkuNXk8GtlIr4IFN9jSRxXcER+mhkjqKRR0wo4GYDI2/G/69vjq+RDfCnj1/HEGo9l
 Q2N3IuOjB8TcqSbdYwTOUMuUC6v+SqFPP1g4MuIgUjiDHU5IU1z99ooCsJpH/ASF1G116e2SkrP
 ujCcRSsgDJ974klH+qgKEkMHyEf7RutseXpdGeN0I6VJjUDEeC4AoF3tkFuSlSqTMlqkrpP0tyu
 8YWauqDNYKq/cP0uCbcB9G8Ac9vldsuBe62Z/gpC78URh4/d
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
Subject: [Linux-stm32] [PATCH 3/6] ARM: dts: stm32: lxa-tac: adjust USB
 gadget fifo sizes for multi function
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

RnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgoKQWxsb3cgcHJv
dmlkaW5nIHRoZSBFdGhlcm5ldCBhbmQgbWFzcyBzdG9yYWdlIGZ1bmN0aW9ucyBvbiB0aGUgVVNC
CnBlcmlwaGVyYWwgcG9ydCBhdCB0aGUgc2FtZSB0aW1lLgoKU2lnbmVkLW9mZi1ieTogTGVvbmFy
ZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBNYXJjIEts
ZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxNXhjLWx4YS10YWMuZHRzaSB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXhj
LWx4YS10YWMuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXhjLWx4YS10YWMu
ZHRzaQppbmRleCBhOTc3MDg0MjNlYzhmMmVlMmM0NzFiMDdmZjlkZmFjMTllNjA1YjNiLi5kOWI5
ZDYxMWE0MWU4YjRjYTM1YWI3NzFkMjZmZGY5MDY3ZDczODE0IDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJtcDE1eGMtbHhhLXRhYy5kdHNpCkBAIC01ODAsNiArNTgwLDEwIEBAICZ1
c2JvdGdfaHMgewogCXZ1c2JfZC1zdXBwbHkgPSA8JnZkZF91c2I+OwogCXZ1c2JfYS1zdXBwbHkg
PSA8JnJlZzE4PjsKIAorCWctcngtZmlmby1zaXplID0gPDUxMj47CisJZy1ucC10eC1maWZvLXNp
emUgPSA8MzI+OworCWctdHgtZmlmby1zaXplID0gPDEyOCAxMjggNjQgMTYgMTYgMTYgMTYgMTY+
OworCiAJZHJfbW9kZSA9ICJwZXJpcGhlcmFsIjsKIAogCXN0YXR1cyA9ICJva2F5IjsKCi0tIAoy
LjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
