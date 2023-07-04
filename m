Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE87A746BD6
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jul 2023 10:28:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80BC6C6B45B;
	Tue,  4 Jul 2023 08:28:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 870D6C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 08:28:39 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1688459318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtTNsVLOJ1m9cODrkVK0gfCj4MpOrmQEjXjQjzvPOq8=;
 b=Ue9HOwCdm2WwblZXd4hpI5ezd9fD9uauiv6dbwEDRLXGeUt3K5x5d5drm3LI8/l83RFRq/
 GQz9i7k0OSVpFv+/hoJQHVrp/aae8LAz3QwEnzvDX4sm+AEGU1TgD6u5XkSE9F2OK3DwY9
 xWzZ7+BMvKF5JhfAsjZQgjA+CVnZmnnnB4mpYnU48V0u5aVFVf1WpV9lPeq/YbnZpqfma9
 nMsHauFIG7w0N+GUmKjobmYDL02uaZDZrAk079Gc/xIO7Om0gJlypBoN2pUfxggT8bUTzj
 RAd1N74ZHsvGJaF/xYacsFo6sdZde/+GwWDLbj5jeJTQCpBmaP8/6SV0TUyC9Q==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8775A1C000D;
 Tue,  4 Jul 2023 08:28:31 +0000 (UTC)
Date: Tue, 4 Jul 2023 10:28:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Message-ID: <20230704102830.2c6db540@xps-13>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-5-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-5-fb6ab3dea87c@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Daniel Golle <daniel@makrotopia.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-oxnas@groups.io,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 05/15] nand: oxnas_nand: remove
 obsolete raw nand driver
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

SGkgTmVpbCwKCm5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAzMCBKdW4g
MjAyMyAxODo1ODozMCArMDIwMDoKCj4gRHVlIHRvIGxhY2sgb2YgbWFpbnRlbmFuY2UgYW5kIHN0
YWxsIG9mIGRldmVsb3BtZW50IGZvciBhIGZldyB5ZWFycyBub3csCj4gYW5kIHNpbmNlIG5vIG5l
dyBmZWF0dXJlcyB3aWxsIGV2ZXIgYmUgYWRkZWQgdXBzdHJlYW0sIHJlbW92ZSBzdXBwb3J0Cj4g
Zm9yIE9YODEwIGFuZCBPWDgyMCBuYW5kLgo+IAo+IEFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4gQWNrZWQtYnk6IERhbmllbCBHb2xsZSA8ZGFuaWVsQG1ha3JvdG9waWEub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8u
b3JnPgoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
CgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
