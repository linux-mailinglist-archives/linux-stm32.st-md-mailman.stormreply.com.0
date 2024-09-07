Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF43A96FEB9
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Sep 2024 02:45:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ACF6C78013;
	Sat,  7 Sep 2024 00:45:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EF9DC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2024 00:45:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 662365C5616;
 Sat,  7 Sep 2024 00:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F8FC4CEC4;
 Sat,  7 Sep 2024 00:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725669939;
 bh=Wf9eAQIrgyBOHh+h49EgYiaHCXti2sPJ1vB7JaQZ3es=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mxxOj9RKxdG8MAveIytoq5zv6qKWAFr4X5GVFqDpMEM8cNi94/S+ykHlfAVoerhFi
 tViN4liTfBVIU6cGSD2BcHpctYrzw2cAUq1lL0iyWS5UlnJDAG4c6S0Q4n7qGIT1sh
 hO5s6xDMhK+nVIsBg+Cl0gOIP8ND0WMyimiuIQqlIXXYJDwwIgAoSwH8QPUU7Y5SAP
 gtx9Qa6oRoANQ9lM12ativ7ukh/snn8bEYpP2v24UzeZBxjfRw4am5E8GrK01nSoD9
 w4u6OTHroOZ9jqRmeCZ1Biu9203evY77EOKhAyJ8dO9JOi0vbKjJfOcfIAvpeKCFG6
 cR9d05ZLHXHCA==
Date: Fri, 6 Sep 2024 17:45:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240906174537.428f8aad@kernel.org>
In-Reply-To: <cover.1725631883.git.0x1207@gmail.com>
References: <cover.1725631883.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, linux@armlinux.org.uk, Vladimir Oltean <olteanv@gmail.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v10 0/7] net: stmmac: FPE via
	ethtool + tc
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

On Fri,  6 Sep 2024 22:30:05 +0800 Furong Xu wrote:
> Move the Frame Preemption(FPE) over to the new standard API which uses
> ethtool-mm/tc-mqprio/tc-taprio.

Please read the guidelines:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr
-- 
pv-bot: 24h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
