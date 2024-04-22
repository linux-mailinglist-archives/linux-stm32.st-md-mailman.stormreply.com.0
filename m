Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD308AC243
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B522FC7128A;
	Mon, 22 Apr 2024 00:20:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC190C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:36 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B9BA088312;
 Mon, 22 Apr 2024 02:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745236;
 bh=lkwZYPGL9RUwv5mle9kVh/lgKGdBi0lFINhZNuTKxp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U00GCQvE8PTu3NYHf+VTmMA1rrb9dQeFSCGGCj/rH/aecKC/BF6nQaOwbRHIHC93u
 dzDZRan2XXKa33vY78V5FT6H9/jABfESQxMcgpEAx+v1LrbdFZa8ngOXinWBkjKfq2
 Q3D5mNeCenFNCXeUw4Jj3sTin4kxpx4/qwxiu+VH9Fgpw9uF7wsAIfrCt15vxVgYci
 Xf3djnkWnSevhHY8bU1Jy0/fPzmoOpAWUKvZQeBNfOuexYC5uN0oZqMdz3bHGfkTqO
 nMAEbb60EviLZuTNHY1owjyvVmYbTN+42iPm5zX0Z0pfjfEzjddLN4QHd008Buj0RO
 Kj98wcCqODMtw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:17 +0200
Message-ID: <20240422002006.243687-3-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 03/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 ADC CC pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgQURDIENDIHBpbnMsIHRoaXMgaXMgdXNlZCBvbgpE
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
ZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTMtcGluY3RybC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0
cmwuZHRzaQppbmRleCAwM2RlZDQxNTM5MDYyLi4zOTZmYjZlZWU4NDEyIDEwMDY0NAotLS0gYS9h
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpCisrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kKQEAgLTE5LDYgKzE5LDEzIEBAIHBp
bnMgewogCQl9OwogCX07CiAKKwlhZGMxX3VzYl9jY19waW5zX2I6IGFkYzEtdXNiLWNjLXBpbnMt
MSB7CisJCXBpbnMgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnQScsIDUsIEFOQUxPRyk+
LCAvKiBBREMxX0lOUDIgKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnRicsIDEzLCBBTkFMT0cpPjsg
LyogQURDMV9JTlAxMSAqLworCQl9OworCX07CisKIAlpMmMxX3BpbnNfYTogaTJjMS0wIHsKIAkJ
cGlucyB7CiAJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdEJywgMTIsIEFGNSk+LCAvKiBJMkMx
X1NDTCAqLwotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
