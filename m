Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1742BB022
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Nov 2020 17:22:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67954C56632;
	Fri, 20 Nov 2020 16:22:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BE03C0692F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Nov 2020 16:22:13 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B5FC223BE;
 Fri, 20 Nov 2020 16:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889331;
 bh=ff2/0GFZmOkfOpWgo2XaheET+oxDW24eQaCng8TEeRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=txLefZFl+Pa19Ah6jARwsNIaAl85zEF8BVTjtIs8gGtaVceu098dLwQAJOKzm6EyP
 DfzYFWOyq1csi11jp2QG10FCsyS7Eq/xfAIK0Jww7vkS+bGf2VlQTx7At6DPFkhijo
 3hjIXMTXdbwjCFa1X3G7ApbZ87Glx5O8Ls3UaM00=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>
Date: Fri, 20 Nov 2020 17:21:29 +0100
Message-Id: <20201120162133.472938-12-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120162133.472938-1-krzk@kernel.org>
References: <20201120162133.472938-1-krzk@kernel.org>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 12/16] mfd: stmfx: drop of_match_ptr from
	of_device_id table
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

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLiAgVGhpcyBmaXhlcwpjb21waWxlIHdh
cm5pbmcgKCFDT05GSUdfT0Ygb24geDg2XzY0KToKCiAgZHJpdmVycy9tZmQvc3RtZnguYzo1NDI6
MzQ6IHdhcm5pbmc6IOKAmHN0bWZ4X29mX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9tZmQvc3RtZnguYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWZkL3N0bWZ4LmMgYi9kcml2ZXJzL21mZC9zdG1meC5jCmluZGV4IDVlNjgwYmZk
ZjVjOS4uMzgzMDNiNTM0MTcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21mZC9zdG1meC5jCisrKyBi
L2RyaXZlcnMvbWZkL3N0bWZ4LmMKQEAgLTU0OCw3ICs1NDgsNyBAQCBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBzdG1meF9vZl9tYXRjaCk7CiBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgc3RtZnhf
ZHJpdmVyID0gewogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gInN0bWZ4LWNvcmUiLAotCQkub2Zf
bWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoc3RtZnhfb2ZfbWF0Y2gpLAorCQkub2ZfbWF0Y2hf
dGFibGUgPSBzdG1meF9vZl9tYXRjaCwKIAkJLnBtID0gJnN0bWZ4X2Rldl9wbV9vcHMsCiAJfSwK
IAkucHJvYmUgPSBzdG1meF9wcm9iZSwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
