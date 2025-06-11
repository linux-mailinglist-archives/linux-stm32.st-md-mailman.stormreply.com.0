Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED3AD525A
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 12:44:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5AD7C36B1F;
	Wed, 11 Jun 2025 10:44:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D334EC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 10:44:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9535F4A60C;
 Wed, 11 Jun 2025 10:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E828CC4CEF1;
 Wed, 11 Jun 2025 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749638652;
 bh=XY1bFw2WKrjGrjUMr6K7T7hPamKz4LzK9z8ZINQUPZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uYa7JADiz4vkuaVd9vaqDCAVjdCcDvLZc9z811fTBpqSRN9W4IorsCBqtY95TTXrA
 t6e5T/AAoGoIjasNBY+R6YtdQGNIOFqzemBuzp8FxLGYcsnlU0qo1iUp5KuyWWlILl
 0C3kpXeBUP1d7hrW8olblffTXajjEBvINLpAs5Y6N1FC7dNPmy4xJA0PFPUHwjpUxW
 4QfTSK4r8/kCqB7LGQyCNugNqAhetxWdxOoXiQJsh8KJQZ7gEX3t4N42Kypvndi8MO
 VsJ4FbtBLIxmzpCu4EmOEJsj4oaZhjW/BJso/ykP+zBMlbewthc3wVTmEd3rdXG67X
 Ircrxk63TlvYA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 11 Jun 2025 12:43:37 +0200
Message-ID: <20250611104348.192092-9-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, tglx@linutronix.de,
 David Lechner <dlechner@baylibre.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH] iio: Use dev_fwnode()
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

aXJxX2RvbWFpbl9jcmVhdGVfc2ltcGxlKCkgdGFrZXMgZndub2RlIGFzIHRoZSBmaXJzdCBhcmd1
bWVudC4gSXQgY2FuIGJlCmV4dHJhY3RlZCBmcm9tIHRoZSBzdHJ1Y3QgZGV2aWNlIHVzaW5nIGRl
dl9md25vZGUoKSBoZWxwZXIgaW5zdGVhZCBvZgp1c2luZyBvZl9ub2RlIHdpdGggb2ZfZndub2Rl
X2hhbmRsZSgpLgoKU28gdXNlIHRoZSBkZXZfZndub2RlKCkgaGVscGVyLgoKU2lnbmVkLW9mZi1i
eTogSmlyaSBTbGFieSAoU1VTRSkgPGppcmlzbGFieUBrZXJuZWwub3JnPgpDYzogSm9uYXRoYW4g
Q2FtZXJvbiA8amljMjNAa2VybmVsLm9yZz4KQ2M6IERhdmlkIExlY2huZXIgPGRsZWNobmVyQGJh
eWxpYnJlLmNvbT4KQ2M6ICJOdW5vIFPDoSIgPG51bm8uc2FAYW5hbG9nLmNvbT4KQ2M6IEFuZHkg
U2hldmNoZW5rbyA8YW5keUBrZXJuZWwub3JnPgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tPgpDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1
ZUBmb3NzLnN0LmNvbT4KQ2M6IGxpbnV4LWlpb0B2Z2VyLmtlcm5lbC5vcmcKCi0tLQpDYzogbGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCi0tLQogZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3Jl
LmMgfCA3ICsrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3JlLmMgYi9k
cml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUuYwppbmRleCBiZDM0NTg5NjViZmYuLjU4YjU4
MzgyMjdhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3JlLmMKKysr
IGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3JlLmMKQEAgLTQwNyw3ICs0MDcsNiBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGlycV9kb21haW5fb3BzIHN0bTMyX2FkY19kb21haW5fb3BzID0g
ewogc3RhdGljIGludCBzdG0zMl9hZGNfaXJxX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYsCiAJCQkgICAgICAgc3RydWN0IHN0bTMyX2FkY19wcml2ICpwcml2KQogewotCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsKIAl1bnNpZ25lZCBpbnQgaTsK
IAogCS8qCkBAIC00MjEsMTAgKzQyMCw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRjX2lycV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCQkJcmV0dXJuIHByaXYtPmlycVtpXTsK
IAl9CiAKLQlwcml2LT5kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV9zaW1wbGUob2ZfZndub2Rl
X2hhbmRsZShucCksCi0JCQkJCQlTVE0zMl9BRENfTUFYX0FEQ1MsIDAsCi0JCQkJCQkmc3RtMzJf
YWRjX2RvbWFpbl9vcHMsCi0JCQkJCQlwcml2KTsKKwlwcml2LT5kb21haW4gPSBpcnFfZG9tYWlu
X2NyZWF0ZV9zaW1wbGUoZGV2X2Z3bm9kZSgmcGRldi0+ZGV2KSwgU1RNMzJfQURDX01BWF9BRENT
LCAwLAorCQkJCQkJJnN0bTMyX2FkY19kb21haW5fb3BzLCBwcml2KTsKIAlpZiAoIXByaXYtPmRv
bWFpbikgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gYWRkIGlycSBkb21haW5c
biIpOwogCQlyZXR1cm4gLUVOT01FTTsKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
