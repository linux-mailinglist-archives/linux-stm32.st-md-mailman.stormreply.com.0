Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C5630091
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Nov 2022 23:47:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11131C6507B;
	Fri, 18 Nov 2022 22:47:28 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09064C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Nov 2022 22:47:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA8b-0002Nr-3c; Fri, 18 Nov 2022 23:47:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA8Y-0058SL-E2; Fri, 18 Nov 2022 23:47:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA8Y-00008W-Ht; Fri, 18 Nov 2022 23:47:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Zheng Yongjun <zhengyongjun3@huawei.com>
Date: Fri, 18 Nov 2022 23:39:54 +0100
Message-Id: <20221118224540.619276-261-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 260/606] Input: stmfts - Convert to i2c's
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
LS0tCiBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3N0bWZ0cy5jIHwgNSArKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3N0bWZ0cy5jIGIvZHJpdmVycy9pbnB1dC90b3VjaHNj
cmVlbi9zdG1mdHMuYwppbmRleCBkNWJkMTcwODA4ZmIuLmQwOTJlODlkNDBlOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9zdG1mdHMuYworKysgYi9kcml2ZXJzL2lucHV0
L3RvdWNoc2NyZWVuL3N0bWZ0cy5jCkBAIC02MjQsOCArNjI0LDcgQEAgc3RhdGljIGludCBzdG1m
dHNfZW5hYmxlX2xlZChzdHJ1Y3Qgc3RtZnRzX2RhdGEgKnNkYXRhKQogCXJldHVybiAwOwogfQog
Ci1zdGF0aWMgaW50IHN0bWZ0c19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAotCQkJ
Y29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQorc3RhdGljIGludCBzdG1mdHNfcHJvYmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIHsKIAlpbnQgZXJyOwogCXN0cnVjdCBzdG1mdHNf
ZGF0YSAqc2RhdGE7CkBAIC04MDksNyArODA4LDcgQEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVy
IHN0bWZ0c19kcml2ZXIgPSB7CiAJCS5wbSA9ICZzdG1mdHNfcG1fb3BzLAogCQkucHJvYmVfdHlw
ZSA9IFBST0JFX1BSRUZFUl9BU1lOQ0hST05PVVMsCiAJfSwKLQkucHJvYmUgPSBzdG1mdHNfcHJv
YmUsCisJLnByb2JlX25ldyA9IHN0bWZ0c19wcm9iZSwKIAkucmVtb3ZlID0gc3RtZnRzX3JlbW92
ZSwKIAkuaWRfdGFibGUgPSBzdG1mdHNfaWQsCiB9OwotLSAKMi4zOC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
