Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E498D8961F0
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 03:23:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99628C6B45B;
	Wed,  3 Apr 2024 01:23:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C491BC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 01:23:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7492860C37;
 Wed,  3 Apr 2024 01:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769A7C433F1;
 Wed,  3 Apr 2024 01:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712107433;
 bh=Yy3W35jtTdyObIhJ/w2Brxj+AIW5aDDLh0ei+LhZZUo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SIWb1X+DZwHj4mHi9J3FOltBIYLuYyWy5XHMgk6IGbuxD7JDxd6Vcze3wRIHkmlKB
 eVMUSkF1MF+ueaF6HjJq9TqXB7TcgnrlyhXUeUlbgFd/3UcxAGIcc59vEhd3gfA6jt
 S1IyofvTDw5rTYFznLP0lY8gYUSo8n/fU10QO0F3rPnxqfFJx0MoaoEgJT3VtFgocD
 sZ6QcH0rQNEjgoWY8RZTdedkLHdatfzIrPLETbDluALQGK4SMzLxMHW52E0LwET4yU
 kRrhTYOLHEv9S5kuwUUp4e76ZIExuJXfW0j3VPBA9cxD7+1gLGx3r6Ga1fdwxN8vOx
 qnzAvh/pG5eGQ==
Date: Tue, 2 Apr 2024 18:23:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20240402182351.031f5b59@kernel.org>
In-Reply-To: <20240401024456.41433-2-minda.chen@starfivetech.com>
References: <20240401024456.41433-1-minda.chen@starfivetech.com>
 <20240401024456.41433-2-minda.chen@starfivetech.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: mmc_core: Add GMAC
 mmc tx/rx missing statistics
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

On Mon,  1 Apr 2024 10:44:56 +0800 Minda Chen wrote:
> +	unsigned int mmc_rx_control_g;

What's control_g?
If it's number of received control frames it should be reported as
MACControlFramesReceived from ethtool_ops::get_eth_ctrl_stats.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
