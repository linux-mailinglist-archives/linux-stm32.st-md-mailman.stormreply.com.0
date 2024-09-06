Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7F96F7AF
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 17:03:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D0DDC78018;
	Fri,  6 Sep 2024 15:03:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFB79C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 15:03:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32D6E60009;
 Fri,  6 Sep 2024 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1725635034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCE2Aeig1Xtcqxsj6OCesMJmx0Bzx3NcYdEg1kOU9Wc=;
 b=PunlC78BePp6i3CMkcel19x4PHIcMkhAoQtwHCtPb3f/8vgyKhRc4njyM1R8yUlHP5IadP
 4sOrUMZ86RJ2cXmTOITw+HIRlggZDpVCzT1VfBUqZ0dsb3MfwlpJjo/M8jDPUYN8Gont70
 AGNqpJRGxlaEzQCk6b+C1UTPQOwqsylksrCZyxc7QEQov8J9L8XwvpD9TAcgqkefj5o3Fl
 8pUErSqOrREkixPF39G2m0nTzGI8PwKQZDMPVfFVuKfwEYv4Fp6hWOpYUfnhClb4mglzrU
 +5co91phMXuldBvfqhxTKq44tpZqr82YMIlNc35Ul7+vcL1gK92/acbVnNnVOw==
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
Date: Fri,  6 Sep 2024 17:03:51 +0200
Message-ID: <20240906150351.734658-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-6-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0d5c32b5c877d61afc954c760dc58f3b8626ec04'
X-GND-Sasl: miquel.raynal@bootlin.com
Subject: Re: [Linux-stm32] [PATCH -next RESEND 05/10] mtd: rawnand:
	rockchip: Use for_each_child_of_node_scoped()
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

On Mon, 2024-08-26 at 09:43:23 UTC, Jinjie Ruan wrote:
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
