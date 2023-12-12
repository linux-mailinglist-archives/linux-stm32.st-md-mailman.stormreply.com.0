Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0539780FB45
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Dec 2023 00:23:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3CE8C6C85B;
	Tue, 12 Dec 2023 23:23:51 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6A9FC6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 23:23:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 53E23B8172F;
 Tue, 12 Dec 2023 23:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B611C433C7;
 Tue, 12 Dec 2023 23:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702423428;
 bh=KwRraPl+S6WmazlLNqOJ7U472XTL+/fDGulYB+j/FLk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BtEAI2K97P4K3o2dTr9wLUIpp5Fd7FshRQzuKgCImTlqG7pISseimEd/dyIWmN3qp
 SnyunpjfhBl978TWs57HDJf0wyhZzAXq8wqNdH077Mn7Xggx602NtRwtwQy/zJg4DY
 eFaW0MNfUc/KBzIzvV4qCGdQeYvtdlDWKLEYQbOvCFtkE8FvTYRWI4JzkmatZ+FFsl
 JUxq1BBpkAz2IY5Mm1txEtBKcnbRe0TxQ3IwK7wCBdBw98vmA2k14p47ymK2nXSegA
 wVMaU8WlhtppPwey/4s66Hh46QeWbd1UMIBFEBEoID0J2h0e7346dii8RGNyhib6WQ
 EX5BxvpaWIdDw==
Date: Tue, 12 Dec 2023 15:23:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Message-ID: <20231212152347.167007f3@kernel.org>
In-Reply-To: <CY5PR12MB63727C24923AE855CFF0D425BF8EA@CY5PR12MB6372.namprd12.prod.outlook.com>
References: <CY5PR12MB63727C24923AE855CFF0D425BF8EA@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>, "open list:STMMAC ETHERNET
 DRIVER" <netdev@vger.kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, James Li <James.Li1@synopsys.com>,
 Eric Dumazet <edumazet@google.com>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Martin McKenny <Martin.McKenny@synopsys.com>
Subject: Re: [Linux-stm32] [PATCH v2 net-next] net: stmmac: xgmac3+: add FPE
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

On Tue, 12 Dec 2023 14:05:02 +0000 Jianheng Zhang wrote:
> Adds the HW specific support for Frame Preemption handshaking on XGMAC3+
> cores.
> 
> Signed-off-by: Jianheng Zhang <Jianheng.Zhang@synopsys.com>

I defer to Vladimir on whether to trust that the follow up with
the ethtool API support will come later (and not require rewrite
of existing code); or we should request that it's part of the same
series.
-- 
pw-bot: needs-ack
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
