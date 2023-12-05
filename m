Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB43805411
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 13:26:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF217C6C820;
	Tue,  5 Dec 2023 12:26:44 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E35C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 12:26:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAUVZ-0005XV-Aq; Tue, 05 Dec 2023 13:26:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAUVW-00Djul-Mr; Tue, 05 Dec 2023 13:26:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAUVW-00EhQX-DJ; Tue, 05 Dec 2023 13:26:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Date: Tue,  5 Dec 2023 13:26:15 +0100
Message-ID: <cover.1701778038.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=8all5/IHFXIAXqeYzLVd/ErOOyU8CBOkibjzWo7s07Q=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbxbmmD94bntqRzhdfRPibGRUIkQg4ZpUucl6c
 uy9sofkpFuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW8W5gAKCRCPgPtYfRL+
 TkOmB/9/EmP6fTqC77VRMQD4r69MCOPkQ6Gf5bN+WCbkAhMPeVSdIhHxWbT7JUdXHtWiE+tgK2g
 cVCfMPenzVd+W+p8iesX9IQqsogSys3xirj6eb5v2y8h/gyIpDS8ajg+hiifRTEOzvNPEFOhBJ0
 T+oX6QJvXAuQ+K3aQe33V6rdSQxamaOlGmcFGTrCDSgV0lCbeqqBPD5uzVYsGQ3sZ82MeNOfZ4e
 Ycb/rKiqxKt7kaV8Ladpk++mZ97UPqZlZjm0Z4Hjtrt442WQRT2BJj8IIbbImf1IwFj8beIuaL0
 JrTaavDxcQJBZ10cOCLCQViDgatGMdhyxsI4HtD+2SO4UIa+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Linux-stm32] [PATCH 0/8] regulator: Convert to platform remove
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgZHJpdmVycyBiZWxvdyBkcml2ZXJzL3Jl
Z3VsYXRvciB0byBzdHJ1Y3QKcGxhdGZvcm1fZHJpdmVyOjpyZW1vdmVfbmV3KCkuIFNlZSBjb21t
aXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06ClByb3ZpZGUgYSByZW1vdmUgY2FsbGJhY2sgdGhh
dCByZXR1cm5zIG5vIHZhbHVlIikgZm9yIGFuIGV4dGVuZGVkCmV4cGxhbmF0aW9uIGFuZCB0aGUg
ZXZlbnR1YWwgZ29hbC4KCkFsbCBjb252ZXJzYXRpb25zIGFyZSB0cml2aWFsLCBiZWNhdXNlIGFs
bCAucmVtb3ZlKCkgY2FsbGJhY2tzIHJldHVybmVkCnplcm8gdW5jb25kaXRpb25hbGx5LgoKVGhl
cmUgYXJlIG5vIGludGVyZGVwZW5kZW5jaWVzIGJldHdlZW4gdGhlc2UgcGF0Y2hlcywgc28gdGhl
eSBjb3VsZCBiZQpwaWNrZWQgdXAgaW5kaXZpZHVhbGx5LiBIb3dldmVyIEknZCBleHBlY3QgdGhl
bSB0byBnbyBpbiBhbGwgdG9nZXRoZXIKdmlhIE1hcmsncyByZWd1bGF0b3IgdHJlZS4KCkJlc3Qg
cmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICg4KToKICByZWd1bGF0b3I6IGFyaXpvbmEt
bGRvMTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2
b2lkCiAgcmVndWxhdG9yOiBiZDk1NzFtd3Y6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZwogICAgdm9pZAogIHJlZ3VsYXRvcjogZGI4NTAwLXByY211OiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICByZWd1
bGF0b3I6IHN0bTMyLXZyZWZidWY6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
CiAgICByZXR1cm5pbmcgdm9pZAogIHJlZ3VsYXRvcjogdW5pcGhpZXI6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwogICAgdm9pZAogIHJlZ3VsYXRvcjogdXNl
cnNwYWNlLWNvbnN1bWVyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjawogICAg
cmV0dXJuaW5nIHZvaWQKICByZWd1bGF0b3I6IHZpcnR1YWw6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcmVndWxhdG9yOiB3bTgzNTA6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgogZHJpdmVycy9y
ZWd1bGF0b3IvYXJpem9uYS1sZG8xLmMgICAgICAgIHwgOCArKystLS0tLQogZHJpdmVycy9yZWd1
bGF0b3IvYmQ5NTcxbXd2LXJlZ3VsYXRvci5jIHwgNSArKy0tLQogZHJpdmVycy9yZWd1bGF0b3Iv
ZGI4NTAwLXByY211LmMgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcmVndWxhdG9yL3N0bTMy
LXZyZWZidWYuYyAgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL3JlZ3VsYXRvci91bmlwaGllci1y
ZWd1bGF0b3IuYyAgfCA2ICsrLS0tLQogZHJpdmVycy9yZWd1bGF0b3IvdXNlcnNwYWNlLWNvbnN1
bWVyLmMgIHwgNiArKy0tLS0KIGRyaXZlcnMvcmVndWxhdG9yL3ZpcnR1YWwuYyAgICAgICAgICAg
ICB8IDYgKystLS0tCiBkcml2ZXJzL3JlZ3VsYXRvci93bTgzNTAtcmVndWxhdG9yLmMgICAgfCA2
ICsrLS0tLQogOCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMo
LSkKCgpiYXNlLWNvbW1pdDogMGY1ZjEyYWMwNWYzNmYxMTdlNzkzNjU2YzNmNTYwNjI1ZTkyN2Yx
YgotLSAKMi40Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
