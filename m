Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 570BD6D385C
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 16:31:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21E9CC6A612;
	Sun,  2 Apr 2023 14:31:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76F3BC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 14:31:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjJ-0002tZ-SE; Sun, 02 Apr 2023 16:30:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjD-008TQR-Gw; Sun, 02 Apr 2023 16:30:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjC-009zBO-Py; Sun, 02 Apr 2023 16:30:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Date: Sun,  2 Apr 2023 16:30:16 +0200
Message-Id: <20230402143025.2524443-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=AWlXAjZ8Ru7rdnyMS6Bp0oEoCFeAMPQ9Sd9tZwp6bt4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKZFwESTTkfx0VtVJee/4tr8hCMjm/sabGCIxL
 BeZYKE/bVaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCmRcAAKCRCPgPtYfRL+
 Tg8SB/0Uu9Y6uwYBc/ar46+3Oac+t9HCEarKVeuahv+ZzJQwVqlf3qlUMDIP7OQz5tU+A2vk2/o
 nQD+aTU6trAflXX9OkGP/yapNltErHD14G0gnFZzvfbyzHCeqXnWKC/sHQpms+nXNIIuglFfHzG
 R7IrqeQbi3NCYUMZo/2pCd9vXaOfaIJdd2G5Jt/D1CqrHDloT7UZ4TdVY6J1/GtDbK6dLJ+3LbR
 eJKVU3ihH+TNGZEri5rHI9OVBARX0AbgnLgKiDwlXjY6TlWXwcW5q5uxsv8XNDMin5fKH22i7hf
 M6UIl4u+Da+pddHimVHNeGZAV53p2H8BkPihvYcRw3RdGKDV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 02/11] net: stmmac: dwmac-visconti:
	Make visconti_eth_clock_remove() return void
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

VGhlIGZ1bmN0aW9uIHJldHVybnMgemVybyB1bmNvbmRpdGlvbmFsbHkuIENoYW5nZSBpdCB0byBy
ZXR1cm4gdm9pZAppbnN0ZWFkIHdoaWNoIHNpbXBsaWZpZXMgb25lIGNhbGxlciBhcyBlcnJvciBo
YW5kaW5nIGJlY29tZXMKdW5uZWNlc3NhcnkuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXZpc2NvbnRpLmMgfCA4ICsrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXZpc2NvbnRpLmMgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5jCmluZGV4
IGQ0M2RhNzFlYjFlMS4uNzUzMWZjZDRmZmUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5jCisrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXZpc2NvbnRpLmMKQEAgLTE5OCw3ICsxOTgsNyBA
QCBzdGF0aWMgaW50IHZpc2NvbnRpX2V0aF9jbG9ja19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LAogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHZpc2NvbnRpX2V0aF9jbG9j
a19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHZpc2Nv
bnRpX2V0aF9jbG9ja19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlz
dHJ1Y3QgdmlzY29udGlfZXRoICpkd21hYyA9IGdldF9zdG1tYWNfYnNwX3ByaXYoJnBkZXYtPmRl
dik7CiAJc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsKQEAgLTIwNiw4ICsyMDYsNiBAQCBzdGF0aWMgaW50IHZpc2NvbnRpX2V0aF9jbG9ja19yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWNsa19kaXNhYmxlX3VucHJlcGFy
ZShkd21hYy0+cGh5X3JlZl9jbGspOwogCWNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5wbGF0
LT5zdG1tYWNfY2xrKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IHZpc2NvbnRpX2V0
aF9kd21hY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQpAQCAtMjY3LDkgKzI2
NSw3IEBAIHN0YXRpYyBpbnQgdmlzY29udGlfZXRoX2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCiAJc3RtbWFjX3BsdGZyX3JlbW92ZShwZGV2KTsKIAotCWVyciA9
IHZpc2NvbnRpX2V0aF9jbG9ja19yZW1vdmUocGRldik7Ci0JaWYgKGVyciA8IDApCi0JCWRldl9l
cnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byByZW1vdmUgY2xvY2s6ICVkXG4iLCBlcnIpOworCXZp
c2NvbnRpX2V0aF9jbG9ja19yZW1vdmUocGRldik7CiAKIAlzdG1tYWNfcmVtb3ZlX2NvbmZpZ19k
dChwZGV2LCBwcml2LT5wbGF0KTsKIAotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
