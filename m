Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F37769D39
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 18:55:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E83D4C6B471;
	Mon, 31 Jul 2023 16:55:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA601C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 16:55:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAk-0006a0-1h; Mon, 31 Jul 2023 18:55:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAf-000AQS-O1; Mon, 31 Jul 2023 18:55:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAe-009NYd-FU; Mon, 31 Jul 2023 18:55:00 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Bourgoin <thomas.bourgoin@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Date: Mon, 31 Jul 2023 18:54:53 +0200
Message-Id: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=w0wihl2nAbFj+WMOmikfkuigtjpGlCwMYZnP0JawFc8=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpTjzyNV31csM+zhm3Llpe/Vb8H3+9wq1i5ZtWXRYg+rD
 Cc9y4pnnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMZM4r9v/5vSYusl3/XBIb
 vH95dCREWbJ/XL1vmguXxZ1Ziux9c9zezVhq/lu0sa/Z8+AlDf5ZGatV6+TkS0WSbx7gyzw8x3X
 xXHnpkuDV93lM1qrXs37dFqAeFBe8+7yvyOG59xYcYtK4cvP6Uf7k9WyTp3MGcsgFByruuZ8hkB
 Wx220r1+NFHxUus2ppbmX7aPDoD8cGyZ3B3z6n/vO1/KBns2NOQL3qiVXr0/w2OFT1xF/65exfU
 HK1dmakJecX5YpIge86vvtnNPLfDOiYmmJUGCfcNn9RlrHkqbivjbvcDHgmWdjeWjwjTe5r4tVd
 zYk69tXFfL6ORWFsjvLu1b16LrIce8O1rzqurk7YJHoTAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/3] stm32/hash - Convert to platform remove
	callback returning void
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

SGVsbG8sCgp0aGlzIHBhdGNoIHNlcmllcyBjb252ZXJ0cyB0aGUgc3RtMzItaGFzaCBkcml2ZXIg
dG8gdXNlIC5yZW1vdmVfbmV3LiBUaGUKZmlyc3QgcGF0Y2ggaXMgYSBmaXggdGhhdCBjb3VsZCBi
ZSBiYWNrcG9ydGVkIHRvIHN0YWJsZSwgYnV0IGl0J3Mgbm90CnZlcnkgdXJnZW50LiBJdCdzIG9u
bHkgcHJvYmxlbWF0aWMgaWYgc3VjaCBhIGRldmljZSBpcyB1bmJvdW5kICh3aGljaApoYXBwZW5z
IHJhcmVseSkgYW5kIHRoZW4gY2xrX3ByZXBhcmVfZW5hYmxlKCkgZmFpbHMuIFVwIHRvIHlvdSBp
ZiB5b3UKd2FudCB0byB0YWcgaXQgYXMgc3RhYmxlIG1hdGVyaWFsLgoKVGhlIG92ZXJhbGwgZ29h
bCBpcyB0byByZWR1Y2UgdGhlIG51bWJlciBvZiBkcml2ZXJzIHVzaW5nIHRoZSBpcnJpdGF0aW5n
Ci5yZW1vdmUoKSBjYWxsYmFjayBieSBvbmUuIFNlZSB0aGUgY29tbWl0IGxvZyBvZiB0aGUgdGhp
cmQgcGF0Y2ggZm9yIHRoZQpyZWFzb25pbmcuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5l
LUvDtm5pZyAoMyk6CiAgY3J5cHRvOiBzdG0zMi9oYXNoIC0gUHJvcGVybHkgaGFuZGxlIHBtX3J1
bnRpbWVfZ2V0IGZhaWxpbmcKICBjcnlwdG86IHN0bTMyL2hhc2ggLSBEcm9wIGlmIGJsb2NrIHdp
dGggYWx3YXlzIGZhbHNlIGNvbmRpdGlvbgogIGNyeXB0bzogc3RtMzIvaGFzaCAtIENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwogICAgdm9pZAoKIGRyaXZlcnMv
Y3J5cHRvL3N0bTMyL3N0bTMyLWhhc2guYyB8IDE5ICsrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6
IDNkZTAxNTJiZjI2ZmYwYzUwODNlZjgzMWJhNzY3NmZjNGM5MmU2M2EKLS0gCjIuMzkuMgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
