Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AB67BD6A4
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 11:22:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C908C6B442;
	Mon,  9 Oct 2023 09:22:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B098C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 09:22:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qpmTD-0006sV-83; Mon, 09 Oct 2023 11:22:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qpmTC-000NWN-5W; Mon, 09 Oct 2023 11:22:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qpmTB-00C4op-Sc; Mon, 09 Oct 2023 11:22:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon,  9 Oct 2023 10:38:37 +0200
Message-Id: <20231009083856.222030-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=oQvuwpLV6jEvG8nPX5IRlTZZ5eR2ugHk+8EMhpV4SKQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlI7wAB8YUxAlLBbwC7CIKjUbWm11DxuAGLQFuF
 PnKvZq8Ol2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSO8AAAKCRCPgPtYfRL+
 TjJjCAC4Tdc4fTfh4VtpKisfvbBZZ0D+fqAmRlGB0zNqfrv706XALbviXa7gthDeHwPd4lv8wKr
 Ite+awd5fMyaGbl9XHLZ5gAHQ3JEjV6lPNk8v0CuXjFzEW82fkKMEJSL1Z+1aUG3IFE70SUBZDf
 2Od7RaLozqLEEOO+6oerRQDP9UycvcJGkfXOwZ5ZZYOExGr51w3ex6RuIsYMEbniwO7//3JHVdP
 ZQpEEZvabqVPS+mx/fuF07qQlbpItj0UzV6FspmOKyC1ZVkXk+KMLjbrCzGEcYD5CzrbaKN3daX
 Yvrtl6ebPOFQICKlYIpv7t5owBQhbumI9X3ZqpTeaTE879qF
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 01/20] pinctrl: stmfx: Improve error message
	in .remove()'s error path
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

VGhlIGRyaXZlciBjb3JlIGhhcyBubyBoYW5kbGluZyBmb3IgZXJyb3JzIHJldHVybmVkIGJ5IHRo
ZSAucmVtb3ZlKCkKY2FsbGJhY2suIFRoZSBvbmx5IGFjdGlvbiBvbiBlcnJvciBpcyBhIGRldl93
YXJuKCkgd2l0aCBnZW5lcmljIGVycm9yCm1lc3NhZ2UgdGhhdCB0aGUgcmV0dXJuZWQgdmFsdWUg
aXMgcmV0dXJuZWQuCgpSZXBsYWNlIGl0IGJ5IGEgbW9yZSBzcGVjaWZpYyBhbmQgdXNlZnVsIG1l
c3NhZ2UuIFRoZW4gcmV0dXJuaW5nIHplcm8gaXMKdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLCB0aGUg
b25seSBlZmZlY3QgaXMgdG8gc3VwcHJlc3MgdGhlIGNvcmUncwp3YXJuaW5nLgoKVGhpcyBwcmVw
YXJlcyB0aGUgZHJpdmVyIGZvciB0aGUgY29udmVyc2lvbiB0byAucmVtb3ZlX25ldygpLgoKU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4KLS0tCiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jIHwgMTQgKysrKysrKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMgYi9kcml2ZXJzL3Bp
bmN0cmwvcGluY3RybC1zdG1meC5jCmluZGV4IDA5NzRiYmY1N2I1NC4uZDdhYjgyNDMyYTUyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jCisrKyBiL2RyaXZlcnMv
cGluY3RybC9waW5jdHJsLXN0bWZ4LmMKQEAgLTczNywxMSArNzM3LDE3IEBAIHN0YXRpYyBpbnQg
c3RtZnhfcGluY3RybF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogc3RhdGlj
IGludCBzdG1meF9waW5jdHJsX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewogCXN0cnVjdCBzdG1meCAqc3RtZnggPSBkZXZfZ2V0X2RydmRhdGEocGRldi0+ZGV2LnBhcmVu
dCk7CisJaW50IHJldDsKIAotCXJldHVybiBzdG1meF9mdW5jdGlvbl9kaXNhYmxlKHN0bWZ4LAot
CQkJCSAgICAgIFNUTUZYX0ZVTkNfR1BJTyB8Ci0JCQkJICAgICAgU1RNRlhfRlVOQ19BTFRHUElP
X0xPVyB8Ci0JCQkJICAgICAgU1RNRlhfRlVOQ19BTFRHUElPX0hJR0gpOworCXJldCA9IHN0bWZ4
X2Z1bmN0aW9uX2Rpc2FibGUoc3RtZngsCisJCQkJICAgICBTVE1GWF9GVU5DX0dQSU8gfAorCQkJ
CSAgICAgU1RNRlhfRlVOQ19BTFRHUElPX0xPVyB8CisJCQkJICAgICBTVE1GWF9GVU5DX0FMVEdQ
SU9fSElHSCk7CisJaWYgKHJldCkKKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGRp
c2FibGUgcGlucyAoJXBlKVxuIiwKKwkJCUVSUl9QVFIocmV0KSk7CisKKwlyZXR1cm4gMDsKIH0K
IAogI2lmZGVmIENPTkZJR19QTV9TTEVFUAotLSAKMi40MC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
