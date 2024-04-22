Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ECD8AC25B
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5959EC7129B;
	Mon, 22 Apr 2024 00:20:50 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6190FC7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:48 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5972C88315;
 Mon, 22 Apr 2024 02:20:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745248;
 bh=OKJaAukXExnDYrQ44jGcx1NxCqvcn9vxyEbJX+2j5aY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=inGXIpi/nBbNwP5dnCkkri1K+rUM3I5tpExc2gPAZq+lRUNcOMjqtjatPgfKttxHm
 aDumi1DCwCYKGvcXkfzmBU+KjiwabvEIiN+FeeAq2Uk3wNAs9/nJyabxDWoefrHSu2
 gk7ouRNni9A6R2krtF9rOyOrzKFdRsQzXevpoQusWNpZVdVgM6KaKcOwwZA0tqL6sZ
 9VF4riFukjdzAQq+UGGPwVKguZAPJY0S0wQ2+KTaVY6CkLAF4JHKFL9O2P5dYjVpxP
 zH/8P7MhMxliQ1SQN7RDP+q1m00B2TjOjrz+aN8VLz6Y7v0baTMnGIwnT9BSbOyy49
 L5bhBmd+HpADw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:31 +0200
Message-ID: <20240422002006.243687-17-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422002006.243687-1-marex@denx.de>
References: <20240422002006.243687-1-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 17/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 USART2 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgVVNBUlQyIHBpbnMsIHRoaXMgaXMgdXNlZCBvbgpE
SCBlbGVjdHJvbmljcyBTVE0zMk1QMTN4eCBESENPUiBESFNCQyBib2FyZC4KClNpZ25lZC1vZmYt
Ynk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgotLS0KQ2M6ICJMZW9uYXJkIEfDtmhycyIg
PGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgpDYzogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5n
dXRyb25peC5kZT4KQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5z
dC5jb20+CkNjOiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KQ2M6IENv
bm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KQ2M6IERhcmlvIEJpbmFjY2hpIDxkYXJp
by5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KQ2M6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyemsrZHRAa2VybmVsLm9yZz4KQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4K
Q2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBTZWFuIE55ZWtqYWVyIDxzZWFu
QGdlYW5peC5jb20+CkNjOiBTdGVmZmVuIFRydW10cmFyIDxzLnRydW10cmFyQHBlbmd1dHJvbml4
LmRlPgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGtlcm5lbEBkaC1lbGVjdHJv
bmljcy5jb20KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQotLS0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgfCA0MSArKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxMy1waW5jdHJsLmR0c2kKaW5kZXggZGFlMDE1YTBkZGY4Ni4uNjVmOTEyNjVhNGQ0
YSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRz
aQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpCkBAIC03
NTgsNCArNzU4LDQ1IEBAIHBpbnMgewogCQkJCSA8U1RNMzJfUElOTVVYKCdFJywgMTEsIEFOQUxP
Ryk+OyAvKiBVU0FSVDJfQ1RTX05TUyAqLwogCQl9OwogCX07CisKKwl1c2FydDJfcGluc19iOiB1
c2FydDItMCB7CisJCXBpbnMxIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0YnLCAxMSwg
QUYxKT4sIC8qIFVTQVJUMl9UWCAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdBJywgMSwgQUY3KT47
IC8qIFVTQVJUMl9SVFMgKi8KKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWRyaXZlLXB1c2gtcHVsbDsK
KwkJCXNsZXctcmF0ZSA9IDwwPjsKKwkJfTsKKwkJcGluczIgeworCQkJcGlubXV4ID0gPFNUTTMy
X1BJTk1VWCgnRCcsIDE1LCBBRjEpPiwgLyogVVNBUlQyX1JYICovCisJCQkJIDxTVE0zMl9QSU5N
VVgoJ0UnLCAxNSwgQUYzKT47IC8qIFVTQVJUMl9DVFNfTlNTICovCisJCQliaWFzLWRpc2FibGU7
CisJCX07CisJfTsKKworCXVzYXJ0Ml9pZGxlX3BpbnNfYjogdXNhcnQyLWlkbGUtMCB7CisJCXBp
bnMxIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0YnLCAxMSwgQU5BTE9HKT4sIC8qIFVT
QVJUMl9UWCAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdFJywgMTUsIEFOQUxPRyk+OyAvKiBVU0FS
VDJfQ1RTX05TUyAqLworCQl9OworCQlwaW5zMiB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVY
KCdBJywgMSwgQUY3KT47IC8qIFVTQVJUMl9SVFMgKi8KKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWRy
aXZlLXB1c2gtcHVsbDsKKwkJCXNsZXctcmF0ZSA9IDwwPjsKKwkJfTsKKwkJcGluczMgeworCQkJ
cGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnRCcsIDE1LCBBRjEpPjsgLyogVVNBUlQyX1JYICovCisJ
CQliaWFzLWRpc2FibGU7CisJCX07CisJfTsKKworCXVzYXJ0Ml9zbGVlcF9waW5zX2I6IHVzYXJ0
Mi1zbGVlcC0wIHsKKwkJcGlucyB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdGJywgMTEs
IEFOQUxPRyk+LCAvKiBVU0FSVDJfVFggKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnQScsIDEsIEFO
QUxPRyk+LCAvKiBVU0FSVDJfUlRTICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0QnLCAxNSwgQU5B
TE9HKT4sIC8qIFVTQVJUMl9SWCAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdFJywgMTUsIEFOQUxP
Ryk+OyAvKiBVU0FSVDJfQ1RTX05TUyAqLworCQl9OworCX07CiB9OwotLSAKMi40My4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
