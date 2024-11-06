Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A059BDC5D
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 03:21:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7EBDC71292;
	Wed,  6 Nov 2024 02:20:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 144C5C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 02:20:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A6975C045E;
 Wed,  6 Nov 2024 02:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF43C4CECF;
 Wed,  6 Nov 2024 02:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730859651;
 bh=JQwZWqay0fD/RVvSUq/M7j+EthA8PgKPkA3/ngbOuF4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KF/7FHeXI9aKLJBwKxLnNY6wq54eyINIDMfExomu8YLPUTv+YYLNMj7o7ajtMMxqn
 PMAPN6PxUti4+6ybZwg4Fs4UgKJhld9T0g17Em38dezveqmQQC1+YymOrTSPJaX+h/
 0Z7BMzz1yoEQaIrquQwaiGB/xs3U/thQ4yYD6TxPwtlCcaqls5rO3M2oPGJUUcrNQx
 j5qTGOiUo5tVq58m1/pRnBRwS6aK1LVivF9YFqxx+VfieFeHytAEBXDtFkEo34v+V7
 9zNNA75klioy00Xrw4vX5B2KCkHwgp8rbEGR/3LlJxtbww3I6jICHoMT4TDXU6MkvT
 khDR9erObcLrg==
Date: Tue, 5 Nov 2024 18:20:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20241105182050.2839f1e7@kernel.org>
In-Reply-To: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/9] Support external
	snapshots on dwmac1000
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

On Mon,  4 Nov 2024 18:02:40 +0100 Maxime Chevallier wrote:
>   net: stmmac: Only update the auto-discovered PTP clock features

Minor conflict in the context on this one, please respin.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
