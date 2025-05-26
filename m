Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 828FBAC42DE
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 18:17:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 468C9C36B0F;
	Mon, 26 May 2025 16:17:56 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D3D3C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=/08m4WiVs71pwfy4afzILVd589TmeFYKjVShkpd/6Xk=;
 b=cOo+iE3dQ+XGIYC67LTJgRXrsxVcskrIamUspAxWNOfw8IHx5/c/BsJdxWpP0b
 hFyZpPd4mGHUNdODYM2R7dnnA+06xICpaWTakAoVHN5KaXSKJFTROQ7AKmYU9Qbk
 Hl+uhPbipikJOoBURZqbbS4fCK0F9+F8oUyWvbCVXLpUU=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wD3v1DYkzRowdzVEA--.46087S2; 
 Tue, 27 May 2025 00:16:36 +0800 (CST)
From: =?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jonas@kwiboo.se, rmk+kernel@armlinux.org.uk,
 david.wu@rock-chips.com, wens@csie.org, jan.petrous@oss.nxp.com
Date: Mon, 26 May 2025 09:16:21 -0700
Message-Id: <20250526161621.3549-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3v1DYkzRowdzVEA--.46087S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw13Wr1rCFWfAryUKF43GFg_yoWfXwcEga
 17ZFsaqa15GF4jyF98Cw45ZrWSvF4DWrs3ZFsxKayfCF47Xwn8XryDursxArnrur45AF9r
 Gr1fJFyxZ34xGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtCJPDUUUUU==
X-Originating-IP: [112.20.94.209]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBMR5Xq2gyA7BOhAADsz
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

c2luY2UgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgcGh5X3Bvd2VyX29uKCkgZnVuY3Rpb24gaXMg
YWx3YXlzIDAsCmNoZWNraW5nIGl0cyByZXR1cm4gdmFsdWUgaXMgcmVkdW5kYW50LgoKU2lnbmVk
LW9mZi1ieTog5p2O5ZOyIDxzZW5zb3IxMDEwQDE2My5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYyB8IDYgKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKaW5kZXggNzAwODU4ZmY2ZjdjLi42ZThiMTBm
ZGEyNGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLXJrLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
cmsuYwpAQCAtMTgzOSwxMSArMTgzOSw3IEBAIHN0YXRpYyBpbnQgcmtfZ21hY19wb3dlcnVwKHN0
cnVjdCBya19wcml2X2RhdGEgKmJzcF9wcml2KQogCQlkZXZfZXJyKGRldiwgIk5PIGludGVyZmFj
ZSBkZWZpbmVkIVxuIik7CiAJfQogCi0JcmV0ID0gcGh5X3Bvd2VyX29uKGJzcF9wcml2LCB0cnVl
KTsKLQlpZiAocmV0KSB7Ci0JCWdtYWNfY2xrX2VuYWJsZShic3BfcHJpdiwgZmFsc2UpOwotCQly
ZXR1cm4gcmV0OwotCX0KKwlwaHlfcG93ZXJfb24oYnNwX3ByaXYsIHRydWUpOwogCiAJcG1fcnVu
dGltZV9nZXRfc3luYyhkZXYpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
