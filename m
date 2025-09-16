Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9EFB5993B
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Sep 2025 16:18:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A46B6C32EB5;
	Tue, 16 Sep 2025 14:18:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E38DC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 14:18:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 990A1416A0;
 Tue, 16 Sep 2025 14:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4A3C4CEFC;
 Tue, 16 Sep 2025 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758032287;
 bh=MHGfGuchcAt29gAf8ZZAge+ONTorOmrLa6kSLpgeWZI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=F/W6kloe5Ooa5vCU4qDrZO3r1d7KJtj+Gak0Q9Me8sYdmZ1CBp12ReGezCg9qiVIq
 3WdX/lPq/AakhJYk4OsmNboW/hypMsRQUOMZBOqhAXdQ2YHSGQScugk282pdoy4C8W
 V78jhgk+QUnlPUs2Q6S0LfMLfMoFHmQ98wCc3xx4EaMKWWAaDBMjhJgYpQLukDOaF1
 P+P/Y1+1q2fal5LAaK9hmBES3nMwan/jbYnrV+72oiMWJ3zCHHpjM90NEmH8jzzUrM
 7vvmSbi+eHXMjSXibDCV1WvG7OpN2r/lGun4yvA3/PjgTD0bJ+XuFF/XMtA/hsXJIx
 OCumt0iWlbyyQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-1-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-1-076ee7738a0b@linaro.org>
Message-Id: <175803227904.3821457.282370095352768515.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 15:17:59 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c81fc
Cc: imx@lists.linux.dev, linux-unisoc@lists.infradead.org,
 openbmc@lists.ozlabs.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 1/3] mfd: vexpress-sysreg: use
 more common syntax for compound literals
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

T24gV2VkLCAxMCBTZXAgMjAyNSAwOToyNTo0NSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3
cm90ZToKPiBUaGUgKHR5cGVvZihmb28pKSBjb25zdHJ1Y3QgaXMgdW51c3VhbCBpbiB0aGUga2Vy
bmVsLCB1c2UgYSBtb3JlIHR5cGljYWwKPiBzeW50YXggYnkgZXhwbGljaXRseSBzcGVsbGluZyBv
dXQgdGhlIHR5cGUuCj4gCj4gCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8zXSBtZmQ6IHZleHByZXNz
LXN5c3JlZzogdXNlIG1vcmUgY29tbW9uIHN5bnRheCBmb3IgY29tcG91bmQgbGl0ZXJhbHMKICAg
ICAgY29tbWl0OiBmOGNiYTk3M2U0ZTUxYjhhMTY2Y2JmODFmODI3ZmY5MjZmNjRkOTJlCgotLQpM
ZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
