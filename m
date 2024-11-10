Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6819C322E
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Nov 2024 14:35:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EA33C78023;
	Sun, 10 Nov 2024 13:35:40 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56AA5C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Nov 2024 13:35:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C033BA40BA8;
 Sun, 10 Nov 2024 13:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76D3C4CECD;
 Sun, 10 Nov 2024 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731245731;
 bh=wAosZbIeN6i75DZ5IsgZbec7MRK0ROPy5XUoDy34nVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eIO3FtlPwBtQzNX8Fv2NF3KEdJX2RtwjTu39d03m+uljJkRn7OH+k8RZPnmgcFxMq
 M1hfjVXujTHfJMX6lffuBSc8ENpI9wWnC8D1P+N2fAl6cIfO5oFJWQf2nFUwflwlmL
 /VvhI0PQt2tZFZSh8kZSsoBd5wg4ztRHl8IYNgyS6BeVTkAjQHaVPQaucIJzGtoSP/
 mWbEIo81hX6927L4OIw99CG6RUamy+stIDIhQLrIwM1tAM0bN2srXhHy9M6ReiR5m8
 wQl6pdNj/YHmNLRs5mWa3Upps1A/nSV1Ib5q4B22FH1jDr7DxiLz6gPRdDumu8JDoI
 AO8UytdIltBRA==
Date: Sun, 10 Nov 2024 13:35:24 +0000
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Message-ID: <20241110133524.GO4507@kernel.org>
References: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
 <20241107063637.2122726-2-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241107063637.2122726-2-leyfoon.tan@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, lftan.linux@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] net: stmmac: dwmac4: Fix
 MTL_OP_MODE_RTC mask and shift macros
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

On Thu, Nov 07, 2024 at 02:36:34PM +0800, Ley Foon Tan wrote:
> RTC fields are located in bits [1:0]. Correct the _MASK and _SHIFT
> macros to use the appropriate mask and shift.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
