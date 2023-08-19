Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA097817B8
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Aug 2023 08:57:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33854C6B460;
	Sat, 19 Aug 2023 06:57:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5591AC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Aug 2023 06:57:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E64AE61215;
 Sat, 19 Aug 2023 06:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F12FC433C7;
 Sat, 19 Aug 2023 06:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692428256;
 bh=NJ+AzEErbCS9Uj2GmaQZ/wrbE6c9H2qORM9U8sYbwSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=INaR/I8iU3IbGQDU94rliksjxWziuXDqnC9Jnq5nAMRg1AaDpg86WgrTbTnMdlfTN
 TkGM56cqN9GQMUQgSmGgf7h/vVLstHdEyikRSYJ8naChN54OhtsrygQwSkz6/49hHO
 KPObH40gdfoktYdrq1yTgFW36X++c2EnTWqG8O79H4o5Ev5AWuutX7sicPYxiUSzrV
 X+imAjAz59fiAkfXZHesbyV7gWPEamh/dT0tnJl6+k1k7ne8yBZ85Qkp7hGI8W5DFc
 uNYyFpzS5jMB4bov+DqKA5bXrQ/4dceSiKG/yTPgZMnBQaU+bHnDP99qy1dwei1lcD
 AoRHrc5Gyoaig==
Date: Sat, 19 Aug 2023 08:57:31 +0200
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <ZOBn22NT/GYbZKxY@vergenet.net>
References: <20230818094832.179420-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818094832.179420-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Check more MAC
 HW features for XGMAC Core 3.20
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

On Fri, Aug 18, 2023 at 05:48:32PM +0800, Furong Xu wrote:
> 1. XGMAC core does not have hash_filter definition, it uses
> vlhash(VLAN Hash Filtering) instead, skip hash_filter when XGMAC.
> 2. Show exact size of Hash Table instead of raw register value.
> 3. Show full description of safety features defined by Synopsys Databook.
> 4. When safety feature is configured with no parity, or ECC only,
> keep FSM Parity Checking disabled.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Hi Furong Xu,

thanks for your patch.

Unfortunately it does not apply cleanly to net-next,
which means that it isn't run through the upstream  CI and
creates a process issue for the maintainers.

Please consider rebasing on net-next and reposting.

-- 
pw-bot: changes-requested

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
