Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF76B777550
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 12:03:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91F1CC6B469;
	Thu, 10 Aug 2023 10:03:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B2C1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 10:03:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECAD265720;
 Thu, 10 Aug 2023 10:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4BFC433C8;
 Thu, 10 Aug 2023 10:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691661808;
 bh=h3BA3I10oH7VW8/1K474QAx0VUkyw0uaaD0W0BPjf+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQuvaB982mwEO7JuDiSs+xIJamzFCo+k9o5sT80t2RT33S8xb6TdKuzeYXv9JiZkj
 KKnAWfjUKUtFZveI9RrBSzdu69lEH2TOY/SXQzFffAHtAzhTV75CV8vaG13doAsaIP
 V4X7jEYlglKETikr1QGpZ799l9hfEew87tejhLeLBpEOr2T0okDSBW9cmRzkG4AQ1p
 /kQJYqYWA91uGUilavbHwngUkuhx84EqdNUg3J5z5Ftl4+IPjD6BGw8tVqybABwTOZ
 DZCcDVhjYEOjHy50Kdhd4HvJrGKc0EV4iGIcze/wLc5yVC7SheVWJndU8xL51eR/dL
 CcvM/35+xMb8Q==
Date: Thu, 10 Aug 2023 12:03:22 +0200
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <ZNS16rhrXq+JUR85@vergenet.net>
References: <20230809020238.1136732-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230809020238.1136732-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/1] net: stmmac: xgmac: RX
 queue routing configuration
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

On Wed, Aug 09, 2023 at 10:02:38AM +0800, Furong Xu wrote:
> Commit abe80fdc6ee6 ("net: stmmac: RX queue routing configuration")
> introduced RX queue routing to DWMAC4 core.
> This patch extend the support to XGMAC2 core.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> Changes in v3:
>   - Clean unused defines
> 
> Changes in v2:
>   - Convert the shift ops to FIELD_PREP

Thanks for the updates.

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
