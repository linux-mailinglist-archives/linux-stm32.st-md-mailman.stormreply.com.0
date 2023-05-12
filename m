Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5BD700E01
	for <lists+linux-stm32@lfdr.de>; Fri, 12 May 2023 19:38:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A065C6907C;
	Fri, 12 May 2023 17:38:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8156DC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 May 2023 17:38:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pxWii-0004jy-SJ; Fri, 12 May 2023 19:38:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pxWig-0031HH-Oq; Fri, 12 May 2023 19:38:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pxWig-003nrx-2D; Fri, 12 May 2023 19:38:18 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 12 May 2023 19:38:09 +0200
Message-Id: <20230512173810.131447-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512173810.131447-1-u.kleine-koenig@pengutronix.de>
References: <20230512173810.131447-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=2vlMXGGCVahNI3ka92R9UEaW26yVnbxKviGYxwDHwHI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkXnl8XOlqYTrlntQBtWRe0BgeL6TRM0AdNYGMU
 lOxq8sMDLaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZF55fAAKCRCPgPtYfRL+
 TndZB/9l6fw/rsarQumOA/889xFG4Wnn4OSbNFhyCe0HTdP5eIsEBjCjAZev0Zm7DmRGFSLS3ZT
 hVL2eJUuplPzlzGLQW7FxVVK4m/cmURX3ciNYpfZLwUt5r2yiTvrdeLPRMDHvYTPEiXA5EFOa2G
 19HdfD1FrYWecH9HSWy/E6rb/zHXhld/NO2QExehO3vPWIwV1YBOJC9qXp0zYMBPB1USUQp8vrX
 I7mBi5jYc2g6L9MpGxLhJqo1wMjcl28GrF6601f3q+YpWtKpSZLsNTUkL3M/vyWxAbqLpDGjUWB
 16Js0R/8z5ZzLhn9NDDP92OLkCVw65uzRAMlDW9Gqmqqsx43
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 1/2] serial: stm32: Ignore return value of
	uart_remove_one_port() in .remove()
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

UmV0dXJuaW5nIGVhcmx5IGZyb20gc3RtMzJfdXNhcnRfc2VyaWFsX3JlbW92ZSgpIHJlc3VsdHMg
aW4gYSByZXNvdXJjZQpsZWFrIGFzIHNldmVyYWwgY2xlYW51cCBmdW5jdGlvbnMgYXJlIG5vdCBj
YWxsZWQuIFRoZSBkcml2ZXIgY29yZSBpZ25vcmVzCnRoZSByZXR1cm4gdmFsdWUgYW5kIHRoZXJl
IGlzIG5vIHBvc3NpYmlsaXR5IHRvIGNsZWFuIHVwIGxhdGVyLgoKdWFydF9yZW1vdmVfb25lX3Bv
cnQoKSBvbmx5IHJldHVybnMgbm9uLXplcm8gaWYgdGhlcmUgaXMgc29tZQppbmNvbnNpc3RlbmN5
IChpLmUuIHN0bTMyX3VzYXJ0X2RyaXZlci5zdGF0ZVtwb3J0LT5saW5lXS51YXJ0X3BvcnQgPT0g
TlVMTCkuClRoaXMgc2hvdWxkIG5ldmVyIGhhcHBlbiwgYW5kIGV2ZW4gaWYgaXQgZG9lcyBpdCdz
IGEgYmFkIGlkZWEgdG8gZXhpdAplYXJseSBpbiB0aGUgcmVtb3ZlIGNhbGxiYWNrIHdpdGhvdXQg
Y2xlYW5pbmcgdXAuCgpUaGlzIHByZXBhcmVzIGNoYW5naW5nIHRoZSBwcm90b3R5cGUgb2Ygc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlcjo6cmVtb3ZlIHRvCnJldHVybiB2b2lkLiBTZWUgY29tbWl0IDVj
NWE3NjgwZTY3YiAoInBsYXRmb3JtOiBQcm92aWRlIGEgcmVtb3ZlIGNhbGxiYWNrCnRoYXQgcmV0
dXJucyBubyB2YWx1ZSIpIGZvciBmdXJ0aGVyIGRldGFpbHMgYWJvdXQgdGhpcyBxdWVzdC4KClNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+Ci0tLQogZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgfCA1ICstLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwv
c3RtMzItdXNhcnQuYwppbmRleCAxZTM4ZmM5YjEwYzEuLmU5ZTExYTI1OTYyMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKKysrIGIvZHJpdmVycy90dHkvc2Vy
aWFsL3N0bTMyLXVzYXJ0LmMKQEAgLTE3NTUsMTMgKzE3NTUsMTAgQEAgc3RhdGljIGludCBzdG0z
Ml91c2FydF9zZXJpYWxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3Ry
dWN0IHVhcnRfcG9ydCAqcG9ydCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVj
dCBzdG0zMl9wb3J0ICpzdG0zMl9wb3J0ID0gdG9fc3RtMzJfcG9ydChwb3J0KTsKIAljb25zdCBz
dHJ1Y3Qgc3RtMzJfdXNhcnRfb2Zmc2V0cyAqb2ZzID0gJnN0bTMyX3BvcnQtPmluZm8tPm9mczsK
LQlpbnQgZXJyOwogCXUzMiBjcjM7CiAKIAlwbV9ydW50aW1lX2dldF9zeW5jKCZwZGV2LT5kZXYp
OwotCWVyciA9IHVhcnRfcmVtb3ZlX29uZV9wb3J0KCZzdG0zMl91c2FydF9kcml2ZXIsIHBvcnQp
OwotCWlmIChlcnIpCi0JCXJldHVybihlcnIpOworCXVhcnRfcmVtb3ZlX29uZV9wb3J0KCZzdG0z
Ml91c2FydF9kcml2ZXIsIHBvcnQpOwogCiAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYp
OwogCXBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZCgmcGRldi0+ZGV2KTsKLS0gCjIuMzkuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
