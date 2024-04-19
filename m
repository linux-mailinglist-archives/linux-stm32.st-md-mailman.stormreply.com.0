Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 051FE8AA7D9
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 07:02:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0F32C6DD72;
	Fri, 19 Apr 2024 05:02:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 733C6C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 05:02:43 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DDF178860F;
 Fri, 19 Apr 2024 07:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713502962;
 bh=/7K16+lFmr4GqBnQeBVfOAuaKd9QSck1GMug9WoFvSw=;
 h=From:To:Cc:Subject:Date:From;
 b=hvx9/2A8C66P7Ncj6RgdVN2zrwlZvYezmUNYIy9IIrbIFJAbMnbIZoDz+toUyofWe
 CM8gEv6pWbQVu7mmiIvIaHVy91BtdOFRD7j6ublgWaGsiLnYArlH9EA16MqtLQwi8K
 AFa6Ku7UhlUE5G8SeJD2CdoHMRBm3cXkdwsZO+MQjFX0Xz4UshAmuAOnBz3HpXaH4U
 JQGgDLVPkORbskbWgvZZhUMLFqN8pR0pijJdZmDYgO5o+o37i0XG2v0Bsml85zXU8C
 v8XxQ9hmp1u6Nyx48Zv5vFb3NF5TFbqXZ2GU/8OvnBbA28Df2nvVO50HLN+lsk4kVV
 YNK8TJWNJtbwA==
From: Marek Vasut <marex@denx.de>
To: linux-crypto@vger.kernel.org
Date: Fri, 19 Apr 2024 07:01:12 +0200
Message-ID: <20240419050201.181041-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] hwrng: stm32 - use logical OR in
	conditional
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

VGhlIGNvbmRpdGlvbmFsIGlzIHVzZWQgdG8gY2hlY2sgd2hldGhlciBlcnIgaXMgbm9uLXplcm8g
T1Igd2hldGhlcgpyZWcgdmFyaWFibGUgaXMgbm9uLXplcm8gYWZ0ZXIgY2xlYXJpbmcgYml0cyBm
cm9tIGl0LiBUaGlzIHNob3VsZCBiZQpkb25lIHVzaW5nIGxvZ2ljYWwgT1IsIG5vdCBiaXR3aXNl
IE9SLCBmaXggaXQuCgpGaXhlczogNmI4NWE3ZTE0MWNiICgiaHdybmc6IHN0bTMyIC0gaW1wbGVt
ZW50IFNUTTMyTVAxM3ggc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJl
eEBkZW54LmRlPgotLS0KQ2M6ICJVd2UgS2xlaW5lLUvDtm5pZyIgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4KQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9z
cy5zdC5jb20+CkNjOiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5z
dC5jb20+CkNjOiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+CkNjOiBN
YXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+CkNjOiBPbGl2aWEgTWFj
a2FsbCA8b2xpdmlhQHNlbGVuaWMuY29tPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KQ2M6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+CkNjOiBrZXJu
ZWxAZGgtZWxlY3Ryb25pY3MuY29tCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKQ2M6IGxpbnV4LWNyeXB0b0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KLS0tCiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0
bTMyLXJuZy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYyBi
L2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMKaW5kZXggMzc5YmMyNDVjNTIwMi4u
MWNjNjFlZjhlZTU0YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1y
bmcuYworKysgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jCkBAIC0zNTMsNyAr
MzUzLDcgQEAgc3RhdGljIGludCBzdG0zMl9ybmdfaW5pdChzdHJ1Y3QgaHdybmcgKnJuZykKIAll
cnIgPSByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dF9hdG9taWMocHJpdi0+YmFzZSArIFJOR19T
UiwgcmVnLAogCQkJCQkJcmVnICYgUk5HX1NSX0RSRFksCiAJCQkJCQkxMCwgMTAwMDAwKTsKLQlp
ZiAoZXJyIHwgKHJlZyAmIH5STkdfU1JfRFJEWSkpIHsKKwlpZiAoZXJyIHx8IChyZWcgJiB+Uk5H
X1NSX0RSRFkpKSB7CiAJCWNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5jbGspOwogCQlkZXZf
ZXJyKChzdHJ1Y3QgZGV2aWNlICopcHJpdi0+cm5nLnByaXYsCiAJCQkiJXM6IHRpbWVvdXQ6JXgg
U1I6ICV4IVxuIiwgX19mdW5jX18sIGVyciwgcmVnKTsKLS0gCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
