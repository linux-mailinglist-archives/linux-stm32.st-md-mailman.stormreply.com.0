Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 556F8A17038
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2025 17:34:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED4F1C78027;
	Mon, 20 Jan 2025 16:34:09 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12696C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 16:34:03 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1tZuiw-00033l-Nv
 for linux-stm32@st-md-mailman.stormreply.com; Mon, 20 Jan 2025 17:34:02 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tZuiw-000xsB-1S
 for linux-stm32@st-md-mailman.stormreply.com;
 Mon, 20 Jan 2025 17:34:02 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 2841B3AD0C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 16:34:02 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id 178193AD0A4;
 Mon, 20 Jan 2025 16:33:59 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 6815eb50;
 Mon, 20 Jan 2025 16:33:58 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Mon, 20 Jan 2025 17:33:46 +0100
Message-Id: <20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOp6jmcC/22NzQqDMBCEX0X23C35KVh76nsUD6nZ6EIbJYkSE
 d+9IeceP2bmmwMiBaYIj+aAQBtHnn0BdWlgmIwfCdkWBiXUTSop8JMNOsNhT2tGarXo2s5qqx2
 UyRLIca66F8T01Qo95QR9ySaOaQ57fdpkbfyXbhIFdoaMkIN93zU9F/LjmsLsOV8tQX+e5w/Df
 f8/uQAAAA==
X-Change-ID: 20241210-lxa-fairytux-e730979d3d3f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=QUCrRzfLcrv/sEz8FJ6qxQC7xNYnscNmjk0UmAB32rk=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnjnruIewAenRs8HPGcmEcVef/zd9aynU0vqWRz
 VLz1pEpsv+JATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ4567gAKCRAoOKI+ei28
 b1G5B/9zTvXY8tCoJoS66NDPZKaTcf27QLsgnAajtyBe9rkh90y1LEof04jBnpEjiyKuFLxRQJR
 NLUoxcmTwcp8AENowO/iA+GF4GqBoIDZLfP6dH4wARvaMwoIMn2RxnAjiD9+f0QHv6pdudDlfbk
 0POFX/NAuiFBal5Gm1DUa3g7Bs7rtatWkGp0ItppGS5Objix6m1NgUo4SUCi9WM0255I5Ahcf32
 5o7n5rufPc2hvuN/sxEgeptRHPfvvjMiQj0c/cFNB0twpZReDA+ToinTt7Azcp14ka6/7/H3t8W
 YP3rHfeWV422oaYrAP8x0dotq89xBAqGHXjsdR18B7Ml3PZr
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
Subject: [Linux-stm32] [PATCH stm32-next v2 0/2] ARM: dts: stm32:
 lxa-fairytux2: add gen{1, 2} boards
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

SGVsbG8sCgp0aGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBMaW51eCBBdXRvbWF0aW9u
IEdtYkggRmFpcnlUdXgyCmJvYXJkcyBnZW5lcmF0aW9uIDEgYW5kIDIuCgpUaGUgRmFpcnlUdXgy
IGlzIGEgc21hbGwgTGludXggZGV2aWNlIGJhc2VkIG9uIGFuIE9jdGF2byBTeXN0ZW1zCk9TRDMy
TVAxNTNjIFNpUCwgdGhhdCBvY2N1cGllcyBqdXN0IHR3byBzbG90cyBvbiBhIERJTiByYWlsLgoK
cmVnYXJkcywKTWFyYwoKU2lnbmVkLW9mZi1ieTogTWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBwZW5n
dXRyb25peC5kZT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gMS8yOiBBZGRlZCBLcnp5c3p0b2YncyBB
Y2tlZC1ieQotIDIvMjogZml4IGFsaWdubWVudCBmb3IgZ3Bpby1saW5lLW5hbWVzICh0aGFua3Mg
S3J6eXN6dG9mKQotIDIvMjogb25seSB1c2UgY29sb3I6ZnVuY3Rpb24gZm9yIExFRCBsYWJlbHMg
KHRoYW5rcyBLcnp5c3p0b2YpCi0gMi8yOiB1c2UgZ2VuZXJpYyBub2RlIG5hbWVzIGZvciBleHRl
cm5hbCBHUElPIGFuZCBVU0IgVHlwZS1DIGNvbnRyb2xsZXIKLSBMaW5rIHRvIHYxOiBodHRwczov
L3BhdGNoLm1zZ2lkLmxpbmsvMjAyNDEyMTAtbHhhLWZhaXJ5dHV4LXYxLTAtOWFlYTAxY2RiODNl
QHBlbmd1dHJvbml4LmRlCgotLS0KTGVvbmFyZCBHw7ZocnMgKDIpOgogICAgICBkdC1iaW5kaW5n
czogYXJtOiBzdG0zMjogYWRkIGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgTGludXggQXV0b21hdGlv
biBHbWJIIExYQSBGYWlyeVR1eCAyCiAgICAgIEFSTTogZHRzOiBzdG0zMjogbHhhLWZhaXJ5dHV4
MjogYWRkIExpbnV4IEF1dG9tYXRpb24gR21iSCBGYWlyeVR1eCAyCgogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgICAgICAgfCAgIDIgKwogYXJjaC9hcm0vYm9v
dC9kdHMvc3QvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogLi4uL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAxNTNjLWx4YS1mYWlyeXR1eDItZ2VuMS5kdHMgfCAxMDEgKysrKysrCiAu
Li4vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1M2MtbHhhLWZhaXJ5dHV4Mi1nZW4yLmR0cyB8IDE0NiAr
KysrKysrKwogLi4uL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUzYy1seGEtZmFpcnl0dXgyLmR0
c2kgfCAzOTQgKysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDY0NSBpbnNl
cnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogYjdlYmZiODRhMDlkZTZiNDQ0OTI5NzQzMzk2NTRk
OGZmYzVhZDllMQpjaGFuZ2UtaWQ6IDIwMjQxMjEwLWx4YS1mYWlyeXR1eC1lNzMwOTc5ZDNkM2YK
CkJlc3QgcmVnYXJkcywKLS0gCk1hcmMgS2xlaW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9uaXguZGU+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
