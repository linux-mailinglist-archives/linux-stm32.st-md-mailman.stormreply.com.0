Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42372619A61
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 15:43:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E12ACC65042;
	Fri,  4 Nov 2022 14:43:47 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86B58C6411F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 14:43:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DFEB4B82E2E;
 Fri,  4 Nov 2022 14:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18450C433C1;
 Fri,  4 Nov 2022 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667573024;
 bh=UBbkqkVceLOOAXfkK0cOsW2bKaYhwR/pDIEt/9iU3Sw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SML8AXMir9D9NFZrj5BLUfryJLJoZlXJLzxsPjgDTtfXha9tKT+ZNezKaXvoWRB30
 8b6BJBtm1hyNNU90UxQ4Wpz/Der716VtsAAuPjeM8FD5vepwjpPH6QV9LuA+RGqSrI
 UHxphMk9rFS9C6O8Sddr8XPbcUF6lZmOKNcoa3sfdmfK/ZsyDT6mWRRpGH8Pazhrh2
 cImPlnuijV+Ac9AtSCPShqkoadseh37DBVi+b+syszZ9HWsa2s1LnlDYgkMkkhKGKu
 yBgOQGlwM6jV9E1Jh/cSFEa/cOEILR2eSiptQQfod224Y4sDWbR5jyXu1pPt6dUDW8
 PBT+AcjxpUyNw==
Date: Fri, 4 Nov 2022 20:13:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <Y2UlHIp/9P8w/n5m@matsya>
References: <20221024083611.132588-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221024083611.132588-1-amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma: fix potential race
 between pause and resume
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

On 24-10-22, 10:36, Amelie Delaunay wrote:
> When disabling dma channel, a TCF flag is set and as TCIE is enabled, an
> interrupt is raised.
> On a busy system, the interrupt may have latency and the user can ask for
> dmaengine_resume while stm32-dma driver has not yet managed the complete
> pause (backup of registers to restore state in resume).
> To avoid such a case, instead of waiting the interrupt to backup the
> registers, do it just after disabling the channel and discard Transfer
> Complete interrupt in case the channel is paused.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
