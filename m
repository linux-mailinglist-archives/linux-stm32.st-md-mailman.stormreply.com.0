Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 532256D385B
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 16:31:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 142D8C6A60F;
	Sun,  2 Apr 2023 14:31:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 625F1C6A5FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 14:31:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjH-0002tc-6X; Sun, 02 Apr 2023 16:30:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjD-008TQU-LX; Sun, 02 Apr 2023 16:30:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjD-009zBR-0v; Sun, 02 Apr 2023 16:30:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun,  2 Apr 2023 16:30:17 +0200
Message-Id: <20230402143025.2524443-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=GTFyaOdgg0Lm2AhOB1Nk+U46u3Y+WjIwpoEkwcVw7V8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKZFx7Ov93thD7A8g5K70nz9jOqUwnbwwbngqG
 SDZN8L+6LqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCmRcQAKCRCPgPtYfRL+
 Tu0zCACBVUGAuTiiPgtRM/MpzT17fCMyGqiEnOSvFSNbUSz1eQ9p3Ge8p2M4tYRqxwPNg3jHxb0
 7z5Uh/yh+fLfaQYCqSO1z0B2h+LuZXQ4PpSbvWaGp+j/CUkXQA+IvYPVQsYKVmlj18UxXgB8Fwy
 tDvI3VOkwggEvT4eNBzGxaf299F/EQ6MSyV3eKj6wt/YXy3r9QtmdYaW4uMkMMcWgN4v9svwAHL
 l/h1UDAasZHOH0rETJRrsFUI+g0xb0duIqZk3F95FmcJiHbqUJzEuYSB092KREg8m3+8qBgUM/t
 iW1SgL3fZZd20cmniptUSBfrMLozyJkbwGvHyqPvdGq6phqk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net-next 03/11] net: stmmac:
	dwmac-qcom-ethqos: Drop an if with an always false condition
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

VGhlIHJlbW92ZSBjYWxsYmFjayBpcyBvbmx5IGV2ZXIgY2FsbGVkIGFmdGVyIC5wcm9iZSgpIHJl
dHVybmVkCnN1Y2Nlc3NmdWxseS4gQWZ0ZXIgdGhhdCBnZXRfc3RtbWFjX2JzcF9wcml2KCkgYWx3
YXlzIHJldHVybiBub24tTlVMTC4KClNpZGUgbm90ZTogVGhlIGVhcmx5IGV4aXQgd291bGQgYWxz
byBiZSBhIGJ1ZyBiZWNhdXNlIHRoZSByZXR1cm4gdmFsdWUKb2YgcWNvbV9ldGhxb3NfcmVtb3Zl
KCkgaXMgaWdub3JlZCBieSB0aGUgZGV2aWNlIGNvcmUgYW5kIHRoZSBkZXZpY2UgaXMKdW5ib3Vu
ZCB1bmNvbmRpdGlvbmFsbHkuIFNvIGV4aXRpbmcgZWFybHkgcmVzdWx0ZWQgaW4gYSBkYW5nZXJv
dXMKcmVzb3VyY2UgbGVhayBhcyBhbGwgZGV2bSBhbGxvY2F0ZWQgcmVzb3VyY2VzIChzb21lIG1l
bW9yeSBhbmQgdGhlCnJlZ2lzdGVyIG1hcHBpbmdzKSBhcmUgZnJlZWQgYnV0IHRoZSBuZXR3b3Jr
IGRldmljZSBzdGF5cyBhcm91bmQuICBVc2luZwp0aGUgbmV0d29yayBkZXZpY2UgYWZ0ZXJ3YXJk
cyBwcm9iYWJseSBvb3BzZXMuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMgfCA2ICstLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCmluZGV4IGY5
ZmFhNmY1NTkzOS4uZmJhMWZjODhkMmRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCisrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKQEAgLTU4MCwxMSArNTgw
LDcgQEAgc3RhdGljIGludCBxY29tX2V0aHFvc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCiBzdGF0aWMgaW50IHFjb21fZXRocW9zX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogewotCXN0cnVjdCBxY29tX2V0aHFvcyAqZXRocW9zOwotCi0JZXRocW9z
ID0gZ2V0X3N0bW1hY19ic3BfcHJpdigmcGRldi0+ZGV2KTsKLQlpZiAoIWV0aHFvcykKLQkJcmV0
dXJuIC1FTk9ERVY7CisJc3RydWN0IHFjb21fZXRocW9zICpldGhxb3MgPSBnZXRfc3RtbWFjX2Jz
cF9wcml2KCZwZGV2LT5kZXYpOwogCiAJc3RtbWFjX3BsdGZyX3JlbW92ZShwZGV2KTsKIAlldGhx
b3NfY2xrc19jb25maWcoZXRocW9zLCBmYWxzZSk7Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
