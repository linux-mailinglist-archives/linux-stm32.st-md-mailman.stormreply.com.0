Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4E7A823E
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Sep 2023 14:58:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6C99C6B46F;
	Wed, 20 Sep 2023 12:58:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3D1AC6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Sep 2023 12:58:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qiwn2-0005kd-JX; Wed, 20 Sep 2023 14:58:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qiwn0-007h1M-Mt; Wed, 20 Sep 2023 14:58:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qiwn0-003IFZ-Dh; Wed, 20 Sep 2023 14:58:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 Sep 2023 14:58:25 +0200
Message-Id: <20230920125829.1478827-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=joFLd3qLFbjJRTJtTX+NHFytmcS0AcvTPKAHVZOkxKI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxqeMQG7HcczT+up8xjmqHr+9d++ju6kGtV8
 +2Y2QZ3NrCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsagAKCRCPgPtYfRL+
 Tk+IB/9FHPxqZP+T04AUuOxaGQ85K5ius12Yvh5sizbi5JnUMlx1ViCRAKqhaDicM9zjdyJH6/m
 3H11pjf2a4b9HUb/xITgS1hPoGggBWuWhYgxD6Cv8sU6kgnOJvrvyqu4+VOnELEVpKWOp1pMuWM
 q37vpy6i2DtcbpERSWaCGC8I5eE9fZ5y0ONvVNUD9LZst9eeob0pznauRUZtmeNPQFVQJ5VMb+Z
 ud1WuxX1yYaTt6UhSGzQkbr5ebji3QCwBiHMzN2AGQTB3oGFdEK0WfNz0dAIFe9ZgJ3pw1HTPwu
 /1CsOyIawPo2qKSoWLlVh9TTtegAY53fmFCaWhCSnvDtlyTD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@pengutronix.de,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 48/52] input: stmpe-ts - Convert to platform
	remove callback returning void
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
ClRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxs
YmFjayByZXR1cm4Kdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcyBxdWVzdCBhbGwgZHJp
dmVycyBhcmUgY29udmVydGVkIHRvCi5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5z
IHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMKYXJlIGNvbnZlcnRlZCwgLnJlbW92
ZV9uZXcoKSB3aWxsIGJlIHJlbmFtZWQgdG8gLnJlbW92ZSgpLgoKVHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpjYWxs
YmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9pbnB1dC90b3VjaHNjcmVlbi9zdG1wZS10cy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
bnB1dC90b3VjaHNjcmVlbi9zdG1wZS10cy5jIGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9z
dG1wZS10cy5jCmluZGV4IDI1YzQ1YzNhMzU2MS4uYjIwNGZkYjJkMjJjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3N0bXBlLXRzLmMKKysrIGIvZHJpdmVycy9pbnB1dC90
b3VjaHNjcmVlbi9zdG1wZS10cy5jCkBAIC0zNTAsMTMgKzM1MCwxMSBAQCBzdGF0aWMgaW50IHN0
bXBlX2lucHV0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7
CiB9CiAKLXN0YXRpYyBpbnQgc3RtcGVfdHNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCitzdGF0aWMgdm9pZCBzdG1wZV90c19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RtcGVfdG91Y2ggKnRzID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7CiAKIAlzdG1wZV9kaXNhYmxlKHRzLT5zdG1wZSwgU1RNUEVfQkxPQ0tfVE9VQ0hT
Q1JFRU4pOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IHN0bXBlX3RzX2RyaXZlciA9IHsKQEAgLTM2NCw3ICszNjIsNyBAQCBzdGF0aWMgc3RydWN0IHBs
YXRmb3JtX2RyaXZlciBzdG1wZV90c19kcml2ZXIgPSB7CiAJCS5uYW1lID0gU1RNUEVfVFNfTkFN
RSwKIAl9LAogCS5wcm9iZSA9IHN0bXBlX2lucHV0X3Byb2JlLAotCS5yZW1vdmUgPSBzdG1wZV90
c19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG1wZV90c19yZW1vdmUsCiB9OwogbW9kdWxlX3Bs
YXRmb3JtX2RyaXZlcihzdG1wZV90c19kcml2ZXIpOwogCi0tIAoyLjQwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
