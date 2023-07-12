Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E7750908
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 15:02:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F419AC6B44E;
	Wed, 12 Jul 2023 13:02:09 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E43BC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 13:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=PNXY7AK9+1KCjIZmt16vPWCVc4fo9JVBMW55Z+fzIf8=; b=SGNDr4WZL48qkQ5RQh9B3tHZoh
 0TImBsBvFpTUa5IHxnViC1gYSpx3Zjx/WLcNEG3w4Q6xw6n8qQnBqJ4f3AYkzU8nK/XLDTMUUothx
 mIMrUgOU2h2i5pwi7dJSdRq8tJDC/SddJ/GsKw9et75J7uLHGRTCFvdxyvNx2B6gV1+p3qNcNA33D
 f5IEiZbfR0atJaBNmB6xLjIu8Hfuvt8BWDwI20g5UB7fR1TfxEfWczIlzUQkkKliswOhKT8dZP0m3
 jXgILVY88WGUcWEQj6Fk3hk5oqA/kpqEREUsA5BmeCFqM7p/wntDscyk/FhMVgWRXeNG4x3KXwnly
 r4Qy7xRA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qJZBg-000NMR-Ir; Wed, 12 Jul 2023 14:43:20 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qJZBg-000L9W-0D; Wed, 12 Jul 2023 14:43:20 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: l.goehrs@pengutronix.de, a.fatoum@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 12 Jul 2023 14:42:42 +0200
Message-Id: <20230712124248.2400862-4-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230712124248.2400862-1-sean@geanix.com>
References: <20230712124248.2400862-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26967/Wed Jul 12 09:28:32 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 4/9] ARM: dts: stm32: osd32: fix ldo1 not
	required to be always-on
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

QWNjb3JkaW5nIHRvIHRoZSBPU0QzMk1QMSBQb3dlciBTeXN0ZW0gb3ZlcnZpZXdbMV0gdGhlcmUg
aXMgbm8gaGFyZApyZXF1aXJlbWVudCBmb3IgdGhlIGxkbzEgdG8gYmUgYWx3YXlzLW9uLgoKWzFd
OiBodHRwczovL29jdGF2b3N5c3RlbXMuY29tL2FwcF9ub3Rlcy9vc2QzMm1wMS1wb3dlci1zeXN0
ZW0tb3ZlcnZpZXcvI2Nvbm5lY3Rpb25zCgpTaWduZWQtb2ZmLWJ5OiBTZWFuIE55ZWtqYWVyIDxz
ZWFuQGdlYW5peC5jb20+CkFja2VkLWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5nb2VocnNAcGVuZ3V0
cm9uaXguZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtb3NkMzIuZHRz
aSB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LW9zZDMyLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpCmluZGV4IGE0Mzk2NWM4NmZlOC4uZWI0M2Ex
ZTNhMGM5IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1vc2Qz
Mi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LW9zZDMyLmR0c2kK
QEAgLTExNyw5ICsxMTcsNyBAQCB2MXY4X2F1ZGlvOiBsZG8xIHsKIAkJCQlyZWd1bGF0b3ItbmFt
ZSA9ICJ2MXY4X2F1ZGlvIjsKIAkJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAw
PjsKIAkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKLQkJCQlyZWd1bGF0
b3ItYWx3YXlzLW9uOwogCQkJCWludGVycnVwdHMgPSA8SVRfQ1VSTElNX0xETzEgMD47Ci0KIAkJ
CX07CiAKIAkJCXYzdjNfaGRtaTogbGRvMiB7Ci0tIAoyLjQwLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
