Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825CAB9368
	for <lists+linux-stm32@lfdr.de>; Fri, 16 May 2025 03:04:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDCEEC78F6A;
	Fri, 16 May 2025 01:04:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E25E7C78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 01:04:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0B9B5C4445;
 Fri, 16 May 2025 01:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC0EC4CEE7;
 Fri, 16 May 2025 01:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747357489;
 bh=3ggWfmad+Ahr7bFez/BW9d/QPrzgbhpVN0Lt6HYLdYw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fM5HpisdK9I89uPQxKjo44flBMfJQYJLWGvodP3rAmh4O/ZYNp19nXuMIEXEt9vl9
 M6lcd8BIxyIyhg27f8WudzMRH+ojoT4sr8/f5BJK8YsVeIrKy4DQ6YTDCUMBqQ2fVQ
 IimnR8/BHVSAg/ibZJLPhMGgE9mqyu6AEQ35FoQP46OCjtBMixlNrsXyCwh3DLULeW
 EvTbvV34sUfjtRidMBti0A97mHFewVxi3760FPT0iiTU7aUq9lXjsJ7FKS2YrySQcV
 VRajxmnCd8ublHWq0l2oeTPk/9NFvlTFJmMc2nRAIac5cSMRzcm1cUL7hg662V7Rl1
 TCUdwm5vxv7Tg==
Date: Thu, 15 May 2025 18:04:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Message-ID: <20250515180448.2d00909a@kernel.org>
In-Reply-To: <20250514143249.1808377-1-vladimir.oltean@nxp.com>
References: <20250514143249.1808377-1-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next] net: stmmac: convert to
 ndo_hwtstamp_get() and ndo_hwtstamp_set()
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

On Wed, 14 May 2025 17:32:49 +0300 Vladimir Oltean wrote:
> +	if (!netif_running(dev)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Cannot change timestamping configuration while up");

changed up -> down when applying
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
