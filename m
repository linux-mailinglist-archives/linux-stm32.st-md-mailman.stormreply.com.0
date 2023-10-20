Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 475007D09EF
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Oct 2023 09:56:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08978C6C838;
	Fri, 20 Oct 2023 07:56:50 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BEEBC6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Oct 2023 07:56:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtkN7-0003hX-Bo; Fri, 20 Oct 2023 09:56:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtkN5-002yWQ-Gz; Fri, 20 Oct 2023 09:56:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtkN5-002OKk-7g; Fri, 20 Oct 2023 09:56:39 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Date: Fri, 20 Oct 2023 09:56:01 +0200
Message-ID: <20231020075521.2121571-83-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7A/4jfO5f6HPiPMVJM3k1eEGID7WdOBM8OghW+7z3ug=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMjKWxBuHKyc8wcbd1mj6AxMptWcoLzYBnaw3U
 wg+jgwX8VSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTIylgAKCRCPgPtYfRL+
 ThDwB/wK8d5usctRxniPVmWkOoFU/WfE+6gfYDF2lBAw5FKmcp0+xjRl5hPzamdDONa7wNHQggs
 vmLCxzAf9nSCzPtI4JlodbrDMzqLrJR2JHHxzh3pqh14ouxm6RsYMgUCK10LH07JW3eOtS3ZYNB
 MLRUbqq6zG2PI6MN8U4St7jnLxOJZ0Ry/idbzvxTD/Kq539lV98YNQYccHGjZziD5AQzMc9qosN
 X5tWmf9gRPJaaV2j5UoywSLzRCV3qveCSRxgZUIhdVgM/otC56pBRcSlxeWcyOqGREb7SYQOiKR
 UO+vpVfxREop/84pttO44tEJO6MF72B7eK4uFbPwzb7EXo9i
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Colin Ian King <colin.i.king@gmail.com>
Subject: [Linux-stm32] [PATCH 39/42] crypto: stm32/cryp - Convert to
	platform remove callback returning void
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
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVGhlIGRyaXZlciBhZGFw
dGVkIGhlcmUgc3VmZmVyZWQgZnJvbSB0aGlzIHdyb25nIGFzc3VtcHRpb24gYW5kIGhhZApzZXZl
cmFsIGVycm9yIHBhdGhzIHJlc3VsdGluZyBpbiByZXNvdXJjZSBsZWFrcy4KClRoZSBjaGVjayBm
b3IgY3J5cCBiZWluZyBub24tTlVMTCBpcyBoYXJtbGVzcy4gVGhpcyBjYW4gbmV2ZXIgaGFwcGVu
IGFzCi5yZW1vdmUoKSBpcyBvbmx5IGNhbGxlZCBhZnRlciAucHJvYmUoKSBjb21wbGV0ZWQgc3Vj
Y2Vzc2Z1bGx5IGFuZCBpbgp0aGF0IGNhc2UgZHJ2ZGF0YSB3YXMgc2V0IHRvIGEgbm9uLU5VTEwg
dmFsdWUuIFNvIHRoaXMgY2hlY2sgY2FuIGp1c3QgYmUKZHJvcHBlZC4KCklmIHBtX3J1bnRpbWVf
Z2V0KCkgZmFpbHMsIHRoZSBvdGhlciByZXNvdXJjZXMgaGVsZCBieSB0aGUgZGV2aWNlIG11c3QK
c3RpbGwgYmUgZnJlZWQuIE9ubHkgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgc2hvdWxkIGJlIHNr
aXBwZWQgYXMgdGhlCnBtX3J1bnRpbWVfZ2V0KCkgZmFpbGVkIHRvIGNhbGwgY2xrX3ByZXBhcmVf
ZW5hYmxlKCkuCgpBZnRlciB0aGVzZSBjaGFuZ2VzIHRoZSByZW1vdmUgZnVuY3Rpb24gcmV0dXJu
cyB6ZXJvIHVuY29uZGl0aW9uYWxseSBhbmQKY2FuIHRyaXZpYWxseSBiZSBjb252ZXJ0ZWQgdG8g
dGhlIHByb3RvdHlwZSByZXF1aXJlZCBmb3IgLnJlbW92ZV9uZXcoKS4KClNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQog
ZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItY3J5cC5jIHwgMTYgKysrKystLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItY3J5cC5jIGIvZHJpdmVycy9jcnlwdG8v
c3RtMzIvc3RtMzItY3J5cC5jCmluZGV4IGYwOTVmMDA2NTQyOC4uYzNjYmMyNjczMzM4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1jcnlwLmMKKysrIGIvZHJpdmVycy9j
cnlwdG8vc3RtMzIvc3RtMzItY3J5cC5jCkBAIC0yMDg0LDE3ICsyMDg0LDEyIEBAIHN0YXRpYyBp
bnQgc3RtMzJfY3J5cF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVy
biByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgc3RtMzJfY3J5cF9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHN0bTMyX2NyeXBfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHN0bTMyX2NyeXAgKmNyeXAgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlpbnQgcmV0OwogCi0JaWYgKCFjcnlwKQotCQlyZXR1cm4g
LUVOT0RFVjsKLQotCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoY3J5cC0+ZGV2KTsK
LQlpZiAocmV0IDwgMCkKLQkJcmV0dXJuIHJldDsKKwlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5j
KGNyeXAtPmRldik7CiAKIAlpZiAoY3J5cC0+Y2Fwcy0+YWVhZHNfc3VwcG9ydCkKIAkJY3J5cHRv
X2VuZ2luZV91bnJlZ2lzdGVyX2FlYWRzKGFlYWRfYWxncywgQVJSQVlfU0laRShhZWFkX2FsZ3Mp
KTsKQEAgLTIxMDksOSArMjEwNCw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfY3J5cF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlwbV9ydW50aW1lX2Rpc2FibGUoY3J5cC0+ZGV2
KTsKIAlwbV9ydW50aW1lX3B1dF9ub2lkbGUoY3J5cC0+ZGV2KTsKIAotCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShjcnlwLT5jbGspOwotCi0JcmV0dXJuIDA7CisJaWYgKHJldCA+PSAwKQorCQljbGtf
ZGlzYWJsZV91bnByZXBhcmUoY3J5cC0+Y2xrKTsKIH0KIAogI2lmZGVmIENPTkZJR19QTQpAQCAt
MjE0OCw3ICsyMTQyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHN0bTMyX2Ny
eXBfcG1fb3BzID0gewogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9jcnlw
X2RyaXZlciA9IHsKIAkucHJvYmUgID0gc3RtMzJfY3J5cF9wcm9iZSwKLQkucmVtb3ZlID0gc3Rt
MzJfY3J5cF9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0zMl9jcnlwX3JlbW92ZSwKIAkuZHJp
dmVyID0gewogCQkubmFtZSAgICAgICAgICAgPSBEUklWRVJfTkFNRSwKIAkJLnBtCQk9ICZzdG0z
Ml9jcnlwX3BtX29wcywKLS0gCjIuNDIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
