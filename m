Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0659AD6B40
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 10:46:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87081C36B24;
	Thu, 12 Jun 2025 08:46:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9B79C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 08:46:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3338629E5;
 Thu, 12 Jun 2025 08:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBD7C4CEEA;
 Thu, 12 Jun 2025 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749717992;
 bh=q0g9wx98hCczaJZlZXB6wU/lJ/vXX/yhrFUxNtdecsI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V4ZzDTOMm61NFYpYB6+z5Vmibr2Z49kYL5cd8k0KqQ9JDUgYQJ7u65OkKMa2YJmj+
 RPyeZZITd3zBmzM5lCW6MPM37/+Co2LHZu8ZOQBDsKWZJ1cBGWvTODCTID8f47ClCI
 uDn52wkmG3saFUpQHqqZoL1gnPRS9cHERulCDL2l6XXQc7Vt4xMtXV2/t8+xRM0GjJ
 am1cgbSW5d+ZyONNkmDqrQZ1FYgqFX4ykE/wyyINs5Xarw1eo/6l2TWTOqWHn4yEn8
 y75TsIAs7+Gw80rAirMqqOLOFsVWk9x9QaHjJK2Q9BuOVeQBBlABD6+MMKic2QppPR
 W7v8KBZH8S7WA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: jic23@kernel.org
Date: Thu, 12 Jun 2025 10:46:27 +0200
Message-ID: <20250612084627.217341-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
References: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, tglx@linutronix.de,
 David Lechner <dlechner@baylibre.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
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
ZUBmb3NzLnN0LmNvbT4KQ2M6IGxpbnV4LWlpb0B2Z2VyLmtlcm5lbC5vcmcKCi0tLQpbdjJdCiog
Zml4IHN1YmplY3QKKiB3cmFwIHRvIDgwIGNoYXJzCgpDYzogbGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCi0tLQogZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3JlLmMgfCAzICstLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jIGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFk
Yy1jb3JlLmMKaW5kZXggYmQzNDU4OTY1YmZmLi5kZWExNjZjNTMzNjkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jCisrKyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0z
Mi1hZGMtY29yZS5jCkBAIC00MDcsNyArNDA3LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpcnFf
ZG9tYWluX29wcyBzdG0zMl9hZGNfZG9tYWluX29wcyA9IHsKIHN0YXRpYyBpbnQgc3RtMzJfYWRj
X2lycV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCQkJICAgICAgIHN0cnVj
dCBzdG0zMl9hZGNfcHJpdiAqcHJpdikKIHsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRl
di0+ZGV2Lm9mX25vZGU7CiAJdW5zaWduZWQgaW50IGk7CiAKIAkvKgpAQCAtNDIxLDcgKzQyMCw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRjX2lycV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2LAogCQkJcmV0dXJuIHByaXYtPmlycVtpXTsKIAl9CiAKLQlwcml2LT5kb21haW4gPSBp
cnFfZG9tYWluX2NyZWF0ZV9zaW1wbGUob2ZfZndub2RlX2hhbmRsZShucCksCisJcHJpdi0+ZG9t
YWluID0gaXJxX2RvbWFpbl9jcmVhdGVfc2ltcGxlKGRldl9md25vZGUoJnBkZXYtPmRldiksCiAJ
CQkJCQlTVE0zMl9BRENfTUFYX0FEQ1MsIDAsCiAJCQkJCQkmc3RtMzJfYWRjX2RvbWFpbl9vcHMs
CiAJCQkJCQlwcml2KTsKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
