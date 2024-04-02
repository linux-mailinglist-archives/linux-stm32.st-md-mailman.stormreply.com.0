Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E58894D92
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 10:33:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79A70C6B45B;
	Tue,  2 Apr 2024 08:33:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 261B6C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 08:33:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E045560F7C;
 Tue,  2 Apr 2024 08:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390D4C433C7;
 Tue,  2 Apr 2024 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712046804;
 bh=VdyK9CuL3U4VLQggfdxEFwARCxJ4gjiGjJcF5BjF0S4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j5ZmKJhF9YNAaMWvfZ9p1C/M+QVSL16VsCYBS8UfOrI8SQ1rSMMJsRYbcN8B+PRnW
 hfs/mbCY0u8bEDOeEdYHC+Wt9BPkMxNklqzesIH4T0NNeFmpw9OLhiTtWczoQNdBGA
 49ew90BVPFIZ4Cda2yniRtAaXdtbuhDZohFpkoUEzCTz1Cl6Dg9RGM2jUHH313XQGR
 H7ssHz7tNY1Ozhy8Z6ecc7qnaQSh0wIMfpTt9uGJq5cXskeG/2x0+K4gi1S6/v8VVc
 dIXDfmFaUO7duQBn7Qfm1d7sIrSPYYGXbTZNOBOIXDS1e4kknqbefftpJGamcRd42q
 zlcfE9PmyE7Kg==
Date: Tue, 2 Apr 2024 09:33:20 +0100
From: Simon Horman <horms@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20240402083320.GL26556@kernel.org>
References: <20240401024456.41433-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401024456.41433-1-minda.chen@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/2] net: stmmac: mmc_core: Add GMAC
	LPI statistics
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

On Mon, Apr 01, 2024 at 10:44:55AM +0800, Minda Chen wrote:
> XGMAC MMC has already added LPI statistics. GMAC MMC lack of these
> statistics. Add register definition and reading the LPI statistics
> from registers.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
