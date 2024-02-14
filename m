Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FA8855B70
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 08:12:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEC8CC64102;
	Thu, 15 Feb 2024 07:12:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C32FC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf5-0005l0-Rd; Wed, 14 Feb 2024 10:34:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf1-000fFw-Mb; Wed, 14 Feb 2024 10:34:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf1-004Y7d-21;
 Wed, 14 Feb 2024 10:34:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:43 +0100
Message-ID: <13d4d3e90a9ee1bcd04674dfdc16f242615b8320.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=Nqj6FSyujOBi7wIfnBl8B3HIO7dDpveM2SltQZnDbWY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjQfHsVV8onHY9QV0koIOZtXKH407+kVXCpv
 bPYokUawpuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI0AAKCRCPgPtYfRL+
 TvlHB/sHWYVJuTH7ezXErU582vAbPrpDDl5W6dOrHDLFuwaT9xqM7asOC9r7Ovhq4CdW+sHPqoi
 9rMYMaleFh0HISRlCUl4vjEaFuhCXC+B16ZwHsI4yK3rOM+VW5ipjS79p5o05XbKkJG+3f5jAXQ
 STpCrsfrAobJpKJxEjPSWq9WF77fqLKCe4i22O8TFlXQGyCqbt7hSxgTHPGVZrfzE6DXuK2/sDP
 uiBp6BRmmacs7EepJcxnrOMRXEFWX3CWB3ZNcd17IyclfLlN2XVCLN9eqDLt4urnqiqrxpKlqua
 wPl+tUxAwX+OELn9wXXDidzZ2JxCVv/DDZ90XcSHAltkbO+9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Thu, 15 Feb 2024 07:12:00 +0000
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 116/164] pwm: stm32: Change prototype of
	helper that detects npwm to prepare further changes
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

V2hlbiB0aGUgc3RtMzIgcHdtIGRyaXZlciBpcyBjb252ZXJ0ZWQgdG8gcHdtY2hpcF9hbGxvYygp
LCB0aGUgbnVtYmVyIG9mCmF2YWlsYWJsZSBQV00gbGluZXMgbXVzdCBiZSBrbm93biBiZWZvcmUg
dGhlIGRyaXZlciBwcml2YXRlIGRhdGEgY2FuIGJlCmFsbG9jYXRlZC4gU28gcmV3b3JrIHRoZSBo
ZWxwZXIgZnVuY3Rpb24gdGhhdCBkZXRlcm1pbmVzIHRoaXMgbnVtYmVyIHRvCm5vdCB0YWtlIHRo
ZSBkcml2ZXIgcHJpdmF0ZSBkYXRhIHN0cnVjdCBhcyBpbnB1dCBwYXJhbWV0ZXIuCgpTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
PgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcHdtL3B3bS1zdG0zMi5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKaW5kZXggNGQx
MmYzZDg0OWNkLi4xNDQwYjcwNmVlNTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0z
Mi5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCkBAIC02MDYsNyArNjA2LDcgQEAgc3Rh
dGljIHZvaWQgc3RtMzJfcHdtX2RldGVjdF9jb21wbGVtZW50YXJ5KHN0cnVjdCBzdG0zMl9wd20g
KnByaXYpCiAJcHJpdi0+aGF2ZV9jb21wbGVtZW50YXJ5X291dHB1dCA9IChjY2VyICE9IDApOwog
fQogCi1zdGF0aWMgdW5zaWduZWQgaW50IHN0bTMyX3B3bV9kZXRlY3RfY2hhbm5lbHMoc3RydWN0
IHN0bTMyX3B3bSAqcHJpdiwKK3N0YXRpYyB1bnNpZ25lZCBpbnQgc3RtMzJfcHdtX2RldGVjdF9j
aGFubmVscyhzdHJ1Y3QgcmVnbWFwICpyZWdtYXAsCiAJCQkJCSAgICAgIHVuc2lnbmVkIGludCAq
bnVtX2VuYWJsZWQpCiB7CiAJdTMyIGNjZXIsIGNjZXJfYmFja3VwOwpAQCAtNjE1LDEwICs2MTUs
MTAgQEAgc3RhdGljIHVuc2lnbmVkIGludCBzdG0zMl9wd21fZGV0ZWN0X2NoYW5uZWxzKHN0cnVj
dCBzdG0zMl9wd20gKnByaXYsCiAJICogSWYgY2hhbm5lbHMgZW5hYmxlIGJpdHMgZG9uJ3QgZXhp
c3Qgd3JpdGluZyAxIHdpbGwgaGF2ZSBubwogCSAqIGVmZmVjdCBzbyB3ZSBjYW4gZGV0ZWN0IGFu
ZCBjb3VudCB0aGVtLgogCSAqLwotCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX0NDRVIs
ICZjY2VyX2JhY2t1cCk7Ci0JcmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NDRVIs
IFRJTV9DQ0VSX0NDWEUpOwotCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsICZj
Y2VyKTsKLQlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgY2Nlcl9iYWNrdXAp
OworCXJlZ21hcF9yZWFkKHJlZ21hcCwgVElNX0NDRVIsICZjY2VyX2JhY2t1cCk7CisJcmVnbWFw
X3NldF9iaXRzKHJlZ21hcCwgVElNX0NDRVIsIFRJTV9DQ0VSX0NDWEUpOworCXJlZ21hcF9yZWFk
KHJlZ21hcCwgVElNX0NDRVIsICZjY2VyKTsKKwlyZWdtYXBfd3JpdGUocmVnbWFwLCBUSU1fQ0NF
UiwgY2Nlcl9iYWNrdXApOwogCiAJKm51bV9lbmFibGVkID0gaHdlaWdodDMyKGNjZXJfYmFja3Vw
ICYgVElNX0NDRVJfQ0NYRSk7CiAKQEAgLTY1Nyw3ICs2NTcsNyBAQCBzdGF0aWMgaW50IHN0bTMy
X3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJY2hpcC0+ZGV2ID0g
ZGV2OwogCWNoaXAtPm9wcyA9ICZzdG0zMnB3bV9vcHM7Ci0JY2hpcC0+bnB3bSA9IHN0bTMyX3B3
bV9kZXRlY3RfY2hhbm5lbHMocHJpdiwgJm51bV9lbmFibGVkKTsKKwljaGlwLT5ucHdtID0gc3Rt
MzJfcHdtX2RldGVjdF9jaGFubmVscyhkZGF0YS0+cmVnbWFwLCAmbnVtX2VuYWJsZWQpOwogCiAJ
LyogSW5pdGlhbGl6ZSBjbG9jayByZWZjb3VudCB0byBudW1iZXIgb2YgZW5hYmxlZCBQV00gY2hh
bm5lbHMuICovCiAJZm9yIChpID0gMDsgaSA8IG51bV9lbmFibGVkOyBpKyspCi0tIAoyLjQzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
