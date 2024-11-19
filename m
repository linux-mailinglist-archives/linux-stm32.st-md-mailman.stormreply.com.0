Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793B9D24E6
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 12:35:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A087C78F9F;
	Tue, 19 Nov 2024 11:35:20 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74CB5C78F97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVl-0004hN-RY
 for linux-stm32@st-md-mailman.stormreply.com; Tue, 19 Nov 2024 12:35:13 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tDMVk-001YfP-35
 for linux-stm32@st-md-mailman.stormreply.com;
 Tue, 19 Nov 2024 12:35:13 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 9C67137706C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:35:12 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id 1EBD5377039;
 Tue, 19 Nov 2024 11:35:10 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id b585d42b;
 Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:35:01 +0100
MIME-Version: 1.0
Message-Id: <20241119-lxa-tac-gen3-v1-4-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=OiGyC5hvkOyfhSJPitFX+JtgXZ73YWwikIJiBbUL5vE=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnPHfo83L1ffukhGKoWDoL8tjex0fmM2FuiA8BB
 3HMT7tDq/WJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZzx36AAKCRAoOKI+ei28
 b1XbCACWy17HQEJrXpAgn2wESy57lQ66WicbSnsYR9JWSmBp2ZxM9zyZ7dRca3v6b+4ddvmO2Io
 4l29BCkVvVMG2JHxWGL/6D0J6S2U2FiXNJT6vM1LOIzI3DWkjyt/zRArP3n+3095Tc43mKVl3rk
 DNLwzLYAVGWVgj0QbGaDiVmA9F4vHBxrEpAbwmBKDy9QYLd9qGaH2rjrHIkaz19EN/TL937XsiX
 NUDSoTydcE9hpbMKGAQ4DPxWqwr3AztBZObadH2/VyxJAwxEDgCd4Nq/zTzOCdWHubNpkykicTC
 qY2zYnaf/+alLbFoU3BPWPqc4XXlGQ0+sL+wBPjmuC+mhdcN
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
Subject: [Linux-stm32] [PATCH 4/6] dt-bindings: arm: stm32: add compatible
 strings for Linux Automation LXA TAC gen 3
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

RnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgoKVGhlIExpbnV4
IEF1dG9tYXRpb24gTFhBIFRBQyBnZW5lcmF0aW9uIDMgaXMgYnVpbHQgYXJvdW5kIGFuCk9TRDMy
TVAxNTN4IFNpUCB3aXRoIENQVSwgUkFNLCBQTUlDLCBPc2NpbGxhdG9yIGFuZCBFRVBST00uCgpM
WEEgVEFDcyBhcmUgYSBkZXZlbG9wbWVudCB0b29sIGZvciBlbWJlZGRlZCBkZXZpY2VzIHdpdGgg
YSBmb2N1cyBvbgplbWJlZGRlZCBMaW51eCBkZXZpY2VzLgoKQWRkIGNvbXBhdGlibGUgZm9yIHRo
ZSBnZW5lcmF0aW9uIDMgYmFzZWQgb24gdGhlIFNUTTMyTVAxNTNjLgoKU2lnbmVkLW9mZi1ieTog
TGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBN
YXJjIEtsZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPgotLS0KIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCB8IDcgKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbAppbmRleCA3MDNkNGI1NzQz
OThkMjc2ODkyNGRmOGQ0YmQ4NDRlNDg2YWE1YWJmLi5iNmM1NmQ0Y2U2Yjk1MTU1NjVmYzA1MzQ4
ODk2YmE5ZjQwMDY0M2YwIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sCkBAIC05MSw2ICs5MSwxMyBAQCBwcm9wZXJ0
aWVzOgogICAgICAgICAgIC0gY29uc3Q6IGRoLHN0bTMybXAxNTNjLWRoY29yLXNvbQogICAgICAg
ICAgIC0gY29uc3Q6IHN0LHN0bTMybXAxNTMKIAorICAgICAgLSBkZXNjcmlwdGlvbjogT2N0YXZv
IE9TRDMyTVAxNTMgU3lzdGVtLWluLVBhY2thZ2UgYmFzZWQgYm9hcmRzCisgICAgICAgIGl0ZW1z
OgorICAgICAgICAgIC0gZW51bToKKyAgICAgICAgICAgICAgLSBseGEsc3RtMzJtcDE1M2MtdGFj
LWdlbjMgIyBMaW51eCBBdXRvbWF0aW9uIFRBQyAoR2VuZXJhdGlvbiAzKQorICAgICAgICAgIC0g
Y29uc3Q6IG9jdCxzdG0zMm1wMTUzeC1vc2QzMgorICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMy
bXAxNTMKKwogICAgICAgLSBpdGVtczoKICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAg
IC0gc2hpcmF0ZWNoLHN0bTMybXAxNTdhLWlvdC1ib3ggIyBJb1QgQm94CgotLSAKMi40NS4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
