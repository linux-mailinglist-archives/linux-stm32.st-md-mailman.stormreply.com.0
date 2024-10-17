Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3C9A2297
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 14:41:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D073C78032;
	Thu, 17 Oct 2024 12:41:15 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F406C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:41:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6AC94A43EA1;
 Thu, 17 Oct 2024 12:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519F3C4CEC3;
 Thu, 17 Oct 2024 12:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729168867;
 bh=LtW4cH6RJ/U6LGh2Snc/2Z+gjm0u80RPvBaReDRovUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPYY28+fhwc4pmigbR28drVzI/W2FB1fpX/kXNd5YYdkzH+v6cnTj3FF0nUgcoOU7
 YgItldM3bwxpQM/fxlGdL6B04oP9RmJmpg8nqQLWvpD46CFYVBgn++N8sY3fQctpg3
 W4V7w4VyRuhPH4/uR+tbLdFCxTWTo6hg/f4dg9f9SlIbpyJiL/dpC5Z/8C/+3jdqLJ
 au9dsxX5a3gbMxeA4aMT5k2Fwew6MCCfjcHr3IU5HDHoQSUFTv0jhzqlct3DvAIpoS
 eyyT893E4zX5SFzeEAlBlBEWxHc4hCvPuLq+POsjbeEzhedqd6/T28rtN4l3FIkDIW
 9GycGACvP8NJQ==
Date: Thu, 17 Oct 2024 13:41:02 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241017124102.GK1697@kernel.org>
References: <cover.1728980110.git.0x1207@gmail.com>
 <4557515b4df0ebe7fb8c1fd8b3725386bf77d1a4.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4557515b4df0ebe7fb8c1fd8b3725386bf77d1a4.1728980110.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/5] net: stmmac: xgmac:
 Rename XGMAC_RQ to XGMAC_FPRQ
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

On Tue, Oct 15, 2024 at 05:09:25PM +0800, Furong Xu wrote:
> Synopsys XGMAC Databook defines MAC_RxQ_Ctrl1 register:
> RQ: Frame Preemption Residue Queue
> 
> XGMAC_FPRQ is more readable and more consistent with GMAC4.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
