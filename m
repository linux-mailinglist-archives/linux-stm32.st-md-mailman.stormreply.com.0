Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBC396F7A8
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 17:03:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08A25C78013;
	Fri,  6 Sep 2024 15:03:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 029A0C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 15:03:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00735FF809;
 Fri,  6 Sep 2024 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1725635018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCzNIuC06O9GFpBj+rz7i/FoJaoTyZM/ftekjkxFq5M=;
 b=HqC7m+EFgPCjd836JQLxJJmHm80prF1dgL8sxE6fAr42qroDhMQBXdwtpFosb6wpPNsQCR
 IfuvCZbXn3iKIvMijAwzafQkCGIz95baZwVtzeVkxDmqKMkYnZZ69eCU/39m1O9bgIzKap
 wDRHyPJAHhTmStNvOG6/WaLdwrXVYJLMzWPAta5Z+W6WrWFBQj6xzLckz3E2eI440WRGgY
 GqN/Dv1Bf4id3WzmxlDDKi4Fnv2+12VO3veuLpXJ3KmrGKTv8Rnwo1vLW+8BiFzWGaDbPP
 sX1US0i2uG+MLavxLw0sAtEdk8BWGX2OrxhYlIZjVC7pXIfFBJPqKM2cRwdf2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, miquel.raynal@bootlin.com,
 michal.simek@amd.com, richard@nod.at, vigneshr@ti.com,
 liang.yang@amlogic.com, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 kees@kernel.org, gustavoars@kernel.org, linux@treblig.org, robh@kernel.org,
 u.kleine-koenig@pengutronix.de, erick.archer@gmx.com,
 christophe.jaillet@wanadoo.fr, val@packett.cool,
 christophe.kerello@foss.st.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, krzk@kernel.org, jic23@kernel.org
Date: Fri,  6 Sep 2024 17:03:34 +0200
Message-ID: <20240906150334.734568-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-9-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f3b3c47ca41f696623e71596416d34fe1671d229'
X-GND-Sasl: miquel.raynal@bootlin.com
Subject: Re: [Linux-stm32] [PATCH -next RESEND 08/10] mtd: rawnand: renesas:
	Use for_each_child_of_node_scoped()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, 2024-08-26 at 09:43:26 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
