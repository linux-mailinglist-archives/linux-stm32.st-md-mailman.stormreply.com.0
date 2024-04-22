Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F053C8AC242
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A09C6C6DD9A;
	Mon, 22 Apr 2024 00:20:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04DECC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:36 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E648288311;
 Mon, 22 Apr 2024 02:20:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745235;
 bh=0WAIir6pmYOE7fRhHAVw6R0Nbw4zWz9OPkn1lgq6o28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pxVPIBLosHYDx0LhZioRDA7MQJzTSEv5uAWf4QbHtzOnbLHG+erLXRYIS09cMBpij
 fCqnULkX5BMCf7yvveMsfHO/STGdmdKFNb+CCjDJJ6zJBe4eAZp2tK6r9m8qK7UyHH
 muYhQy0R1CWZ1xoTSltQP2NJ2dtNA7mORxYH7WaaGYAs2FOnizScsxlbAcHGqWXX7L
 YKjh8ArDVLDq69kjZ0GrwTLGBVoXAq0bCAK0N3yHkeWn04JgFp/1ZleN6CnlAOlZ2q
 vt61lfEpsnaBwqbtRMQPZvRfqrPFovGlCaGsN5zgNBjZcRMbvTkDEVepVvTeFxfb3Z
 aWaJxrASlJV3A==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:16 +0200
Message-ID: <20240422002006.243687-2-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 02/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 ADC pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgQURDIHBpbnMsIHRoaXMgaXMgdXNlZCBvbgpESCBl
bGVjdHJvbmljcyBTVE0zMk1QMTN4eCBESENPUiBESFNCQyBib2FyZC4KClNpZ25lZC1vZmYtYnk6
IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgotLS0KQ2M6ICJMZW9uYXJkIEfDtmhycyIgPGwu
Z29laHJzQHBlbmd1dHJvbml4LmRlPgpDYzogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5ndXRy
b25peC5kZT4KQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5j
b20+CkNjOiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KQ2M6IENvbm9y
IERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KQ2M6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5i
aW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGty
emsrZHRAa2VybmVsLm9yZz4KQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJv
Lm9yZz4KQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KQ2M6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdl
YW5peC5jb20+CkNjOiBTdGVmZmVuIFRydW10cmFyIDxzLnRydW10cmFyQHBlbmd1dHJvbml4LmRl
PgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGtlcm5lbEBkaC1lbGVjdHJvbmlj
cy5jb20KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQotLS0KIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
My1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5k
dHNpCmluZGV4IDI3ZTBjMzgyNjc4OWQuLjAzZGVkNDE1MzkwNjIgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaQpAQCAtNiw2ICs2LDEyIEBACiAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMi1waW5mdW5jLmg+CiAKICZwaW5jdHJsIHsKKwlh
ZGMxX3BpbnNfYTogYWRjMS1waW5zLTAgeworCQlwaW5zIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9Q
SU5NVVgoJ0EnLCAzLCBBTkFMT0cpPjsgLyogQURDMSBpbjEyICovCisJCX07CisJfTsKKwogCWFk
YzFfdXNiX2NjX3BpbnNfYTogYWRjMS11c2ItY2MtcGlucy0wIHsKIAkJcGlucyB7CiAJCQlwaW5t
dXggPSA8U1RNMzJfUElOTVVYKCdGJywgMTIsIEFOQUxPRyk+LCAvKiBBREMxIGluNiAqLwotLSAK
Mi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
