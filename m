Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D42C8AC259
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F03BC7129A;
	Mon, 22 Apr 2024 00:20:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98683C7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:47 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7F8E488323;
 Mon, 22 Apr 2024 02:20:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745247;
 bh=takbKSJaPsE0+y1X5pgq5ZRPZJEtLVebLn71ZRBrb0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oSpX4do2iOHJLWIYCKUxEwiMjbvGfqKzxQg1ubwHV+EiabUxm44uqpBPHKrRZyBGT
 sT/CxH/ynE85i4onGZId+RnVbddi2FCAxvj/HV5LRhFZaiRcLqdsahL+zvjL2vucP/
 vX5+PZr8Wl318II1aejeCqOjM218mo4TYdr29TcGknYBhKg1PgyGHWZHX/8Oj350/x
 7Op1U9DHu3gdUqT5WyxQs9DPsZLtKeo1Kf6J1+yBsY6ZZQAyR//nZ0NcIRquyQV3sL
 34Mkd8z8DaUiCG4VzrvlESrsr/lHN+4/ycOsoAOBax1QXI+O+9yw+QIwWM+lLgWsY9
 jiF//f8Sx+VBQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:30 +0200
Message-ID: <20240422002006.243687-16-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 16/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 USART1 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgVVNBUlQxIHBpbnMsIHRoaXMgaXMgdXNlZCBvbgpE
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
ZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgfCAzMCArKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxMy1waW5jdHJsLmR0c2kKaW5kZXggN2FiZDIyN2U2OWY0Yi4uZGFlMDE1YTBkZGY4
NiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRz
aQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpCkBAIC02
ODgsNiArNjg4LDM2IEBAIHBpbnMgewogCQl9OwogCX07CiAKKwl1c2FydDFfcGluc19iOiB1c2Fy
dDEtMSB7CisJCXBpbnMxIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0MnLCAwLCBBRjcp
PjsgLyogVVNBUlQxX1RYICovCisJCQliaWFzLWRpc2FibGU7CisJCQlkcml2ZS1wdXNoLXB1bGw7
CisJCQlzbGV3LXJhdGUgPSA8MD47CisJCX07CisJCXBpbnMyIHsKKwkJCXBpbm11eCA9IDxTVE0z
Ml9QSU5NVVgoJ0QnLCAxNCwgQUY3KT47IC8qIFVTQVJUMV9SWCAqLworCQkJYmlhcy1wdWxsLXVw
OworCQl9OworCX07CisKKwl1c2FydDFfaWRsZV9waW5zX2I6IHVzYXJ0MS1pZGxlLTEgeworCQlw
aW5zMSB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdDJywgMCwgQU5BTE9HKT47IC8qIFVT
QVJUMV9UWCAqLworCQl9OworCQlwaW5zMiB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdE
JywgMTQsIEFGNyk+OyAvKiBVU0FSVDFfUlggKi8KKwkJCWJpYXMtcHVsbC11cDsKKwkJfTsKKwl9
OworCisJdXNhcnQxX3NsZWVwX3BpbnNfYjogdXNhcnQxLXNsZWVwLTEgeworCQlwaW5zIHsKKwkJ
CXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0MnLCAwLCBBTkFMT0cpPiwgLyogVVNBUlQxX1RYICov
CisJCQkJIDxTVE0zMl9QSU5NVVgoJ0QnLCAxNCwgQU5BTE9HKT47IC8qIFVTQVJUMV9SWCAqLwor
CQl9OworCX07CisKIAl1c2FydDJfcGluc19hOiB1c2FydDItMCB7CiAJCXBpbnMxIHsKIAkJCXBp
bm11eCA9IDxTVE0zMl9QSU5NVVgoJ0gnLCAxMiwgQUYxKT4sIC8qIFVTQVJUMl9UWCAqLwotLSAK
Mi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
