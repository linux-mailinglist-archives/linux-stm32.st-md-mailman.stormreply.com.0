Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37087E085
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Mar 2024 22:52:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4D18C6DD75;
	Sun, 17 Mar 2024 21:52:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91EDBC6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 21:52:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rlyQk-0002ko-4u; Sun, 17 Mar 2024 22:52:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rlyQj-006xGt-8J; Sun, 17 Mar 2024 22:52:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rlyQj-007fo3-0Z;
 Sun, 17 Mar 2024 22:52:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 17 Mar 2024 22:52:15 +0100
Message-ID: <06b4a650a608d0887d934c1b2b8919e0f78e4db2.1710711976.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710711976.git.u.kleine-koenig@pengutronix.de>
References: <cover.1710711976.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2570;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=LC/LLRqDr9Z7kf3kDVEv9tMRdoh326PaTq2N/xGKxhs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl92YTQOFkCl9hltuvWQRPORMGwXSAVvQaSYFEj
 cT5yRnj8+yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZfdmEwAKCRCPgPtYfRL+
 Tu8hCACpDquxqwbpdvKPAX/vz7ulv7aFcH25NgqtFXF6p8zu0AZZC+Wswk7hzAfwFb5F5USnqNm
 gbYkpbMLUUspazJvo4Hg6MTBK4ievd3U49DSl08ewTQ43bt/v0GgxHy8vInkCV/gj8Xae4e45WU
 X06nYnEIE6FqjAZ5klzHgehS7Pqp8ymnlFMZ6tpInbNYG0mnMNL5YmjtGJQ8scrMAsj53YvR5PJ
 WFCeqZ96g/4bUKeKo3ZtgeMLWF9WjstBhaza0xbODMDAfB7WgL9NOOnr3SqHOa93RDiG+NG2R75
 4p4FHzGaI//h4LHMMrbk1/Ap+b14PrF6uUA8IgtmU3NcPdUz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] pwm: stm32: Fix for settings using period
	> UINT32_MAX
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

c3RtMzJfcHdtX2NvbmZpZygpIHRvb2sgdGhlIGR1dHlfY3ljbGUgYW5kIHBlcmlvZCB2YWx1ZXMg
d2l0aCB0aGUgdHlwZQppbnQsIGhvd2V2ZXIgc3RtMzJfcHdtX2FwcGx5KCkgcGFzc2VkIHU2NCB2
YWx1ZXMgdGhlcmUuIEV4cGFuZCB0aGUKZnVuY3Rpb24gcGFyYW1ldGVycyB0byB1NjQgdG8gbm90
IGRpc2NhcmQgcmVsZXZhbnQgYml0cyBhbmQgYWRhcHQgdGhlCmNhbGN1bGF0aW9ucyB0byB0aGUg
d2lkZXIgdHlwZS4KClRvIGVuc3VyZSB0aGUgY2FsY3VsYXRpb25zIHdvbid0IG92ZXJmbG93LCBj
aGVjayBpbiAucHJvYmUoKSB0aGUgaW5wdXQKY2xrIGRvZXNuJ3QgcnVuIGZhc3RlciB0aGFuIDEg
R0h6LgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDI5ICsrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2Ry
aXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IGZiNzE0OTM2ZmY4Zi4uYjIwZDQzNDA4ZTYxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYworKysgYi9kcml2ZXJzL3B3bS9wd20t
c3RtMzIuYwpAQCAtMzA5LDE3ICszMDksMTggQEAgc3RhdGljIGludCBzdG0zMl9wd21fY2FwdHVy
ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiB9CiAKIHN0
YXRpYyBpbnQgc3RtMzJfcHdtX2NvbmZpZyhzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCB1bnNpZ25l
ZCBpbnQgY2gsCi0JCQkgICAgaW50IGR1dHlfbnMsIGludCBwZXJpb2RfbnMpCisJCQkgICAgdTY0
IGR1dHlfbnMsIHU2NCBwZXJpb2RfbnMpCiB7CiAJdW5zaWduZWQgbG9uZyBsb25nIHByZCwgZGl2
LCBkdHk7CiAJdW5zaWduZWQgaW50IHByZXNjYWxlciA9IDA7CiAJdTMyIGNjbXIsIG1hc2ssIHNo
aWZ0OwogCi0JLyogUGVyaW9kIGFuZCBwcmVzY2FsZXIgdmFsdWVzIGRlcGVuZHMgb24gY2xvY2sg
cmF0ZSAqLwotCWRpdiA9ICh1bnNpZ25lZCBsb25nIGxvbmcpY2xrX2dldF9yYXRlKHByaXYtPmNs
aykgKiBwZXJpb2RfbnM7Ci0KLQlkb19kaXYoZGl2LCBOU0VDX1BFUl9TRUMpOwotCXByZCA9IGRp
djsKKwkvKgorCSAqIC5wcm9iZSgpIGFzc2VydGVkIHRoYXQgY2xrX2dldF9yYXRlKCkgaXMgbm90
IGJpZ2dlciB0aGFuIDEgR0h6LCBzbworCSAqIHRoaXMgd29uJ3Qgb3ZlcmZsb3cuCisJICovCisJ
ZGl2ID0gbXVsX3U2NF91NjRfZGl2X3U2NChwZXJpb2RfbnMsIGNsa19nZXRfcmF0ZShwcml2LT5j
bGspLAorCQkJCSAgTlNFQ19QRVJfU0VDKTsKIAogCXdoaWxlIChkaXYgPiBwcml2LT5tYXhfYXJy
KSB7CiAJCXByZXNjYWxlcisrOwpAQCAtMzUxLDkgKzM1Miw4IEBAIHN0YXRpYyBpbnQgc3RtMzJf
cHdtX2NvbmZpZyhzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCB1bnNpZ25lZCBpbnQgY2gsCiAJcmVn
bWFwX3NldF9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9BUlBFKTsKIAogCS8q
IENhbGN1bGF0ZSB0aGUgZHV0eSBjeWNsZXMgKi8KLQlkdHkgPSAodW5zaWduZWQgbG9uZyBsb25n
KWNsa19nZXRfcmF0ZShwcml2LT5jbGspICogZHV0eV9uczsKLQlkb19kaXYoZHR5LCBwcmVzY2Fs
ZXIgKyAxKTsKLQlkb19kaXYoZHR5LCBOU0VDX1BFUl9TRUMpOworCWR0eSA9IG11bF91NjRfdTY0
X2Rpdl91NjQoZHV0eV9ucywgY2xrX2dldF9yYXRlKHByaXYtPmNsayksCisJCQkJICAodTY0KU5T
RUNfUEVSX1NFQyAqIChwcmVzY2FsZXIgKyAxKSk7CiAKIAlyZWdtYXBfd3JpdGUocHJpdi0+cmVn
bWFwLCBUSU1fQ0NSMSArIDQgKiBjaCwgZHR5KTsKIApAQCAtNjU5LDYgKzY1OSwxNyBAQCBzdGF0
aWMgaW50IHN0bTMyX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJ
c3RtMzJfcHdtX2RldGVjdF9jb21wbGVtZW50YXJ5KHByaXYpOwogCisJcmV0ID0gZGV2bV9jbGtf
cmF0ZV9leGNsdXNpdmVfZ2V0KGRldiwgcHJpdi0+Y2xrKTsKKwlpZiAocmV0KQorCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBsb2NrIGNsb2NrXG4iKTsKKworCS8q
CisJICogV2l0aCB0aGUgY2xrIHJ1bm5pbmcgd2l0aCBub3QgbW9yZSB0aGFuIDEgR0h6IHRoZSBj
YWxjdWxhdGlvbnMgaW4KKwkgKiAuYXBwbHkoKSB3b24ndCBvdmVyZmxvdy4KKwkgKi8KKwlpZiAo
Y2xrX2dldF9yYXRlKHByaXYtPmNsaykgPiAxMDAwMDAwMDAwKQorCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIC1FSU5WQUwsICJGYWlsZWQgdG8gbG9jayBjbG9ja1xuIik7CisKIAljaGlwLT5v
cHMgPSAmc3RtMzJwd21fb3BzOwogCiAJLyogSW5pdGlhbGl6ZSBjbG9jayByZWZjb3VudCB0byBu
dW1iZXIgb2YgZW5hYmxlZCBQV00gY2hhbm5lbHMuICovCi0tIAoyLjQzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
