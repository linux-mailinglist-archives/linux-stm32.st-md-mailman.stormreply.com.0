Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C29306BB6F9
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Mar 2023 16:08:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A3CBC6A60F;
	Wed, 15 Mar 2023 15:08:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB2EFC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 15:08:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjw-0000KT-KM; Wed, 15 Mar 2023 16:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjs-004KeO-Cy; Wed, 15 Mar 2023 16:08:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjr-0057kb-4B; Wed, 15 Mar 2023 16:08:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 15 Mar 2023 16:07:09 +0100
Message-Id: <20230315150745.67084-138-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=G3+Zub3on/oNv5MlUhL//kM8stML3hIwmYkNv5rWxLo=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMaQI3ju71CVIvOSn+Q9LRruINMUs606RY0H/z3YsbroQu
 79m0uoPnYzGLAyMXAyyYoosdUVaYhMk1vy3K1nCDTOIlQlkCgMXpwBMxNKQ/X+C+rJK+yA/0RMq
 pvGGpoLciUZvOG6s9GM0XvbJZU2qLGPJ9vT6L00d3MVmKsZ6ixcv53r4pH/RxNeM+x7vNCrXFmw
 J1NxeGjiDd96rZfXre/e9XLpdMuPpkdDMWzK1b7ruzrh4aNsip6vrZkZeMJq1eEbP6tjouiv9LQ
 cqd0n1zJzbLy51jsl72h/TMs2mX9zfbyT52vxz8+l8m/D38NbD3RMvi+b2uvZL3n4vInRAfHZU0
 vYtvTb1u8TfaPHXH3QsYjl3/fcH1qkr5qYpyrk/e/u+uWmVYlWwnpebjEWcE+NX9sKDW7e57TVn
 0mKySQB6+PHj1Rn2r8Rss4vmx81l/eh8M6Qo5Cj7leVnAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 137/173] ASoC: stm: stm32_i2s: Convert to
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
bmQvc29jL3N0bS9zdG0zMl9pMnMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zdG0vc3Rt
MzJfaTJzLmMgYi9zb3VuZC9zb2Mvc3RtL3N0bTMyX2kycy5jCmluZGV4IGYzZGQ5ZjhlNjIxYy4u
ZjdlMzgxMTg3MjE2IDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc3RtL3N0bTMyX2kycy5jCisrKyBi
L3NvdW5kL3NvYy9zdG0vc3RtMzJfaTJzLmMKQEAgLTEwOTcsMTMgKzEwOTcsMTEgQEAgc3RhdGlj
IGludCBzdG0zMl9pMnNfcGFyc2VfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIAly
ZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBzdG0zMl9pMnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBzdG0zMl9pMnNfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc25kX2RtYWVuZ2luZV9wY21fdW5yZWdpc3RlcigmcGRl
di0+ZGV2KTsKIAlzbmRfc29jX3VucmVnaXN0ZXJfY29tcG9uZW50KCZwZGV2LT5kZXYpOwogCXBt
X3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMg
aW50IHN0bTMyX2kyc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQpAQCAtMTIy
MSw3ICsxMjE5LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfaTJzX2Ry
aXZlciA9IHsKIAkJLnBtID0gJnN0bTMyX2kyc19wbV9vcHMsCiAJfSwKIAkucHJvYmUgPSBzdG0z
Ml9pMnNfcHJvYmUsCi0JLnJlbW92ZSA9IHN0bTMyX2kyc19yZW1vdmUsCisJLnJlbW92ZV9uZXcg
PSBzdG0zMl9pMnNfcmVtb3ZlLAogfTsKIAogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihzdG0zMl9p
MnNfZHJpdmVyKTsKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
