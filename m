Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CBE5BE02F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Sep 2022 10:34:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0957C6410D;
	Tue, 20 Sep 2022 08:34:11 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BEA1C640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 08:34:10 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F674100006;
 Tue, 20 Sep 2022 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1663662850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fI6KR2XYkMm0fNXZ4hXvpp4VJ410FJUanuWhIpjAvl4=;
 b=EJbgurdM6G5JlkUnG3NVn6aXa7kFc+M2OS0B0Z48WTxHAh1+0QKyZZopom8W8zFHgCWtj3
 7svawuzjkBRwzvjblSNJ/tO2lHafieGYBlTXcTbqsBUhh/RRI8JXN4SSJyPm3NrfCnj4RP
 EEHoBiFtF1mTLUKPAlKlsD1NYKf4J0SbQ7GEx3u1948MEbF8WFuzPiPXzHPMR4rEBQZjXw
 D9eanBUo8R1Rx5YqSagJq+PlpvlsNZG6+kcrUXiLgu4Pl8dRzHR1eDoeUwlWfU5ocpR6Xc
 DB4Ug0PGDx0yeyeUn8AHIKj6vgzN6VneYTXY/7k5lYz1cG3r/riPO1Ni2H7W4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jack Wang <jinpu.wang@ionos.com>,
	linux-kernel@vger.kernel.org
Date: Tue, 20 Sep 2022 10:34:06 +0200
Message-Id: <20220920083406.601177-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819060801.10443-5-jinpu.wang@ionos.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'10ca72235c7754f11abca2197a16e0608ff5fc4f'
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Cai Huoqing <cai.huoqing@linux.dev>, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 04/19] mtd: rawnand: stm32_fmc2: Fix
	dma_map_sg error check
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

On Fri, 2022-08-19 at 06:07:46 UTC, Jack Wang wrote:
> dma_map_sg return 0 on error, in case of error return -EIO.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: Cai Huoqing <cai.huoqing@linux.dev>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
