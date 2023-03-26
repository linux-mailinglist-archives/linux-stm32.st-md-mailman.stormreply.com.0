Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC696C9538
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Mar 2023 16:32:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8584DC6A5FB;
	Sun, 26 Mar 2023 14:32:53 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AAE7C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 14:32:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgRQM-00009Z-E1; Sun, 26 Mar 2023 16:32:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgRQJ-006reu-PA; Sun, 26 Mar 2023 16:32:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgRQI-0088Ym-6c; Sun, 26 Mar 2023 16:32:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 26 Mar 2023 16:31:44 +0200
Message-Id: <20230326143224.572654-80-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=B2SRle1FWU+fvxidEF4AfCr7grTjB5IhYpAYWME58PA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbiFY6P9Bvm19sbb/DGuYDfSjfu1+Ed9eyPQ
 WPUc31/iY6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW4gAKCRCPgPtYfRL+
 TjkxCACrV8VIV049iFgO6pMn+hRVUFDMXLM3LetM9Pj/dkFcpbkVxQEAQL9OoaOmsPGvmn10CDC
 wGZZQztBifG9viCCYtWK1XTxW/QyJtQjpLRvgDKp01FavBHb/UDr87lg0B6Zv3A3zPaL11u6qM3
 9/bT/c24KsFnReeA1pjZoM0T5qKgz4bj7OpcdwGSh9ufyJMFAfSdI2EENirkPmBFygkkKArLosK
 L//ssYDIOZ8/VwseyOOHDWqz/06vxq1b4g36psxoPws0NVYGq3YEsZV0hT3pS6NtlL+5rv7Ue3c
 Nha+Ayh7kEVquPYhJvwVz5wRGSz+2b1AdNti45x2nQMoL+vh
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 077/117] media: stm32-dcmi: Convert to
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9zdC9zdG0zMi9zdG0zMi1kY21pLmMgfCA2ICsrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0L3N0bTMyL3N0bTMyLWRjbWkuYyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vc3Qvc3RtMzIvc3RtMzItZGNtaS5jCmluZGV4IGFkOGU5NzQyZTFhZS4u
ZGMzY2UwODI1OWQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0L3N0bTMy
L3N0bTMyLWRjbWkuYworKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0L3N0bTMyL3N0bTMy
LWRjbWkuYwpAQCAtMjEzNCw3ICsyMTM0LDcgQEAgc3RhdGljIGludCBkY21pX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBk
Y21pX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgZGNt
aV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJf
ZGNtaSAqZGNtaSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCkBAIC0yMTQ3LDggKzIx
NDcsNiBAQCBzdGF0aWMgaW50IGRjbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJbWVkaWFfZGV2aWNlX2NsZWFudXAoJmRjbWktPm1kZXYpOwogCiAJZG1hX3JlbGVhc2Vf
Y2hhbm5lbChkY21pLT5kbWFfY2hhbik7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIF9fbWF5
YmVfdW51c2VkIGludCBkY21pX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCkBA
IC0yMjAyLDcgKzIyMDAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZGNtaV9w
bV9vcHMgPSB7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX2RjbWlfZHJp
dmVyID0gewogCS5wcm9iZQkJPSBkY21pX3Byb2JlLAotCS5yZW1vdmUJCT0gZGNtaV9yZW1vdmUs
CisJLnJlbW92ZV9uZXcJPSBkY21pX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUgPSBE
UlZfTkFNRSwKIAkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKHN0bTMyX2RjbWlfb2Zf
bWF0Y2gpLAotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
