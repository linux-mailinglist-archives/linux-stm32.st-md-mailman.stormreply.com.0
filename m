Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05F604724
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Oct 2022 15:31:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FF0DC64104;
	Wed, 19 Oct 2022 13:31:34 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F75DC55596
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 13:31:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E47E0B8201E;
 Wed, 19 Oct 2022 13:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D43BC433C1;
 Wed, 19 Oct 2022 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666186291;
 bh=yrinlrU4GJFw5V8Pbm68WtjQ9PDNU+MEIvH4dMiemYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QtQfot2R1zDOvLSyEHXFdv4m6AtscL8NOugTTNHxO+zgyBqLUIk6KxyuELqdVJ8/O
 x67CsoRPxX0cPDzoDEDAGTZ+B/8jAtZvOv25VRXmXoBdVsDmoH079a0nihfQlvLnsF
 +3ef9CUOjsloN1Dg/i001SdTCiTgm6+MvfMAvhNk+VPRGEXnaVG1zZTD4WF6PVD3MU
 46Rw4f22OZqWkUIReKjLqVOGHVFPnWwk2dFjkLO/Y8HOSLv/ZWDg6Y00FY3aMgCAop
 lx70EsZgKD1zmUlwl+zjMvY/Nm7Nq+pGFGvvHO4+NyVmMG0nkKkpPSmXPifOZABD7r
 NgnZMvkrMIepA==
Date: Wed, 19 Oct 2022 19:01:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <Y0/8L/13dozOA+WG@matsya>
References: <20221017131413.202567-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017131413.202567-1-amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: memset
 stm32_mdma_chan_config struct before using it
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

On 17-10-22, 15:14, Amelie Delaunay wrote:
> New bool m2m_hw has been added at the end of stm32_mdma_chan_config struct
> to support the STM32 DMA MDMA chaining.
> 
> m2m_hw is set true in stm32_mdma_slave_config() if peripheral_size is set,
> but m2m_hw is never initialized false.
> 
> To ensure this case, and any further new update of the structure, memset it
> to 0 before using it.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
