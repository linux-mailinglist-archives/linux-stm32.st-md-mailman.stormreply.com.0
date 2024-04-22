Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4B8AC25C
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 630D4C7129D;
	Mon, 22 Apr 2024 00:20:50 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30FD4C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:49 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3AFE588328;
 Mon, 22 Apr 2024 02:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745248;
 bh=L6rzBI/zr3bq1+TxXSMRPVauw9NfpeUOT1oMDA1Bew0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VSVZSEP9iAv+6C+eJILkYM1dYj9THMwtABGkd+zaWUrkHXo8uEX0qVrHb6adhTE5B
 0K+4e6jyaybApe7rV2l1acT0YAKJVeZ8jdenbLhffuHsA47cOA2T/hI3yubTp0xL1A
 zvV3N4JbPOIGA4QOfDXFEH1eo34EDo2hQIgJW8ySVdVPYpu8lKdKlLVCEf1YsDQxC5
 rh/3QUWUViHBS7pcPNhcayHTW/+UpBkYIGDouyZljjbGqtGkncD5WpKoz9wl9lSmyY
 mMKgThk6CLuZyTMB+I3g+sx++Nq8StktO0acslDj79Hgp0d1IwiFcYTi2piGBY0TVG
 4vbxj+uIfTt5g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:32 +0200
Message-ID: <20240422002006.243687-18-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 18/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 UART4 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgVUFSVDQgcGlucywgdGhpcyBpcyB1c2VkIG9uCkRI
IGVsZWN0cm9uaWNzIFNUTTMyTVAxM3h4IERIQ09SIERIU0JDIGJvYXJkLgoKU2lnbmVkLW9mZi1i
eTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Ci0tLQpDYzogIkxlb25hcmQgR8O2aHJzIiA8
bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+CkNjOiBBaG1hZCBGYXRvdW0gPGEuZmF0b3VtQHBlbmd1
dHJvbml4LmRlPgpDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0
LmNvbT4KQ2M6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgpDYzogQ29u
b3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPgpDYzogRGFyaW8gQmluYWNjaGkgPGRhcmlv
LmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgpDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6aytkdEBrZXJuZWwub3JnPgpDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgpD
YzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KQ2M6IFNlYW4gTnlla2phZXIgPHNlYW5A
Z2Vhbml4LmNvbT4KQ2M6IFN0ZWZmZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXgu
ZGU+CkNjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpDYzoga2VybmVsQGRoLWVsZWN0cm9u
aWNzLmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCi0tLQogYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaSB8IDMwICsrKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDEzLXBpbmN0cmwuZHRzaQppbmRleCA2NWY5MTI2NWE0ZDRhLi43MDE0YzdhNmQyM2U2
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNp
CisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kKQEAgLTYx
Nyw2ICs2MTcsMzYgQEAgcGlucyB7CiAJCX07CiAJfTsKIAorCXVhcnQ0X3BpbnNfYjogdWFydDQt
MSB7CisJCXBpbnMxIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0EnLCA5LCBBRjgpPjsg
LyogVUFSVDRfVFggKi8KKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWRyaXZlLXB1c2gtcHVsbDsKKwkJ
CXNsZXctcmF0ZSA9IDwwPjsKKwkJfTsKKwkJcGluczIgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJ
Tk1VWCgnRCcsIDgsIEFGOCk+OyAvKiBVQVJUNF9SWCAqLworCQkJYmlhcy1wdWxsLXVwOworCQl9
OworCX07CisKKwl1YXJ0NF9pZGxlX3BpbnNfYjogdWFydDQtaWRsZS0xIHsKKwkJcGluczEgewor
CQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnQScsIDksIEFOQUxPRyk+OyAvKiBVQVJUNF9UWCAq
LworCQl9OworCQlwaW5zMiB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdEJywgOCwgQUY4
KT47IC8qIFVBUlQ0X1JYICovCisJCQliaWFzLXB1bGwtdXA7CisJCX07CisJfTsKKworCXVhcnQ0
X3NsZWVwX3BpbnNfYjogdWFydDQtc2xlZXAtMSB7CisJCXBpbnMgeworCQkJcGlubXV4ID0gPFNU
TTMyX1BJTk1VWCgnQScsIDksIEFOQUxPRyk+LCAvKiBVQVJUNF9UWCAqLworCQkJCSA8U1RNMzJf
UElOTVVYKCdEJywgOCwgQU5BTE9HKT47IC8qIFVBUlQ0X1JYICovCisJCX07CisJfTsKKwogCXVh
cnQ4X3BpbnNfYTogdWFydDgtMCB7CiAJCXBpbnMxIHsKIAkJCXBpbm11eCA9IDxTVE0zMl9QSU5N
VVgoJ0UnLCAxLCBBRjgpPjsgLyogVUFSVDhfVFggKi8KLS0gCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
