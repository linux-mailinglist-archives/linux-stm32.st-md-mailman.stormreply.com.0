Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B84750388
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 11:47:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8841EC6B457;
	Wed, 12 Jul 2023 09:47:21 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7B93C04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 09:47:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-0001bN-LP; Wed, 12 Jul 2023 11:47:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-00Dr60-QK; Wed, 12 Jul 2023 11:47:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-004GUF-4s; Wed, 12 Jul 2023 11:47:12 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 12 Jul 2023 11:46:47 +0200
Message-Id: <20230712094702.1770121-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=/IxcW2l34WOoLU35MOtcq9p89hyZz5PK8UiVz0jKNbg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaBwkoryNWu0Imzm98w+EZi3Gt4BkGCadImw
 hu36lIvVqOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52gQAKCRCPgPtYfRL+
 Tq7GCACTlOaAMoLlEbLHPEOgq0ddyAbNCiKJ3Z2xgoSL3ArYO1wSguUa7UfS+Vrytj51UCsvfp6
 m3KWe/dSTqwNcKzqCF92GSfZqK/I9J4nAPL10JPzZ1JpGiIuSIUEC2UALoeMgLGD+eJR9EpDOTd
 ARCtAB/09oYpZrMbdmxrmkKT1yMZlpSp1fs8oytMoK19VpFWFczx58vuWpmr+8KST6a+6RwZIp1
 Vsdk1eJi8vTRVJcDEmEBe33OEQMkUTQF4dnUotuejce/8qKdzpkn8ZzJ6sNLIBh/AjjfnJhb7AR
 A49ZQ/6obOqukz6g/p24+k4ritOHWaXkJr4sQBJ6NjbX/1p5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH RFC v1 37/52] drm/stm: Use struct
	drm_crtc::drm_dev instead of struct drm_crtc::dev
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

UHJlcGFyZSBkcm9wcGluZyB0aGUgYWxpYXMgImRldiIgZm9yIHN0cnVjdCBkcm1fY3J0Yzo6ZHJt
X2Rldi4gImRybV9kZXYiCmlzIHRoZSBiZXR0ZXIgbmFtZSBhcyAiZGV2IiBpcyB1c3VhbGx5IGEg
c3RydWN0IGRldmljZSBwb2ludGVyLgoKTm8gc2VtYW50aWMgY2hhbmdlcy4KClNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAxMiArKysrKystLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRl
eCBiOGJlNGMxZGI0MjMuLmQ3YmY3YjYzZDhkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9sdGRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKQEAgLTQ4NCw3ICs0
ODQsNyBAQCBzdGF0aWMgY29uc3QgdTMyIGx0ZGNfeWNiY3IycmdiX2NvZWZmc1tEUk1fQ09MT1Jf
RU5DT0RJTkdfTUFYXVtEUk1fQ09MT1JfUkFOR0VfTQogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBs
dGRjX2RldmljZSAqY3J0Y190b19sdGRjKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIHsKLQlyZXR1
cm4gKHN0cnVjdCBsdGRjX2RldmljZSAqKWNydGMtPmRldi0+ZGV2X3ByaXZhdGU7CisJcmV0dXJu
IChzdHJ1Y3QgbHRkY19kZXZpY2UgKikgY3J0Yy0+ZHJtX2Rldi0+ZGV2X3ByaXZhdGU7CiB9CiAK
IHN0YXRpYyBpbmxpbmUgc3RydWN0IGx0ZGNfZGV2aWNlICpwbGFuZV90b19sdGRjKHN0cnVjdCBk
cm1fcGxhbmUgKnBsYW5lKQpAQCAtNzc1LDcgKzc3NSw3IEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0
Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJCQkgICAgc3RydWN0IGRy
bV9hdG9taWNfc3RhdGUgKnN0YXRlKQogewogCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGNy
dGNfdG9fbHRkYyhjcnRjKTsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGNydGMtPmRldjsK
KwlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGNydGMtPmRybV9kZXY7CiAKIAlEUk1fREVCVUdf
RFJJVkVSKCJcbiIpOwogCkBAIC03OTgsNyArNzk4LDcgQEAgc3RhdGljIHZvaWQgbHRkY19jcnRj
X2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJCQkgICAgIHN0cnVjdCBk
cm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKIHsKIAlzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBj
cnRjX3RvX2x0ZGMoY3J0Yyk7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBjcnRjLT5kZXY7
CisJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBjcnRjLT5kcm1fZGV2OwogCWludCBsYXllcl9p
bmRleCA9IDA7CiAKIAlEUk1fREVCVUdfRFJJVkVSKCJcbiIpOwpAQCAtODkxLDcgKzg5MSw3IEBA
IHN0YXRpYyBib29sIGx0ZGNfY3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywK
IHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19tb2RlX3NldF9ub2ZiKHN0cnVjdCBkcm1fY3J0YyAqY3J0
YykKIHsKIAlzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBjcnRjX3RvX2x0ZGMoY3J0Yyk7Ci0J
c3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBjcnRjLT5kZXY7CisJc3RydWN0IGRybV9kZXZpY2Ug
KmRkZXYgPSBjcnRjLT5kcm1fZGV2OwogCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3RfaXRlciBp
dGVyOwogCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSBOVUxMOwogCXN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2RlciA9IE5VTEwsICplbl9pdGVyOwpAQCAtMTAzNCw3ICsxMDM0LDcg
QEAgc3RhdGljIHZvaWQgbHRkY19jcnRjX2F0b21pY19mbHVzaChzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsCiAJCQkJICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogewogCXN0cnVjdCBs
dGRjX2RldmljZSAqbGRldiA9IGNydGNfdG9fbHRkYyhjcnRjKTsKLQlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGRldiA9IGNydGMtPmRldjsKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGNydGMtPmRy
bV9kZXY7CiAJc3RydWN0IGRybV9wZW5kaW5nX3ZibGFua19ldmVudCAqZXZlbnQgPSBjcnRjLT5z
dGF0ZS0+ZXZlbnQ7CiAKIAlEUk1fREVCVUdfQVRPTUlDKCJcbiIpOwpAQCAtMTA2Myw3ICsxMDYz
LDcgQEAgc3RhdGljIGJvb2wgbHRkY19jcnRjX2dldF9zY2Fub3V0X3Bvc2l0aW9uKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKIAkJCQkJICAga3RpbWVfdCAqc3RpbWUsIGt0aW1lX3QgKmV0aW1lLAog
CQkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKLQlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGRldiA9IGNydGMtPmRldjsKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9
IGNydGMtPmRybV9kZXY7CiAJc3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gZGRldi0+ZGV2X3By
aXZhdGU7CiAJaW50IGxpbmUsIHZhY3RpdmVfc3RhcnQsIHZhY3RpdmVfZW5kLCB2dG90YWw7CiAK
LS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
