Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A94A08D0E
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 10:55:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C8A1C78011;
	Fri, 10 Jan 2025 09:55:15 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0594C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 09:55:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8DE5BA41C63;
 Fri, 10 Jan 2025 09:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26485C4CED6;
 Fri, 10 Jan 2025 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736502913;
 bh=gkpmHwnR8Yh/n2rNCUGtcEYp1sllwOnm/9K7DGRRUzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QItRPsT0l45znuNh9ylybQ2raG04cRGacxDaULTQjfASc3ljcAcN3fEPXrtBXqb+p
 WxPuyaE0d8IDZ9MAqTXM+ZQTPBfIW21sWkmX9gpzLgaVHsRTX7ks8+rvu9wwOOc9fn
 Om5dh2yMYMF+cojubaOPFKgzmpdIxvUz3V5E1yEyi1r9PpA7xSc0oOWcjcMBgCsgYU
 RZZMEbBz/DYif8pmzqYtRvpPgEIK5Gku1mEmKYs2bVtTfuxnzcN0FUUWh5RyT2fFWS
 MJT5XB4gIOXEBD8ws0bhuFQdxyf+BUzugMTS9xSdJmRPtAHAQ6SK9/fEMHEh9KHYAz
 kjva7Qi2GRWTw==
Date: Fri, 10 Jan 2025 09:55:08 +0000
From: Simon Horman <horms@kernel.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Message-ID: <20250110095508.GT7706@kernel.org>
References: <20250109155842.60798-1-rgallaispou@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250109155842.60798-1-rgallaispou@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: sti: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

On Thu, Jan 09, 2025 at 04:58:42PM +0100, Raphael Gallais-Pou wrote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> Changes in v2:
>   - Split serie in single patches
>   - Remove irrelevant 'Link:' from commit log
>   - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-5-c7d4c4856336@gmail.com

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
