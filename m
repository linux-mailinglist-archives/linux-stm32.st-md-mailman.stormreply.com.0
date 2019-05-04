Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80669138A5
	for <lists+linux-stm32@lfdr.de>; Sat,  4 May 2019 12:18:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EEC8C1638A
	for <lists+linux-stm32@lfdr.de>; Sat,  4 May 2019 10:18:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12214C16389
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 May 2019 10:18:34 +0000 (UTC)
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1AA820675;
 Sat,  4 May 2019 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556965112;
 bh=0KX1gqAHG/+QLBLSshORNJlXTvHn1YJoWjdUaaUXvWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7MzHWZNDZgm9Qh0JTdXx83GNTV+vjuf5t+CEJmYUyB+049URk8X24UDMWBiveHHI
 B1qe5jekaRdx6wevSc1acu360Q5izS7RtypuWWvGc674fxWNPCImo9tMHZFYnCLH04
 sr8PPDfM4fZ6K0QEZAIXpqUCYGnmwxZelkgXFr50=
Date: Sat, 4 May 2019 15:48:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20190504101823.GX3845@vkoul-mobl.Dlink>
References: <1556789322-7232-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556789322-7232-1-git-send-email-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] dmaengine: stm32-dma: fix residue
 calculation in stm32-dma
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

On 02-05-19, 11:28, Arnaud Pouliquen wrote:
> In double buffer mode, during residue calculation, the DMA can
> automatically switch to the next transfer. Indeed the CT bit that
> gives position in the double buffer can has been updated by the
> hardware, during calculation.
> In this case the SxNDTR register value can not be trusted.
> If a transition is detected we consider that the DMA has switched to
> the beginning of next sg.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
