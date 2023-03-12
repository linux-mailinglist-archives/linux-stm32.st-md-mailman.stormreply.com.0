Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 382A26B67E2
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 17:15:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFCB8C6A610;
	Sun, 12 Mar 2023 16:15:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8128C69073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 16:15:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbOM1-0007s2-Bk; Sun, 12 Mar 2023 17:15:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbOM0-003f3O-Mu; Sun, 12 Mar 2023 17:15:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbOLz-004K9a-MQ; Sun, 12 Mar 2023 17:15:23 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 12 Mar 2023 17:15:07 +0100
Message-Id: <20230312161512.2715500-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=YSdgKydMUmqqeYG946UQat08kJ/q2KTOaGSGnm0gse0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkDfp6xwsITcqTQd1LtV6bSmWobY11RcAQyBADL
 isAsR//OeaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA36egAKCRDB/BR4rcrs
 CS0HCACeU/irJ0xObgGaUABt1LhZ3HhEP2AcWllEyHGs4VYMe2fhsL6WkHa1Xb0Zm2QIOi4pOSU
 cIsBOQHJzzeKxQxycQxnZ+t+iPAhaaorEtHf6W0eBtCTEW2XWK0usG5SGO1Je1QzetwHujE4Zei
 FfIlcwx2jmvEZpNK9kQLzYxLKzy3Xwv3SRoCHMh0+ZLjHiMIktVPFK8UE/X6YT7cnzN+IJA/P34
 01tCWyMZmvUw46b6Ghm/LyOqfyoS/dPFqLK1A4vjJuQkuDOwOJ/m7kIj5zhZ3M9rRxNt0Y5nYKY
 vao6Xw+ru12lquwaUV1yM5TyB9xaMilvr1ASZYLqoM39TwrS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 25/30] clk: stm32: Convert to platform remove
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
dmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAxMy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvc3RtMzIvY2xrLXN0bTMybXAxMy5jIGIvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAx
My5jCmluZGV4IDExOTJlZWU4YWJlNC4uYzRhNzM3NDgyZmU1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2Nsay9zdG0zMi9jbGstc3RtMzJtcDEzLmMKKysrIGIvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0
bTMybXAxMy5jCkBAIC0xNTkzLDE1ICsxNTkzLDEzIEBAIHN0YXRpYyBpbnQgc3RtMzJtcDFfcmNj
X2Nsb2Nrc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7
CiB9CiAKLXN0YXRpYyBpbnQgc3RtMzJtcDFfcmNjX2Nsb2Nrc19yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHN0bTMybXAxX3JjY19jbG9ja3NfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGRldmljZSAqZGV2ID0g
JnBkZXYtPmRldjsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkLCAqbnAgPSBkZXZfb2Zfbm9k
ZShkZXYpOwogCiAJZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKQog
CQlvZl9jbGtfZGVsX3Byb3ZpZGVyKGNoaWxkKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMm1wMTNfcmNjX2Nsb2Nrc19kcml2ZXIgPSB7CkBA
IC0xNjEwLDcgKzE2MDgsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMm1w
MTNfcmNjX2Nsb2Nrc19kcml2ZXIgPSB7CiAJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMybXAxM19t
YXRjaF9kYXRhLAogCX0sCiAJLnByb2JlID0gc3RtMzJtcDFfcmNjX2Nsb2Nrc19wcm9iZSwKLQku
cmVtb3ZlID0gc3RtMzJtcDFfcmNjX2Nsb2Nrc19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0z
Mm1wMV9yY2NfY2xvY2tzX3JlbW92ZSwKIH07CiAKIHN0YXRpYyBpbnQgX19pbml0IHN0bTMybXAx
M19jbG9ja3NfaW5pdCh2b2lkKQotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
