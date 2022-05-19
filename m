Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6652DBBD
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 19:49:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0864C03FE2;
	Thu, 19 May 2022 17:49:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D410FC03FC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 17:49:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 66006B824A1;
 Thu, 19 May 2022 17:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAB8C385AA;
 Thu, 19 May 2022 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652982545;
 bh=ac9xGH+1JIcnCHzru2IWbkDZOfZZiXdeXvfoHhLdoqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=spOW840KGB04EbAqRHdAwCEI4ueJigujG10gmrQZoJohM6H/G5k95LoEo8lMQIRUG
 kb5EgjV5RPlKUXKLzXwJlYXAPbrzUmvcCpkIsEy9yT7mj+kqsXctQyxtnyDoGSfPPR
 vGw9oRS1FSIl4okTHuPOQ27P3GZJb0Bmt537RCgrscZRYwICzTULien/6Av1HMM1Uf
 DuduX7Auy6kWgTAouMt+V/zK487LrCXmjI70yWCZx+rim2RgcJnonMLLim/HxoXn44
 3WcpcMhtBuuWBLGbev6CQvd8UXSbD2uoT8OpUBO9XydaZDIF6ZBHFHOQdVtSh4Y7aM
 KjdTCTo/HfA6A==
Date: Thu, 19 May 2022 23:19:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YoaDDFtLBjFWAJoQ@matsya>
References: <20220505115611.38845-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505115611.38845-1-amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] STM32 DMA pause/resume support
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

On 05-05-22, 13:56, Amelie Delaunay wrote:
> This patchset introduces pause/resume support in stm32-dma driver.
> [1/4], [2/4] and [3/4] ease the introduction of device_pause/device_resume
> ops management in [4/4].

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
