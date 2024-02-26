Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E128671B7
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 11:44:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8897C6C83D;
	Mon, 26 Feb 2024 10:44:47 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B819DC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 10:44:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA30AE0002;
 Mon, 26 Feb 2024 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708944286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AO4akNw+96Nu8tYAznJ+U/EWh5SkwWOrFAKal+L/WwY=;
 b=MoqjKKzWXG0b3EBe8D9j+rmKxHoUn0TlC8U+WLxwFy6KATGubMq+rkhE3TlWjpNWEYeMe5
 /xgaTNwLMeFUwEfo2IjJNWpYxMn0rJsNuuj0rcJho501SWMzUvwXijWRCii9gtN16CUCpL
 2H5sFXeWTbdSxQz2wx2Z5rGP6Ua33RC24ejaIH4Q7foyQA47I8ee+81vhjXpoUtydQHcK5
 mGnDEH3zN4nXz5gEVLOxGDKv6eXT61ewSjxeXkP4qnub/qnpGv1eHfG+r5UZ0QCZpS7oVv
 XC3768fpMK1InfB9vN5lO45qmKJcr1mPYyeAkdGbfWC4pDTuGvmGVJCvaDTCFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Date: Mon, 26 Feb 2024 11:44:45 +0100
Message-Id: <20240226104445.489926-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219140505.85794-3-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a9ae475cc60d908dfd232d1c064fc34ec51d3228'
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/3] mtd: rawnand: stm32_fmc2: use
	dma_get_slave_caps to get DMA max burst
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

On Mon, 2024-02-19 at 14:05:04 UTC, Christophe Kerello wrote:
> Use dma_get_slave_caps API to get the max burst size of a DMA channel.
> 
> For MP1 SoCs, MDMA is used and the max burst size is 128.
> For MP25 SoC, DMA3 is used and the max burst size is 64.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
