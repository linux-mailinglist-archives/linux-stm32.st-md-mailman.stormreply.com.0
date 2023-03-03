Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F896A9FA5
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 19:55:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2804AC6A619;
	Fri,  3 Mar 2023 18:55:15 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2591BC6A616
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 18:55:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYAYc-0006WH-KJ; Fri, 03 Mar 2023 19:55:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYAYb-001cVh-5G; Fri, 03 Mar 2023 19:55:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYAYY-001ul9-02; Fri, 03 Mar 2023 19:55:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  3 Mar 2023 19:54:39 +0100
Message-Id: <20230303185445.2112695-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
References: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=jmmiE3N34M+f9bnP1i3ZcXKc0KLwveoqbOciUOB61ao=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAkJWrCRVmtpts6fB4h58ukV4CnbNxk4KoXKBG
 rQtZQ0yup6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJCVgAKCRDB/BR4rcrs
 CT+3B/0Z1tun5MtmoFj/1O0B0FihqbDTmjOyymVfU+DfA66JSWdMnqkG9ej3+lx6fM3Emy3T8ok
 HNfDto+b9idqnAEZzTDx031mKjn2ZahnLeBGuLVoQCa/ki5iEGHGaCRtTzDCnx25i3/grHTyzN0
 IHZ2k8gdKsrKbKv6HW0xNcf6gt+zUngvNG4h6mxvOQ38V6asA9RR3hCdndZJ1fOI2p91III+A/R
 MzoA6+PdkyvCjHBmb9/eq1AsqLaWcFBI1/DYZH1sNRoSHdUYFVTXrpstPwMq2bVnyiL54/BDJr4
 TFn9Nqlrm0+BW/K/EIUV32L608DB2qtJoFbjduJcbb/mT5T4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 24/30] pwm: stm32: Convert to platform remove
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
dmVycy9wd20vcHdtLXN0bTMyLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3Rt
MzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IDIxZTRhMzRkZmZmMy4uYTQ4MmY3
ZTBlNGFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYworKysgYi9kcml2ZXJz
L3B3bS9wd20tc3RtMzIuYwpAQCAtNjQyLDcgKzY0Miw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdt
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0
YXRpYyBpbnQgc3RtMzJfcHdtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQor
c3RhdGljIHZvaWQgc3RtMzJfcHdtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCBzdG0zMl9wd20gKnByaXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsKIAl1bnNpZ25lZCBpbnQgaTsKQEAgLTY1MSw4ICs2NTEsNiBAQCBzdGF0aWMgaW50IHN0bTMy
X3B3bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJcHdtX2Rpc2FibGUo
JnByaXYtPmNoaXAucHdtc1tpXSk7CiAKIAlwd21jaGlwX3JlbW92ZSgmcHJpdi0+Y2hpcCk7Ci0K
LQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdG0zMl9wd21fc3Vz
cGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC02OTksNyArNjk3LDcgQEAgTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgc3RtMzJfcHdtX29mX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9y
bV9kcml2ZXIgc3RtMzJfcHdtX2RyaXZlciA9IHsKIAkucHJvYmUJPSBzdG0zMl9wd21fcHJvYmUs
Ci0JLnJlbW92ZQk9IHN0bTMyX3B3bV9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0zMl9wd21f
cmVtb3ZlLAogCS5kcml2ZXIJPSB7CiAJCS5uYW1lID0gInN0bTMyLXB3bSIsCiAJCS5vZl9tYXRj
aF90YWJsZSA9IHN0bTMyX3B3bV9vZl9tYXRjaCwKLS0gCjIuMzkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
