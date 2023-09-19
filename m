Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 842C37A69FD
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 19:50:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A486C6C829;
	Tue, 19 Sep 2023 17:50:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1853EC6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 17:50:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierH-00077L-Sq; Tue, 19 Sep 2023 19:49:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierH-007VYc-7B; Tue, 19 Sep 2023 19:49:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierG-0034Zf-Ts; Tue, 19 Sep 2023 19:49:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 19 Sep 2023 19:49:31 +0200
Message-Id: <20230919174931.1417681-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=8KwHSL8TuAiHCNseqPqBrPjb/1yV+n3dsfUORSJVSa8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCd8mRFylT7xmEsuv/UaGPOvVUq6T4KbwmkjY0
 ZBBzO1pMWqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQnfJgAKCRCPgPtYfRL+
 TgzyB/46eFeGI2MjtA+6jtjaUeGp+5CaZEOXQtXsLjtmyfXu0XAN+MasjRicDZlUrC2IxlsRQSB
 XE8ckaVEvMDJB3GvGfdLvF0jD+mnZdlUVrkYHFPlQbd4KuKCqb7kP5+pNlKPZ3MPPq9Zi25UNPs
 PChl0TycPsFQRDaCb+zWmixoMnlBKNrYDRLGfxUqK3vjyEBD/B4UcXNBbwROnbK2wlNpDWYn+0y
 dolcxBJHkIglkyZRtp/U63sf+apE81dA+2gpkOPCIKOMwINVWPAdG3e1Mk+vDIfPWmj4AlEwWMe
 trMYYUeRNA3gQETXFInIhK4HX7aC4MNvKNaJBaGqt+oDTYa6
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, kernel@pengutronix.de,
 linux-iio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 49/49] iio: trigger: stm32-timer: Convert to
	platform remove callback returning void
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
cy9paW8vdHJpZ2dlci9zdG0zMi10aW1lci10cmlnZ2VyLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2lpby90cmlnZ2VyL3N0bTMyLXRpbWVyLXRyaWdnZXIuYyBiL2RyaXZlcnMvaWlvL3RyaWdn
ZXIvc3RtMzItdGltZXItdHJpZ2dlci5jCmluZGV4IDM2NDNjNGFmYWU2Ny4uZDc2NDQ0MDMwYTI4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby90cmlnZ2VyL3N0bTMyLXRpbWVyLXRyaWdnZXIuYwor
KysgYi9kcml2ZXJzL2lpby90cmlnZ2VyL3N0bTMyLXRpbWVyLXRyaWdnZXIuYwpAQCAtODA5LDcg
KzgwOSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfdGltZXJfdHJpZ2dlcl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHN0bTMyX3Rp
bWVyX3RyaWdnZXJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMg
dm9pZCBzdG0zMl90aW1lcl90cmlnZ2VyX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogewogCXN0cnVjdCBzdG0zMl90aW1lcl90cmlnZ2VyICpwcml2ID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7CiAJdTMyIHZhbDsKQEAgLTgyNCw4ICs4MjQsNiBAQCBzdGF0aWMgaW50
IHN0bTMyX3RpbWVyX3RyaWdnZXJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAKIAlpZiAocHJpdi0+ZW5hYmxlZCkKIAkJY2xrX2Rpc2FibGUocHJpdi0+Y2xrKTsKLQotCXJl
dHVybiAwOwogfQogCiBzdGF0aWMgaW50IHN0bTMyX3RpbWVyX3RyaWdnZXJfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCkBAIC05MDQsNyArOTAyLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShv
Ziwgc3RtMzJfdHJpZ19vZl9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IHN0bTMyX3RpbWVyX3RyaWdnZXJfZHJpdmVyID0gewogCS5wcm9iZSA9IHN0bTMyX3RpbWVyX3Ry
aWdnZXJfcHJvYmUsCi0JLnJlbW92ZSA9IHN0bTMyX3RpbWVyX3RyaWdnZXJfcmVtb3ZlLAorCS5y
ZW1vdmVfbmV3ID0gc3RtMzJfdGltZXJfdHJpZ2dlcl9yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJ
Lm5hbWUgPSAic3RtMzItdGltZXItdHJpZ2dlciIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMy
X3RyaWdfb2ZfbWF0Y2gsCi0tIAoyLjQwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
