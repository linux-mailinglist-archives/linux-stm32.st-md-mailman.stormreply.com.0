Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1A54E69D
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 18:04:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 026ABC56630;
	Thu, 16 Jun 2022 16:04:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AB02C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 16:04:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 114F0CE2605;
 Thu, 16 Jun 2022 16:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44116C34114;
 Thu, 16 Jun 2022 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655395459;
 bh=JO1HKRHKxu7WPx4qEiPzXk5d2zmhZIc2D4Xy7QgyiF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BAFkbaIUC20fFE5GCcvpoVmvmbSEA6WSMh2h3yqpAZDE0NQ3LBFxa7vTFy3kWPrLO
 WIgy/BU6jxpWtmHuRnNfFCeg+Sl/l4sU19T0vWG6T9ObRnVRUCbbRoW2ObJvXTMnIQ
 vRTCu0s8M64Ev0hCFHaEEFaAzyNiY95k2VN7HVH/myMefuTb+IYGZYb6KoDFgj0kny
 A8wYG6wVvsjsa0m3BdNi0m5uAE1U8B78/lNGfGabovaoxnD20JmvFPg69p8hGhxQP7
 dJCsiq1pBi6sXDN3SICmhmLmbX1b7uqIFII7tzw9WXZjuL7/xu51uFEi0gtDDESmwP
 ph107cKjXreYg==
Date: Thu, 16 Jun 2022 09:04:18 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Message-ID: <YqtUgrNQphUjJpvu@matsya>
References: <1655072638-9103-1-git-send-email-khoroshilov@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1655072638-9103-1-git-send-email-khoroshilov@ispras.ru>
Cc: dmaengine@vger.kernel.org, ldv-project@linuxtesting.org,
 Amelie Delaunay <amelie.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: Remove dead code
 in stm32_mdma_irq_handler()
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

On 13-06-22, 01:23, Alexey Khoroshilov wrote:
> Local variable chan is initialized by an address of element of chan array
> that is part of stm32_mdma_device struct, so it does not make sense to
> compare chan with NULL.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
