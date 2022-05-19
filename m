Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B76552DBE3
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 19:51:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE041C57183;
	Thu, 19 May 2022 17:51:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E505C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 17:51:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A4F8618D6;
 Thu, 19 May 2022 17:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB05CC3411E;
 Thu, 19 May 2022 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652982702;
 bh=4HOH8hGdisT7kvObHMoru1/cjL66qqMhvek5a+tvt8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AI4Pzlgd6rgGA2MBUXLnpQtyJJgNqOZOhfsS5eIObcFDhd+TMl5OgUVUDxE3ihWDY
 6KkxbTJJuYKnmcrkzwRveKHAM9zr50hGesj+yPAeSSD+NdSmHQSRV2k7eibI+vum93
 dG9zDs1n0b2SdE72RcEFfzyWHpUR5QAjq1G+RTV8Yf4wBD49jbCq1Ad2cMO9M6uxUJ
 ha1m8E/UYcFMfZVFHW3APvyMyUYq/BLIN0TfhlXkkmveWAvBjDArePvITEQh/IsDdk
 947AGtvPgaU3uOc03a4yRs9Jp43bWrQpOLoKuidgBum440XPk/mEkeINywsVTK79ce
 Ay269JkheM9lw==
Date: Thu, 19 May 2022 23:21:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YoaDqY4xa/Yq8ECS@matsya>
References: <20220504155322.121431-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504155322.121431-1-amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] STM32 MDMA IRQ handler code cleaning
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

On 04-05-22, 17:53, Amelie Delaunay wrote:
> This patchset cleans stm32-mdma interrupt handler:
> - GISR1 register is not used on any STM32 SoC with MDMA
> - Remove chan wrong initialization
> - Lower the log level to debug instead of warn in case of spurious it
>   on stopped channel

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
