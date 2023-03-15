Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 957376BB6F5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Mar 2023 16:08:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A144C6904C;
	Wed, 15 Mar 2023 15:08:45 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A79FC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 15:08:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjw-0000Jh-Fi; Wed, 15 Mar 2023 16:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjs-004KeD-1G; Wed, 15 Mar 2023 16:08:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pcSjq-0057kY-Sm; Wed, 15 Mar 2023 16:08:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 15 Mar 2023 16:07:08 +0100
Message-Id: <20230315150745.67084-137-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=mkEA2aglVrZicYe+eAFWE7drEQFhyfBxx2S9b8QGsDI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7KrH18BKn6U5TdR0h99SdCYDXnSsCGZlZWO
 lXdTzExb5+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeygAKCRDB/BR4rcrs
 CeFlB/9b4zj1DMI0KekPjwfjO/6X4fGR4QmZVhy3RG441iQZTYXUUpIi56sqakT4hWfixMulfCZ
 jalr6IzIuLtLiNmrhi8ggcllJIbzLCK+PcacY5nAtScVQ062PbynwU5XuSE1ik1HXojBp5HctL/
 3jxkC2Zdm/z+4MDkd7dVimP18I6t/aFhTyRpNiBmVnKYLsiar4glu1Kw7DWt01Zin62trRg2O36
 EVI4aq1rx4wegyCh414DlUkHEG0VFrZZ0L9Lqi8F0ZNEsOQVQ2BnKn4mRGbY/8RCAXUg8g644BV
 uVA/weNz9A4wkcyKddy7+FamBZTsghFM8iSAXynFlZpiYDlD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 136/173] ASoC: stm: stm32_adfsdm: Convert to
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
bmQvc29jL3N0bS9zdG0zMl9hZGZzZG0uYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zdG0v
c3RtMzJfYWRmc2RtLmMgYi9zb3VuZC9zb2Mvc3RtL3N0bTMyX2FkZnNkbS5jCmluZGV4IDgzN2Mx
ODQ4ZDliZi4uYThmZmY3Mzc4NjQxIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc3RtL3N0bTMyX2Fk
ZnNkbS5jCisrKyBiL3NvdW5kL3NvYy9zdG0vc3RtMzJfYWRmc2RtLmMKQEAgLTM4NiwxMiArMzg2
LDEwIEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRmc2RtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBzdG0zMl9hZGZzZG1fcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBzdG0zMl9hZGZz
ZG1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc25kX3NvY191bnJl
Z2lzdGVyX2NvbXBvbmVudCgmcGRldi0+ZGV2KTsKIAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYt
PmRldik7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
c3RtMzJfYWRmc2RtX2RyaXZlciA9IHsKQEAgLTQwMCw3ICszOTgsNyBAQCBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9hZGZzZG1fZHJpdmVyID0gewogCQkgICAub2ZfbWF0Y2hf
dGFibGUgPSBzdG0zMl9hZGZzZG1fb2ZfbWF0Y2gsCiAJCSAgIH0sCiAJLnByb2JlID0gc3RtMzJf
YWRmc2RtX3Byb2JlLAotCS5yZW1vdmUgPSBzdG0zMl9hZGZzZG1fcmVtb3ZlLAorCS5yZW1vdmVf
bmV3ID0gc3RtMzJfYWRmc2RtX3JlbW92ZSwKIH07CiAKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIo
c3RtMzJfYWRmc2RtX2RyaXZlcik7Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
