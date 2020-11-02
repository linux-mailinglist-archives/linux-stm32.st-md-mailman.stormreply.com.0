Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA7E2A3D25
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Nov 2020 08:06:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03226C3FAE3;
	Tue,  3 Nov 2020 07:06:55 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DACAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Nov 2020 21:27:29 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CQ5bg6Ktbz6r;
 Mon,  2 Nov 2020 22:27:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1604352448; bh=2g213xzmFT56VmXrFrh2NgIcRbPzT1GPUDOzlYzxpPQ=;
 h=Date:From:Subject:To:Cc:From;
 b=gVIkqZ7iRjeBncuOQ0cnSZcwWCsXYqymh1kbJZK3KJjzDqWhYr4nkk+yVdDfoU8Tr
 BlMxwtDapVD7E8TrPRZtbR765pzwlcZ+6vjENRYM26Wg4BUGt5CnT+tytcWsA2J7UF
 SwoqeazIKrfDRT99+QXuRZH9htZjfQ9DfBI7foUUp5xjHEll8e9BWgXbEXlxSl1t5E
 zPIFuYU8QxwgVOz9REmFP6wvZyeAuGqiPjEuhCqnTWhvDxF+c32QlTozv1PCx2+nbF
 4I2WzNJgyPG2zEQCAGah3PENGb2OGJcCuIqQpRUO2hUaR019qBU9QG9H2aH6nlDtKB
 12EmfapnFsCqg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Mon, 02 Nov 2020 22:27:27 +0100
Message-Id: <a9041d68b4d35e4a2dd71629c8a6422662acb5ee.1604351936.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
X-Mailman-Approved-At: Tue, 03 Nov 2020 07:06:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v1] regulator: defer probe when trying to get
 voltage from unresolved supply
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

cmVndWxhdG9yX2dldF92b2x0YWdlX3JkZXYoKSBpcyBjYWxsZWQgaW4gcmVndWxhdG9yIHByb2Jl
KCkgd2hlbgphcHBseWluZyBtYWNoaW5lIGNvbnN0cmFpbnRzLiAgVGhlICJmaXhlZCIgY29tbWl0
IGV4cG9zZWQgdGhlIHByb2JsZW0KdGhhdCBub24tYnlwYXNzZWQgcmVndWxhdG9ycyBjYW4gZm9y
d2FyZCB0aGUgcmVxdWVzdCB0byBpdHMgcGFyZW50CihsaWtlIGJ5cGFzc2VkIG9uZXMpIHN1cHBs
eS4gUmV0dXJuIC1FUFJPQkVfREVGRVIgd2hlbiB0aGUgc3VwcGx5CmlzIGV4cGVjdGVkIGJ1dCBu
b3QgcmVzb2x2ZWQgeWV0LgoKRml4ZXM6IGFlYTZjYjk5NzAzZSAoInJlZ3VsYXRvcjogcmVzb2x2
ZSBzdXBwbHkgYWZ0ZXIgY3JlYXRpbmcgcmVndWxhdG9yIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKU2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5x
bXFtLnBsPgpSZXBvcnRlZC1ieTogT25kxZllaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgpS
ZXBvcnRlZC1ieTogQ29yZW50aW4gTGFiYmUgPGNsYWJiZS5tb250am9pZUBnbWFpbC5jb20+Ci0t
LQogdjE6IHRoaXMgaXMgYSBiaXQgZGlmZmVyZW50IHNvbHV0aW9uIHRoYW4gdGhlIGhhY2sgc2Vu
dCBlYXJsaWVyLiBJdCBzaG91bGQKICAgICBiZSBlcXVpdmFsZW50IChwdXR0aW5nIHRoZSBlcnJv
ciBjb2RlIGF0IHRoZSBzb3VyY2UpLCBidXQgcGxlYXNlCiAgICAgdGVzdCBhZ2Fpbi4KLS0tCiBk
cml2ZXJzL3JlZ3VsYXRvci9jb3JlLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3IvY29yZS5jIGIvZHJpdmVycy9y
ZWd1bGF0b3IvY29yZS5jCmluZGV4IGE0ZmZkNzE2OTZkYS4uYTVhZDU1M2RhOGNkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9jb3JlLmMKKysrIGIvZHJpdmVycy9yZWd1bGF0b3IvY29y
ZS5jCkBAIC00MTY1LDYgKzQxNjUsOCBAQCBpbnQgcmVndWxhdG9yX2dldF92b2x0YWdlX3JkZXYo
c3RydWN0IHJlZ3VsYXRvcl9kZXYgKnJkZXYpCiAJCXJldCA9IHJkZXYtPmRlc2MtPmZpeGVkX3VW
OwogCX0gZWxzZSBpZiAocmRldi0+c3VwcGx5KSB7CiAJCXJldCA9IHJlZ3VsYXRvcl9nZXRfdm9s
dGFnZV9yZGV2KHJkZXYtPnN1cHBseS0+cmRldik7CisJfSBlbHNlIGlmIChyZGV2LT5zdXBwbHlf
bmFtZSkgeworCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKIAl9IGVsc2UgewogCQlyZXR1cm4gLUVJ
TlZBTDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
