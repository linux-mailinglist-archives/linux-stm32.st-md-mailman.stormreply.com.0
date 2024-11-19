Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 947749D24E7
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 12:35:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 442B8C7A827;
	Tue, 19 Nov 2024 11:35:20 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AF6BC78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVl-0004g0-1T
 for linux-stm32@st-md-mailman.stormreply.com; Tue, 19 Nov 2024 12:35:13 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVk-001Yet-1j
 for linux-stm32@st-md-mailman.stormreply.com;
 Tue, 19 Nov 2024 12:35:12 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 38C9D377063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:12 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id 976C6377032;
 Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id e1a4d7b9;
 Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:34:57 +0100
Message-Id: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOF3PGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0Mj3ZyKRN2SxGTd9NQ8Y12LlKRkYxMLw+RU80QloJaCotS0zAqwcdG
 xtbUA6TzJgF4AAAA=
X-Change-ID: 20241112-lxa-tac-gen3-8dbc3481ce7a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=KdVStOdD/uuuDQWXB4cY0gjv4M2fNzhz+/kAvPe2m7o=;
 b=owGbwMvMwMWoYbHIrkp3Tz7jabUkhnSb8kdLP2pJrPOQrGCSeFot5V5/u5Pl7BuFG8X7Weu+u
 ny6O7uzk9GYhYGRi0FWTJElwGFX24NtLHc199jFwwxiZQKZwsDFKQATsZ7B/od7gUFrsF+RgFuz
 qcmhkEALhmrR3Ev3j/r8mmCvf1SQr5nT/4qWqrnzx3v855O0S2+eX9Tr8bEzX0aap6Jt3o/ffhw
 vjr73CzguLF7i3rArryxf6SjL+l0lAqLZG7SlBD5xvG//JLbpx+ev5pW3VczmTJL7M2fFd4+aT/
 f1XmhNnJF9c5dxlGNbuv1Ci4Q3HUuzpkqFcxrk6BkYelzZk5F7Nn9Sa8N2TR1Gu9X7jM5+yb0nY
 RMl0DtBbHaIeOLKB+uqumzvqmX65D7yPs2vfp/p1BJp/2kGSx+tnKp3c636U4WkCKElHW92V1w8
 yZlmLnHqmYa5gKHncf+Ii9FX3hUnBE//fuJY0aSOl/89AQ==
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
Subject: [Linux-stm32] [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,
 2} boards and add gen3 board
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

SGVsbG8sCgp0aGlzIHNlcmllcyBmaXhlcyBzb21lIHByb2JsZW1zIGZvdW5kIGluIHRoZSBseGEt
dGFjIGdlbmVyYXRpb24gMSBhbmQKMiBib2FyZHMgYW5kIGFkZCBzdXBwb3J0IGZvciB0aGUgZ2Vu
ZXJhdGlvbiAzIGJvYXJkLiBJdCdzIGJhc2VkIG9uIGFuClNUTTMyTVAxNTNjLCB3aGlsZSB0aGUg
Z2VuZXJhdGlvbiAxIGFuZCAyIGFyZSBiYXNlZCBvbiB0aGUKU1RNMzJNUDE1N2MuCgpyZWdhcmRz
LApNYXJjCgpTaWduZWQtb2ZmLWJ5OiBNYXJjIEtsZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4
LmRlPgotLS0KTGVvbmFyZCBHw7ZocnMgKDYpOgogICAgICBBUk06IGR0czogc3RtMzI6IGx4YS10
YWM6IGRpc2FibGUgdGhlIHJlYWwgdGltZSBjbG9jawogICAgICBBUk06IGR0czogc3RtMzI6IGx4
YS10YWM6IGV4dGVuZCB0aGUgYWxpYXMgdGFibGUKICAgICAgQVJNOiBkdHM6IHN0bTMyOiBseGEt
dGFjOiBhZGp1c3QgVVNCIGdhZGdldCBmaWZvIHNpemVzIGZvciBtdWx0aSBmdW5jdGlvbgogICAg
ICBkdC1iaW5kaW5nczogYXJtOiBzdG0zMjogYWRkIGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgTGlu
dXggQXV0b21hdGlvbiBMWEEgVEFDIGdlbiAzCiAgICAgIEFSTTogZHRzOiBzdG0zMjogbHhhLXRh
YzogbW92ZSBhZGMgYW5kIGdwaW97ZSxnfSB0byBnZW57MSwyfSBib2FyZHMKICAgICAgQVJNOiBk
dHM6IHN0bTMyOiBseGEtdGFjOiBBZGQgc3VwcG9ydCBmb3IgZ2VuZXJhdGlvbiAzIGRldmljZXMK
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCAgICAgICB8ICAg
NyArCiBhcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8
ICAgMSArCiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUzYy1seGEtdGFjLWdlbjMuZHRz
ICB8IDI2NyArKysrKysrKysrKysrKysrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
bXAxNTdjLWx4YS10YWMtZ2VuMS5kdHMgIHwgIDg0ICsrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxNTdjLWx4YS10YWMtZ2VuMi5kdHMgIHwgIDg0ICsrKysrKysKIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxNXhjLWx4YS10YWMuZHRzaSAgICAgIHwgMTAwICstLS0tLS0t
CiA2IGZpbGVzIGNoYW5nZWQsIDQ1NSBpbnNlcnRpb25zKCspLCA4OCBkZWxldGlvbnMoLSkKLS0t
CmJhc2UtY29tbWl0OiBiMDE5MWE1Y2JjMjIyZmM3YWYzZjk1MTFiNDRkMWYzMzBlZjk4MGU5CmNo
YW5nZS1pZDogMjAyNDExMTItbHhhLXRhYy1nZW4zLThkYmMzNDgxY2U3YQoKQmVzdCByZWdhcmRz
LAotLSAKTWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBwZW5ndXRyb25peC5kZT4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
