Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 738B496F7B0
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 17:04:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37F5CC78018;
	Fri,  6 Sep 2024 15:04:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5091FC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 15:04:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10FF81C000D;
 Fri,  6 Sep 2024 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1725635040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gVP1IO5B0KxwnAMcPOyPNDvjw/mvY2nbIjRYuUupdU=;
 b=lPF136AFaXPTVEKxnUQMWPcv+NslqQqYRoTBEdgY2gcjR9kVQpL2qGAMOp23FcUtGHqAal
 m6W2r6rK4/3g+NFSfeQtOQG21ZBHap2EfQYyAVC/vWZniDLb326RRU107oBb5UGa4yab+z
 AupglR5W41ecFm6fBikBJLW2i6kjgpO3SeNlEzdkMUZEbctp/Pwp68Emx4/96MVNsC+trh
 0tOCnVwOtENsa8b4qxAoHl9vR0djb5fKuZPzcRSdD7vX1yGHvIJwAP68a3h8NEjUDw8auw
 W5JtVwLM25N7hJws1c+MDFny/rk4NYO/BXqOpJiGfJ57aGAogkUW5ec+cjnfXQ==
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
Date: Fri,  6 Sep 2024 17:03:57 +0200
Message-ID: <20240906150357.734687-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-5-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'707f2d0720ed6831d736cca084b62ba97eb7fa23'
X-GND-Sasl: miquel.raynal@bootlin.com
Subject: Re: [Linux-stm32] [PATCH -next RESEND 04/10] mtd: rawnand: marvell:
	drm/rockchip: Use for_each_child_of_node_scoped()
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

On Mon, 2024-08-26 at 09:43:22 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
