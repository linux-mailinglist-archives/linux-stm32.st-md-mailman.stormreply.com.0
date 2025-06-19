Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABE7AE03C3
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jun 2025 13:35:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41213C349C0;
	Thu, 19 Jun 2025 11:35:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8241FC36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 11:35:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2ADB749F7E;
 Thu, 19 Jun 2025 11:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB84EC4CEEA;
 Thu, 19 Jun 2025 11:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750332903;
 bh=OSekkCHN37/wFSljw2iH1JTgpKEfUG9ZYdnTvES6x0o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YzMkdkAAn+eR8VtWUKEsYGskQ9UTPoAxVdqpd9edRCZG1AhpNzbhDK1TiH9VBAb9s
 wzigTGDSKEmFxLKeFeF9uWACGnCWOfc0Tgs1QOqELnnEPCDutD0g0io+rhbjvWRzDD
 UcFQeM0fNTxdluWbrZuMNtwcJxw/FSBCgBWPrQuoxlUqPEpiSzHg4WWE3hSF+BjVYo
 8OChQvHya7k+wmcvM0GiJ3PLZ3T4S8tyguiPxebueO0+Hcxh+ra6igU8CHh3WyJ0sf
 aj8Q9l5kKKWpDy5bAjYDyV7V5WgDTiMymp1FknPJ85lRa+90Xk+fsyPH4VlH0vdcSk
 fQEU6cg8izszw==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
In-Reply-To: <20250611104348.192092-13-jirislaby@kernel.org>
References: <20250611104348.192092-13-jirislaby@kernel.org>
Message-Id: <175033289843.706988.8724251028976565230.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 12:34:58 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c81fc
Cc: imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Lee Jones <lee@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Roger Quadros <rogerq@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 tglx@linutronix.de, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] (subset) [PATCH] mfd: Use dev_fwnode()
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

T24gV2VkLCAxMSBKdW4gMjAyNSAxMjo0Mzo0MSArMDIwMCwgSmlyaSBTbGFieSAoU1VTRSkgd3Jv
dGU6Cj4gaXJxX2RvbWFpbl9jcmVhdGVfc2ltcGxlKCkgdGFrZXMgZndub2RlIGFzIHRoZSBmaXJz
dCBhcmd1bWVudC4gSXQgY2FuIGJlCj4gZXh0cmFjdGVkIGZyb20gdGhlIHN0cnVjdCBkZXZpY2Ug
dXNpbmcgZGV2X2Z3bm9kZSgpIGhlbHBlciBpbnN0ZWFkIG9mCj4gdXNpbmcgb2Zfbm9kZSB3aXRo
IG9mX2Z3bm9kZV9oYW5kbGUoKS4KPiAKPiBTbyB1c2UgdGhlIGRldl9md25vZGUoKSBoZWxwZXIu
Cj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIG1mZDogVXNlIGRldl9md25v
ZGUoKQogICAgICBjb21taXQ6IDBjZmU2OTQ3NmViZjNhMjdiMDc0ODQ4ZjJhMTQ3YWUyMmMyZDg0
ZmMKCi0tCkxlZSBKb25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
