Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE06854571
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 10:34:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89DB7C7128C;
	Wed, 14 Feb 2024 09:34:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D768C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf4-0005kE-MU; Wed, 14 Feb 2024 10:34:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf1-000fFr-Hl; Wed, 14 Feb 2024 10:34:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf1-004Y7Z-1W;
 Wed, 14 Feb 2024 10:34:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:42 +0100
Message-ID: <3db96cd915d9d8fc350a7193c0d55dd109b1f035.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2861;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=eAn5zF3jZjX3+BIQYFdyKESVmjjGkTa7aWulVHapXqA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjPJCfNH6vyPPPC9avsKPPfP5Ivo6fJsl5ri
 EkWkZwDeV6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyIzwAKCRCPgPtYfRL+
 Ti8FB/49TDgXTFVxzSGv2wqrXOht+HhTFwO/+fq5SwdAa1NB0Vd+V2oRnUPUNqnvITBnGNZYUTc
 50nI/TKddrey92Dw2XIPUXF+vDUSFz5Uo9sA9P/9caEPlNu9V6mSEPqeO1g+XytuZd7GJwFxsRi
 7Ju6Jl3g++puBlegdyWdLeoByphzx33an6HLAn4kTPAxlU8R8r/wxXkHzdHwWiZvCmB1/8LdIig
 3PyedNiS58IZ0D4d05fpEnk8dreVHah7ZIChpazCSfvdbVO6E/19LUUM4eiLl+49QEd6fWpn+gj
 JHgpaBITWpsN1J6c6HRLgpSW1G1KgbWoXoU0f9sa0GmYvSoj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 115/164] pwm: stm32: Prepare removing
	pwm_chip from driver data
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

VGhpcyBwcmVwYXJlcyB0aGUgZHJpdmVyIGZvciBmdXJ0aGVyIGNoYW5nZXMgdGhhdCB3aWxsIGRy
b3Agc3RydWN0CnB3bV9jaGlwIGNoaXAgZnJvbSBzdHJ1Y3Qgc3RtMzJfcHdtLiBVc2UgdGhlIHB3
bV9jaGlwIGFzIGRyaXZlcgpkYXRhIGluc3RlYWQgb2YgdGhlIHN0bTMyX3B3bSB0byBnZXQgYWNj
ZXNzIHRvIHRoZSBwd21fY2hpcCBpbgpzdG0zMl9wd21fc3VzcGVuZCgpIHdpdGhvdXQgdXNpbmcg
cHJpdi0+Y2hpcC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgfCAyMiAr
KysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2Ry
aXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IGVjMTViYzUxZDkzMC4uNGQxMmYzZDg0OWNkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYworKysgYi9kcml2ZXJzL3B3bS9wd20t
c3RtMzIuYwpAQCAtNjMwLDYgKzYzMCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwogCXN0cnVjdCBz
dG0zMl90aW1lcnMgKmRkYXRhID0gZGV2X2dldF9kcnZkYXRhKHBkZXYtPmRldi5wYXJlbnQpOwor
CXN0cnVjdCBwd21fY2hpcCAqY2hpcDsKIAlzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2OwogCXVuc2ln
bmVkIGludCBudW1fZW5hYmxlZDsKIAl1bnNpZ25lZCBpbnQgaTsKQEAgLTYzOCw2ICs2MzksNyBA
QCBzdGF0aWMgaW50IHN0bTMyX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsK
IAlpZiAoIXByaXYpCiAJCXJldHVybiAtRU5PTUVNOworCWNoaXAgPSAmcHJpdi0+Y2hpcDsKIAog
CW11dGV4X2luaXQoJnByaXYtPmxvY2spOwogCXByaXYtPnJlZ21hcCA9IGRkYXRhLT5yZWdtYXA7
CkBAIC02NTMsMzcgKzY1NSwzOCBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJc3RtMzJfcHdtX2RldGVjdF9jb21wbGVtZW50YXJ5
KHByaXYpOwogCi0JcHJpdi0+Y2hpcC5kZXYgPSBkZXY7Ci0JcHJpdi0+Y2hpcC5vcHMgPSAmc3Rt
MzJwd21fb3BzOwotCXByaXYtPmNoaXAubnB3bSA9IHN0bTMyX3B3bV9kZXRlY3RfY2hhbm5lbHMo
cHJpdiwgJm51bV9lbmFibGVkKTsKKwljaGlwLT5kZXYgPSBkZXY7CisJY2hpcC0+b3BzID0gJnN0
bTMycHdtX29wczsKKwljaGlwLT5ucHdtID0gc3RtMzJfcHdtX2RldGVjdF9jaGFubmVscyhwcml2
LCAmbnVtX2VuYWJsZWQpOwogCiAJLyogSW5pdGlhbGl6ZSBjbG9jayByZWZjb3VudCB0byBudW1i
ZXIgb2YgZW5hYmxlZCBQV00gY2hhbm5lbHMuICovCiAJZm9yIChpID0gMDsgaSA8IG51bV9lbmFi
bGVkOyBpKyspCiAJCWNsa19lbmFibGUocHJpdi0+Y2xrKTsKIAotCXJldCA9IGRldm1fcHdtY2hp
cF9hZGQoZGV2LCAmcHJpdi0+Y2hpcCk7CisJcmV0ID0gZGV2bV9wd21jaGlwX2FkZChkZXYsIGNo
aXApOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCi0JcGxhdGZvcm1fc2V0X2RydmRh
dGEocGRldiwgcHJpdik7CisJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgY2hpcCk7CiAKIAly
ZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBzdG0zMl9wd21fc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiB7Ci0Jc3RydWN0IHN0bTMyX3B3bSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
OworCXN0cnVjdCBwd21fY2hpcCAqY2hpcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCXN0cnVj
dCBzdG0zMl9wd20gKnByaXYgPSB0b19zdG0zMl9wd21fZGV2KGNoaXApOwogCXVuc2lnbmVkIGlu
dCBpOwogCXUzMiBjY2VyLCBtYXNrOwogCiAJLyogTG9vayBmb3IgYWN0aXZlIGNoYW5uZWxzICov
CiAJY2NlciA9IGFjdGl2ZV9jaGFubmVscyhwcml2KTsKIAotCWZvciAoaSA9IDA7IGkgPCBwcml2
LT5jaGlwLm5wd207IGkrKykgeworCWZvciAoaSA9IDA7IGkgPCBjaGlwLT5ucHdtOyBpKyspIHsK
IAkJbWFzayA9IFRJTV9DQ0VSX0NDMUUgPDwgKGkgKiA0KTsKIAkJaWYgKGNjZXIgJiBtYXNrKSB7
CiAJCQlkZXZfZXJyKGRldiwgIlBXTSAldSBzdGlsbCBpbiB1c2UgYnkgY29uc3VtZXIgJXNcbiIs
Ci0JCQkJaSwgcHJpdi0+Y2hpcC5wd21zW2ldLmxhYmVsKTsKKwkJCQlpLCBjaGlwLT5wd21zW2ld
LmxhYmVsKTsKIAkJCXJldHVybiAtRUJVU1k7CiAJCX0KIAl9CkBAIC02OTMsNyArNjk2LDggQEAg
c3RhdGljIGludCBzdG0zMl9wd21fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIHN0YXRp
YyBpbnQgc3RtMzJfcHdtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0IHN0
bTMyX3B3bSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBwd21fY2hpcCAq
Y2hpcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBzdG0zMl9wd20gKnByaXYgPSB0
b19zdG0zMl9wd21fZGV2KGNoaXApOwogCWludCByZXQ7CiAKIAlyZXQgPSBwaW5jdHJsX3BtX3Nl
bGVjdF9kZWZhdWx0X3N0YXRlKGRldik7Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
