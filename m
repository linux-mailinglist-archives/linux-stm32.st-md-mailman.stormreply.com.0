Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFE26FB8A5
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 22:53:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D194FC6A613;
	Mon,  8 May 2023 20:53:38 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D17BDC6A60A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 20:53:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw7rO-0003y4-Un; Mon, 08 May 2023 22:53:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw7rO-0024ue-8P; Mon, 08 May 2023 22:53:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw7rN-002YZE-Ck; Mon, 08 May 2023 22:53:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Wolfram Sang <wsa@kernel.org>
Date: Mon,  8 May 2023 22:52:47 +0200
Message-Id: <20230508205306.1474415-71-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=eQvd9WsH9i08sYN0qPrLQXf+L5YYyHoKbzWIJuiTnrU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEFVCbbVDr7BY0KGmVwYpbWm6t5Zo6+u1Fs7
 4qhIl+aby+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhBQAKCRCPgPtYfRL+
 TkFBCACVqkNNaHxapodNcJ981Oze3RuPzzzpYyo19iwm7REZfHq5JPL2g//mRVlaNDL+NwpzVqH
 8FcMQ+U2pKyvJeOwAnlrLZhf+IjXLwr5VFgopopTVvm7RwcGheG8+lnfACrjNJPnWztJR4pMVDo
 WCqgBMaQkHeXTQqGkw3IAggJhLt2/EMHFFPsYkh3NwWErUnlWrhlxQbN5Y3fslUVHhAC+J7bUAT
 lb8jTKzagUH60zKG6dv8jw05/TkSPMWEkUB9lu+qeDSCjt1HpAedEnChS9K/Ex15aRyCQdHAXzS
 la1iJYLFhMSQApQ5OkQlTYmX5CHP+6CU5ca41+gKvSibyYEC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 70/89] i2c: stm32f7: Convert to platform
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
dmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXN0bTMyZjcuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5j
CmluZGV4IGQxYzU5ZDgzYTY1Yi4uZTg5N2Q5MTAxNDM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXN0bTMyZjcuYworKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMy
ZjcuYwpAQCAtMjMwOSw3ICsyMzA5LDcgQEAgc3RhdGljIGludCBzdG0zMmY3X2kyY19wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBp
bnQgc3RtMzJmN19pMmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0
aWMgdm9pZCBzdG0zMmY3X2kyY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IHsKIAlzdHJ1Y3Qgc3RtMzJmN19pMmNfZGV2ICppMmNfZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7CiAKQEAgLTIzNDEsOCArMjM0MSw2IEBAIHN0YXRpYyBpbnQgc3RtMzJmN19pMmNf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RtMzJmN19pMmNfd3JpdGVf
Zm1fcGx1c19iaXRzKGkyY19kZXYsIGZhbHNlKTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShp
MmNfZGV2LT5jbGspOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91bnVz
ZWQgc3RtMzJmN19pMmNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKQEAgLTI0
ODYsNyArMjQ4NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyZjdfaTJj
X2RyaXZlciA9IHsKIAkJLnBtID0gJnN0bTMyZjdfaTJjX3BtX29wcywKIAl9LAogCS5wcm9iZSA9
IHN0bTMyZjdfaTJjX3Byb2JlLAotCS5yZW1vdmUgPSBzdG0zMmY3X2kyY19yZW1vdmUsCisJLnJl
bW92ZV9uZXcgPSBzdG0zMmY3X2kyY19yZW1vdmUsCiB9OwogCiBtb2R1bGVfcGxhdGZvcm1fZHJp
dmVyKHN0bTMyZjdfaTJjX2RyaXZlcik7Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
