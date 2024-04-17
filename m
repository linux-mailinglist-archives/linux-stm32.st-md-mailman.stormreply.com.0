Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7EC8A7F0E
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 11:04:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB3CDC6B47E;
	Wed, 17 Apr 2024 09:04:30 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 991C7C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:04:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx1DD-0004on-PA; Wed, 17 Apr 2024 11:04:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx1DC-00ClGK-4Z; Wed, 17 Apr 2024 11:04:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rx1DC-002hM4-0A;
 Wed, 17 Apr 2024 11:04:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 17 Apr 2024 11:03:28 +0200
Message-ID: <a784f80d3414f7db723b2ec66efc56e1ad666cbf.1713344161.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1713344161.git.u.kleine-koenig@pengutronix.de>
References: <cover.1713344161.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=CFmHE1BzGVHwhk0poqXyOfp0UAIGCsaPeLG3rEUuFW0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmH5BijoBEeBEBW6sX9z1WyExTH4i3AnV9yQT9Z
 lBMrOKfwXSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZh+QYgAKCRCPgPtYfRL+
 Tql6B/9J22rBmAfTCxSYqK0kI0Av488jT1v/xAP7xF0yXbywi5OUJMKeUCyjk84D/DSBYn4Is+8
 WcNweLId14pD66JBCLv9mogAIkXZdMP+M9VFoozWpa5wvbIwlCR+xtgkTrIhaPIV8e1X4SjxBwy
 vw7ra9YZ6zXmrnmSPiigEvbSOYFVq7JAYwva4BVC28eqHaDvV+uUbM8XYGcquxV64bgG+RUwoJF
 5TbiWjJhY8aNnrBNtJigGB6QeZwtC/QK5q9D//p27xcE5wC6BXul465HCMg1ljMl6PJteONYP7S
 KT7DALY0S/Vq+nz+vB1s02g0Ph/a7mZaEWgGQandOBYwPi5S
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Peter Hurley <peter@hurleysoftware.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-serial@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [Linux-stm32] [PATCH 2/2] serial: stm32: Reset .throttled state in
	.startup()
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

V2hlbiBhbiBVQVJUIGlzIG9wZW5lZCB0aGF0IHN0aWxsIGhhcyAudGhyb3R0bGVkIHNldCBmcm9t
IGEgcHJldmlvdXMKb3BlbiwgdGhlIFJYIGludGVycnVwdCBpcyBlbmFibGVkIGJ1dCB0aGUgaXJx
IGhhbmRsZXIgZG9lc24ndCBjb25zaWRlcgppdC4gVGhpcyBlYXNpbHkgcmVzdWx0cyBpbiBhIHN0
dWNrIGlycSB3aXRoIHRoZSBlZmZlY3QgdG8gb2NjdXB5IHRoZSBDUFUKaW4gYSB0aWdodCBsb29w
LgoKU28gcmVzZXQgdGhlIHRocm90dGxlIHN0YXRlIGluIC5zdGFydHVwKCkgdG8gZW5zdXJlIHRo
YXQgUlggaXJxcyBhcmUKaGFuZGxlZC4KCkZpeGVzOiBkMWVjOGEyZWFiZTkgKCJzZXJpYWw6IHN0
bTMyOiB1cGRhdGUgdGhyb3R0bGUgYW5kIHVudGhyb3R0bGUgb3BzIGZvciBkbWEgbW9kZSIpCkNj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmln
IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy90dHkvc2VyaWFs
L3N0bTMyLXVzYXJ0LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jIGIvZHJpdmVycy90dHkv
c2VyaWFsL3N0bTMyLXVzYXJ0LmMKaW5kZXggMmJlYTFkN2M5ODU4Li5lMWU3YmMwNGM1NzkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCisrKyBiL2RyaXZlcnMv
dHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCkBAIC0xMDgwLDYgKzEwODAsNyBAQCBzdGF0aWMgaW50
IHN0bTMyX3VzYXJ0X3N0YXJ0dXAoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCkKIAkJdmFsIHw9IFVT
QVJUX0NSMl9TV0FQOwogCQl3cml0ZWxfcmVsYXhlZCh2YWwsIHBvcnQtPm1lbWJhc2UgKyBvZnMt
PmNyMik7CiAJfQorCXN0bTMyX3BvcnQtPnRocm90dGxlZCA9IGZhbHNlOwogCiAJLyogUlggRklG
TyBGbHVzaCAqLwogCWlmIChvZnMtPnJxciAhPSBVTkRFRl9SRUcpCi0tIAoyLjQzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
