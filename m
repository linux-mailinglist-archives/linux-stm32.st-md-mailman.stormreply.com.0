Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479C6300B1
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Nov 2022 23:48:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 364F6C6507E;
	Fri, 18 Nov 2022 22:48:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D86B0C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Nov 2022 22:47:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9K-0004Ie-MH; Fri, 18 Nov 2022 23:47:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9H-0058ii-Vc; Fri, 18 Nov 2022 23:47:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9I-0000Mi-4G; Fri, 18 Nov 2022 23:47:52 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 18 Nov 2022 23:43:15 +0100
Message-Id: <20221118224540.619276-462-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 461/606] mfd: stmpe-i2c: Convert to i2c's
	.probe_new()
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

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
Ci5wcm9iZV9uZXcoKSBkb2Vzbid0IGdldCB0aGUgaTJjX2RldmljZV9pZCAqIHBhcmFtZXRlciwg
c28gZGV0ZXJtaW5lCnRoYXQgZXhwbGljaXRseSBpbiB0aGUgcHJvYmUgZnVuY3Rpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPgotLS0KIGRyaXZlcnMvbWZkL3N0bXBlLWkyYy5jIHwgNSArKystLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21mZC9zdG1wZS1pMmMuYyBiL2RyaXZlcnMvbWZkL3N0bXBlLWkyYy5jCmluZGV4IGVhM2M4Njcy
Yjg1YS4uZDQ5NDRmYzFmZWIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL21mZC9zdG1wZS1pMmMuYwor
KysgYi9kcml2ZXJzL21mZC9zdG1wZS1pMmMuYwpAQCAtNjcsOCArNjcsOSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG1wZV9vZl9tYXRjaFtdID0gewogTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgc3RtcGVfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgaW50Ci1zdG1wZV9pMmNfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmkyYywgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlk
KQorc3RtcGVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMpCiB7CisJY29uc3Qgc3Ry
dWN0IGkyY19kZXZpY2VfaWQgKmlkID0gaTJjX2NsaWVudF9nZXRfZGV2aWNlX2lkKGkyYyk7CiAJ
ZW51bSBzdG1wZV9wYXJ0bnVtIHBhcnRudW07CiAJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAq
b2ZfaWQ7CiAKQEAgLTExNyw3ICsxMTgsNyBAQCBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgc3Rt
cGVfaTJjX2RyaXZlciA9IHsKIAkJLnBtID0gcG1fc2xlZXBfcHRyKCZzdG1wZV9kZXZfcG1fb3Bz
KSwKIAkJLm9mX21hdGNoX3RhYmxlID0gc3RtcGVfb2ZfbWF0Y2gsCiAJfSwKLQkucHJvYmUJCT0g
c3RtcGVfaTJjX3Byb2JlLAorCS5wcm9iZV9uZXcJPSBzdG1wZV9pMmNfcHJvYmUsCiAJLnJlbW92
ZQkJPSBzdG1wZV9pMmNfcmVtb3ZlLAogCS5pZF90YWJsZQk9IHN0bXBlX2kyY19pZCwKIH07Ci0t
IAoyLjM4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
