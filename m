Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47B9C3232
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Nov 2024 14:36:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43189C78023;
	Sun, 10 Nov 2024 13:36:02 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83F74C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Nov 2024 13:36:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4C7C1A4033D;
 Sun, 10 Nov 2024 13:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204EDC4CECD;
 Sun, 10 Nov 2024 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731245760;
 bh=/lKfQUd/rjWnE2W48MI2heX3riS1KAnteGBZEmZPoQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UC94Dyjg+IUAL3oeqr88LpjjvFA+XqMTD9MlOqinxd9xDIRQAd/FEYOXDjWylPI9N
 FTjEyPu5Xhk9m2oQqaukG/9OyD/zxyQbq89FPyXmWeUBdeUkfQEBncVtC1naDrwFZ2
 Ksbrf1MqVNUwLNLeO76zKcofTmeJ4uJ1KJbHkT3Kve5/4nI0KIRFsF2spcAJQ10UsS
 VG8TYVyM3GgdiB7QJ4hIltVa05dLpSkZ2z3f4GbwtYr+tJIAHv5w4zP5c33hCNVb9v
 kCB3mIN/idQAgjB6BZJjrPkl9b5oSTOkgzvdHt2d2eJGv9HFy2gW/l4GmlHImLcaHL
 2yfK9c0/XQ38A==
Date: Sun, 10 Nov 2024 13:35:54 +0000
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Message-ID: <20241110133554.GQ4507@kernel.org>
References: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
 <20241107063637.2122726-4-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241107063637.2122726-4-leyfoon.tan@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, lftan.linux@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: dwmac4:
 Receive Watchdog Timeout is not in abnormal interrupt summary
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

On Thu, Nov 07, 2024 at 02:36:36PM +0800, Ley Foon Tan wrote:
> The Receive Watchdog Timeout (RWT, bit[9]) is not part of Abnormal
> Interrupt Summary (AIS). Move the RWT handling out of the AIS
> condition statement.
> 
> >From databook, the AIS is the logical OR of the following interrupt bits:
> 
> - Bit 1: Transmit Process Stopped
> - Bit 7: Receive Buffer Unavailable
> - Bit 8: Receive Process Stopped
> - Bit 10: Early Transmit Interrupt
> - Bit 12: Fatal Bus Error
> - Bit 13: Context Descriptor Error
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
