Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF976FB2B4
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 16:26:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85E76C6A602;
	Mon,  8 May 2023 14:26:55 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B42B4C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 14:26:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p7-0008Nx-Ks; Mon, 08 May 2023 16:26:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p5-0021HK-CM; Mon, 08 May 2023 16:26:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p4-002Ski-KV; Mon, 08 May 2023 16:26:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Date: Mon,  8 May 2023 16:26:37 +0200
Message-Id: <20230508142637.1449363-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=QTDJa+yMsqSxmxjnUw6htk1Y9hvDpA8YLqxpg6zNbB4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWQaZrheDy7RraexOmpuDLaIlfkFWSlzHBZC9a
 q5EuIDrSheJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFkGmQAKCRCPgPtYfRL+
 TkSWCACLenrrxyw0lMT//GsV6+nJravQC8xIl/opXPY/vHQhzwG6SYAo1EQ01quWaG2kfVSslF4
 TitbSlO/wAkhjjjItmJ5eicdUXf1u0p/9tPV5gTffXeZKPNhFLWv+D4E1AE5zsDm3xb+FpS+rOz
 M78fvAl3vppozkjCQTm8DTMNHkOvyn42uEqMF1JAjM2IUyEK5kIkQdnDSN5qcmUSigroUN9so1J
 Rsohf7kFTcwYBh7fvbR98iy8q/FNesDsDG0YsZwuqSuCVtAP4zqc3RUDWnD8ymUEI4C9CayaBNF
 mPkW4voElHfDHUyXWpiYMXqqZqFoMR28Ix7emrLMdfahepS7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, kernel@pengutronix.de,
 Simon Horman <simon.horman@corigine.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 11/11] net: stmmac: dwmac-tegra:
	Convert to platform remove callback returning void
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClJldmlld2VkLWJ5OiBTaW1v
biBIb3JtYW4gPHNpbW9uLmhvcm1hbkBjb3JpZ2luZS5jb20+CkFja2VkLWJ5OiBUaGllcnJ5IFJl
ZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXRlZ3JhLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy10ZWdyYS5jIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdGVncmEuYwppbmRleCBiZGY5OTBjZjJmMzEu
LmY4MzY3YzViNDkwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtdGVncmEuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy10ZWdyYS5jCkBAIC0zNTMsMTUgKzM1MywxMyBAQCBzdGF0aWMgaW50IHRlZ3Jh
X21nYmVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gZXJyOwog
fQogCi1zdGF0aWMgaW50IHRlZ3JhX21nYmVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCitzdGF0aWMgdm9pZCB0ZWdyYV9tZ2JlX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogewogCXN0cnVjdCB0ZWdyYV9tZ2JlICptZ2JlID0gZ2V0X3N0bW1hY19ic3Bf
cHJpdigmcGRldi0+ZGV2KTsKIAogCWNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKEFSUkFZX1NJ
WkUobWdiZV9jbGtzKSwgbWdiZS0+Y2xrcyk7CiAKIAlzdG1tYWNfcGx0ZnJfcmVtb3ZlKHBkZXYp
OwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHRl
Z3JhX21nYmVfbWF0Y2hbXSA9IHsKQEAgLTM3NCw3ICszNzIsNyBAQCBzdGF0aWMgU0lNUExFX0RF
Vl9QTV9PUFModGVncmFfbWdiZV9wbV9vcHMsIHRlZ3JhX21nYmVfc3VzcGVuZCwgdGVncmFfbWdi
ZV9yZXN1bQogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciB0ZWdyYV9tZ2JlX2RyaXZl
ciA9IHsKIAkucHJvYmUgPSB0ZWdyYV9tZ2JlX3Byb2JlLAotCS5yZW1vdmUgPSB0ZWdyYV9tZ2Jl
X3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IHRlZ3JhX21nYmVfcmVtb3ZlLAogCS5kcml2ZXIgPSB7
CiAJCS5uYW1lID0gInRlZ3JhLW1nYmUiLAogCQkucG0JCT0gJnRlZ3JhX21nYmVfcG1fb3BzLAot
LSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
