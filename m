Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C28AC25E
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B61BC71296;
	Mon, 22 Apr 2024 00:20:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D88FC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:50 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0D8F788312;
 Mon, 22 Apr 2024 02:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745249;
 bh=jHT9ExLaPMZWc9ed806tdtwWjG9sWi8+PuBdJnBWNIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WJX0PdW1lt3iVws+BeelGWMl7i4IL4YAupKvKutxS8aZfJRKzhxMeTvkfLDJx7l8F
 OmSiBeMVGMujvF4DbOa/C2ugD3cqm9k/qfqiYA2LLagj0SYA2lZNMPB9lu187Gfljr
 yGvKDdsVwIzB0Ov3Cfr2Ss4nvJj+TVgX67/viGM8jBz7uoFvJmLXrDHkodXHyVyO2X
 dLvHW34ZvCFJAkzpnC1jtp8S/OtTNVucXyp5gO6nvFOGxv7bScQJbjb3SRJ/CJnHNx
 2+bBohDsffTOy9vpJ7Zy0QiQyOKSio9pAOHsdAc+fuPlynIlFSs93u+2nLmbxyp5fN
 uue7Wle0GAxCA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:33 +0200
Message-ID: <20240422002006.243687-19-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 19/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 UART7 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgVUFSVDcgcGlucywgdGhpcyBpcyB1c2VkIG9uCkRI
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
dHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaSB8IDQxICsrKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDEzLXBpbmN0cmwuZHRzaQppbmRleCA3MDE0YzdhNmQyM2U2Li5jMDFkMzlmMDNlYTQx
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNp
CisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kKQEAgLTY0
Nyw2ICs2NDcsNDcgQEAgcGlucyB7CiAJCX07CiAJfTsKIAorCXVhcnQ3X3BpbnNfYTogdWFydDct
MCB7CisJCXBpbnMxIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0gnLCAyLCBBRjgpPiwg
LyogVUFSVDdfVFggKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnQicsIDEyLCBBRjcpPjsgLyogVUFS
VDdfUlRTICovCisJCQliaWFzLWRpc2FibGU7CisJCQlkcml2ZS1wdXNoLXB1bGw7CisJCQlzbGV3
LXJhdGUgPSA8MD47CisJCX07CisJCXBpbnMyIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgo
J0UnLCAxMCwgQUY3KT4sIC8qIFVBUlQ3X1JYICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0cnLCA3
LCBBRjgpPjsgLyogVUFSVDdfQ1RTX05TUyAqLworCQkJYmlhcy1kaXNhYmxlOworCQl9OworCX07
CisKKwl1YXJ0N19pZGxlX3BpbnNfYTogdWFydDctaWRsZS0wIHsKKwkJcGluczEgeworCQkJcGlu
bXV4ID0gPFNUTTMyX1BJTk1VWCgnSCcsIDIsIEFOQUxPRyk+LCAvKiBVQVJUN19UWCAqLworCQkJ
CSA8U1RNMzJfUElOTVVYKCdHJywgNywgQU5BTE9HKT47IC8qIFVBUlQ3X0NUU19OU1MgKi8KKwkJ
fTsKKwkJcGluczIgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnQicsIDEyLCBBRjcpPjsg
LyogVUFSVDdfUlRTICovCisJCQliaWFzLWRpc2FibGU7CisJCQlkcml2ZS1wdXNoLXB1bGw7CisJ
CQlzbGV3LXJhdGUgPSA8MD47CisJCX07CisJCXBpbnMzIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9Q
SU5NVVgoJ0UnLCAxMCwgQUY3KT47IC8qIFVBUlQ3X1JYICovCisJCQliaWFzLWRpc2FibGU7CisJ
CX07CisJfTsKKworCXVhcnQ3X3NsZWVwX3BpbnNfYTogdWFydDctc2xlZXAtMCB7CisJCXBpbnMg
eworCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnSCcsIDIsIEFOQUxPRyk+LCAvKiBVQVJUN19U
WCAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdCJywgMTIsIEFOQUxPRyk+LCAvKiBVQVJUN19SVFMg
Ki8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnRScsIDEwLCBBTkFMT0cpPiwgLyogVUFSVDdfUlggKi8K
KwkJCQkgPFNUTTMyX1BJTk1VWCgnRycsIDcsIEFOQUxPRyk+OyAvKiBVQVJUN19DVFNfTlNTICov
CisJCX07CisJfTsKKwogCXVhcnQ4X3BpbnNfYTogdWFydDgtMCB7CiAJCXBpbnMxIHsKIAkJCXBp
bm11eCA9IDxTVE0zMl9QSU5NVVgoJ0UnLCAxLCBBRjgpPjsgLyogVUFSVDhfVFggKi8KLS0gCjIu
NDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
