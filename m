Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BBC6A9D30
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 18:21:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEE8DC6A61C;
	Fri,  3 Mar 2023 17:21:15 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E910C6A61B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 17:21:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pY95f-00074T-Go; Fri, 03 Mar 2023 18:21:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pY95e-001boK-M9; Fri, 03 Mar 2023 18:21:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pY95d-001tmX-RL; Fri, 03 Mar 2023 18:21:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  3 Mar 2023 18:20:27 +0100
Message-Id: <20230303172041.2103336-74-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=TTzji5qZuKUEjFFALcmPwLVE5by1HIpRjVd3ggKjoqg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiwmxvr9esPSJVH5g3dbhmj4salWV2V+ja3L1
 clwRFsikZSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIsJgAKCRDB/BR4rcrs
 CbU2B/9tBylijbSzh84LNRPeuDQ2AJ2zYYwjs0PXJC98NEms2VKjmdiihvSxC+Uj7awn8bN4UFK
 FVaXmElsMZPkZPb/H3inzmoXSKP7qvjXOy1fB9aYtTwn4I7YqN+DXRL+1Rd1AJOs1JyknRdyusk
 KsRILGf4DbfoReFAxj4MSdbfs+93DN1d7OcDM0aABAwFjO07Auz+PR8SeTjAPYoRf9M+kO664H3
 LVD3YOYJIhcBibqM5no5j3LIGcdbGiRSDCAVqzRCeNGTwsoeHt8zmxAZSs3ir0Hw/yYXurTLIYn
 3KDPTdth+C6KjUyq9Ba6ejiPLOVcKlfo9FolbUKVic2mc8SG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH 73/87] spi: stm32: Convert to platform remove
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
dmVycy9zcGkvc3BpLXN0bTMyLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktc3Rt
MzIuYyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCmluZGV4IGRlZjA5Y2YwZGMxNC4uOWNjYjUy
Mjk2ZTU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktc3RtMzIuYworKysgYi9kcml2ZXJz
L3NwaS9zcGktc3RtMzIuYwpAQCAtMTkyMiw3ICsxOTIyLDcgQEAgc3RhdGljIGludCBzdG0zMl9z
cGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQog
Ci1zdGF0aWMgaW50IHN0bTMyX3NwaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKK3N0YXRpYyB2b2lkIHN0bTMyX3NwaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIHsKIAlzdHJ1Y3Qgc3BpX21hc3RlciAqbWFzdGVyID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7CiAJc3RydWN0IHN0bTMyX3NwaSAqc3BpID0gc3BpX21hc3Rlcl9nZXRfZGV2ZGF0
YShtYXN0ZXIpOwpAQCAtMTk0Niw4ICsxOTQ2LDYgQEAgc3RhdGljIGludCBzdG0zMl9zcGlfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAogCXBpbmN0cmxfcG1fc2VsZWN0
X3NsZWVwX3N0YXRlKCZwZGV2LT5kZXYpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQg
X19tYXliZV91bnVzZWQgc3RtMzJfc3BpX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpCkBAIC0yMDIzLDcgKzIwMjEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMg
c3RtMzJfc3BpX3BtX29wcyA9IHsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3Rt
MzJfc3BpX2RyaXZlciA9IHsKIAkucHJvYmUgPSBzdG0zMl9zcGlfcHJvYmUsCi0JLnJlbW92ZSA9
IHN0bTMyX3NwaV9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0zMl9zcGlfcmVtb3ZlLAogCS5k
cml2ZXIgPSB7CiAJCS5uYW1lID0gRFJJVkVSX05BTUUsCiAJCS5wbSA9ICZzdG0zMl9zcGlfcG1f
b3BzLAotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
