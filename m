Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B46A87E084
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Mar 2024 22:52:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC9C4C6B46B;
	Sun, 17 Mar 2024 21:52:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95B6FC6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 21:52:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rlyQk-0002kn-4u; Sun, 17 Mar 2024 22:52:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rlyQj-006xGq-2A; Sun, 17 Mar 2024 22:52:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rlyQi-007fnz-3A;
 Sun, 17 Mar 2024 22:52:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 17 Mar 2024 22:52:14 +0100
Message-ID: <7628ecd8a7538aa5a7397f0fc4199a077168e8a6.1710711976.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710711976.git.u.kleine-koenig@pengutronix.de>
References: <cover.1710711976.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=rEQVgXxWi/ELpI3VBppPiQpewrscwVr8g8zdSA8buoQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl92YScoxX1h3+nr521TOsRmlHYsPPfgDdPHW8Q
 pC6dqgrkMSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZfdmEgAKCRCPgPtYfRL+
 TiP+CACXUE7O4GXr8UzfgtBC/6Wj+KUUjMdf1rrenLU1/M/tMQE9nNEhyU9e9Pn1aFfYPGIodc6
 E9Xy0xx7eXfbvQ7bJ+R3sreGbcCWPe+4ROfwti7Xo4iV2o7gkazSz6uboiLSWmuXKZNhR6YbRTJ
 1eq25Ap59RyJlPchI6cZ2kUcFryfuTVn2CnYra4lRrOf3qPulR7R6ls2ZUqLxHihICreugwz9aN
 idiAbN6XqvN6fZxf4YtwIGwdNich/7kuuPi8TVyKX7V0qNba0Av5185vvcDzE2/UXFvWoSw3Ovh
 84BYlrhbjAu2uIAZn8Isuwu+zoYN8BIeP9iJ3STNeMRdIGHl
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] pwm: stm32: Improve precision of
	calculation in .apply()
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

V2hpbGUgbWF0aGVtYXRpY2FsbHkgaXQncyBvayB0byBjYWxjdWxhdGUgdGhlIG51bWJlciBvZiBj
eWxlcyBmb3IgdGhlCmR1dHkgY3ljbGUgYXM6CgoJZHV0eV9jeWNsZXMgPSBwZXJpb2RfY3ljbGVz
ICogZHV0eV9ucyAvIHBlcmlvZF9ucwoKdGhpcyBkb2Vzbid0IGFsd2F5cyBnaXZlIHRoZSByaWdo
dCByZXN1bHQgd2hlbiBkb2luZyBpbnRlZ2VyIG1hdGguIFRoaXMKaXMgYmVzdCBkZW1vbnN0cmF0
ZWQgdXNpbmcgYW4gZXhhbXBsZTogV2l0aCB0aGUgaW5wdXQgY2xvY2sgcnVubmluZyBhdAoyMDg4
Nzc5MzAgSHogYSByZXF1ZXN0IGZvciBkdXR5X2N5Y2xlID0gMzgzIG5zIGFuZCBwZXJpb2QgPSA0
OTk5NiBucwpyZXN1bHRzIGluCgoJcGVyaW9kX2N5Y2xlcyA9IGNsa3JhdGUgKiBwZXJpb2RfbnMg
LyBOU0VDX1BFUl9TRUMgPSAxMDQ0My4wNjA5ODgyOAoKTm93IGNhbGN1bGF0aW5nIGR1dHlfY3lj
bGVzIHdpdGggdGhlIGFib3ZlIGZvcm11bGEgZ2l2ZXM6CgoJZHV0eV9jeWNsZXMgPSAxMDQ0My4w
NjA5ODgyOCAqIDM4MyAvIDQ5OTk2ID0gODAuMDAwMjQ3MTkKCkhvd2V2ZXIgd2l0aCBwZXJpb2Rf
Y3ljbGUgdHJ1bmNhdGVkIHRvIGFuIGludGVnZXIgcmVzdWx0cyBpbjoKCglkdXR5X2N5Y2xlcyA9
IDEwNDQzICogMzgzIC8gNDk5OTYgPSA3OS45OTk3Nzk5ODIzOTg1OQoKU28gd2hpbGUgYSB2YWx1
ZSBvZiAoYSBsaXR0bGUgbW9yZSB0aGFuKSA4MCB3b3VsZCBiZSB0aGUgcmlnaHQgcmVzdWx0LApv
bmx5IDc5IGlzIHVzZWQgaGVyZS4gVGhlIHByb2JsZW0gaGVyZSBpcyB0aGF0IDE0NDQzIGlzIGEg
cm91bmRlZCByZXN1bHQKdGhhdCBzaG91bGQgYmV0dGVyIG5vdCBiZSB1c2VkIHRvIGRvIGZ1cnRo
ZXIgbWF0aC4gU28gdG8gZml4IHRoYXQgdXNlCnRoZSBleGFjdCBmb3JtdWxhciBzaW1pbGFyIHRv
IGhvdyBwZXJpb2RfY3ljbGVzIGlzIGNhbGN1bGF0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMv
cHdtL3B3bS1zdG0zMi5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBi
L2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IGZmZTU3MmI3NjE3NC4uZmI3MTQ5MzZmZjhm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYworKysgYi9kcml2ZXJzL3B3bS9w
d20tc3RtMzIuYwpAQCAtMzUxLDggKzM1MSw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2NvbmZp
ZyhzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCB1bnNpZ25lZCBpbnQgY2gsCiAJcmVnbWFwX3NldF9i
aXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9BUlBFKTsKIAogCS8qIENhbGN1bGF0
ZSB0aGUgZHV0eSBjeWNsZXMgKi8KLQlkdHkgPSBwcmQgKiBkdXR5X25zOwotCWRvX2RpdihkdHks
IHBlcmlvZF9ucyk7CisJZHR5ID0gKHVuc2lnbmVkIGxvbmcgbG9uZyljbGtfZ2V0X3JhdGUocHJp
di0+Y2xrKSAqIGR1dHlfbnM7CisJZG9fZGl2KGR0eSwgcHJlc2NhbGVyICsgMSk7CisJZG9fZGl2
KGR0eSwgTlNFQ19QRVJfU0VDKTsKIAogCXJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIFRJTV9D
Q1IxICsgNCAqIGNoLCBkdHkpOwogCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
