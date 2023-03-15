Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B18596BB6F6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Mar 2023 16:08:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DD9AC69067;
	Wed, 15 Mar 2023 15:08:45 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AB9CC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 15:08:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjw-0000L4-9o; Wed, 15 Mar 2023 16:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjs-004KeS-KC; Wed, 15 Mar 2023 16:08:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjr-0057kg-AW; Wed, 15 Mar 2023 16:08:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 15 Mar 2023 16:07:10 +0100
Message-Id: <20230315150745.67084-139-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=xG7bgQl1WQ6zGD0G+sP96zZYOX6Rmgyluc+Vlw6F6Xw=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7QZu6j8n8G0uOcXjx79C0pgFIGqDwF5fWYo
 pQIkZG9/fmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe0AAKCRDB/BR4rcrs
 CansB/9BsX2txlHSdHcMeg+f3WY/EE4bSOWq3xqBnWRRe/ARYATwjTxGqKAyiVP0J2hrChbcUBs
 MrfzZu+FDutl48VHlwQtICETaBebUAl5vpaZsQQKHDXMdIkPSH+YxVhyFyCuwb02BtC6r5J60rI
 pP68z0qoh5xu3gef9Kzj0X1tmxtDxhpRwGeY5Z0absUWr4TRRMPYJU1lC2KWlfTC2vjFLSqbZZA
 W1Gy99aP5SSfjXWU6IQ+XaPNn2qjYHGAy/abQFM65OBIWN63xkM/WFcJyfOvGIOBtNe0bWZwMUg
 FQIjUoiXL5LkE9HmIrMNxPCm2KnSMn9KOkXBqnU4/v7BFzqu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 138/173] ASoC: stm: stm32_sai_sub: Convert to
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
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogc291
bmQvc29jL3N0bS9zdG0zMl9zYWlfc3ViLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc3Rt
L3N0bTMyX3NhaV9zdWIuYyBiL3NvdW5kL3NvYy9zdG0vc3RtMzJfc2FpX3N1Yi5jCmluZGV4IGVi
MzFiNDllNjU5Ny4uMzhlNjVlMWY5NDk2IDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc3RtL3N0bTMy
X3NhaV9zdWIuYworKysgYi9zb3VuZC9zb2Mvc3RtL3N0bTMyX3NhaV9zdWIuYwpAQCAtMTU1OSw3
ICsxNTU5LDcgQEAgc3RhdGljIGludCBzdG0zMl9zYWlfc3ViX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgc3RtMzJfc2FpX3N1
Yl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHN0bTMy
X3NhaV9zdWJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IHN0bTMyX3NhaV9zdWJfZGF0YSAqc2FpID0gZGV2X2dldF9kcnZkYXRhKCZwZGV2LT5kZXYpOwog
CkBAIC0xNTY3LDggKzE1NjcsNiBAQCBzdGF0aWMgaW50IHN0bTMyX3NhaV9zdWJfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc25kX2RtYWVuZ2luZV9wY21fdW5yZWdpc3Rl
cigmcGRldi0+ZGV2KTsKIAlzbmRfc29jX3VucmVnaXN0ZXJfY29tcG9uZW50KCZwZGV2LT5kZXYp
OwogCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKLQotCXJldHVybiAwOwogfQogCiAj
aWZkZWYgQ09ORklHX1BNX1NMRUVQCkBAIC0xNjE4LDcgKzE2MTYsNyBAQCBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9zYWlfc3ViX2RyaXZlciA9IHsKIAkJLnBtID0gJnN0bTMy
X3NhaV9zdWJfcG1fb3BzLAogCX0sCiAJLnByb2JlID0gc3RtMzJfc2FpX3N1Yl9wcm9iZSwKLQku
cmVtb3ZlID0gc3RtMzJfc2FpX3N1Yl9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0zMl9zYWlf
c3ViX3JlbW92ZSwKIH07CiAKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc3RtMzJfc2FpX3N1Yl9k
cml2ZXIpOwotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
