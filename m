Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB4925DFFF
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Sep 2020 18:43:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 308E1C3FAD9;
	Fri,  4 Sep 2020 16:43:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77A78C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 16:43:44 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D3362064E;
 Fri,  4 Sep 2020 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599237823;
 bh=nxciuoD47KxGkOpJC1/Yb+VqPBHDhps24SnDZPx4IXk=;
 h=From:To:Cc:Subject:Date:From;
 b=vV07QlSQWiamQPiw7TcgBV0AVn8g3VLYp4Y0YEpQajmWoDymFi6NXno5wrMIrWqbk
 IYPI85Ll5xGRHSi6KObRaeEGTM/DoL18I/V+Yzx29NgruQPi31ggY144MQCLaytdIg
 uZHZpn9PJ/8lwmzuvIfusuOcx36eP0X6eMPZ8fYk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Prabu Thangamuthu <prabu.t@synopsys.com>,
 Manjunath M B <manjumb@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@axis.com
Date: Fri,  4 Sep 2020 18:43:14 +0200
Message-Id: <20200904164315.24618-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [Linux-stm32] [PATCH v2 1/2] mmc: host: Drop unneeded MMC
	dependency in Kconfig
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

QWxsIGVudHJpZXMgaW4gS2NvbmZpZyBhcmUgYWxyZWFkeSBwYXJ0IG9mICJpZiBNTUMiLCBzbyB0
aGVyZSBpcyBubyBuZWVkCmZvciBhZGRpdGlvbmFsIGRlcGVuZGVuY3kgb24gTU1DLgoKU3VnZ2Vz
dGVkLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+ClNpZ25l
ZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCi0tLQoKQ2hh
bmdlcyBzaW5jZSB2MToKMS4gTmV3IHBhdGNoCi0tLQogZHJpdmVycy9tbWMvaG9zdC9LY29uZmln
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZyBiL2RyaXZlcnMvbW1jL2hv
c3QvS2NvbmZpZwppbmRleCBiOTVmNzlmNTMzOTUuLmVlYTAxZmRlMDU5MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tbWMvaG9zdC9LY29uZmlnCisrKyBiL2RyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZwpA
QCAtNDIyLDcgKzQyMiw3IEBAIGNvbmZpZyBNTUNfU0RIQ0lfSVBST0MKIAogY29uZmlnIE1NQ19N
RVNPTl9HWAogCXRyaXN0YXRlICJBbWxvZ2ljIFM5MDUvR1gqL0FYRyBTRC9NTUMgSG9zdCBDb250
cm9sbGVyIHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBBUkNIX01FU09OICYmIE1NQworCWRlcGVuZHMg
b24gQVJDSF9NRVNPTgogCWhlbHAKIAkgIFRoaXMgc2VsZWN0cyBzdXBwb3J0IGZvciB0aGUgQW1s
b2dpYyBTRC9NTUMgSG9zdCBDb250cm9sbGVyCiAJICBmb3VuZCBvbiB0aGUgUzkwNS9HWCovQVhH
IGZhbWlseSBvZiBTb0NzLiAgVGhpcyBjb250cm9sbGVyIGlzCkBAIC00NTgsNyArNDU4LDcgQEAg
Y29uZmlnIE1NQ19NRVNPTl9NWF9TRElPCiAKIGNvbmZpZyBNTUNfTU9YQVJUCiAJdHJpc3RhdGUg
Ik1PWEFSVCBTRC9NTUMgSG9zdCBDb250cm9sbGVyIHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBBUkNI
X01PWEFSVCAmJiBNTUMKKwlkZXBlbmRzIG9uIEFSQ0hfTU9YQVJUCiAJaGVscAogCSAgVGhpcyBz
ZWxlY3RzIHN1cHBvcnQgZm9yIHRoZSBNT1hBUlQgU0QvTU1DIEhvc3QgQ29udHJvbGxlci4KIAkg
IE1PWEEgcHJvdmlkZXMgb25lIG11bHRpLWZ1bmN0aW9uYWwgY2FyZCByZWFkZXIgd2hpY2ggY2Fu
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
