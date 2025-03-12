Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2EEA5E238
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 18:06:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E9F3C7128F;
	Wed, 12 Mar 2025 17:06:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6736C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 17:06:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C1D815C5CD7;
 Wed, 12 Mar 2025 17:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3862FC4CEEA;
 Wed, 12 Mar 2025 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741799191;
 bh=Ku0zOGsgy8nW6TnGyeloxNuOmdzoa1Y4XqlQKPQdjPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BUkNneDdy4EQ1GGzUpIewE4E4iTQmS0e9bVbzsMi3PHjvkj/O783BQSn5VTPFDGxt
 vuoTI0RaaY5t6ILNVue9uAIPvOq0kMnkTgl7nCMOhXZlkF++JB7ZrZPOOPiRqrJdSk
 +65SdIAYPreQ+sHathgQZz6hLTU6KOeAM/unXaVoXTrqu8VILDKEJqH5dmcueyfsfh
 niXA2hvWzDVU/nG1EBbBiJ1bkU0LlMYugSqNxEEAGc8ohDaEnOlQAPw3Nmifoy6EmK
 CwUPkmPAPJOnKVFkDCVOLiB3XBrEvLS4tzRW+29IxIToXuU+s4pcECGhuYLO0UzvRY
 prTE+ERTfIQ3g==
Date: Wed, 12 Mar 2025 18:06:21 +0100
From: Simon Horman <horms@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <20250312170621.GW4159220@kernel.org>
References: <20250308213720.2517944-1-jonas@kwiboo.se>
 <20250308213720.2517944-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250308213720.2517944-4-jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] net: stmmac: dwmac-rk: Remove
 unneeded GRF and peripheral GRF checks
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

On Sat, Mar 08, 2025 at 09:37:15PM +0000, Jonas Karlman wrote:
> Now that GRF, and peripheral GRF where needed, is validated at probe
> time there is no longer any need to check and log an error in each SoC
> specific operation.
> 
> Remove unneeded IS_ERR() checks and early bail out from each SoC
> specific operation.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
