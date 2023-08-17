Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A29177FCDD
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 19:19:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3C86C6B475;
	Thu, 17 Aug 2023 17:19:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE897C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:19:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDD9562A54;
 Thu, 17 Aug 2023 17:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B800C433C7;
 Thu, 17 Aug 2023 17:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692292762;
 bh=iHIfK/mk9Pz261VmV7TPqv4tXFXcg5nMmuiazYWbCBw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GC8cIiXAKmlBhvVE+7A2h95aT3jTrFYY9OtCYVzfJAh/vVzRiGloDobPjfNznvzGz
 lW2Lz+Mpb/xo6CVEfRG0ug1XjJk+X+cr7oLZi4/68oweQXyENRc8cC8TRWDfrI4sct
 7YUvgEk+m4hRmqPLvV231h7GE6twilAhwDuMIvoUYsSCvzcyrNiUYKRGQ4Sqa4U+D6
 T3BrpK2TbzGYA0TykvjOY68APfBPgBOw1MYnvYkIoucU/43WfH2w6RGFlPmDpQ2zDT
 JHXP3PL1wNqRAW7t/Q2PhhLJLOYAGljsF+m70p/RO1qexobTaz3uwyv32JAKuEWVYq
 kxLR81oLB+Bhg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
Message-Id: <169229275920.1072243.16297304606056880279.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 18:19:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/9] mfd: stmpe: Fix
	Wvoid-pointer-to-enum-cast warning
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

T24gVGh1LCAxMCBBdWcgMjAyMyAxMTo1ODo0MSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiAncGFydG51bScgaXMgYW4gZW51bSwgdGh1cyBjYXN0IG9mIHBvaW50ZXIgb24gNjQt
Yml0IGNvbXBpbGUgdGVzdCB3aXRoIFc9MQo+IGNhdXNlczoKPiAKPiBzdG1wZS1pMmMuYzo5MDox
MzogZXJyb3I6IGNhc3QgdG8gc21hbGxlciBpbnRlZ2VyIHR5cGUgJ2VudW0gc3RtcGVfcGFydG51
bScgZnJvbSAnY29uc3Qgdm9pZCAqJyBbLVdlcnJvciwtV3ZvaWQtcG9pbnRlci10by1lbnVtLWNh
c3RdCj4gCj4gCgpBcHBsaWVkLCB0aGFua3MhCgpbMS85XSBtZmQ6IHN0bXBlOiBGaXggV3ZvaWQt
cG9pbnRlci10by1lbnVtLWNhc3Qgd2FybmluZwogICAgICBjb21taXQ6IGVlMWE5MWVlNzcyOWI1
NjUzNWJjZTc1M2M1YTgxNDZlYzU4YWEwYzYKWzIvOV0gbWZkOiBtYXgxNDU3NzogRml4IFd2b2lk
LXBvaW50ZXItdG8tZW51bS1jYXN0IHdhcm5pbmcKICAgICAgY29tbWl0OiBlMzU2OWJkNjg3ZWJi
YjM1MzM5YWE4Njk5MzExYzI4NzcwZDNhM2I2ClszLzldIG1mZDogbWF4Nzc1NDE6IEZpeCBXdm9p
ZC1wb2ludGVyLXRvLWVudW0tY2FzdCB3YXJuaW5nCiAgICAgIGNvbW1pdDogZDk2NGFjNTk1MTZj
YTc3YzA3NjFkNzM2ODFkNzk3NWUzM2RkZmVhZQpbNC85XSBtZmQ6IGhpNjQyMS1wbWljOiBGaXgg
V3ZvaWQtcG9pbnRlci10by1lbnVtLWNhc3Qgd2FybmluZwogICAgICBjb21taXQ6IGJiZjI2YjE3
NDc2Yzg1MjhhM2RjOTAzZjU1NTBlODliZGNhN2FhNzIKWzUvOV0gbWZkOiBscDg3NTY1OiBGaXgg
V3ZvaWQtcG9pbnRlci10by1lbnVtLWNhc3Qgd2FybmluZwogICAgICBjb21taXQ6IGQzY2Y0ZDcw
NTU2M2QyNmUwMmU4OTk3Y2MyY2YyOTc1NDJhYmRhZGYKWzYvOV0gbWZkOiB0YzM1ODk6IEZpeCBX
dm9pZC1wb2ludGVyLXRvLWVudW0tY2FzdCB3YXJuaW5nCiAgICAgIGNvbW1pdDogNDk5ZTZjNzkw
NGE1ZDE4NjA2NTFlYzI0MzdhOTg3M2UyYjlhYTFmMApbNy85XSBtZmQ6IHdtODk5NDogRml4IFd2
b2lkLXBvaW50ZXItdG8tZW51bS1jYXN0IHdhcm5pbmcKICAgICAgY29tbWl0OiBiNTNjZDJmYjI3
NjlkZDhjMDgyYWRhYWE4ZjE3NDYyNjVhOWNhNzMyCls4LzldIG1mZDogd20zMXg6IEZpeCBXdm9p
ZC1wb2ludGVyLXRvLWVudW0tY2FzdCB3YXJuaW5nCiAgICAgIGNvbW1pdDogYTc5YzFjNzZkNzI2
YzVhZjljZjkyNWVlMGE1YjkzNGJkMTdjMTQ5NgpbOS85XSBtZmQ6IG14cy1scmFkYzogRml4IFd2
b2lkLXBvaW50ZXItdG8tZW51bS1jYXN0IHdhcm5pbmcKICAgICAgY29tbWl0OiAyNDNjZDQ3Zjc1
M2Q1N2UxZDZkMTE0NDkwNTZhNDM3MDUyNTYwYjg0CgotLQpMZWUgSm9uZXMgW+adjueQvOaWr10K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
