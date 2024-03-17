Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BDD87E083
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Mar 2024 22:52:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C923EC6DD69;
	Sun, 17 Mar 2024 21:52:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90108C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 21:52:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rlyQk-0002km-4u; Sun, 17 Mar 2024 22:52:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rlyQi-006xGn-S7; Sun, 17 Mar 2024 22:52:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rlyQi-007fnv-2W;
 Sun, 17 Mar 2024 22:52:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 17 Mar 2024 22:52:13 +0100
Message-ID: <cover.1710711976.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=PBFTj54rIAkX9wEsGaAGKdtJlRaJeRIbI8HQTYWi8t4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl92YOlpfRRDDkAHEMVgHkRqSly0zgbSvEy52Ra
 Gj8Ae9rXX2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZfdmDgAKCRCPgPtYfRL+
 TlKOCACpt5vgcFrmRNkITC5B2J2dMxu54054EpwrMv4U3GAtnNrRXHyk95m/+hxj9It7aE9FNym
 nqChmJe5Y8S5wHKccH3fMuKmaa0LjcTzQ6UhlSHqWQVz6fZ4rk1GPca4q4HX529PdKmDh0mL7De
 /b2Ddk5x5+jhx9OALGvbZQNSnhyW7sTLEScuDWN1UTcq+++zM8+k6N1FvleCcxtZTHnn+zpS/TM
 FNGAuEHEk+4Gr2wuqH4wVGe3YmZRyOvLOmVPA/sHCYPHSuUJKWg7POVeRAifWegwfbzv2sfjUnX
 S41A6SfJhqSGVl+AiUpA6cO4CYbUVYcoV10eBHstSjqGUWm3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] pwm: stm32: Some improvements
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

SGVsbG8sCgp3aGlsZSB3b3JraW5nIG9uIHRoZSBjaGFyYWN0ZXIgZGV2aWNlIHN1cHBvcnQgb24g
YW4gc3RtMzJtcDE1NyBJCmlkZW50aWZpZWQgYSBmZXcgYnVncyAvIHNob3J0Y29taW5ncyBpbiB0
aGUgc3RtMzIgcHdtIGRyaXZlci4gVGhlc2UgYXJlCmZpeGVkIGhlcmUuCgpJIGJhc2VkIHRoaXMg
c2VyaWVzIG9uIHRvcCBvZiBwd20vZm9yLW5leHQKKyBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1wd20vMjAyNDAzMTUxNDU0NDMuOTgyODA3LTItdS5rbGVpbmUta29lbmlnQHBlbmd1dHJv
bml4LmRlCisgYSBjaGVycnktcGljayBvZiBjb21taXQgYjBjZGU2MmU0YzU0ICgiY2xrOiBBZGQg
YSBkZXZtIHZhcmlhbnQgb2YgY2xrX3JhdGVfZXhjbHVzaXZlX2dldCgpIikKCkJlc3QgcmVnYXJk
cwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICgzKToKICBwd206IHN0bTMyOiBJbXByb3ZlIHByZWNp
c2lvbiBvZiBjYWxjdWxhdGlvbiBpbiAuYXBwbHkoKQogIHB3bTogc3RtMzI6IEZpeCBmb3Igc2V0
dGluZ3MgdXNpbmcgcGVyaW9kID4gVUlOVDMyX01BWAogIHB3bTogc3RtMzI6IENhbGN1bGF0ZSBw
cmVzY2FsZXIgd2l0aCBhIGRpdmlzaW9uIGluc3RlYWQgb2YgYSBsb29wCgogZHJpdmVycy9wd20v
cHdtLXN0bTMyLmMgfCA1MSArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKYmFz
ZS1jb21taXQ6IGRkNmM2ZDU3YWI2MWQ0OTZmNmZmN2Q2Y2EzODYxMTA2MmFmMTQyYTEKcHJlcmVx
dWlzaXRlLXBhdGNoLWlkOiA5MWUzMzliYTZmNjg3MGUyMDhmNWQ3YmVlZjRjZmQ1OWU4MWU3Yzk1
CnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogNzMzZTcwNjFjMmQ5YjViYTIyMDJmZWQ0ZWNlZTRiMDcw
ZDQyMzM2OAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
