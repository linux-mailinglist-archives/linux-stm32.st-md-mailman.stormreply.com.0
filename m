Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE306E1669
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 23:23:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6A95C69065;
	Thu, 13 Apr 2023 21:23:57 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 158FDC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 21:23:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pn4Py-0004rB-4n; Thu, 13 Apr 2023 23:23:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pn4Pu-00B3Td-SR; Thu, 13 Apr 2023 23:23:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pn4Pu-00CzGq-3G; Thu, 13 Apr 2023 23:23:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 William Breathitt Gray <william.gray@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Thu, 13 Apr 2023 23:23:39 +0200
Message-Id: <20230413212339.3611722-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1841;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=vxtaBmxwNsBkr9CdtdCf+mVLWRBggCM6EPnGO9VbZeY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkOHLZP6hHl9jieHDPCcxLcjQxJ/8Ne4sNwuePK
 TlBhuZ4IxyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZDhy2QAKCRCPgPtYfRL+
 Tr6DB/4tCTTgUX3YN1QgGIcU6A0L0zrWPI1weshKJPCTfVssBBfSkNNltw6R4oGgeyTytC/KvRR
 B1g+lOIxVkWzJJjTrgJth/kIJBddPzXIl6RyLxna/0Yan0+cr3enI0HaNwgOLQsQBSdFUoKzIwa
 gV6SFTAoB9RfTuXoWXz6wYCsodwZHOMdMrjLdq54ivczK+Uco86JTA8QGaShoROWnhU8gFo5xB1
 1pZRzOt1g+OOLQ/A8LN8nFOUsPJkFDwsNgyoLuMPU9fsrrpNFFhBFiZmUMzUad2c00WuxpIwjm2
 NZwXX1xo1R+oEvZYObv5E50hyEYQPfhYm165gP5OaKV7QBSd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-iio@vger.kernel.org,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] counter: stm32-timer-cnt: Reset TIM_TISEL
	to its default value in probe
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

VGhlIGRyaXZlciBhc3N1bWVzIHRoYXQgdGhlIGlucHV0IHNlbGVjdGlvbiByZWdpc3RlciAoVElN
X1RJU0VMKSBpcyBhdAppdHMgcmVzZXQgZGVmYXVsdCB2YWx1ZS4gVXN1YWxseSB0aGlzIGlzIHRo
ZSBjYXNlLCBidXQgdGhlIGJvb3Rsb2FkZXIKbWlnaHQgaGF2ZSBtb2RpZmllZCBpdC4KClRoaXMg
YmFzZXMgb24gYSBzaW1pbGFyIHBhdGNoIHN1Ym1pdHRlZCBieSBPbGl2aWVyIE1veXNhbiBmb3Ig
cHdtLXN0bTMyLgoKUmV2aWV3ZWQtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVy
QGZvc3Muc3QuY29tClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQpDaGFuZ2VzIHNpbmNlIChpbXBsaWNpdCkgdjEgc2Vu
dCB3aXRoIE1lc3NhZ2UtSWQ6CjIwMjMwNDEyMTUzNzA5LjM1NTczMjMtMS11LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGUgLgoKIC0gT25seSByZXNldCBUSU1fVElTRUwgYXMgc3VnZ2VzdGVk
IGJ5IEZhYnJpY2UKIC0gQWRkIEZhYnJpY2UncyBSZXZpZXcgdGFnCgogZHJpdmVycy9jb3VudGVy
L3N0bTMyLXRpbWVyLWNudC5jIHwgMyArKysKIGluY2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVy
cy5oICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMgYi9kcml2ZXJzL2NvdW50ZXIvc3Rt
MzItdGltZXItY250LmMKaW5kZXggOWJmMjBhNWQ2YmRhLi42MjA2ZDJkYzNkNDcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYworKysgYi9kcml2ZXJzL2NvdW50
ZXIvc3RtMzItdGltZXItY250LmMKQEAgLTM0Miw2ICszNDIsOSBAQCBzdGF0aWMgaW50IHN0bTMy
X3RpbWVyX2NudF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcGxhdGZv
cm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7CiAKKwkvKiBSZXNldCBpbnB1dCBzZWxlY3RvciB0
byBpdHMgZGVmYXVsdCBpbnB1dCAqLworCXJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIFRJTV9U
SVNFTCwgMHgwKTsKKwogCS8qIFJlZ2lzdGVyIENvdW50ZXIgZGV2aWNlICovCiAJcmV0ID0gZGV2
bV9jb3VudGVyX2FkZChkZXYsIGNvdW50ZXIpOwogCWlmIChyZXQgPCAwKQpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmggYi9pbmNsdWRlL2xpbnV4L21mZC9zdG0z
Mi10aW1lcnMuaAppbmRleCA1ZjVjNDNmZDY5ZGQuLjFiOTQzMjVmZWJiMyAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZmQv
c3RtMzItdGltZXJzLmgKQEAgLTMxLDYgKzMxLDcgQEAKICNkZWZpbmUgVElNX0JEVFIJMHg0NAkv
KiBCcmVhayBhbmQgRGVhZC1UaW1lIFJlZyAqLwogI2RlZmluZSBUSU1fRENSCQkweDQ4CS8qIERN
QSBjb250cm9sIHJlZ2lzdGVyICAgICovCiAjZGVmaW5lIFRJTV9ETUFSCTB4NEMJLyogRE1BIHJl
Z2lzdGVyIGZvciB0cmFuc2ZlciAqLworI2RlZmluZSBUSU1fVElTRUwJMHg2OAkvKiBJbnB1dCBT
ZWxlY3Rpb24gICAgICAgICAqLwogCiAjZGVmaW5lIFRJTV9DUjFfQ0VOCUJJVCgwKQkvKiBDb3Vu
dGVyIEVuYWJsZQkgICAqLwogI2RlZmluZSBUSU1fQ1IxX0RJUglCSVQoNCkgIC8qIENvdW50ZXIg
RGlyZWN0aW9uCSAgICovCgpiYXNlLWNvbW1pdDogZmUxNWMyNmVlMjZlZmExMTc0MWE3YjYzMmU5
ZjIzYjAxYWNhNGNjNgotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
