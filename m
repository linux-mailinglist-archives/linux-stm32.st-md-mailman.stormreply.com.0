Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBA36C952E
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Mar 2023 16:32:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 745D3C6A5FA;
	Sun, 26 Mar 2023 14:32:46 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA164C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 14:32:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgRQ7-0007lc-KK; Sun, 26 Mar 2023 16:32:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgRQ4-006rZG-7s; Sun, 26 Mar 2023 16:32:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgRQ3-0088UK-G3; Sun, 26 Mar 2023 16:32:27 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Date: Sun, 26 Mar 2023 16:30:36 +0200
Message-Id: <20230326143224.572654-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=D/UAC+t+fl8c6EjlWf6JDxvuYAMHu5bYFNCcxsw+JGM=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsAbrwF6Dzy1NElLhi5qCVORf8/NW/5rkxW5prSeRa
 Ppenr2T0ZiFgZGLQVZMkcW+cU2mVZVcZOfaf5dhBrEygUxh4OIUgIloHuRgmPi/2ny+i9XGX9Hv
 cj8K8asKTHh7eOVSu2VnF1Xrap96r//j2r8PXm1LZ6xN8T5y9nTDdL5ZNQEmzcbVCluNXV/Z2P2
 4d0Yz3ldfqP2a+K3Sf3wTdoT9bj0uZ7imZNLdiAU9x49XX9os3W8lemcCVxrrveKYloCYXdW/rH
 NncoQvWm+w9eq5dTlt3r+dV+09eFp8456QY14NBdtvPt/9RtT4XiKPEUPz3uj8AoX4lhLbZo9NE
 Rf7PNj3bym/KJ6z4ofQ1rtlH1Tz2F5t0An+d5XbjKnvL9dEnzUiXLUvnRl6ixTMfnVJ5Vw4O+3k
 i2hB/bkutcdYEi2rN9Z4Kz374r53G5N/sU+X2vp325QTAQ==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 009/117] media: stm32-cec: Convert to platform
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vc3RtMzIvc3RtMzItY2VjLmMgfCA2ICsrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1jZWMuYyBiL2RyaXZlcnMv
bWVkaWEvY2VjL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNlYy5jCmluZGV4IDdiMmRiNDZhNTcyMi4u
YWRhM2QxNTMzNjJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9zdG0z
Mi9zdG0zMi1jZWMuYworKysgYi9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9zdG0zMi9zdG0z
Mi1jZWMuYwpAQCAtMzQ0LDcgKzM0NCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfY2VjX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGlu
dCBzdG0zMl9jZWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMg
dm9pZCBzdG0zMl9jZWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJ
c3RydWN0IHN0bTMyX2NlYyAqY2VjID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKQEAg
LTM1Miw4ICszNTIsNiBAQCBzdGF0aWMgaW50IHN0bTMyX2NlY19yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAljbGtfdW5wcmVwYXJlKGNlYy0+Y2xrX2hkbWlfY2VjKTsKIAog
CWNlY191bnJlZ2lzdGVyX2FkYXB0ZXIoY2VjLT5hZGFwKTsKLQotCXJldHVybiAwOwogfQogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl9jZWNfb2ZfbWF0Y2hbXSA9IHsK
QEAgLTM2NCw3ICszNjIsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdG0zMl9jZWNfb2Zf
bWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9jZWNfZHJpdmVy
ID0gewogCS5wcm9iZSAgPSBzdG0zMl9jZWNfcHJvYmUsCi0JLnJlbW92ZSA9IHN0bTMyX2NlY19y
ZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0zMl9jZWNfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJ
CS5uYW1lCQk9IENFQ19OQU1FLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl9jZWNfb2ZfbWF0
Y2gsCi0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
