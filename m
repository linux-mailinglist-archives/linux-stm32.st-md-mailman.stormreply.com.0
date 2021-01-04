Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E895C2E9951
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jan 2021 16:58:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A328DC56634;
	Mon,  4 Jan 2021 15:58:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FDE6C32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jan 2021 15:58:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BA9520769;
 Mon,  4 Jan 2021 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609775880;
 bh=LoOOq2YendorTfy/uNCtlLdS5EtflOQg3elL8akGBGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MnLcdZNUAbuVcy/SLnrspfYBnwQ5nV8/8v0QZf6twKG1pJ0joyU0zYfYCB3u3DFdd
 fbEd5+GYtOFDEaGtoVqDEHe8P6HLQOrB91KVwxRmD5O2WNRTmDvsF1UffE5mecHiPV
 7FwGQMyenSsdkZ9iZcGIHPznbx/1/8brfa5f+HlKhr4mD4JXKpTgkbGkom2u7gYnwH
 BV+e9n4Kc1ijqsHFKT4JCf+mTtryGlJhy+nnNuMm6qWpsRt/uMENKHuB79YsUF+cuw
 829zo95jN6mNak3S9zaQD8N4+NWO2QR4OExqIyGw1OANllw+1vfahMRi0Fl3otjIij
 0uBi62TmKHFWQ==
Date: Mon, 4 Jan 2021 21:27:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20210104155755.GI120946@vkoul-mobl>
References: <20210104142045.25583-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210104142045.25583-1-amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] dmaengine: stm32-mdma: fix
 STM32_MDMA_VERY_HIGH_PRIORITY value
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

On 04-01-21, 15:20, Amelie Delaunay wrote:
> STM32_MDMA_VERY_HIGH_PRIORITY is b11 not 0x11, so fix it with 0x3.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
