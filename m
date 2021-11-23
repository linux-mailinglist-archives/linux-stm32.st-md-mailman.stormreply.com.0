Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5372F459F3C
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Nov 2021 10:29:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0733DC5C82A;
	Tue, 23 Nov 2021 09:29:59 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5E8DC597BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 09:29:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mpS7e-0004zO-Sw; Tue, 23 Nov 2021 10:29:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1mpS7c-000acO-Ln; Tue, 23 Nov 2021 10:29:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mpS7b-0004Yb-LU; Tue, 23 Nov 2021 10:29:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Date: Tue, 23 Nov 2021 10:29:38 +0100
Message-Id: <20211123092939.82705-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211123092939.82705-1-u.kleine-koenig@pengutronix.de>
References: <20211123092939.82705-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=8jATezIbTlGSrdLdO5ys8yywShN3MuQ8u9zcvX9o3X4=;
 m=cvdV+JPCpFyGWqfi+3WupSS1omG0Q3Ie0aF8MW1uChg=;
 p=HJY9CrYP39XlcJYI39MINTuizNs0pUZ35b1qfFAIet4=;
 g=adb0b952bf122359cdcd76e56d37916d9ba326ee
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGctHwACgkQwfwUeK3K7AmyRwf+Ilq
 JW2RKt0X3FcdVjgT4WPQ9W6oZKassdpL/ekoiocKk0f4wxYVCsESNaS7xvG32DoikhE29/AKbKxN5
 ZUxXFJT5kvSRNuf9Y9LkNRrMOnZenSJf1vH9jp2XF+FBn69Zs10DKcwQ64g5kh90LZ0cA/08zTo35
 sstVme0+wbqkaLsmQww/QpLFQovf5fvdFn9c1FcT4xIWCJxIZa5/lhh3SPjXezUdYNwCqsJXNiosS
 FBF/tA6ljSGEMeJsV+NUU+zOwzgsY1q3BQ2LQIEVFA6d1O9/jinfbE7WXNMOuCaEHiPSk7R4wVG6T
 hMQC8udVYSWVyqnQLyHkprVROdmGJsA==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Sean Anderson <sean.anderson@seco.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 4/5] pwm: stmpe: Drop unused setting of driver
	data
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

VGhlIGRyaXZlciBuZXZlciB1c2VzIGRldl9nZXRfZHJ2ZGF0YSgpIHRvIHJldHJpZXZlIHRoZSBw
d20gZHJpdmVyIGRhdGEuClNvIGRyb3Agc2V0dGluZyBpdC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9wd20vcHdtLXN0bXBlLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtcGUuYyBiL2RyaXZlcnMvcHdtL3B3bS1z
dG1wZS5jCmluZGV4IDlkYzk4M2EzY2JmMS4uN2MwZTU2N2ZmNzFjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3B3bS9wd20tc3RtcGUuYworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtcGUuYwpAQCAtMzAx
LDggKzMwMSw2IEBAIHN0YXRpYyBpbnQgX19pbml0IHN0bXBlX3B3bV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gcmV0OwogCX0KIAotCXBsYXRmb3JtX3NldF9k
cnZkYXRhKHBkZXYsIHB3bSk7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4zMC4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
