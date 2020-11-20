Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C515E2BB02A
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Nov 2020 17:23:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AE26C56633;
	Fri, 20 Nov 2020 16:23:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EBC7C0692F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Nov 2020 16:23:23 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A90952225B;
 Fri, 20 Nov 2020 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889402;
 bh=b4u/t0Hst9rVcGF2Gll2KrBiXj/Rs/Ms1ZSr/qfr4Qs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oQk4n6t+bHcdcPjjQtvOOCwdEHG56qCd3TPvolN5j9amfJOg0ane3TwUS7DtOF8nV
 9QJlK92mQxfXy1zpdd422CVQk/staQv8VJ+96ZENEy8keCi/5daF3c5D/L0LDy8ltO
 cv4KzWulDnaxZ2kpCFOPy4xGfMfHr9vS5QktGsFE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Date: Fri, 20 Nov 2020 17:23:02 +0100
Message-Id: <20201120162303.482126-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120162303.482126-1-krzk@kernel.org>
References: <20201120162303.482126-1-krzk@kernel.org>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 5/6] dmaengine: stm32: mark of_device_id table
	as maybe unused
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

VGhlIGRyaXZlciB1c2VzIGEgc2Vjb25kIG9mX2RldmljZV9pZCB0YWJsZSBpbiB0aGUgcHJvYmUo
KQpmdW5jdGlvbiBieSBwYXNzaW5nIGl0IHRvIG9mX21hdGNoX25vZGUoKS4gIFRoaXMgY29kZSB3
aWxsIGJlIGEgbm8tb3AKZm9yIGNvbXBpbGUgdGVzdGluZyAoIUNPTkZJR19PRiBvbiB4ODZfNjQp
OgoKICAgIGRyaXZlcnMvZG1hL3N0bTMyLWRtYW11eC5jOjE3MTozNDogd2FybmluZzoKICAgICAg
ICDigJhzdG0zMl9zdG0zMmRtYV9tYXN0ZXJfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2RtYS9zdG0zMi1kbWFtdXguYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZG1hL3N0bTMyLWRtYW11eC5jIGIvZHJpdmVycy9kbWEvc3RtMzIt
ZG1hbXV4LmMKaW5kZXggYTEwY2NkOTY0Mzc2Li5lZjBkMDU1NTEwM2QgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZG1hL3N0bTMyLWRtYW11eC5jCisrKyBiL2RyaXZlcnMvZG1hL3N0bTMyLWRtYW11eC5j
CkBAIC0xNjgsNyArMTY4LDcgQEAgc3RhdGljIHZvaWQgKnN0bTMyX2RtYW11eF9yb3V0ZV9hbGxv
Y2F0ZShzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzICpkbWFfc3BlYywKIAlyZXR1cm4gRVJSX1BUUihy
ZXQpOwogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl9zdG0zMmRt
YV9tYXN0ZXJfbWF0Y2hbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0
bTMyX3N0bTMyZG1hX21hc3Rlcl9tYXRjaFtdIF9fbWF5YmVfdW51c2VkID0gewogCXsgLmNvbXBh
dGlibGUgPSAic3Qsc3RtMzItZG1hIiwgfSwKIAl7fSwKIH07Ci0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
