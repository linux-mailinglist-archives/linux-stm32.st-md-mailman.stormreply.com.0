Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591739544C
	for <lists+linux-stm32@lfdr.de>; Mon, 31 May 2021 06:03:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 219FDC57B69;
	Mon, 31 May 2021 04:03:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89CE8C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 04:03:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD10F611AC;
 Mon, 31 May 2021 04:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622433823;
 bh=0xfMtsHewwb7fTSKcKv14cPltEk1ithOlhx+6gwiMWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YH4XE324kuwVcxWwphHA9vmTHk3uOkBaY0gEBmL90Rkd2umcwWyJEcz4vBFw89xuo
 gaAw4gElZ2x9ARafnLx6MgO4gRUCZNy07c27Asx2k5ngrVqa6MjU5MS6FLxMgscq+N
 86AyApEbCSXfmohHU2EExJ6P1RF5K39ZI7/GU6/Med5DJTFNwfms4UXieXq0Xqj7j5
 7s8/lKiMcbYB6hBjxmvszUKm/S6x9vAhXieRTR6kfguTcRPgnwrHDCdtPKQDhetYN9
 opAE80XSsBpPVHuoWo2X8iH+Fk5wTHhhCl4c3Xc5yaVo+/g3fDeF5+e4LF86piqwi/
 XoySnNHa+7ltQ==
Date: Mon, 31 May 2021 09:33:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yu Kuai <yukuai3@huawei.com>
Message-ID: <YLRgG+mK1exroXrh@vkoul-mobl.Dlink>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-2-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517081826.1564698-2-yukuai3@huawei.com>
Cc: michal.simek@xilinx.com, yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dmaengine: stm32-mdma: fix PM
 reference leak in stm32_mdma_alloc_chan_resourc()
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

On 17-05-21, 16:18, Yu Kuai wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
