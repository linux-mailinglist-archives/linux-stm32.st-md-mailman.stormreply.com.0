Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 056E59A26D5
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 17:35:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0587C78032;
	Thu, 17 Oct 2024 15:35:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12F41C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 15:35:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 652445C5942;
 Thu, 17 Oct 2024 15:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C6CC4CED6;
 Thu, 17 Oct 2024 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729179341;
 bh=P1lQx9wD81DvlOvlceUyKmrKzmEfjIo6JQtVyhf4K9o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bOHvnN9g8fljhOdINWlyNyGP4IZRmhKnmafva44/BXp+zznL1xVmMDoCfLADuqVil
 YL0HYtlcgrWHTaizPUmV0Qc6BZfxj3lmBuGJa9PBpDzktUV3f3OGqAN5JTC5qKSlEs
 OncktYtJPj3VHz4jriSezjena8f5qx51B+j+3NTKZDicX684p16QO4rVlou96solup
 69Jeueio4FIaqLkye6lqUbr8s87WewcDfJ8fdGPU/Sjzj8TYU9xHETZxjXGM3FH8p2
 IhnUrycAoWYIqzj+zdJW6hBhFGIC7s4Um68/J6VaE9ZM23LNDpK1wPtgSYrVy9ptLq
 uB/JVZcCPs3Pw==
From: Vinod Koul <vkoul@kernel.org>
To: christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20241017040657.33992-1-yang.lee@linux.alibaba.com>
References: <20241017040657.33992-1-yang.lee@linux.alibaba.com>
Message-Id: <172917933891.288841.1409635021239519028.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:05:38 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: linux-phy@lists.infradead.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH -next] phy: stm32: Remove unneeded
	semicolon
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


On Thu, 17 Oct 2024 12:06:57 +0800, Yang Li wrote:
> This patch removes an unneeded semicolon after a switch statement.
> 
> ./drivers/phy/st/phy-stm32-combophy.c:226:2-3: Unneeded semicolon
> 
> 

Applied, thanks!

[1/1] phy: stm32: Remove unneeded semicolon
      commit: e592a65584fce0852825156086cfa1d5ef4dc2b0

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
