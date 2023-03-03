Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE96A9D28
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 18:21:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF211C6A61A;
	Fri,  3 Mar 2023 17:21:11 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73B92C6A616
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 17:21:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pY95f-000751-Tm; Fri, 03 Mar 2023 18:21:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pY95e-001boU-VZ; Fri, 03 Mar 2023 18:21:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pY95d-001tmT-Kb; Fri, 03 Mar 2023 18:21:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  3 Mar 2023 18:20:26 +0100
Message-Id: <20230303172041.2103336-73-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=hw0v7/VEboyjh4ufaxKxn8YhNW4zVT4Q1r6kSgkyUo8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiwihaoJipsCTCC2VlZLiQcIlqSvMoBNZjkVT
 5Ld2Z22ewKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIsIgAKCRDB/BR4rcrs
 Ce8IB/0ZtukNATZIF/3Yb5ThyqyiBIACWDZEACUFBOO4wLwVejanAY5BQrjsxHj7b9sMg8PWT47
 aLxdki5SV3HWRKIBLkDOFvXbOiDTompRmJajZjXPn1iCEBZq09ZUycDF/07kV2eQx7x8cllmFVo
 Eyr4kB49MKRGIVngivrjPYC8ypRxmne0+BBGezVKXADvOmaVC4ujCvWj8L0GazIXKjv9lkMQdGm
 HCyx09ijNA9MvPMxB2cR0IueP2eu+/42AoItVfuxgbloHN4Tkz1PptNEUkUb1yA+qH/Ld3Lxh+t
 OCw4H2U1y+KRn5JWocJ+e896kIo+bJS+uRijTV5GgYC/X6ZG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH 72/87] spi: stm32-qspi: Convert to platform
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
dmVycy9zcGkvc3BpLXN0bTMyLXFzcGkuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3Nw
aS1zdG0zMi1xc3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktc3RtMzItcXNwaS5jCmluZGV4IDkxMzE2
NjBjMWFmYi4uMjkxMjVhZjBhZmRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktc3RtMzIt
cXNwaS5jCisrKyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi1xc3BpLmMKQEAgLTg4OCw3ICs4ODgs
NyBAQCBzdGF0aWMgaW50IHN0bTMyX3FzcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IHN0bTMyX3FzcGlfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBzdG0zMl9xc3BpX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBzdG0zMl9xc3BpICpx
c3BpID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKQEAgLTkwMyw4ICs5MDMsNiBAQCBz
dGF0aWMgaW50IHN0bTMyX3FzcGlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJcG1fcnVudGltZV9zZXRfc3VzcGVuZGVkKHFzcGktPmRldik7CiAJcG1fcnVudGltZV9kb250
X3VzZV9hdXRvc3VzcGVuZChxc3BpLT5kZXYpOwogCWNsa19kaXNhYmxlX3VucHJlcGFyZShxc3Bp
LT5jbGspOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3Rt
MzJfcXNwaV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQpAQCAtOTY4LDcgKzk2
Niw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHN0bTMyX3FzcGlfbWF0Y2gpOwogCiBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9xc3BpX2RyaXZlciA9IHsKIAkucHJvYmUJ
PSBzdG0zMl9xc3BpX3Byb2JlLAotCS5yZW1vdmUJPSBzdG0zMl9xc3BpX3JlbW92ZSwKKwkucmVt
b3ZlX25ldyA9IHN0bTMyX3FzcGlfcmVtb3ZlLAogCS5kcml2ZXIJPSB7CiAJCS5uYW1lID0gInN0
bTMyLXFzcGkiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl9xc3BpX21hdGNoLAotLSAKMi4z
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
