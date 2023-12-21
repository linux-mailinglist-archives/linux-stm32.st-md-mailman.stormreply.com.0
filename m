Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF981BC02
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 17:30:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E92E1C6B477;
	Thu, 21 Dec 2023 16:30:18 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A472AC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 16:30:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EA053CE2039;
 Thu, 21 Dec 2023 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A3FC433CA;
 Thu, 21 Dec 2023 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703176214;
 bh=A57ukB5dDklEZ9q0kgCWQa6lMi3LSmaS7YQSckNb91Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=P1HrzvHWzb/+3jULyDf6W9QWJPsgKr5LDrGbm1XLEwRz9R0015HLoNtLisFIoKRT+
 u753KdaTa2kMDgpHg6AoYVyShNVOVH5p4/+UySAFwdFBjH26xRMrhpbxM59i1E8/ZE
 6ty2JTBNAxxjWl9m49KGmFtREZZ5hxgj4t2aymcYH5nE1tWSwJqU6IVEeOnBAhUNZR
 jben7mscQwQWRFleCIIsDt5E7syQP9KIMeFJE2Tcuv/HIDTK+90x6kunvYqzR/+kdO
 Kc9nssCHoC60gPXLhc+sKTjYmw6f5gXLwxbyKYjgz+GNg0/eUzV4ED7aJHpcOKZ3dN
 3a7MM7miVPoSA==
From: Vinod Koul <vkoul@kernel.org>
To: Dave Jiang <dave.jiang@intel.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20231213160452.2598073-1-amelie.delaunay@foss.st.com>
References: <20231213160452.2598073-1-amelie.delaunay@foss.st.com>
Message-Id: <170317621281.683420.8268114839792721931.b4-ty@kernel.org>
Date: Thu, 21 Dec 2023 22:00:12 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: fix NULL pointer in channel
 unregistration function
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


On Wed, 13 Dec 2023 17:04:52 +0100, Amelie Delaunay wrote:
> __dma_async_device_channel_register() can fail. In case of failure,
> chan->local is freed (with free_percpu()), and chan->local is nullified.
> When dma_async_device_unregister() is called (because of managed API or
> intentionally by DMA controller driver), channels are unconditionally
> unregistered, leading to this NULL pointer:
> [    1.318693] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000d0
> [...]
> [    1.484499] Call trace:
> [    1.486930]  device_del+0x40/0x394
> [    1.490314]  device_unregister+0x20/0x7c
> [    1.494220]  __dma_async_device_channel_unregister+0x68/0xc0
> 
> [...]

Applied, thanks!

[1/1] dmaengine: fix NULL pointer in channel unregistration function
      commit: f5c24d94512f1b288262beda4d3dcb9629222fc7

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
