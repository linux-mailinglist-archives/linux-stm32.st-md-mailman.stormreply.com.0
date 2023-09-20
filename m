Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F637A8237
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Sep 2023 14:58:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A96F6C6B46F;
	Wed, 20 Sep 2023 12:58:43 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4520C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Sep 2023 12:58:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qiwmt-0005AE-Ey; Wed, 20 Sep 2023 14:58:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qiwms-007gyw-B0; Wed, 20 Sep 2023 14:58:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qiwms-003ID9-1W; Wed, 20 Sep 2023 14:58:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 Sep 2023 14:57:48 +0200
Message-Id: <20230920125829.1478827-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=hR+xfy5cJ6dkQ8th8pBh40l7WaCRGUsViNGV2Mb0oP4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxAplWQj00KiMIRQDHhuLJpAfB9dxrrVT5Qi
 HCoNwLauoKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsQAAKCRCPgPtYfRL+
 TnyxCACOa3Ln2L7fKhv1S71rT7Xi+gXAvbFtnpOMbCCHO33VIBJTKMHwMAg01d2IAEYnHSeLhgZ
 v5GS6g1i6z0v/GXHNVv83e2G71qIuRIJTB9HVY1KgLdEIZXH1QjJ1TE6PYZYD1hkW2WL92SDV1C
 5WXLA//ljN08rcqLK33uag/bJBr1Z/SVrCksTJTMXG+/Qd+Pal5tjn+uqxZxDhLDd3RGKUufXF8
 mbn1RhjTuFzlxDWDrJrUjZbcLOXhCLKurRCNCxS4RT182h2cgVfiyAQb4721edfX42fiYcKbtAR
 tau1r4hnHajQbYlgdRIVlzkqEi9WHkG1d5qI1hSZzpTU79xm
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
Subject: [Linux-stm32] [PATCH 11/52] input: stmpe-keypad - Convert to
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
cy9pbnB1dC9rZXlib2FyZC9zdG1wZS1rZXlwYWQuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aW5wdXQva2V5Ym9hcmQvc3RtcGUta2V5cGFkLmMgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL3N0
bXBlLWtleXBhZC5jCmluZGV4IDJjNmM1MzI5MGNjMC4uMjAxM2MwYWZkMGMzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL3N0bXBlLWtleXBhZC5jCisrKyBiL2RyaXZlcnMvaW5w
dXQva2V5Ym9hcmQvc3RtcGUta2V5cGFkLmMKQEAgLTQwNCwyMCArNDA0LDE4IEBAIHN0YXRpYyBp
bnQgc3RtcGVfa2V5cGFkX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0
dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgc3RtcGVfa2V5cGFkX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgc3RtcGVfa2V5cGFkX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBzdG1wZV9rZXlwYWQgKmtleXBhZCA9
IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCiAJc3RtcGVfZGlzYWJsZShrZXlwYWQtPnN0
bXBlLCBTVE1QRV9CTE9DS19LRVlQQUQpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bXBlX2tleXBhZF9kcml2ZXIgPSB7CiAJLmRyaXZlci5uYW1l
CT0gInN0bXBlLWtleXBhZCIsCiAJLmRyaXZlci5vd25lcgk9IFRISVNfTU9EVUxFLAogCS5wcm9i
ZQkJPSBzdG1wZV9rZXlwYWRfcHJvYmUsCi0JLnJlbW92ZQkJPSBzdG1wZV9rZXlwYWRfcmVtb3Zl
LAorCS5yZW1vdmVfbmV3CT0gc3RtcGVfa2V5cGFkX3JlbW92ZSwKIH07CiBtb2R1bGVfcGxhdGZv
cm1fZHJpdmVyKHN0bXBlX2tleXBhZF9kcml2ZXIpOwogCi0tIAoyLjQwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
