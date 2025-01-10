Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0821A08432
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 01:54:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94D71C78011;
	Fri, 10 Jan 2025 00:54:58 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17379C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 00:54:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 97BABA41631;
 Fri, 10 Jan 2025 00:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A477C4CED2;
 Fri, 10 Jan 2025 00:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736470489;
 bh=An7XqfSUMLwrY40eKxuhc/R7ct4U+ZFUuaL7mUE2bBo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aCbRiwgsgoH9GYITCVeOe1M59ZZvJNVbVpgb6KdwJaADf31LmsNnBIvPZ8i+x6dza
 yLRbCYYMWJTjDxQJVhBbbz9j38SVdse0DgQB5Z8fMYtXZcdtHvh0AWRRF1RCH0JHnJ
 X4HE/IoddNq5d3tFw8uGZVC6LAPMyZoNz52Uvyh0bdJZ4ZMJ+6g5px7EmajI8CyrYI
 QlEasfKwtF9LDjoo0M+F/4mqhV0tABhGoZc8KogfpSVdiZv6lf9GaApZniVxTp1NOy
 EF6EjPGSjZYSz6XoFNMg6UyZmC9vRWp91rv7kw5TNlSfu2+DCRxPDshcNbQDshQfvZ
 f9ymmynN6L2IA==
Date: Thu, 9 Jan 2025 16:54:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Parker Newman <parker@finest.io>
Message-ID: <20250109165448.53cb3e48@kernel.org>
In-Reply-To: <6fb97f32cf4accb4f7cf92846f6b60064ba0a3bd.1736284360.git.pnewman@connecttech.com>
References: <6fb97f32cf4accb4f7cf92846f6b60064ba0a3bd.1736284360.git.pnewman@connecttech.com>
MIME-Version: 1.0
Cc: Parker Newman <pnewman@connecttech.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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

On Tue,  7 Jan 2025 16:24:59 -0500 Parker Newman wrote:
> Nvidia's Tegra MGBE controllers require the IOMMU "Stream ID" (SID) to be
> written to the MGBE_WRAP_AXI_ASID0_CTRL register.
> 
> The current driver is hard coded to use MGBE0's SID for all controllers.
> This causes softirq time outs and kernel panics when using controllers
> other than MGBE0.

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
