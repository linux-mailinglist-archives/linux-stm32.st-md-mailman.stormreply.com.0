Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA46AAA15
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Mar 2023 14:30:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2981DC6A5F6;
	Sat,  4 Mar 2023 13:30:56 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91A68C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Mar 2023 13:30:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYRyM-0000v3-82; Sat, 04 Mar 2023 14:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYRyK-001nbV-IK; Sat, 04 Mar 2023 14:30:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYRyJ-0027II-B9; Sat, 04 Mar 2023 14:30:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sat,  4 Mar 2023 14:30:20 +0100
Message-Id: <20230304133028.2135435-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1780;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=qu1Wb2WQcVjfZBiUnowOxu6XKSmq8kIXTaVeur0cljk=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fTKOS3opN+kqbq5GCVypqgpY5TfQ9SP/Fd2
 AWSynmPUBaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH0wAKCRDB/BR4rcrs
 CVCTB/9DbBNnuh450yNpockNp/1vKu95EDn9LMVE2DFusOqqchP6H59J+gy2CRGNxO2NeoLhOh/
 9nnDHRDIXT1b6qNyYhIUPhMoCVGmY+PJaqB7KuaUg6sXfw+5/jowk+bd9JhDN6hr2JddMx2xkgN
 nQ45Z/WY8eiICqx5d5i1t+FxKvHBBJNst2OggxM0yTabz3tSp8x5w+gAK3ThYB7p5PZJOAs054n
 M2Q7GMbkmZEV1aT1zC3jXSieKW7T00o8VBuZOqGjw4XAm1d8ZfATT53VO8wYJEdmVGTUiH1Uf5S
 QE+kk7fD78z7cHx3//T/wureWucelKT/zfWsksCxvwOhA3NH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 33/41] rtc: stmp3xxx: Convert to platform
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
dmVycy9ydGMvcnRjLXN0bXAzeHh4LmMgfCA4ICsrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0
Yy1zdG1wM3h4eC5jIGIvZHJpdmVycy9ydGMvcnRjLXN0bXAzeHh4LmMKaW5kZXggYWFlNDBkMjBk
MDg2Li42ZjExYjc0NWYzNGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1zdG1wM3h4eC5j
CisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1zdG1wM3h4eC5jCkBAIC0yMzIsMTcgKzIzMiwxNSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHJ0Y19jbGFzc19vcHMgc3RtcDN4eHhfcnRjX29wcyA9IHsKIAku
c2V0X2FsYXJtCT0gc3RtcDN4eHhfcnRjX3NldF9hbGFybSwKIH07CiAKLXN0YXRpYyBpbnQgc3Rt
cDN4eHhfcnRjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZv
aWQgc3RtcDN4eHhfcnRjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewog
CXN0cnVjdCBzdG1wM3h4eF9ydGNfZGF0YSAqcnRjX2RhdGEgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsKIAogCWlmICghcnRjX2RhdGEpCi0JCXJldHVybiAwOworCQlyZXR1cm47CiAKIAl3
cml0ZWwoU1RNUDNYWFhfUlRDX0NUUkxfQUxBUk1fSVJRX0VOLAogCQlydGNfZGF0YS0+aW8gKyBT
VE1QM1hYWF9SVENfQ1RSTCArIFNUTVBfT0ZGU0VUX1JFR19DTFIpOwotCi0JcmV0dXJuIDA7CiB9
CiAKIHN0YXRpYyBpbnQgc3RtcDN4eHhfcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCkBAIC00MDYsNyArNDA0LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcnRjX2R0
X2lkcyk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bXAzeHh4X3J0Y2RydiA9
IHsKIAkucHJvYmUJCT0gc3RtcDN4eHhfcnRjX3Byb2JlLAotCS5yZW1vdmUJCT0gc3RtcDN4eHhf
cnRjX3JlbW92ZSwKKwkucmVtb3ZlX25ldwk9IHN0bXAzeHh4X3J0Y19yZW1vdmUsCiAJLmRyaXZl
cgkJPSB7CiAJCS5uYW1lCT0gInN0bXAzeHh4LXJ0YyIsCiAJCS5wbQk9ICZzdG1wM3h4eF9ydGNf
cG1fb3BzLAotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
