Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383EA17037
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2025 17:34:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD3A8C78018;
	Mon, 20 Jan 2025 16:34:09 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1698BC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 16:34:03 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1tZuiw-000344-Sh
 for linux-stm32@st-md-mailman.stormreply.com; Mon, 20 Jan 2025 17:34:02 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tZuiw-000xsH-1h
 for linux-stm32@st-md-mailman.stormreply.com;
 Mon, 20 Jan 2025 17:34:02 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 2A3353AD0C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 16:34:02 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id 340223AD0A5;
 Mon, 20 Jan 2025 16:33:59 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 20c0da44;
 Mon, 20 Jan 2025 16:33:58 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Mon, 20 Jan 2025 17:33:47 +0100
MIME-Version: 1.0
Message-Id: <20250120-lxa-fairytux-v2-1-95f4a0eaa44d@pengutronix.de>
References: <20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de>
In-Reply-To: <20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=nHqVbVztPOg4rqN4cb7rY9www086UjxiBiZ4nydhcgc=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnjnrx/FRlp1txQr1NDmjA/Lt3a5qIcSpYRj4Dr
 6zR+kGBVp2JATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ4568QAKCRAoOKI+ei28
 b4hCB/wOTgzesIXoKxq7B0VGu8I2Wum0QkzqH+dXRW2jjMGsteF728EvZ54kgkVtI6vu2RDEQWb
 nJqGMSIuDK4TLrC/QISlCKdzJf4Z6OVTBhAvBWDHz/4aH+Am1tBGoblhftVMcsN/hw/mZGNfna+
 nygfr9wJCWo7LDO1/wNiekq2iZFA2/GGf9P4YUikr8lB8gyxsR4WLY/j0IDW8zwVIDOO06/hy4O
 dQXKYwu/raUNIimEBHI5tbONXyntT8Ksg+A180MIzUBqUaMbsu/VrgSJfpCAC+vsDIrVW0URTpo
 9ABadjTfsuyrvdUWOW1h5xq7bCNt+7KzSDGqtFRVF0e7L+wL
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de,
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH stm32-next v2 1/2] dt-bindings: arm: stm32:
 add compatible strings for Linux Automation GmbH LXA FairyTux 2
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
IEF1dG9tYXRpb24gR21iSCBGYWlyeVR1eDIgaXMgYSBzbWFsbCBMaW51eCBkZXZpY2UgYmFzZWQg
b24KYW4gT2N0YXZvIFN5c3RlbXMgT1NEMzJNUDE1M2MgU2lQLCB0aGF0IG9jY3VwaWVzIGp1c3Qg
dHdvIHNsb3RzIG9uIGEKRElOIHJhaWwuCgpBZGQgY29tcGF0aWJsZSBmb3IgdGhlIGdlbmVyYXRp
b24gMSBhbmQgMiBiYXNlZCBvbiB0aGUgU1RNMzJNUDE1M2MuCgpTaWduZWQtb2ZmLWJ5OiBMZW9u
YXJkIEfDtmhycyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+CkFja2VkLWJ5OiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6
IE1hcmMgS2xlaW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9uaXguZGU+Ci0tLQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sIHwgMiArKwogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbAppbmRleCBiNmM1NmQ0Y2U2Yjk1
MTU1NjVmYzA1MzQ4ODk2YmE5ZjQwMDY0M2YwLi42ODI1ZDk2NWRhM2RhZjJiNTA4ZmJkODhlOGM5
ZDQwZTIwYmExZjU5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sCkBAIC05NCw2ICs5NCw4IEBAIHByb3BlcnRpZXM6
CiAgICAgICAtIGRlc2NyaXB0aW9uOiBPY3Rhdm8gT1NEMzJNUDE1MyBTeXN0ZW0taW4tUGFja2Fn
ZSBiYXNlZCBib2FyZHMKICAgICAgICAgaXRlbXM6CiAgICAgICAgICAgLSBlbnVtOgorICAgICAg
ICAgICAgICAtIGx4YSxzdG0zMm1wMTUzYy1mYWlyeXR1eDItZ2VuMSAjIExpbnV4IEF1dG9tYXRp
b24gRmFpcnlUdXggMiAoR2VuZXJhdGlvbiAxKQorICAgICAgICAgICAgICAtIGx4YSxzdG0zMm1w
MTUzYy1mYWlyeXR1eDItZ2VuMiAjIExpbnV4IEF1dG9tYXRpb24gRmFpcnlUdXggMiAoR2VuZXJh
dGlvbiAyKQogICAgICAgICAgICAgICAtIGx4YSxzdG0zMm1wMTUzYy10YWMtZ2VuMyAjIExpbnV4
IEF1dG9tYXRpb24gVEFDIChHZW5lcmF0aW9uIDMpCiAgICAgICAgICAgLSBjb25zdDogb2N0LHN0
bTMybXAxNTN4LW9zZDMyCiAgICAgICAgICAgLSBjb25zdDogc3Qsc3RtMzJtcDE1MwoKLS0gCjIu
NDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
