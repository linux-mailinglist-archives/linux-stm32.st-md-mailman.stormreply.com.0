Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D87AC9370
	for <lists+linux-stm32@lfdr.de>; Fri, 30 May 2025 18:22:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F7A9C35E3F;
	Fri, 30 May 2025 16:22:33 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94730C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=jCdzSFwYnDZECKuJL2W/gBgula6jQ6d53Xso4SG8qwc=;
 b=bgOHFXZ6AOcPgSn6ym7msrP48dbWljzcAVEwnjzBO7/oXxAHAUULqJD6I27cdv
 h+u3PCaPWVgo99D0n4WzIDBoN/1HO8nONEPPv8U6LLdUdo510JQnPBbYoAPTlnF+
 DdEOs9elr2f1D+e77+cMf8c5O3YO7kQv3r+rMGeFbQ+18=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wCXjDDH2jlouf2RFA--.37484S2; 
 Sat, 31 May 2025 00:20:31 +0800 (CST)
From: =?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jonas@kwiboo.se, rmk+kernel@armlinux.org.uk,
 david.wu@rock-chips.com, jan.petrous@oss.nxp.com,
 detlev.casanova@collabora.com
Date: Fri, 30 May 2025 09:20:17 -0700
Message-Id: <20250530162017.3661-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CM-TRANSID: _____wCXjDDH2jlouf2RFA--.37484S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4xKw1fAF1rZF13ArWDArb_yoW8Ww47p3
 9xCF92yr1kXryxGa17trsrZa45uayxtFy0qF1xt3yfu3WfCF1Dtry8tr4FvF109rykXF1a
 yr4UAF1fCFn8Wr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziFfO5UUUUU=
X-Originating-IP: [112.23.163.108]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBMQldq2g502LCbgAAsC
Cc: netdev@vger.kernel.org, =?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: dwmac-rk: No need to check the return
	value of the phy_power_on()
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

cGh5X3Bvd2VyX29uKCkgaXMgYSBsb2NhbCBzY29wZSBvbmUgd2l0aGluIHRoZSBkcml2ZXIsIHNp
bmNlIHRoZSByZXR1cm4KdmFsdWUgb2YgdGhlIHBoeV9wb3dlcl9vbigpIGZ1bmN0aW9uIGlzIGFs
d2F5cyAwLCBjaGVja2luZyBpdHMgcmV0dXJuCnZhbHVlIGlzIHJlZHVuZGFudC4KClNpZ25lZC1v
ZmYtYnk6IOadjuWTsiA8c2Vuc29yMTAxMEAxNjMuY29tPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMgfCAxNyArKysrLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKaW5kZXggNzAwODU4ZmY2
ZjdjLi5mN2MzMjkzNGY4YTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLXJrLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtcmsuYwpAQCAtMTY0NSwyMyArMTY0NSwxOCBAQCBzdGF0aWMgaW50IGdtYWNf
Y2xrX2VuYWJsZShzdHJ1Y3QgcmtfcHJpdl9kYXRhICpic3BfcHJpdiwgYm9vbCBlbmFibGUpCiAJ
cmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgcGh5X3Bvd2VyX29uKHN0cnVjdCBya19wcml2X2Rh
dGEgKmJzcF9wcml2LCBib29sIGVuYWJsZSkKK3N0YXRpYyB2b2lkIHBoeV9wb3dlcl9vbihzdHJ1
Y3QgcmtfcHJpdl9kYXRhICpic3BfcHJpdiwgYm9vbCBlbmFibGUpCiB7CiAJc3RydWN0IHJlZ3Vs
YXRvciAqbGRvID0gYnNwX3ByaXYtPnJlZ3VsYXRvcjsKLQlpbnQgcmV0OwogCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZic3BfcHJpdi0+cGRldi0+ZGV2OwogCiAJaWYgKGVuYWJsZSkgewotCQlyZXQg
PSByZWd1bGF0b3JfZW5hYmxlKGxkbyk7Ci0JCWlmIChyZXQpCisJCWlmIChyZWd1bGF0b3JfZW5h
YmxlKGxkbykpCiAJCQlkZXZfZXJyKGRldiwgImZhaWwgdG8gZW5hYmxlIHBoeS1zdXBwbHlcbiIp
OwogCX0gZWxzZSB7Ci0JCXJldCA9IHJlZ3VsYXRvcl9kaXNhYmxlKGxkbyk7Ci0JCWlmIChyZXQp
CisJCWlmIChyZWd1bGF0b3JfZGlzYWJsZShsZG8pKQogCQkJZGV2X2VycihkZXYsICJmYWlsIHRv
IGRpc2FibGUgcGh5LXN1cHBseVxuIik7CiAJfQotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBz
dHJ1Y3QgcmtfcHJpdl9kYXRhICpya19nbWFjX3NldHVwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYsCkBAIC0xODM5LDExICsxODM0LDcgQEAgc3RhdGljIGludCBya19nbWFjX3Bvd2VydXAo
c3RydWN0IHJrX3ByaXZfZGF0YSAqYnNwX3ByaXYpCiAJCWRldl9lcnIoZGV2LCAiTk8gaW50ZXJm
YWNlIGRlZmluZWQhXG4iKTsKIAl9CiAKLQlyZXQgPSBwaHlfcG93ZXJfb24oYnNwX3ByaXYsIHRy
dWUpOwotCWlmIChyZXQpIHsKLQkJZ21hY19jbGtfZW5hYmxlKGJzcF9wcml2LCBmYWxzZSk7Ci0J
CXJldHVybiByZXQ7Ci0JfQorCXBoeV9wb3dlcl9vbihic3BfcHJpdiwgdHJ1ZSk7CiAKIAlwbV9y
dW50aW1lX2dldF9zeW5jKGRldik7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
