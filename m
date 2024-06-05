Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB118FDA7E
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2024 01:28:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D42B0C78001;
	Wed,  5 Jun 2024 23:28:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DFFFC712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 23:28:30 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E0347881BC;
 Thu,  6 Jun 2024 01:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717630110;
 bh=Sh3L1tN8CDv44Y4aN0xsapeWAqaQcNJARHqWd6gqaXE=;
 h=From:To:Cc:Subject:Date:From;
 b=thYHs/ZITV40869tTbvw6rXrz4iFRCU5cmbPVRYspcxLpqn+IDWc+XANg9CpJ9SVI
 Fm1H+VDRZuG5ywLYPyTpbugoWC4f8fqKbiD1Grek8vgCeJaUUFvglDQpkEjk5jCoT7
 G4aoIW7nWJGlV92Ta+5B92oGbdbiVeviQZbt4IjSdyFBO8GpjqmZIbp2TDLZ9GA3Rh
 MNJKPmp/o6hv95Fzt3+y9kRw3l2i6BUnQUSa46GITjfayqAB5LEouZswmSwDECCIH+
 QbeMYAeM3WRGJx+C1ep5DG2XQYuZq5e0koWPJga1oOpm4JpT5jbjmCa3rGjkEXpWnn
 xcdwBoL0/gb/w==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu,  6 Jun 2024 01:27:01 +0200
Message-ID: <20240605232809.169927-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sean Nyekjaer <sean@geanix.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix STM32MP13xx DHCOR DHSBC
	Makefile entry
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

Rml4IHN0bTMybXAxMzVmLWRoY29yLWRoc2JjIGJvYXJkIE1ha2VmaWxlIGVudHJ5LApyZXBsYWNl
ICdkaHNvbScgd2l0aCAnZGhjb3InIHR5cG8uCgpGaXhlczogMTJmZjhlMTY3NjQxICgiQVJNOiBk
dHM6IHN0bTMyOiBBZGQgc3VwcG9ydCBmb3IgU1RNMzJNUDEzeHggREhDT1IgU29NIGFuZCBESFNC
QyBib2FyZCIpClNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgotLS0K
Q2M6ICJMZW9uYXJkIEfDtmhycyIgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgpDYzogQWhtYWQg
RmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4KQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFs
ZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+CkNjOiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6
eXdhcmFAYXJtLmNvbT4KQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KQ2M6
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KQ2M6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz4KQ2M6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVl
bGluLnN0bTMyQGdtYWlsLmNvbT4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNj
OiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+CkNjOiBTdGVmZmVuIFRydW10cmFyIDxz
LnRydW10cmFyQHBlbmd1dHJvbml4LmRlPgpDYzogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIu
YXV1Zy5vcmcuYXU+CkNjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpDYzoga2VybmVsQGRo
LWVsZWN0cm9uaWNzLmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
CkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCi0tLQogYXJjaC9h
cm0vYm9vdC9kdHMvc3QvTWFrZWZpbGUgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9N
YWtlZmlsZSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlCmluZGV4IGRiOTcxODA1OWFl
MmYuLjAxNTkwM2QwOTMyM2YgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2Vm
aWxlCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlCkBAIC0yOSw3ICsyOSw3IEBA
IGR0Yi0kKENPTkZJR19BUkNIX1NUTTMyKSArPSBcCiAJc3RtMzJoNzQzaS1ldmFsLmR0YiBcCiAJ
c3RtMzJoNzQzaS1kaXNjby5kdGIgXAogCXN0bTMyaDc1MGktYXJ0LXBpLmR0YiBcCi0Jc3RtMzJt
cDEzNWYtZGhzb20tZGhzYmMuZHRiIFwKKwlzdG0zMm1wMTM1Zi1kaGNvci1kaHNiYy5kdGIgXAog
CXN0bTMybXAxMzVmLWRrLmR0YiBcCiAJc3RtMzJtcDE1MWEtcHJ0dDFhLmR0YiBcCiAJc3RtMzJt
cDE1MWEtcHJ0dDFjLmR0YiBcCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
