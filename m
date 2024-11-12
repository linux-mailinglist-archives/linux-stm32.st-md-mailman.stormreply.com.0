Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6EE9C4A76
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 01:12:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B394CC78F70;
	Tue, 12 Nov 2024 00:12:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEF74C78F6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 00:12:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 367615C578F;
 Tue, 12 Nov 2024 00:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB5FC4CECF;
 Tue, 12 Nov 2024 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731370327;
 bh=F6KtVDx7kefgsDbbvSvre0SI4ek2HJre6EpkN5nZLpw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FYtWjqgoyYor2KQxuCduFyVPGGug7Lae6Zmq//DBd3J775HaM3IaD89LNwlzGfzg8
 OTbdTKXJNxQ7RyTm/Uf3WjPXmMeT5O+324PbmckBkAIr+vu3Hisv/RQ+px6riH/ew9
 EvzwcyclN8+IzKBkfEDqUbK5gE4mrRnEDF5MObJoeQoQxwuk1cOoO6ls0My5yu96wx
 AslbCPGQqKPkw4swgS1D4SPmEY0D2GeJvPbvqytMxbsfghFSySvHDlc7/qImqc3ZgG
 frjtrVU+2NYAa3e1d2JYggboGUkn5HZd4Q36XxubIDtQnn2ie3QdpX7feyV1rmruUu
 dFA/HxKRYepAQ==
Date: Mon, 11 Nov 2024 16:12:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20241111161205.25c53c62@kernel.org>
In-Reply-To: <20241106090331.56519-5-maxime.chevallier@bootlin.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
 <20241106090331.56519-5-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/9] net: stmmac: Introduce
 dwmac1000 ptp_clock_info and operations
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

On Wed,  6 Nov 2024 10:03:25 +0100 Maxime Chevallier wrote:
> +		mutex_unlock(&priv->aux_ts_lock);
> +
> +		/* wait for auxts fifo clear to finish */
> +		ret = readl_poll_timeout(ptpaddr + PTP_TCR, tcr_val,
> +					 !(tcr_val & GMAC_PTP_TCR_ATSFC),
> +					 10, 10000);

Is there a good reason to wait for the flush to complete outside of 
the mutex? 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
