Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B937EAC2635
	for <lists+linux-stm32@lfdr.de>; Fri, 23 May 2025 17:17:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61BFDC7A82E;
	Fri, 23 May 2025 15:17:33 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5B52C7A82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 15:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=3aX8PUAXDaemiEQ3IrgJbnTZwuocxLWzcQByTZDngOU=;
 b=bBwVXnXV47gzp2czYWTvmcMKEgZrPMUK9feAAVxOgG4AOljD7u1FtJ/gbID3wl
 5TC1szaWCRf19jfCuTR/VW5SEF5Epmr+km/g05ps82PrudkZ4Yvhzmc8Mt1TrWCD
 6Jebflm7/aV9n/B/b9GcMaoiXetu2Kn3b8KGIMA2T9/L4=
Received: from localhost.localdomain (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgCXbyELkTBoFV96Bg--.59745S2;
 Fri, 23 May 2025 23:15:35 +0800 (CST)
From: =?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jonas@kwiboo.se, rmk+kernel@armlinux.org.uk,
 david.wu@rock-chips.com, wens@csie.org, u.kleine-koenig@baylibre.com,
 an.petrous@oss.nxp.com
Date: Fri, 23 May 2025 08:15:21 -0700
Message-Id: <20250523151521.3503-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgCXbyELkTBoFV96Bg--.59745S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1kXry3Kw4Dtr4DKr4Uurg_yoWkWFbE9w
 1Ivrn3XF45XF40kF1DGw13Zr9agFs8ZFs5Ar42gFWSvFW7Zwn8Zr4kWrsrArn5Ww48AF9r
 Gr1xAF1Iyw1xtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtCJPDUUUUU==
X-Originating-IP: [112.20.94.209]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBMR9Wq2gwKoMmeAABs9
Cc: netdev@vger.kernel.org, =?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: dwmac-rk: MAC clock should be truned off
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

aWYgUEhZIHBvd2VyLW9uIGZhaWxzLCBjbG9ja2Fzc29jaWF0ZWQgdGhlIE1BQyBzaG91bGQKYmUg
ZGlzYWJsZWQgZHVyaW5nIHRoZSBNQUMgaW5pdGlhbGl6YXRpb24gcHJvY2VzcwoKU2lnbmVkLW9m
Zi1ieTog5p2O5ZOyIDxzZW5zb3IxMDEwQDE2My5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwppbmRleCA3MDA4NThmZjZmN2MuLjAzNmU0NWJlNTgy
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
cmsuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5j
CkBAIC0xNjQ4LDcgKzE2NDgsNyBAQCBzdGF0aWMgaW50IGdtYWNfY2xrX2VuYWJsZShzdHJ1Y3Qg
cmtfcHJpdl9kYXRhICpic3BfcHJpdiwgYm9vbCBlbmFibGUpCiBzdGF0aWMgaW50IHBoeV9wb3dl
cl9vbihzdHJ1Y3QgcmtfcHJpdl9kYXRhICpic3BfcHJpdiwgYm9vbCBlbmFibGUpCiB7CiAJc3Ry
dWN0IHJlZ3VsYXRvciAqbGRvID0gYnNwX3ByaXYtPnJlZ3VsYXRvcjsKLQlpbnQgcmV0OworCWlu
dCByZXQgPSAwOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZic3BfcHJpdi0+cGRldi0+ZGV2Owog
CiAJaWYgKGVuYWJsZSkgewpAQCAtMTY2MSw3ICsxNjYxLDcgQEAgc3RhdGljIGludCBwaHlfcG93
ZXJfb24oc3RydWN0IHJrX3ByaXZfZGF0YSAqYnNwX3ByaXYsIGJvb2wgZW5hYmxlKQogCQkJZGV2
X2VycihkZXYsICJmYWlsIHRvIGRpc2FibGUgcGh5LXN1cHBseVxuIik7CiAJfQogCi0JcmV0dXJu
IDA7CisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIHN0cnVjdCBya19wcml2X2RhdGEgKnJrX2dt
YWNfc2V0dXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
