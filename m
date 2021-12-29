Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D47A481499
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Dec 2021 16:45:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B02AAC5E2CC;
	Wed, 29 Dec 2021 15:45:06 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F165C5C82B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Dec 2021 15:45:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2b8N-0006qd-52; Wed, 29 Dec 2021 16:44:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2b8H-007KHf-NK; Wed, 29 Dec 2021 16:44:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2b8G-00015t-Bc; Wed, 29 Dec 2021 16:44:52 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Wed, 29 Dec 2021 16:44:39 +0100
Message-Id: <20211229154441.38045-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229154441.38045-1-u.kleine-koenig@pengutronix.de>
References: <20211229154441.38045-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2830; h=from:subject;
 bh=Z30Y5klYFwnFI5jJS4Jj6GD8bn4cD3tqmAq9j/Gq+4c=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBhzIJacwTnYraxEudTA2g4uyLsOHdO8G35dTdIsTc6
 TGeqWNSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYcyCWgAKCRDB/BR4rcrsCdEXB/
 9ak1i59flop7l6GePuduqIvXEWIS7FcFHzY5YVx4oZA854nfbqb6wl9rFw4ITFyrc3lnLgG7w4oeS8
 yZoTQW+0GuyOXCm1gGExDXyVjGUHCpmqMLqUUKMrymaA72Z+xVR/MyCRlqxYnycc5h3k6g2VDIg/pa
 EoUWnI00EeeXOJtG3BUhSmS+cmI0bAU5O0N5vEdGujTrMFxImHRE+xULBSye/Koj/UdXiYHZNZ/kBO
 PrP/0JF9c8MN/iw4IJZH6vm2h+d9SGRpkpdP++575L9PEWcxg0uN/Fx7Jm93YTvOmYN5XeIvLUf3MZ
 69FznVb2cDpbc4C9pkWDl1rGJhK9mb
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 21/23] counter: stm32-lptimer-cnt: Convert
	to new counter registration
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

VGhpcyBmaXhlcyBkZXZpY2UgbGlmZXRpbWUgaXNzdWVzIHdoZXJlIGl0IHdhcyBwb3NzaWJsZSB0
byBmcmVlIGEgbGl2ZQpzdHJ1Y3QgZGV2aWNlLgoKRml4ZXM6IDU5N2Y1NWUzZjM2YyAoImNvdW50
ZXI6IHN0bTMyLWxwdGltZXI6IGFkZCBjb3VudGVyIGRldmljZSIpClJldmlld2VkLWJ5OiBKb25h
dGhhbiBDYW1lcm9uIDxKb25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+CkFja2VkLWJ5OiBXaWxs
aWFtIEJyZWF0aGl0dCBHcmF5IDx2aWxoZWxtLmdyYXlAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0K
IGRyaXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNudC5jIHwgMzMgKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NvdW50ZXIvc3RtMzItbHB0aW1lci1jbnQu
YyBiL2RyaXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNudC5jCmluZGV4IDljZjAwZTkyOWNj
MC4uNjgwMzFkOTNjZTg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2NvdW50ZXIvc3RtMzItbHB0aW1l
ci1jbnQuYworKysgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItbHB0aW1lci1jbnQuYwpAQCAtMjAs
NyArMjAsNiBAQAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAKIHN0cnVjdCBzdG0zMl9scHRp
bV9jbnQgewotCXN0cnVjdCBjb3VudGVyX2RldmljZSBjb3VudGVyOwogCXN0cnVjdCBkZXZpY2Ug
KmRldjsKIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7CiAJc3RydWN0IGNsayAqY2xrOwpAQCAtNDEx
LDE0ICs0MTAsMTcgQEAgc3RhdGljIHN0cnVjdCBjb3VudGVyX2NvdW50IHN0bTMyX2xwdGltX2lu
MV9jb3VudHMgPSB7CiBzdGF0aWMgaW50IHN0bTMyX2xwdGltX2NudF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBzdG0zMl9scHRpbWVyICpkZGF0YSA9IGRl
dl9nZXRfZHJ2ZGF0YShwZGV2LT5kZXYucGFyZW50KTsKKwlzdHJ1Y3QgY291bnRlcl9kZXZpY2Ug
KmNvdW50ZXI7CiAJc3RydWN0IHN0bTMyX2xwdGltX2NudCAqcHJpdjsKKwlpbnQgcmV0OwogCiAJ
aWYgKElTX0VSUl9PUl9OVUxMKGRkYXRhKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlwcml2ID0g
ZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOwotCWlm
ICghcHJpdikKKwljb3VudGVyID0gZGV2bV9jb3VudGVyX2FsbG9jKCZwZGV2LT5kZXYsIHNpemVv
ZigqcHJpdikpOworCWlmICghY291bnRlcikKIAkJcmV0dXJuIC1FTk9NRU07CisJcHJpdiA9IGNv
dW50ZXJfcHJpdihjb3VudGVyKTsKIAogCXByaXYtPmRldiA9ICZwZGV2LT5kZXY7CiAJcHJpdi0+
cmVnbWFwID0gZGRhdGEtPnJlZ21hcDsKQEAgLTQyNiwyMyArNDI4LDI2IEBAIHN0YXRpYyBpbnQg
c3RtMzJfbHB0aW1fY250X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcHJp
di0+Y2VpbGluZyA9IFNUTTMyX0xQVElNX01BWF9BUlI7CiAKIAkvKiBJbml0aWFsaXplIENvdW50
ZXIgZGV2aWNlICovCi0JcHJpdi0+Y291bnRlci5uYW1lID0gZGV2X25hbWUoJnBkZXYtPmRldik7
Ci0JcHJpdi0+Y291bnRlci5wYXJlbnQgPSAmcGRldi0+ZGV2OwotCXByaXYtPmNvdW50ZXIub3Bz
ID0gJnN0bTMyX2xwdGltX2NudF9vcHM7CisJY291bnRlci0+bmFtZSA9IGRldl9uYW1lKCZwZGV2
LT5kZXYpOworCWNvdW50ZXItPnBhcmVudCA9ICZwZGV2LT5kZXY7CisJY291bnRlci0+b3BzID0g
JnN0bTMyX2xwdGltX2NudF9vcHM7CiAJaWYgKGRkYXRhLT5oYXNfZW5jb2RlcikgewotCQlwcml2
LT5jb3VudGVyLmNvdW50cyA9ICZzdG0zMl9scHRpbV9lbmNfY291bnRzOwotCQlwcml2LT5jb3Vu
dGVyLm51bV9zaWduYWxzID0gQVJSQVlfU0laRShzdG0zMl9scHRpbV9jbnRfc2lnbmFscyk7CisJ
CWNvdW50ZXItPmNvdW50cyA9ICZzdG0zMl9scHRpbV9lbmNfY291bnRzOworCQljb3VudGVyLT5u
dW1fc2lnbmFscyA9IEFSUkFZX1NJWkUoc3RtMzJfbHB0aW1fY250X3NpZ25hbHMpOwogCX0gZWxz
ZSB7Ci0JCXByaXYtPmNvdW50ZXIuY291bnRzID0gJnN0bTMyX2xwdGltX2luMV9jb3VudHM7Ci0J
CXByaXYtPmNvdW50ZXIubnVtX3NpZ25hbHMgPSAxOworCQljb3VudGVyLT5jb3VudHMgPSAmc3Rt
MzJfbHB0aW1faW4xX2NvdW50czsKKwkJY291bnRlci0+bnVtX3NpZ25hbHMgPSAxOwogCX0KLQlw
cml2LT5jb3VudGVyLm51bV9jb3VudHMgPSAxOwotCXByaXYtPmNvdW50ZXIuc2lnbmFscyA9IHN0
bTMyX2xwdGltX2NudF9zaWduYWxzOwotCXByaXYtPmNvdW50ZXIucHJpdiA9IHByaXY7CisJY291
bnRlci0+bnVtX2NvdW50cyA9IDE7CisJY291bnRlci0+c2lnbmFscyA9IHN0bTMyX2xwdGltX2Nu
dF9zaWduYWxzOwogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7CiAKLQlyZXR1
cm4gZGV2bV9jb3VudGVyX3JlZ2lzdGVyKCZwZGV2LT5kZXYsICZwcml2LT5jb3VudGVyKTsKKwly
ZXQgPSBkZXZtX2NvdW50ZXJfYWRkKCZwZGV2LT5kZXYsIGNvdW50ZXIpOworCWlmIChyZXQgPCAw
KQorCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsICJGYWlsZWQgdG8gYWRk
IGNvdW50ZXJcbiIpOworCisJcmV0dXJuIDA7CiB9CiAKICNpZmRlZiBDT05GSUdfUE1fU0xFRVAK
LS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
