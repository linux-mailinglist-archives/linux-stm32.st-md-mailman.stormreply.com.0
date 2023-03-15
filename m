Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4306BB6F7
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Mar 2023 16:08:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DCBCC6A5EA;
	Wed, 15 Mar 2023 15:08:46 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FBBCC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 15:08:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjx-0000Nl-M1; Wed, 15 Mar 2023 16:08:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjt-004Keb-6k; Wed, 15 Mar 2023 16:08:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjr-0057kk-Hb; Wed, 15 Mar 2023 16:08:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 15 Mar 2023 16:07:11 +0100
Message-Id: <20230315150745.67084-140-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=jvU7ygEInOmx/cF0f3yVtLZnqi+/vqLXkGO3jVzqefI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7UNtXy7hf+SoCky6y/BdsqAnVT3qt0hrnt+
 q769hD4HRWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe1AAKCRDB/BR4rcrs
 CdBIB/9wNtNYu6Z9CDMtcblJUy8Ow3xZop7E/DXPoOFZTpA/dP7f4Ys5RAS5wIa+tE8T33DJfTp
 m8DbJ/Hb33d3JuC+g0i+npWqa8bXsAx1CBGieRffBZ2xveBOSNHO9FmSXOdSG/PSF3nyopsGCXw
 tW254RS67iTOpFBxy75ixIfbZB74rIfXYyxXPc9D/EUaUSNdx226Z/mBOpyd1SMrdGyP0/zSi52
 QWnCQjAR9W1pib1i7Tqcppi+YNR1G5ougCqWdQwoHG89aElsDzFtkBCY6IQY8qA4yVxav7B+1zY
 Rs7A7TLGfk1RFvXYNsjI99ffdc5E3qhLPYgcRPb7aaWXVTCQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 139/173] ASoC: stm: stm32_spdifrx: Convert to
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
bmQvc29jL3N0bS9zdG0zMl9zcGRpZnJ4LmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc3Rt
L3N0bTMyX3NwZGlmcnguYyBiL3NvdW5kL3NvYy9zdG0vc3RtMzJfc3BkaWZyeC5jCmluZGV4IGQz
OTljOTA2YmI5Mi4uYTQwNjZmMjcxZjJkIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc3RtL3N0bTMy
X3NwZGlmcnguYworKysgYi9zb3VuZC9zb2Mvc3RtL3N0bTMyX3NwZGlmcnguYwpAQCAtOTM5LDcg
KzkzOSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfc3BkaWZyeF9wYXJzZV9vZihzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2LAogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHN0bTMyX3NwZGlm
cnhfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBzdG0z
Ml9zcGRpZnJ4X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVj
dCBzdG0zMl9zcGRpZnJ4X2RhdGEgKnNwZGlmcnggPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsKIApAQCAtOTUyLDggKzk1Miw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfc3BkaWZyeF9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzbmRfZG1hZW5naW5lX3BjbV91bnJlZ2lz
dGVyKCZwZGV2LT5kZXYpOwogCXNuZF9zb2NfdW5yZWdpc3Rlcl9jb21wb25lbnQoJnBkZXYtPmRl
dik7CiAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwotCi0JcmV0dXJuIDA7CiB9CiAK
IHN0YXRpYyBpbnQgc3RtMzJfc3BkaWZyeF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQpAQCAtMTA3OCw3ICsxMDc2LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
c3RtMzJfc3BkaWZyeF9kcml2ZXIgPSB7CiAJCS5wbSA9ICZzdG0zMl9zcGRpZnJ4X3BtX29wcywK
IAl9LAogCS5wcm9iZSA9IHN0bTMyX3NwZGlmcnhfcHJvYmUsCi0JLnJlbW92ZSA9IHN0bTMyX3Nw
ZGlmcnhfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gc3RtMzJfc3BkaWZyeF9yZW1vdmUsCiB9Owog
CiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHN0bTMyX3NwZGlmcnhfZHJpdmVyKTsKLS0gCjIuMzku
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
