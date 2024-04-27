Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6928B48CE
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Apr 2024 00:11:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B7A6C71294;
	Sat, 27 Apr 2024 22:11:30 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD60DC71293
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2024 22:11:22 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 35D7A881F8;
 Sun, 28 Apr 2024 00:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1714255882;
 bh=QX5wg8H03Y76/IAFbub0DZS+NBRtA7iEmj/2mDAVlrU=;
 h=From:To:Cc:Subject:Date:From;
 b=rG4MOmno0jXHM7mHYCQnRDwDFOu5AqEW1JW3gxw5KJC8dymaYU8ijCukrh0EIptN0
 xx0Q8+4VP1tcG5PvRlzdYIve8C1RN5vyr1ApHPljEhz/JSwP9SQYCyKUK8dTBEaKMV
 zMCuqk2NGZDFgxAce1fH2TCciZfu8QS57DTdZAaC+kkCfblzoIsbhQ5BkEiJfWwRTB
 xS1tosVcBp5WK5c/yKPUcjUQiDytDITfAIphRhY2AC3+vfCxPfk3Ne2rRxYKY1PY9d
 aNTGnFqzsBFVRxKT8dHqJrDc1ed+Fsdhvhu/jm6UfyGaE27uDXchp6VQvVNWkzy+kj
 pBGoKKrHPGcBw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 28 Apr 2024 00:10:10 +0200
Message-ID: <20240427221048.65392-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/3] dt-bindings: arm: stm32: Add
	compatible string for DH electronics STM32MP13xx DHCOR DHSBC board
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

QWRkIERUIGNvbXBhdGlibGUgc3RyaW5nIGZvciBESCBlbGVjdHJvbmljcyBTVE0zMk1QMTN4eCBE
SENPUiBTb00gYW5kCkRIU0JDIGNhcnJpZXIgYm9hcmQuIFRoaXMgc3RtMzJtcDEzNWYtZGhjb3It
ZGhzYmMgYm9hcmQgaXMgYSBzdGFjayBvZgpESENPUiBTb00gYmFzZWQgb24gU1RNMzJNUDEzNUYg
U29DICg5MDBNSHogLyBjcnlwdG8gY2FwYWJpbGl0aWVzKQpwb3B1bGF0ZWQgb24gREhTQkMgY2Fy
cmllciBib2FyZC4KClRoZSBTb00gY29udGFpbnMgdGhlIGZvbGxvd2luZyBwZXJpcGhlcmFsczoK
LSBTVFBNSUMgKHBvd2VyIGRlbGl2ZXJ5KQotIDUxMk1CIEREUjNMIG1lbW9yeQotIGVNTUMgYW5k
IFNESU8gV2lGaSBtb2R1bGUKClRoZSBESFNCQyBjYXJyaWVyIGJvYXJkIGNvbnRhaW5zIHRoZSBm
b2xsb3dpbmcgcGVyaXBoZXJhbHM6Ci0gVHdvIFJHTUlJIEV0aGVybmV0IHBvcnRzCi0gVVNCLUEg
SG9zdCBwb3J0LCBVU0ItQyBwZXJpcGhlcmFsIHBvcnQsIFVTQi1DIHBvd2VyIHN1cHBseSBwbHVn
Ci0gRXhwYW5zaW9uIGNvbm5lY3RvcgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4
QGRlbnguZGU+Ci0tLQpDYzogIkxlb25hcmQgR8O2aHJzIiA8bC5nb2VocnNAcGVuZ3V0cm9uaXgu
ZGU+CkNjOiBBaG1hZCBGYXRvdW0gPGEuZmF0b3VtQHBlbmd1dHJvbml4LmRlPgpDYzogQWxleGFu
ZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KQ2M6IEFuZHJlIFByenl3
YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgpDYzogQ29ub3IgRG9vbGV5IDxjb25vcitkdEBr
ZXJuZWwub3JnPgpDYzogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgpDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgpD
YzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpDYzogTWF4aW1lIENv
cXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KQ2M6IFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4KQ2M6IFN0ZWZm
ZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXguZGU+CkNjOiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZwpDYzoga2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQpDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCi0tLQpWMjogRml4IHRoZSBiaW5kaW5ncyB0byBsaXN0IHRoZSByaWdo
dCBTb0MvU29NL0JvYXJkIGNvbXBhdGlibGVzCi0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwKaW5kZXggYmMyZjQzMzMwYWU0Mi4uNTgwOTk5
NDllOGYzYSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9zdG0zMi9zdG0zMi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vc3RtMzIvc3RtMzIueWFtbApAQCAtNTksNiArNTksMTIgQEAgcHJvcGVydGllczoKICAg
ICAgICAgICAgICAgLSBwcnQscHJ0dDFzICAgIyBQcm90b25pYyBQUlRUMVMKICAgICAgICAgICAt
IGNvbnN0OiBzdCxzdG0zMm1wMTUxCiAKKyAgICAgIC0gZGVzY3JpcHRpb246IERIIFNUTTMyTVAx
MzUgREhDT1IgU29NIGJhc2VkIEJvYXJkcworICAgICAgICBpdGVtczoKKyAgICAgICAgICAtIGNv
bnN0OiBkaCxzdG0zMm1wMTM1Zi1kaGNvci1kaHNiYworICAgICAgICAgIC0gY29uc3Q6IGRoLHN0
bTMybXAxMzVmLWRoY29yLXNvbQorICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMybXAxMzUKKwog
ICAgICAgLSBkZXNjcmlwdGlvbjogREggU1RNMzJNUDE1MSBESENPUiBTb00gYmFzZWQgQm9hcmRz
CiAgICAgICAgIGl0ZW1zOgogICAgICAgICAgIC0gY29uc3Q6IGRoLHN0bTMybXAxNTFhLWRoY29y
LXRlc3RiZW5jaAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
