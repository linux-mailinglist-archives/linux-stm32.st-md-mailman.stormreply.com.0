Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 897C0B2D156
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 03:22:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50AE9C36B29;
	Wed, 20 Aug 2025 01:22:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8CA9C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 01:22:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8AAFC5C5A64;
 Wed, 20 Aug 2025 01:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB17FC113CF;
 Wed, 20 Aug 2025 01:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755652929;
 bh=giJrwNr4gTNI+BHt14QArf7z8KvI8kFYYAqwhT6nAzc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H/AKtw8RMqpy1JosLZEooNgULsO4wBZsWKirV3sTpu1SUB2bXcRfWL680obJWgZL2
 AyX7yUuQmp9vkp8MoF7VGXbza+fcDlaEm5p3EZovW9zmudPrjyGHouiATXHPu+gzu0
 e0fpta8hr+QKHjiGrwIuvKMFZVktAABjw1hXwGIXXaG1hQSTdfUfTTHd0EXKD1hvB/
 q/DbOERoiBF3qlZMa/h3Cg11HLD7szlcYO8lHJ+bihAfzFQWVVjlIIfxMmJqMknj0e
 BiuD7Ffl90P1nV82+pNwmGSinDFwuMfrPbwchulcA9nyCKIFPiUQMdVKrqYeWQyN8s
 1ZEURTQMJupow==
Date: Tue, 19 Aug 2025 18:22:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Message-ID: <20250819182207.5d7b2faa@kernel.org>
In-Reply-To: <20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
 <20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 rohan.g.thomas@altera.com, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Set CIC bit
 only for TX queues with COE
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

On Sat, 16 Aug 2025 00:55:25 +0800 Rohan G Thomas via B4 Relay wrote:
> +	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;

Hopefully the slight pointer chasing here doesn't impact performance?
XDP itself doesn't support checksum so perhaps we could always pass
false?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
