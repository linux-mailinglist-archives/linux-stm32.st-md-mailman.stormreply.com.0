Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F87F81BCD8
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 18:18:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8E8BC6B477;
	Thu, 21 Dec 2023 17:18:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37E89C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 17:18:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 052FC619EC;
 Thu, 21 Dec 2023 17:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0A4C433C7;
 Thu, 21 Dec 2023 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703179111;
 bh=na3rzBCDzzrE1fWEebLVq6pSc/yHaENpPtcr9w+HKlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uHRMUumzUMZZWeQO/k4+2dNxy0QYbAaj+36VW+cCckTP54f3NYd9tQDEoCLeWysgd
 VkKhwvKJxRhUzuX+o3o3uWFrK1rgJmkQUlba2NScFDUUIQZGivoJpkh+A8wSTM0ePt
 JhqokoK+6ZUFWeR5qGGfGG3fWcqTnYzp6WtaT6cc0gdE8u0YIhDNYlynNbumJahigV
 NIFbuOlu1E5gxO33K7kGv3bZZD06MWYKssQde/3Zpiww1tV55BJ3Qw9N19uUNNaFKj
 bSOjgNwx+mWqM6OIy2XWLpGotgWE735d0yy2zwMf3f3rr0ZmZTm8b/k6zHs+hf9alE
 gY8A6+nfI8oGw==
Date: Thu, 21 Dec 2023 22:48:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <ZYRzY3ul9UzD9d06@matsya>
References: <20231213174021.3074759-1-amelie.delaunay@foss.st.com>
 <ZYRkP-m_sra8qUNZ@matsya>
 <5e007fe4-d6cd-4ec3-b9c1-ef7841e29851@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e007fe4-d6cd-4ec3-b9c1-ef7841e29851@foss.st.com>
Cc: dmaengine@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: add channel device name to
 channel registration
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

On 21-12-23, 18:11, Amelie Delaunay wrote:
> Hi Vinod,
> 
> On 12/21/23 17:13, Vinod Koul wrote:
> > On 13-12-23, 18:40, Amelie Delaunay wrote:
> > > Channel device name is used for sysfs, but also by dmatest filter function.
> > > 
> > > With dynamic channel registration, channels can be registered after dma
> > > controller registration. Users may want to have specific channel names.
> > > 
> > > If name is NULL, the channel name relies on previous implementation,
> > > dma<controller_device_id>chan<channel_device_id>.
> > 
> > lgtm, where is the user for this..?
> > 
> 
> I'll send beginning of next year a DMA controller driver for STM32MP25 SoC
> family. It relies on the dynamic channel registration. It will be a user of
> this dma_async_device_channel_register(struct dma_device *device, struct
> dma_chan *chan, const char *name).

Okay, I prefer to add a API with the user.

Thnx

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
