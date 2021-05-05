Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB732373FCD
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 18:28:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77602C58D7A;
	Wed,  5 May 2021 16:28:54 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11EEAC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 16:28:51 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1leKOG-0002T0-CW; Wed, 05 May 2021 18:28:48 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1leKOE-0001Bc-NH; Wed, 05 May 2021 18:28:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Wed,  5 May 2021 18:28:43 +0200
Message-Id: <20210505162843.188901-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505162843.188901-1-u.kleine-koenig@pengutronix.de>
References: <20210505162843.188901-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 2/2] pwm: stm32-lp: Don't check the return
	code of pwmchip_remove()
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

cHdtY2hpcF9yZW1vdmUoKSBhbHdheXMgcmV0dXJucyAwLiBEb24ndCB1c2UgdGhlIHZhbHVlIHRv
IG1ha2UgaXQKcG9zc2libGUgdG8gZXZlbnR1YWxseSBjaGFuZ2UgdGhlIGZ1bmN0aW9uIHRvIHJl
dHVybiB2b2lkLiBUaGlzIGlzIGEKZ29vZCB0aGluZyBhcyBwd21jaGlwX3JlbW92ZSgpIGlzIHVz
dWFsbHkgY2FsbGVkIGZyb20gYSByZW1vdmUgZnVuY3Rpb24KKG1vc3RseSBmb3IgcGxhdGZvcm0g
ZGV2aWNlcykgYW5kIHRoZWlyIHJldHVybiB2YWx1ZSBpcyBpZ25vcmVkIGJ5IHRoZQpkZXZpY2Ug
Y29yZSBhbnlob3cuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIHwg
NCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgYi9kcml2ZXJzL3B3bS9wd20t
c3RtMzItbHAuYwppbmRleCAyNDY0ZjdhMjQ5ODMuLjU4YmM3NTg1N2I4MCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxw
LmMKQEAgLTIyNCw3ICsyMjQsOSBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9scF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJfcHdtX2xwICpwcml2
ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKLQlyZXR1cm4gcHdtY2hpcF9yZW1vdmUo
JnByaXYtPmNoaXApOworCXB3bWNoaXBfcmVtb3ZlKCZwcml2LT5jaGlwKTsKKworCXJldHVybiAw
OwogfQogCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3B3bV9scF9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikKLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
