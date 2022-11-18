Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C56300B0
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Nov 2022 23:48:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 270DAC6507C;
	Fri, 18 Nov 2022 22:48:00 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F342C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Nov 2022 22:47:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9K-0004I9-K3; Fri, 18 Nov 2022 23:47:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9H-0058ib-Qb; Fri, 18 Nov 2022 23:47:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9H-0000Mf-Uv; Fri, 18 Nov 2022 23:47:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 18 Nov 2022 23:43:14 +0100
Message-Id: <20221118224540.619276-461-uwe@kleine-koenig.org>
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
Subject: [Linux-stm32] [PATCH 460/606] mfd: stmfx: Convert to i2c's
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
ClRoZSBwcm9iZSBmdW5jdGlvbiBkb2Vzbid0IG1ha2UgdXNlIG9mIHRoZSBpMmNfZGV2aWNlX2lk
ICogcGFyYW1ldGVyIHNvIGl0CmNhbiBiZSB0cml2aWFsbHkgY29udmVydGVkLgoKU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
LS0tCiBkcml2ZXJzL21mZC9zdG1meC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zdG1m
eC5jIGIvZHJpdmVycy9tZmQvc3RtZnguYwppbmRleCBhNzY1ZjBlMWNhYjQuLmUyODE5NzFiYTU0
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZmQvc3RtZnguYworKysgYi9kcml2ZXJzL21mZC9zdG1m
eC5jCkBAIC00MTAsOCArNDEwLDcgQEAgc3RhdGljIHZvaWQgc3RtZnhfY2hpcF9leGl0KHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQpCiAJfQogfQogCi1zdGF0aWMgaW50IHN0bWZ4X3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCi0JCSAgICAgICBjb25zdCBzdHJ1Y3QgaTJjX2Rldmlj
ZV9pZCAqaWQpCitzdGF0aWMgaW50IHN0bWZ4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGll
bnQpCiB7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2OwogCXN0cnVjdCBzdG1m
eCAqc3RtZng7CkBAIC01NTQsNyArNTUzLDcgQEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIHN0
bWZ4X2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gc3RtZnhfb2ZfbWF0Y2gsCiAJCS5w
bSA9IHBtX3NsZWVwX3B0cigmc3RtZnhfZGV2X3BtX29wcyksCiAJfSwKLQkucHJvYmUgPSBzdG1m
eF9wcm9iZSwKKwkucHJvYmVfbmV3ID0gc3RtZnhfcHJvYmUsCiAJLnJlbW92ZSA9IHN0bWZ4X3Jl
bW92ZSwKIH07CiBtb2R1bGVfaTJjX2RyaXZlcihzdG1meF9kcml2ZXIpOwotLSAKMi4zOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
