Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26A7CB7C8
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Oct 2023 03:08:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEC74C6B452;
	Tue, 17 Oct 2023 01:08:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BE16C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 01:08:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF85861219;
 Tue, 17 Oct 2023 01:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F90C433C9;
 Tue, 17 Oct 2023 01:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697504931;
 bh=jHzMCQWvVZ1Q/xaW0hEOcnP75eSP2Fct28NmE+fM2ZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U5Ejo6A7IGivJxgjcnLAn/xvYjhejkxSLLUq+ISYOO4hgxkafLCn8H+gOyRFR9rsj
 55vPcR9PbV8r/+Zd/WmCmair8sw52RzbAswebcAHVUJIkQRHIyUZOcvGFurw1NBwzP
 2JAxU9Vqf17EOx2wBwDek3hce2tEDODuGGZqtoU66waHayDQsR6TDUCUeKDXsnqI/N
 SOAkbqABIJJalva1wtuOOJmF47ALmc+tQa6XtvEjcfGLL1z9HVeA3XLCXs4iKQGyk0
 wv2eH7UEqPfYDMNI2yZG5tvJdpuDjgey9j2Hyw3+P3kQ9uslM19cS17gS98qgKDfrq
 JF+g184XSUXjQ==
Date: Mon, 16 Oct 2023 18:08:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <20231016180849.1cc29549@kernel.org>
In-Reply-To: <20231014092954.1850-4-ansuelsmth@gmail.com>
References: <20231014092954.1850-1-ansuelsmth@gmail.com>
 <20231014092954.1850-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH v3 3/4] net: stmmac: move TX
 timer arm after DMA enable
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

On Sat, 14 Oct 2023 11:29:53 +0200 Christian Marangi wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 5124ee87286c..240a18b97825 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2545,7 +2545,8 @@ static void stmmac_bump_dma_threshold(struct stmmac_priv *priv, u32 chan)
>   * @queue: TX queue index
>   * Description: it reclaims the transmit resources after transmission completes.
>   */
> -static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue)
> +static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
> +			   bool *pending_packets)

Missing kdoc for new param, build with W=1 catches this.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
