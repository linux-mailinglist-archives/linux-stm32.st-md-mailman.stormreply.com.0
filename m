Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 560A56FB2BB
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 16:27:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CCC5C6A615;
	Mon,  8 May 2023 14:27:00 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D2A1C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 14:26:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p9-0008No-5N; Mon, 08 May 2023 16:26:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p3-0021Gm-H4; Mon, 08 May 2023 16:26:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p2-002SkA-Lc; Mon, 08 May 2023 16:26:40 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Date: Mon,  8 May 2023 16:26:28 +0200
Message-Id: <20230508142637.1449363-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=O/T3A55gFjLt6nMDdYJGXenQUgJ94uu+0+iASCSIKFU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWQaPN4ogjHSNrh4iFuglnRz71/WGI8+9j922S
 Zm+D2yFP/OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFkGjwAKCRCPgPtYfRL+
 Tvv4B/9u8vgceJcd7AaMpCPxNtBz46s1Tfbfy91bUWMSLZiQLj23L2tAX4Z0x4EY09bPsa4wNXJ
 C5rRx7Qj12rNibOqd5jZpGiEUNrMPriZcb4A16Jl783KSOCS5+Rqudb5zWkbobNd0fEvjg/QAJc
 AxJ70z7Z7uH2sfmWT8EEPmaaNIWrvKZDBhKR1T7YDQRJ1kCnjiXetQrOrev/0eSPO/QLs/PyM/B
 v0kaqmjFAUcyhJIgFptYFl3VGV8zIUHmy7sswu62MagNRS6KrOrB0+4N73axm8KsPZkyAy4dfK6
 UQdXaLRjPDlakSaw5S8YTrOTAjCyGhT3Q4OF+DA60leULRud
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 02/11] net: stmmac:
	dwmac-visconti: Make visconti_eth_clock_remove() return void
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
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXZpc2NvbnRpLmMgfCAxMSArKystLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5j
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdmlzY29udGkuYwpp
bmRleCBkNDNkYTcxZWIxZTEuLjU2MjA5YWY2MjQzYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdmlzY29udGkuYworKysgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5jCkBAIC0xOTgsNyArMTk4
LDcgQEAgc3RhdGljIGludCB2aXNjb250aV9ldGhfY2xvY2tfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCB2aXNjb250aV9ldGhf
Y2xvY2tfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCB2
aXNjb250aV9ldGhfY2xvY2tfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7
CiAJc3RydWN0IHZpc2NvbnRpX2V0aCAqZHdtYWMgPSBnZXRfc3RtbWFjX2JzcF9wcml2KCZwZGV2
LT5kZXYpOwogCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7CkBAIC0yMDYsOCArMjA2LDYgQEAgc3RhdGljIGludCB2aXNjb250aV9ldGhfY2xvY2tf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAljbGtfZGlzYWJsZV91bnBy
ZXBhcmUoZHdtYWMtPnBoeV9yZWZfY2xrKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+
cGxhdC0+c3RtbWFjX2Nsayk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCB2aXNjb250
aV9ldGhfZHdtYWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKQEAgLTI2Mywx
NyArMjYxLDE0IEBAIHN0YXRpYyBpbnQgdmlzY29udGlfZXRoX2R3bWFjX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gcGxh
dGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0
ZGV2X3ByaXYobmRldik7Ci0JaW50IGVycjsKIAogCXN0bW1hY19wbHRmcl9yZW1vdmUocGRldik7
CiAKLQllcnIgPSB2aXNjb250aV9ldGhfY2xvY2tfcmVtb3ZlKHBkZXYpOwotCWlmIChlcnIgPCAw
KQotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVtb3ZlIGNsb2NrOiAlZFxuIiwg
ZXJyKTsKKwl2aXNjb250aV9ldGhfY2xvY2tfcmVtb3ZlKHBkZXYpOwogCiAJc3RtbWFjX3JlbW92
ZV9jb25maWdfZHQocGRldiwgcHJpdi0+cGxhdCk7CiAKLQlyZXR1cm4gZXJyOworCXJldHVybiAw
OwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB2aXNjb250aV9ldGhfZHdt
YWNfbWF0Y2hbXSA9IHsKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
