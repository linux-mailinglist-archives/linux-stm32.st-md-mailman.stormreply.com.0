Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C449C322F
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Nov 2024 14:35:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38820C7802B;
	Sun, 10 Nov 2024 13:35:48 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95540C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Nov 2024 13:35:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5E179A407F1;
 Sun, 10 Nov 2024 13:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7FBC4CECD;
 Sun, 10 Nov 2024 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731245746;
 bh=/Jzva/lnUCOfdvqz4t7Og5xoYDHm+1gt3wfXfs0Sr7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BgCRP6kreVpFhy+lQT4TBD1fmiDazlrZiRMTe+UBlJ3EpIaiWGjLkSZ+0CjF+1GJF
 urnTqcnW3LPRAtnx40v/JVw8DANTMJ8blZO3Empp+4HEheBplcGchYdn0DCTyaWCIw
 4BvKwazdIG7KXCtknQ1fmNKAny+pX9mb2Bz/DjA6njntGc5aaNSojuud7aJUTGfugQ
 DKcW5YVyWp0H/QJacUBCFnUAoO0ngUoeyeKO/1NIEk0iFzAiGViApAMB9ft2764eyS
 NO5+ZiQaYWcB/GF/RIgWT26HJc4xvcZbHWe2cXwzdiR3oGSRmK8MigWkUC9PhtiUu1
 E7nR0Rw1OrQgQ==
Date: Sun, 10 Nov 2024 13:35:40 +0000
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Message-ID: <20241110133540.GP4507@kernel.org>
References: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
 <20241107063637.2122726-3-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241107063637.2122726-3-leyfoon.tan@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, lftan.linux@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: dwmac4: Fix
 the MTL_OP_MODE_*_MASK operation
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

On Thu, Nov 07, 2024 at 02:36:35PM +0800, Ley Foon Tan wrote:
> In order to mask off the bits, we need to use the '~' operator to invert
> all the bits of _MASK and clear them.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
