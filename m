Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F05C483087
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jan 2022 12:30:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2671C5F1EE;
	Mon,  3 Jan 2022 11:30:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DE3FC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jan 2022 11:30:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2230160FF8;
 Mon,  3 Jan 2022 11:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F8AC36AE9;
 Mon,  3 Jan 2022 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641209424;
 bh=PJcapKAIeWCUQ8GEVmO6uaKfnmXoKarLeDRQFQ8RRmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lAY4Akej43xDQ97sjIXy535eaDqM81L/c/e6eFlI227rlPAmVbmajUjKE6ibSGk/I
 wnLfwC8nzjz36FgejGavM3szdsoGS9wA9vpcEPFdIbyqTHfMbE3CN52hCcWxvkGDHU
 9xpzMr3S6lxtoIaMCkcHqHPYzygNpUj8BSi1ie03uL+9NZhKWljyeUMXxjR0ek/PlF
 uGRI/qoVIhihMp30DHtksnsklHM/0kUl64dENP421pnE3BqifnBp1XgK2kpZOHiaUi
 T6atGKekATheFBtX1ModuAqzrK5IgtrWI46g+aVuDDpkSv/IkcdWJA6TLyjG6F3FBQ
 1knCr03OsXQJg==
Date: Mon, 3 Jan 2022 17:00:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YdLeTC+H92xZHi77@matsya>
References: <20211220165827.1238097-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220165827.1238097-1-amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] dmaengine: stm32-mdma: fix
	STM32_MDMA_CTBR_TSEL_MASK
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

On 20-12-21, 17:58, Amelie Delaunay wrote:
> This patch fixes STM32_MDMA_CTBR_TSEL_MASK, which is [5:0], not [7:0].

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
