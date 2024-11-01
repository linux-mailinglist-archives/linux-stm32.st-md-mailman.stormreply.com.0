Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C329B9203
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 14:31:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11B34C78013;
	Fri,  1 Nov 2024 13:31:34 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3BC5C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Ql376oc4wnaREcGn5krPx7lcPHscqZvo3JrbE7OYvGc=; b=uSoDTAZ/cIqasDwVtIG+CgRyvi
 viyfU4jVibbVCiECNT+PYWBrfx6BtAIbKed4/gdLYcACo2wsegoX2Q7yizHq+37NvkZUQZBQKbL5d
 LducaW7+attn4I75C/XMCl0SEubk0RtCMp/Y2ugT4hceF0VngTf7QqY3zRPuOJdBxCdI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t6rk3-00Bso8-HF; Fri, 01 Nov 2024 14:31:07 +0100
Date: Fri, 1 Nov 2024 14:31:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Message-ID: <38e4fc09-7c88-448b-b9e8-f9a082f1dcf0@lunn.ch>
References: <20241101082336.1552084-1-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241101082336.1552084-1-leyfoon.tan@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, lftan.linux@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] code From
 d0f446931dfee7afa9f6ce5b1ac032e4dfa98460 Mon Sep 17 00:00:00 2001
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

On Fri, Nov 01, 2024 at 04:23:33PM +0800, Ley Foon Tan wrote:
> This patch series fixes the bugs in the dwmac4 drivers:
> 
> Patch #1: Fix incorrect _SHIFT and _MASK for MTL_OP_MODE_RTC_* macros.
> Patch #2: Fix bit mask off operation for MTL_OP_MODE_*_MASK.
> Patch #3: Fix Receive Watchdog Timeout (RWT) interrupt handling.
> 
> Changes since v1:
> - Updated CC list from get_maintainers.pl.
> - Removed Fixes tag.

It looks to me that the first two patches really are fixes? The last
patch is just a statistics counter, so probably not a fix?

If this is correct, please spit these into two series. The first two
should target net, and have Fixes: tags. The last patch should target
net-next, and does not need a Fixes: tag.

> - Add more description in cover letter.

The Subject: like of the cover letter could be better.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
