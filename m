Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BF6DFA56
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 17:37:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ADB6C69063;
	Wed, 12 Apr 2023 15:37:21 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6C42C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 15:37:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pmcX6-0003bP-Ac; Wed, 12 Apr 2023 17:37:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pmcX4-00AlqQ-Hk; Wed, 12 Apr 2023 17:37:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pmcX3-00CeDT-To; Wed, 12 Apr 2023 17:37:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 William Breathitt Gray <william.gray@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 12 Apr 2023 17:37:09 +0200
Message-Id: <20230412153709.3557323-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=zc5B2LGRs54BHs4aCdePhpxua9fygSYRDSyPsSaXvAQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkNtAjdw2NqpObCpDcSjUHHwcgtWq3IXeDtu5dJ
 I147vXR/4mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZDbQIwAKCRCPgPtYfRL+
 Tp3rB/9E4lY5pFlQ/4pLFl+7NMDzGTrTBIIBMaxCTZWaTETyfr5PUiCqal1MUl/FpK3Khbuvta3
 JcXl5LfsAqib1UZUiBlJ66qf5ZlmzRh3T6t6W7GVkse1jkXL09lVsqYrSpkmWWer9Lw0nOIqoxX
 hKeAtgq8QLP58Uobmjj8roK9B0ksBexK5ExKmelOXbM+cRKpLPuUE1EKrk8Gfo06jg8M9TbbQiH
 JhFDgnqpvQjAtn9TKsW4myrklpeCbHSKt+W0SLtiPP2lSyi8Xsk3RV51ZjwrmTa4uIARJuISjLL
 HSucF4MYaDb5abCW18X9ZzjwO8SQVmjyLDrBmbfNuzMZEu9r
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-iio@vger.kernel.org, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: Reset TIM_TISEL and
	TIM_SMCR to their default value
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
ZSBjYXNlLCBidXQgdGhlIGJvb3Rsb2FkZXIKbWlnaHQgaGF2ZSBtb2RpZmllZCBpdC4gQWxzbyBy
ZXNldCB0aGUgU01DUiByZWdpc3RlciB3aGlsZSBhdCBpdC4KClRoaXMgYmFzZXMgb24gdGhlIGVm
ZmVjdGl2ZWx5IHNhbWUgcGF0Y2ggc3VibWl0dGVkIGJ5IE9saXZpZXIgTW95c2FuIGZvcgpwd20t
c3RtMzIuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPgotLS0KSGVsbG8sCgpub3RlIHRoYXQgdGhlIHBhdGNoIGJ5IE9saXZp
ZXIgTW95c2FuWzFdIGZvciBwd20tc3RtMzIgaXMgZXhwZWN0ZWQgdG8KYXBwZWFyIGluIFRoaWVy
cnkncyB0cmVlIHNvb24uIEl0IGFkZGVkIHRoZSBkZWZpbml0aW9uIG9mIFRJTV9USVNFTCBpbgp0
aGUgc2FtZSB3YXksIHNvIHRoZSB0d28gcGF0Y2hlcyBzaG91bGQgbWVyZ2UganVzdCBmaW5lLiBB
bHRlcm5hdGl2ZWx5CnlvdSBjYW4gY29tbWl0IGl0IHRvIGEgdHJlZSB0aGF0IGFscmVhZHkgaGFz
IHRoZSBwd20gY2hhbmdlIChhbmQgdGhlbgpkcm9wIHRoZSBjaGFuZ2UgdG8gaW5jbHVkZS9saW51
eC9tZmQvc3RtMzItdGltZXJzLmggZnJvbSB0aGlzIG9uZSkuCgpCZXN0IHJlZ2FyZHMKVXdlCgpb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcHdtLzIwMjIxMjEzMTAyNzA3LjEwOTYz
NDUtMS1vbGl2aWVyLm1veXNhbkBmb3NzLnN0LmNvbQoKIGRyaXZlcnMvY291bnRlci9zdG0zMi10
aW1lci1jbnQuYyB8IDQgKysrKwogaW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmggIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYyBiL2RyaXZlcnMvY291bnRlci9zdG0zMi10aW1l
ci1jbnQuYwppbmRleCA5YmYyMGE1ZDZiZGEuLmQwMDFkNzdmMTdhYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5jCisrKyBiL2RyaXZlcnMvY291bnRlci9zdG0z
Mi10aW1lci1jbnQuYwpAQCAtMzQyLDYgKzM0MiwxMCBAQCBzdGF0aWMgaW50IHN0bTMyX3RpbWVy
X2NudF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcGxhdGZvcm1fc2V0
X2RydmRhdGEocGRldiwgcHJpdik7CiAKKwkvKiBSZXNldCBpbnB1dCBzZWxlY3RvciB0byBpdHMg
ZGVmYXVsdCBpbnB1dCBhbmQgZGlzYWJsZSBzbGF2ZSBtb2RlICovCisJcmVnbWFwX3dyaXRlKHBy
aXYtPnJlZ21hcCwgVElNX1RJU0VMLCAweDApOworCXJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAs
IFRJTV9TTUNSLCAweDApOworCiAJLyogUmVnaXN0ZXIgQ291bnRlciBkZXZpY2UgKi8KIAlyZXQg
PSBkZXZtX2NvdW50ZXJfYWRkKGRldiwgY291bnRlcik7CiAJaWYgKHJldCA8IDApCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaCBiL2luY2x1ZGUvbGludXgvbWZk
L3N0bTMyLXRpbWVycy5oCmluZGV4IDVmNWM0M2ZkNjlkZC4uMWI5NDMyNWZlYmIzIDEwMDY0NAot
LS0gYS9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaAorKysgYi9pbmNsdWRlL2xpbnV4
L21mZC9zdG0zMi10aW1lcnMuaApAQCAtMzEsNiArMzEsNyBAQAogI2RlZmluZSBUSU1fQkRUUgkw
eDQ0CS8qIEJyZWFrIGFuZCBEZWFkLVRpbWUgUmVnICovCiAjZGVmaW5lIFRJTV9EQ1IJCTB4NDgJ
LyogRE1BIGNvbnRyb2wgcmVnaXN0ZXIgICAgKi8KICNkZWZpbmUgVElNX0RNQVIJMHg0QwkvKiBE
TUEgcmVnaXN0ZXIgZm9yIHRyYW5zZmVyICovCisjZGVmaW5lIFRJTV9USVNFTAkweDY4CS8qIElu
cHV0IFNlbGVjdGlvbiAgICAgICAgICovCiAKICNkZWZpbmUgVElNX0NSMV9DRU4JQklUKDApCS8q
IENvdW50ZXIgRW5hYmxlCSAgICovCiAjZGVmaW5lIFRJTV9DUjFfRElSCUJJVCg0KSAgLyogQ291
bnRlciBEaXJlY3Rpb24JICAgKi8KCmJhc2UtY29tbWl0OiBmZTE1YzI2ZWUyNmVmYTExNzQxYTdi
NjMyZTlmMjNiMDFhY2E0Y2M2Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
