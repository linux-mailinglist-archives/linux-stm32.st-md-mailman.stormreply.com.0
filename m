Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3086154534
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 14:45:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DAFCC36B0B;
	Thu,  6 Feb 2020 13:45:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30FCEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 13:45:36 +0000 (UTC)
Received: from localhost (unknown [122.178.198.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC66521775;
 Thu,  6 Feb 2020 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580996734;
 bh=21B1htHlSXP+EtSU9SC4zC69SofeXvGLzj2qSGbg6VA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tlwz94dY/S6h58vaVEkN+y235uq3TjML3gxqp6SJtVBoSAknq3GnQuw3EEuvrPuzl
 k0/FZIoXE1a7Dgl0VfvfAcX5sgo0UhNS4+BMYhgUS6os2SJyoE4k9CM4ctBh+dERXF
 VvzrVuMB841uk/o/zxU59YNS3srmNGn9Yoj/kXmA=
Date: Thu, 6 Feb 2020 19:15:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: David Miller <davem@davemloft.net>
Message-ID: <20200206134530.GP2618@vkoul-mobl>
References: <20200206132147.22874-1-zhengdejin5@gmail.com>
 <20200206133554.GO2618@vkoul-mobl>
 <20200206.143753.1516354381077365451.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206.143753.1516354381077365451.davem@davemloft.net>
Cc: zhengdejin5@gmail.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix a possible endless loop
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

On 06-02-20, 14:37, David Miller wrote:
> > 
> > Also, I think this should be CCed stable
> 
> Networking patches do not CC: stable, I queued them up myself manually.
> 
> Please read the netdev FAQ under Documentation/ for details.

Oops sorry I forgot about that part.

Thanks
-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
