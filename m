Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F880373FCC
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 18:28:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7314CC5718F;
	Wed,  5 May 2021 16:28:53 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FDF4C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 16:28:51 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1leKOG-0002Sz-CX; Wed, 05 May 2021 18:28:48 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1leKOE-0001BZ-Hb; Wed, 05 May 2021 18:28:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Wed,  5 May 2021 18:28:42 +0200
Message-Id: <20210505162843.188901-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 1/2] pwm: stm32-lp: Don't modify HW state in
	.remove callback
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

QSBjb25zdW1lciBpcyBleHBlY3RlZCB0byBkaXNhYmxlIGEgUFdNIGJlZm9yZSBjYWxsaW5nIHB3
bV9wdXQoKS4gQW5kIGlmCnRoZXkgZGlkbid0IHRoZXJlIGlzIGhvcGVmdWxseSBhIGdvb2QgcmVh
c29uIChvciB0aGUgY29uc3VtZXIgbmVlZHMKZml4aW5nKS4gQWxzbyBpZiBkaXNhYmxpbmcgYW4g
ZW5hYmxlZCBQV00gd2FzIHRoZSByaWdodCB0aGluZyB0byBkbywKdGhpcyBzaG91bGQgYmV0dGVy
IGJlIGRvbmUgaW4gdGhlIGZyYW1ld29yayBpbnN0ZWFkIG9mIGluIGVhY2ggbG93IGxldmVsCmRy
aXZlci4KClNvIGRyb3AgdGhlIGhhcmR3YXJlIG1vZGlmaWNhdGlvbiBmcm9tIHRoZSAucmVtb3Zl
KCkgY2FsbGJhY2suCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIHwg
MiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wd20vcHdtLXN0bTMyLWxwLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYwppbmRleCBh
ZjA4ZjU2NGVmMWQuLjI0NjRmN2EyNDk4MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0
bTMyLWxwLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKQEAgLTIyNCw4ICsyMjQs
NiBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9scF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJfcHdtX2xwICpwcml2ID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7CiAKLQlwd21fZGlzYWJsZSgmcHJpdi0+Y2hpcC5wd21zWzBdKTsKLQogCXJl
dHVybiBwd21jaGlwX3JlbW92ZSgmcHJpdi0+Y2hpcCk7CiB9CiAKCmJhc2UtY29tbWl0OiBhNmVm
YjM1MDE5ZDAwZjQ4M2EwZTVmMTg4NzQ3NzIzMzcxZDY1OWZlCi0tIAoyLjMwLjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
