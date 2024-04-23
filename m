Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD1E8ADF70
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 10:07:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57014C7128A;
	Tue, 23 Apr 2024 08:07:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E76CCC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 08:07:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzBBL-000358-JD; Tue, 23 Apr 2024 10:07:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzBBK-00Dq1Y-I2; Tue, 23 Apr 2024 10:07:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rzBBK-006nfv-1V;
 Tue, 23 Apr 2024 10:07:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 23 Apr 2024 10:07:00 +0200
Message-ID: <3fefa60744fc68c9c4b40aeb69e34cda22582c4b.1713858615.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1713858615.git.u.kleine-koenig@pengutronix.de>
References: <cover.1713858615.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=6jj1et03NEbeAAFrK+MkJGJ4zRd04/Wcgxra5zA+vuQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmJ2wol9aHpD6mMPDRKveIJ6x8NgbDf8sNB72sl
 2DxjYz27J2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZidsKAAKCRCPgPtYfRL+
 TuQSB/9aM2ihAPUtN72QJZb2kgQsH/1X8r6mrqaNXZAA9BED8kRjWGrPMecm8obijzWOWbwgj3v
 61+jMl9H0KT4MaNeUw58E1bFB16TkSNRoxjWKD1UgYocLYnhPjHdxbEfTA5qgtJ7sLsJqi94wtY
 VA/ksJ6v/wC62oc1qRISsOLgpe5PzkejkgmLb8vEloegcD73qHNh2Ui/14AHq5cFn34yCAvYD+w
 IYluumtU9ck8N9f43GgoZHmGsAznZBVw7ZMvDUkZXErdRpFZUpYWruqvbRlCHoEeyD6f7UqhOmZ
 NqIb8rDH97KZxpblfWH23tyF5CDzUw0sPWdQeadswDtVaycd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 James Clark <james.clark@arm.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH 3/5] coresight: stm: Convert to platform
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
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKRml4ZXM6IDA1NzI1NmFhYWNj
OCAoImNvcmVzaWdodDogc3RtOiBNb3ZlIEFDUEkgc3VwcG9ydCBmcm9tIEFNQkEgZHJpdmVyIHRv
IHBsYXRmb3JtIGRyaXZlciIpClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9od3RyYWNpbmcvY29yZXNp
Z2h0L2NvcmVzaWdodC1zdG0uYyB8IDcgKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9j
b3Jlc2lnaHQvY29yZXNpZ2h0LXN0bS5jIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1zdG0uYwppbmRleCBjYmY3ZjE3NTU2ZjguLjk2YjFhOGNmZWUxNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1zdG0uYworKysgYi9kcml2
ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXN0bS5jCkBAIC0xMDE0LDE4ICsxMDE0
LDE3IEBAIHN0YXRpYyBpbnQgc3RtX3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBzdG1fcGxhdGZvcm1fcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBzdG1fcGxhdGZv
cm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHN0bV9k
cnZkYXRhICpkcnZkYXRhID0gZGV2X2dldF9kcnZkYXRhKCZwZGV2LT5kZXYpOwogCiAJaWYgKFdB
Uk5fT04oIWRydmRhdGEpKQotCQlyZXR1cm4gLUVOT0RFVjsKKwkJcmV0dXJuOwogCiAJX19zdG1f
cmVtb3ZlKCZwZGV2LT5kZXYpOwogCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKIAlp
ZiAoIUlTX0VSUl9PUl9OVUxMKGRydmRhdGEtPnBjbGspKQogCQljbGtfcHV0KGRydmRhdGEtPnBj
bGspOwotCXJldHVybiAwOwogfQogCiAjaWZkZWYgQ09ORklHX0FDUEkKQEAgLTEwMzgsNyArMTAz
Nyw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUoYWNwaSwgc3RtX2FjcGlfaWRzKTsKIAogc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtX3BsYXRmb3JtX2RyaXZlciA9IHsKIAkucHJvYmUJ
PSBzdG1fcGxhdGZvcm1fcHJvYmUsCi0JLnJlbW92ZQk9IHN0bV9wbGF0Zm9ybV9yZW1vdmUsCisJ
LnJlbW92ZV9uZXcgPSBzdG1fcGxhdGZvcm1fcmVtb3ZlLAogCS5kcml2ZXIJPSB7CiAJCS5uYW1l
CQkJPSAiY29yZXNpZ2h0LXN0bS1wbGF0Zm9ybSIsCiAJCS5hY3BpX21hdGNoX3RhYmxlCT0gQUNQ
SV9QVFIoc3RtX2FjcGlfaWRzKSwKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
