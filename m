Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A7769D3B
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 18:55:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B7D9C6B474;
	Mon, 31 Jul 2023 16:55:14 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37FF7C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 16:55:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAk-0006a1-1g; Mon, 31 Jul 2023 18:55:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAf-000AQV-QT; Mon, 31 Jul 2023 18:55:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAe-009NYg-Lt; Mon, 31 Jul 2023 18:55:00 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Bourgoin <thomas.bourgoin@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Date: Mon, 31 Jul 2023 18:54:54 +0200
Message-Id: <20230731165456.799784-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
References: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ksfJOhEF+wM1eM4wshdSHQJwnX6sLZ+kUE6uGM0N1Yk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkx+da9X/e6ADAGAs7Lvr+pJrc/jzGV032o2THH
 hCN3JvyOF6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMfnWgAKCRCPgPtYfRL+
 TmpXB/4hUVah+ioCKHXDP1EoZ2NEWzcjE3cHH7ibwhpsHwDJgFg8n8sbisVgv9fGL9Ll3/+04FB
 eVFZDYJKAdknPd3/d8I7bLUs9pLIc4samHgqUJV5e/XL7LTm/BScp/b2p9iQoIBUFeo+WQj6Epv
 MgEki4Y55dUQS1/8Z0eSzuIY7tdEgj6y1McOR/wCRR97eaMDrBuWE5gx8xf/7QAf/vWo5CfZa01
 S4A61Bpylmj1Z6l6OJKR/nS6WaiTZUt+4BdFrv9hIzGn8GFJgHMBIe7kr0OkTq7hJ/o+Lf/dZaO
 2UIeK2+OQSZ661FEqWLnv4T79WK4swgTQgExhxlaJbWOt7eW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] crypto: stm32/hash - Properly handle
	pm_runtime_get failing
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

SWYgcG1fcnVudGltZV9nZXQoKSAoZGlzZ3Vpc2VkIGFzIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9n
ZXQoKSkgZmFpbHMsIHRoaXMKbWVhbnMgdGhlIGNsayB3YXNuJ3QgcHJlcGFyZWQgYW5kIGVuYWJs
ZWQuIFJldHVybmluZyBlYXJseSBpbiB0aGlzIGNhc2UKaG93ZXZlciBpcyB3cm9uZyBhcyB0aGVu
IHRoZSBmb2xsb3dpbmcgcmVzb3VyY2UgZnJlZXMgYXJlIHNraXBwZWQgYW5kIHRoaXMKaXMgbmV2
ZXIgY2F0Y2hlZCB1cC4gU28gZG8gYWxsIHRoZSBjbGVhbnVwcyBidXQgY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKCkuCgpBbHNvIGRvbid0IGVtaXQgYSB3YXJuaW5nLCBhcyBzdG0zMl9oYXNoX3J1bnRp
bWVfcmVzdW1lKCkgYWxyZWFkeSBlbWl0dGVkCm9uZS4KCk5vdGUgdGhhdCB0aGUgcmV0dXJuIHZh
bHVlIG9mIHN0bTMyX2hhc2hfcmVtb3ZlKCkgaXMgbW9zdGx5IGlnbm9yZWQgYnkKdGhlIGRldmlj
ZSBjb3JlLiBUaGUgb25seSBlZmZlY3Qgb2YgcmV0dXJuaW5nIHplcm8gaW5zdGVhZCBvZiBhbiBl
cnJvcgp2YWx1ZSBpcyB0byBzdXBwcmVzcyBhbm90aGVyIHdhcm5pbmcgaW4gcGxhdGZvcm1fcmVt
b3ZlKCkuIFNvIHJldHVybiAwCmV2ZW4gaWYgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGZh
aWxlZC4KCkZpeGVzOiA4YjRkNTY2ZGU2YTUgKCJjcnlwdG86IHN0bTMyL2hhc2ggLSBBZGQgcG93
ZXIgbWFuYWdlbWVudCBzdXBwb3J0IikKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2NyeXB0by9zdG0z
Mi9zdG0zMi1oYXNoLmMgfCA3ICsrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3Rt
MzItaGFzaC5jIGIvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItaGFzaC5jCmluZGV4IDg4YTE4
NmMzZGQ3OC4uNzVkMjgxZWRhZTJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NyeXB0by9zdG0zMi9z
dG0zMi1oYXNoLmMKKysrIGIvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItaGFzaC5jCkBAIC0y
MTIxLDkgKzIxMjEsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2hhc2hfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKCFoZGV2KQogCQlyZXR1cm4gLUVOT0RFVjsKIAotCXJl
dCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoaGRldi0+ZGV2KTsKLQlpZiAocmV0IDwgMCkK
LQkJcmV0dXJuIHJldDsKKwlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKGhkZXYtPmRldik7CiAK
IAlzdG0zMl9oYXNoX3VucmVnaXN0ZXJfYWxncyhoZGV2KTsKIApAQCAtMjEzOSw3ICsyMTM3LDgg
QEAgc3RhdGljIGludCBzdG0zMl9oYXNoX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCXBtX3J1bnRpbWVfZGlzYWJsZShoZGV2LT5kZXYpOwogCXBtX3J1bnRpbWVfcHV0X25v
aWRsZShoZGV2LT5kZXYpOwogCi0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhkZXYtPmNsayk7CisJ
aWYgKHJldCA+PSAwKQorCQljbGtfZGlzYWJsZV91bnByZXBhcmUoaGRldi0+Y2xrKTsKIAogCXJl
dHVybiAwOwogfQotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
