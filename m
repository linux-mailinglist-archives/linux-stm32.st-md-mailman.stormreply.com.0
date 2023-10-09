Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C414F7BD320
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 08:12:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B0DAC6B442;
	Mon,  9 Oct 2023 06:12:53 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 192C6C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 06:12:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5FA5CCE0FB9;
 Mon,  9 Oct 2023 06:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60681C433C9;
 Mon,  9 Oct 2023 06:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696831969;
 bh=qJEBc8o2ZV06sm/dmj3FbZTvrSDw0aYx8qLgkYtyhM8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oWyg/PPfQLgsreoGrYsB8yYD4BCn+DHGyL9ftulsoNJ5xYZzrS9kncTfgUp4ur8sk
 +h56OHM285gqKhEr6TH3FVo46QLAKZGxxHWkST31AjeuRoCr/Bx4Hmv+/fFumKOSOq
 oddosbzmWDKqSYNH9JKMjPxX7t7dXKfGFlBSlp4GDJbg2GsYWUt7ZyUCJ5Wkvmz5VY
 g57aKs7IuRQJkZfSCQyTNYGUncNXB+7CbVznYq035j6B+7L5hTUDlZIkj8h/sgBvFq
 6fbWvH/jBVylJrKi64pzyhf7n8gbO6KdVyGrED9enjtLqHfmX9nv1hzfGgkSEsMTWq
 6GUIDddCtNFbQ==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20231004163531.2864160-1-amelie.delaunay@foss.st.com>
References: <20231004163531.2864160-1-amelie.delaunay@foss.st.com>
Message-Id: <169683196592.44135.17868056770840545307.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 11:42:45 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dmaengine: stm32-mdma: abort resume
 if no ongoing transfer
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


On Wed, 04 Oct 2023 18:35:28 +0200, Amelie Delaunay wrote:
> chan->desc can be null, if transfer is terminated when resume is called,
> leading to a NULL pointer when retrieving the hwdesc.
> To avoid this case, check that chan->desc is not null and channel is
> disabled (transfer previously paused or terminated).
> 
> 

Applied, thanks!

[1/3] dmaengine: stm32-mdma: abort resume if no ongoing transfer
      commit: 81337b9a72dc58a5fa0ae8a042e8cb59f9bdec4a
[2/3] dmaengine: stm32-mdma: use Link Address Register to compute residue
      commit: a4b306eb83579c07b63dc65cd5bae53b7b4019d0
[3/3] dmaengine: stm32-mdma: set in_flight_bytes in case CRQA flag is set
      commit: 584970421725b7805db84714b857851fdf7203a9

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
