Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC366FB2B9
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 16:27:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0203BC6A611;
	Mon,  8 May 2023 14:27:00 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D7D4C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 14:26:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p7-0008Np-FZ; Mon, 08 May 2023 16:26:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p3-0021Gq-NC; Mon, 08 May 2023 16:26:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p2-002SkD-TI; Mon, 08 May 2023 16:26:40 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon,  8 May 2023 16:26:29 +0200
Message-Id: <20230508142637.1449363-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=M3Zeb985dqvOyNIprDkcPrQUCdgAjxyUk1k33m1aTkA=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpRItgnxf63uTA9Rs74UvTRKRVB1f4yp/3vzh8rN5Ymcr
 1ao/TPvZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAir7dyMHQcLLnpvDT3vL6v
 zTuzP79PBallXOuQn7AjVsc7+STnl2Wtrot2c4qz3FZU6IrreRRWMHvd+Yb9IWz9KnsVv6/MvbP
 weALbv2d5YkH82Zc5hIX/q3wuF1z2Yksfy557TXv2PGczqMnYM0MiMKJBgOfD89nfLkadny4ecb
 vZL+jozjrvhq6JgkKaj/bw8N0ziO1MjUsq5Cwrezy9P+ybWLHLrrW3HstsiWXOKU92z3vZz6qxz
 He1Ouv9fwt8r+9aYRQib9jY42aUc/TPW08W/5Ur9D0msdYa1q/WjdVZevj6pbMeFzqdpG7tsb6i
 lnPjNafMr1W3Tu2uY5vY4z/5xsWsfF77M+fq00LUKvUTAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 kernel@pengutronix.de, Simon Horman <simon.horman@corigine.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 03/11] net: stmmac:
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
cyBwcm9iYWJseSBvb3BzZXMuCgpSZXZpZXdlZC1ieTogU2ltb24gSG9ybWFuIDxzaW1vbi5ob3Jt
YW5AY29yaWdpbmUuY29tPgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMgfCA2ICstLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCmluZGV4IDQ5NGMy
MjI0MzI1OS4uYmYxN2M2YzhmMmViIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKQEAgLTY2NywxMSArNjY3LDcg
QEAgc3RhdGljIGludCBxY29tX2V0aHFvc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCiBzdGF0aWMgaW50IHFjb21fZXRocW9zX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogewotCXN0cnVjdCBxY29tX2V0aHFvcyAqZXRocW9zOwotCi0JZXRocW9zID0g
Z2V0X3N0bW1hY19ic3BfcHJpdigmcGRldi0+ZGV2KTsKLQlpZiAoIWV0aHFvcykKLQkJcmV0dXJu
IC1FTk9ERVY7CisJc3RydWN0IHFjb21fZXRocW9zICpldGhxb3MgPSBnZXRfc3RtbWFjX2JzcF9w
cml2KCZwZGV2LT5kZXYpOwogCiAJc3RtbWFjX3BsdGZyX3JlbW92ZShwZGV2KTsKIAlldGhxb3Nf
Y2xrc19jb25maWcoZXRocW9zLCBmYWxzZSk7Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
