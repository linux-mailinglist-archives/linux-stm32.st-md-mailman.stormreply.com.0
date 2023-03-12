Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5413A6B67DF
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 17:15:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9C8AC6A60F;
	Sun, 12 Mar 2023 16:15:27 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41299C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 16:15:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbOLz-0007qH-Ia; Sun, 12 Mar 2023 17:15:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbOLy-003f2l-Ts; Sun, 12 Mar 2023 17:15:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbOLx-004K91-IS; Sun, 12 Mar 2023 17:15:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 12 Mar 2023 17:14:58 +0100
Message-Id: <20230312161512.2715500-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=MogxSQmmNC/utpK5URpwGXRDdvqjCsNxmjM9To6NNPI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkDfpVv4WC5SN8KRSwbPkT0MGYOp14+cdP+X83h
 64BGa9EPMWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA36VQAKCRDB/BR4rcrs
 CRbaCACa7m2DRFNqbLtWO+lY/78L7saGvxHdMIkcXdeaeAiPFbpjFY4617uowoj4C6b5GnaPfyH
 Twy4Tx88ijQ4B6ZaK8/Mz6RwJNPoHdsqEfr6pP/J930vPyxyhsqKNiFHf52KT07QR8J+Y0Gysiw
 OoGJhxXhja8ITO6VbYIwWN1Ra8RTsimGgU31zVpFkeQXcsG4C+q/FSOi6vfs9NDYMOvjSn5UtaQ
 XsS55usZCJXzeO1JE7Vz5t5BKlsttxmu7cLhvviTfoitn6wzAwCXV6RQG3j69rMduNeVVKNbr9y
 rzmX+CXLNCzRAo7Kz2H1oFSCFofpB1kpGkANZUqNwRHuLw1s
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 16/30] clk: stm32mp1: Convert to platform
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
dmVycy9jbGsvY2xrLXN0bTMybXAxLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGst
c3RtMzJtcDEuYyBiL2RyaXZlcnMvY2xrL2Nsay1zdG0zMm1wMS5jCmluZGV4IDAxZTVhNDY2ODk3
Zi4uOTM5Nzc5ZjY2ODY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9jbGstc3RtMzJtcDEuYwor
KysgYi9kcml2ZXJzL2Nsay9jbGstc3RtMzJtcDEuYwpAQCAtMjQzNCwxNSArMjQzNCwxMyBAQCBz
dGF0aWMgaW50IHN0bTMybXAxX3JjY19jbG9ja3NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IHN0bTMybXAxX3JjY19jbG9j
a3NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBzdG0z
Mm1wMV9yY2NfY2xvY2tzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewog
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7CiAJc3RydWN0IGRldmljZV9ub2RlICpj
aGlsZCwgKm5wID0gZGV2X29mX25vZGUoZGV2KTsKIAogCWZvcl9lYWNoX2F2YWlsYWJsZV9jaGls
ZF9vZl9ub2RlKG5wLCBjaGlsZCkKIAkJb2ZfY2xrX2RlbF9wcm92aWRlcihjaGlsZCk7Ci0KLQly
ZXR1cm4gMDsKIH0KIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJtcDFfcmNj
X2Nsb2Nrc19kcml2ZXIgPSB7CkBAIC0yNDUxLDcgKzI0NDksNyBAQCBzdGF0aWMgc3RydWN0IHBs
YXRmb3JtX2RyaXZlciBzdG0zMm1wMV9yY2NfY2xvY2tzX2RyaXZlciA9IHsKIAkJLm9mX21hdGNo
X3RhYmxlID0gc3RtMzJtcDFfbWF0Y2hfZGF0YSwKIAl9LAogCS5wcm9iZSA9IHN0bTMybXAxX3Jj
Y19jbG9ja3NfcHJvYmUsCi0JLnJlbW92ZSA9IHN0bTMybXAxX3JjY19jbG9ja3NfcmVtb3ZlLAor
CS5yZW1vdmVfbmV3ID0gc3RtMzJtcDFfcmNjX2Nsb2Nrc19yZW1vdmUsCiB9OwogCiBzdGF0aWMg
aW50IF9faW5pdCBzdG0zMm1wMV9jbG9ja3NfaW5pdCh2b2lkKQotLSAKMi4zOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
