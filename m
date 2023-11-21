Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B46B7F2F79
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 14:52:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAD93C6C83C;
	Tue, 21 Nov 2023 13:52:09 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05CC2C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 13:52:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAb-0006L2-BW; Tue, 21 Nov 2023 14:52:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAZ-00Ab1r-2e; Tue, 21 Nov 2023 14:52:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAY-004xgq-Pp; Tue, 21 Nov 2023 14:52:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 21 Nov 2023 14:50:30 +0100
Message-ID: <20231121134901.208535-89-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7vLR5Fx6dGFSOi8jTX7pv2vCjeBINyjLq2THXqzFGs0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLWt4Z3s2SIT30WmJ2DTFyhou+q4jrBrXrgZF
 f7TxskElOCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1rQAKCRCPgPtYfRL+
 Tpk0CACE1E9pQJtX34DxML1TNE/k3hvdapJ6pxXbTdG/jbmCWZLOL6kuROEBRsZQzAPma4mtu68
 X/xtsG0zaZK+xDdLm9YeMgLNQQq3uhX80um2ueFEHll2Bqd4CxhIyD73tg6EAkum3URGKZfnChM
 51mQ/NIim8f3dElF6mQsLGLRQop+l5DalrVlVewDQMO+NxuVBEWTS5nu0GAtRtuN44ASGskH/YK
 4DL8W4vYkFqjpMK4UAGplVGZpZ1EFUd6WiI9KzOiAR7JjHfV9+FLHeuXslyw7QgPtmWYRj+IHTd
 I9xvhmNgte2wXJS9Ar8BDwdnfm5VcF89s4JpkbMzxDbws+Fr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 088/108] pwm: stm32-lp: Make use of
	devm_pwmchip_alloc() function
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

VGhpcyBwcmVwYXJlcyB0aGUgcHdtLXN0bTMyLWxwIGRyaXZlciB0byBmdXJ0aGVyIGNoYW5nZXMg
b2YgdGhlIHB3bSBjb3JlCm91dGxpbmVkIGluIHRoZSBjb21taXQgaW50cm9kdWNpbmcgZGV2bV9w
d21jaGlwX2FsbG9jKCkuIFRoZXJlIGlzIG5vCmludGVuZGVkIHNlbWFudGljYWwgY2hhbmdlIGFu
ZCB0aGUgZHJpdmVyIHNob3VsZCBiZWhhdmUgYXMgYmVmb3JlLgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL3B3bS9wd20tc3RtMzItbHAuYyB8IDIzICsrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAu
YwppbmRleCAzNzU0ZmFlY2E4MzguLmEyMWQ4OWExZGYyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
d20vcHdtLXN0bTMyLWxwLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKQEAgLTE4
LDE0ICsxOCwxMyBAQAogI2luY2x1ZGUgPGxpbnV4L3B3bS5oPgogCiBzdHJ1Y3Qgc3RtMzJfcHdt
X2xwIHsKLQlzdHJ1Y3QgcHdtX2NoaXAgY2hpcDsKIAlzdHJ1Y3QgY2xrICpjbGs7CiAJc3RydWN0
IHJlZ21hcCAqcmVnbWFwOwogfTsKIAogc3RhdGljIGlubGluZSBzdHJ1Y3Qgc3RtMzJfcHdtX2xw
ICp0b19zdG0zMl9wd21fbHAoc3RydWN0IHB3bV9jaGlwICpjaGlwKQogewotCXJldHVybiBjb250
YWluZXJfb2YoY2hpcCwgc3RydWN0IHN0bTMyX3B3bV9scCwgY2hpcCk7CisJcmV0dXJuIHB3bWNo
aXBfcHJpdihjaGlwKTsKIH0KIAogLyogU1RNMzIgTG93LVBvd2VyIFRpbWVyIGlzIHByZWNlZGVk
IGJ5IGEgY29uZmlndXJhYmxlIHBvd2VyLW9mLTIgcHJlc2NhbGVyICovCkBAIC0xOTYsMjAgKzE5
NSwyMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHB3bV9vcHMgc3RtMzJfcHdtX2xwX29wcyA9IHsK
IHN0YXRpYyBpbnQgc3RtMzJfcHdtX2xwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiB7CiAJc3RydWN0IHN0bTMyX2xwdGltZXIgKmRkYXRhID0gZGV2X2dldF9kcnZkYXRhKHBk
ZXYtPmRldi5wYXJlbnQpOworCXN0cnVjdCBwd21fY2hpcCAqY2hpcDsKIAlzdHJ1Y3Qgc3RtMzJf
cHdtX2xwICpwcml2OwogCWludCByZXQ7CiAKLQlwcml2ID0gZGV2bV9remFsbG9jKCZwZGV2LT5k
ZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOwotCWlmICghcHJpdikKLQkJcmV0dXJuIC1F
Tk9NRU07CisJY2hpcCA9IGRldm1fcHdtY2hpcF9hbGxvYygmcGRldi0+ZGV2LCAxLCBzaXplb2Yo
KnByaXYpKTsKKwlpZiAoSVNfRVJSKGNoaXApKQorCQlyZXR1cm4gUFRSX0VSUihjaGlwKTsKKwlw
cml2ID0gdG9fc3RtMzJfcHdtX2xwKGNoaXApOwogCiAJcHJpdi0+cmVnbWFwID0gZGRhdGEtPnJl
Z21hcDsKIAlwcml2LT5jbGsgPSBkZGF0YS0+Y2xrOwotCXByaXYtPmNoaXAuZGV2ID0gJnBkZXYt
PmRldjsKLQlwcml2LT5jaGlwLm9wcyA9ICZzdG0zMl9wd21fbHBfb3BzOwotCXByaXYtPmNoaXAu
bnB3bSA9IDE7CisJY2hpcC0+b3BzID0gJnN0bTMyX3B3bV9scF9vcHM7CiAKLQlyZXQgPSBkZXZt
X3B3bWNoaXBfYWRkKCZwZGV2LT5kZXYsICZwcml2LT5jaGlwKTsKKwlyZXQgPSBkZXZtX3B3bWNo
aXBfYWRkKCZwZGV2LT5kZXYsIGNoaXApOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0Owog
CkBAIC0yMjAsMTMgKzIxOSwxMyBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9scF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiBzdGF0aWMgaW50IHN0bTMyX3B3bV9scF9zdXNw
ZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKLQlzdHJ1Y3Qgc3RtMzJfcHdtX2xwICpwcml2ID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7CisJc3RydWN0IHB3bV9jaGlwICpjaGlwID0gZGV2X2dldF9k
cnZkYXRhKGRldik7CiAJc3RydWN0IHB3bV9zdGF0ZSBzdGF0ZTsKIAotCXB3bV9nZXRfc3RhdGUo
JnByaXYtPmNoaXAucHdtc1swXSwgJnN0YXRlKTsKKwlwd21fZ2V0X3N0YXRlKCZjaGlwLT5wd21z
WzBdLCAmc3RhdGUpOwogCWlmIChzdGF0ZS5lbmFibGVkKSB7CiAJCWRldl9lcnIoZGV2LCAiVGhl
IGNvbnN1bWVyIGRpZG4ndCBzdG9wIHVzICglcylcbiIsCi0JCQlwcml2LT5jaGlwLnB3bXNbMF0u
bGFiZWwpOworCQkJY2hpcC0+cHdtc1swXS5sYWJlbCk7CiAJCXJldHVybiAtRUJVU1k7CiAJfQog
Ci0tIAoyLjQyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
