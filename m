Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A680DEC0
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 23:59:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4B44C6B458;
	Mon, 11 Dec 2023 22:59:48 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E8E6C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 22:59:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7CAABCE0B6B;
 Mon, 11 Dec 2023 22:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5B7C433C8;
 Mon, 11 Dec 2023 22:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702335585;
 bh=t7nQKTTeGh65bU29w+Bc8SK2+uEhQ8nX0LrViq7JYqk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V/ayCjsP1FkvVFM17OEH03CfEKEOd2MP64ffO019moohHMBAdYMxM5wQ7lLiPowaw
 gxescu6QOlqk99izlWGLWswXQLkz5ItDrmoIvvWQodLnU/faMboH+eT+XG0OrS1Q2h
 tRi4+rt1enNLzJtYP+djQEOAHnND0Sz51/8/5xFqWeXdymJfoZ9AdvRT6fsuKu/EfF
 WLPhwPCLSMFAewuDZvjD4tNBsUa3gJpGoyIren8v1orQnVNzQnDK1BDCpiYv7in+2X
 sxXVAxPiGeW3FNMlzlnF2SAmfftk6XZwbbKVPltqcpp9HpRvIPK/zFqQpkdVC8UwhT
 hfmR1+icdW39A==
Date: Mon, 11 Dec 2023 14:59:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20231211145944.0be51404@kernel.org>
In-Reply-To: <zx7tfojtnzuhcpglkeiwg6ep265xpcb5lmz6fgjjugc2tue6qe@cmuqtneujsvb>
References: <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
 <zx7tfojtnzuhcpglkeiwg6ep265xpcb5lmz6fgjjugc2tue6qe@cmuqtneujsvb>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>, James Li <James.Li1@synopsys.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 Jianheng Zhang <Jianheng.Zhang@synopsys.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: xgmac3+: add FPE
 handshaking support
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

On Mon, 11 Dec 2023 14:14:00 +0300 Serge Semin wrote:
> Although in this case AFAICS the implementation is simpler and the
> only difference is in the CSR offset and the frame preemption residue
> queue ID setting. All of that can be easily solved in the same way as
> it was done for EST (see the link above).
> 
> Jakub, what do you think?

Yup, less code duplication would be great. Highest prio, tho, is to
focus on Vladimir's comment around this driver seemingly implementing
FPE but not using the common ethtool APIs to configure it, yet :(
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
