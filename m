Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C996AAA14
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Mar 2023 14:30:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B0E5C6904A;
	Sat,  4 Mar 2023 13:30:56 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F8BFC640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Mar 2023 13:30:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYRyM-0000x7-FG; Sat, 04 Mar 2023 14:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYRyK-001nbf-VH; Sat, 04 Mar 2023 14:30:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYRyJ-0027ID-5C; Sat, 04 Mar 2023 14:30:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sat,  4 Mar 2023 14:30:19 +0100
Message-Id: <20230304133028.2135435-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=wo4ZpCb09jaV+I9OJsX/61BGqUm7VIOEY4KCLWnhQ2A=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fPD/3y725FcL3zhOi74xeBgcP45+6dC9dfk
 DAI+8fslMmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHzwAKCRDB/BR4rcrs
 CXicB/4tMFECnqFEUgdHyFdw3YXNMB65ggPupC9RG6qIWThdiJjoEK4UuBbl4gOOJAwU3Cx2t1t
 JmrGENDZxbosKC1+yZHudlhTJ7FRnjo675zyWKSTPBKxHwTmA6dBVk3btEDHWifmJsAmw2jEE9J
 +VoOilg/LZ4eKMFprbkCwt61n/OY1x8bMwxaNL15WEtXBp6CSqZ0NpNdaYK1HzXWp0QRMzifiUM
 NUZ9J0f09dgUZFnMoEeB44A/lpC5ruJPl7t4QfTdXWrJmFjBshwhr5zMnaWQJgrkJ65H7qnKlZ5
 aUTIu+sY2BaE8O47BkpgSQwLvbpzwfdfDKARw3r4zfHfE7fz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 32/41] rtc: stm32: Convert to platform remove
	callback returning void
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
dmVycy9ydGMvcnRjLXN0bTMyLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtc3Rt
MzIuYyBiL2RyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jCmluZGV4IGFjOWUyMjhiNTZkMC4uMjI5Y2Iy
ODQ3Y2M0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYworKysgYi9kcml2ZXJz
L3J0Yy9ydGMtc3RtMzIuYwpAQCAtODQ2LDcgKzg0Niw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcnRj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAot
c3RhdGljIGludCBzdG0zMl9ydGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CitzdGF0aWMgdm9pZCBzdG0zMl9ydGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiB7CiAJc3RydWN0IHN0bTMyX3J0YyAqcnRjID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRl
dik7CiAJY29uc3Qgc3RydWN0IHN0bTMyX3J0Y19yZWdpc3RlcnMgKnJlZ3MgPSAmcnRjLT5kYXRh
LT5yZWdzOwpAQCAtODY5LDggKzg2OSw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfcnRjX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJZGV2X3BtX2NsZWFyX3dha2VfaXJxKCZw
ZGV2LT5kZXYpOwogCWRldmljZV9pbml0X3dha2V1cCgmcGRldi0+ZGV2LCBmYWxzZSk7Ci0KLQly
ZXR1cm4gMDsKIH0KIAogI2lmZGVmIENPTkZJR19QTV9TTEVFUApAQCAtOTE3LDcgKzkxNSw3IEBA
IHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhzdG0zMl9ydGNfcG1fb3BzLAogCiBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9ydGNfZHJpdmVyID0gewogCS5wcm9iZQkJPSBzdG0z
Ml9ydGNfcHJvYmUsCi0JLnJlbW92ZQkJPSBzdG0zMl9ydGNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3
CT0gc3RtMzJfcnRjX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSBEUklWRVJfTkFN
RSwKIAkJLnBtCT0gJnN0bTMyX3J0Y19wbV9vcHMsCi0tIAoyLjM5LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
