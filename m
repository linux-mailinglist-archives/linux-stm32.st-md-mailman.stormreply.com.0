Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF936DCE7C
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 02:32:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FE87C62EFE;
	Tue, 11 Apr 2023 00:32:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14A71C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 00:32:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C206262043;
 Tue, 11 Apr 2023 00:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F5AC433EF;
 Tue, 11 Apr 2023 00:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681173149;
 bh=IPQiRaKv5N4+opLgH2RmWIdytX47K28TWJ6fB7F/4ms=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mDi/A2//d0R/Hvzon1hhED+jHJkvRVjIcq+GQTe+sjEF9gvI+4ZE9mPM4+M6hmLQ6
 QxfVMnujtGa1rq/6epuadF4HtpZgZKwtxmeekxccb4VS6pVXcDocWEDevHyyUup+ZZ
 88mF/mXduHMi8DLt1Oogc31S9dWEH/0z6hfd6pcuD7m8n63Mky9AXMyXRA5SckTLSk
 3J1IdqmaLJdwRbrYIqXuRJ8oTvrXcBDNjkufZqp1E7tU1oWlG8tRKtUvkzNb7wv+JK
 ZJ8yB4Uz5ohK/vnossIlah9hGKDRf9rj0NgT7D6F7ERKCY6/YFhsAZ7Ojzdwb7C93o
 kmMBZn0g2dLsw==
Date: Mon, 10 Apr 2023 17:32:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yan Wang <rocklouts@sina.com>
Message-ID: <20230410173227.74f9d60a@kernel.org>
In-Reply-To: <20230408155823.12834-1-rocklouts@sina.com>
References: <20230407195730.298867dd@kernel.org>
 <20230408155823.12834-1-rocklouts@sina.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 John 'Warthog9' Hawley <warthog9@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac:fix system hang when setting
 up standalone tag_8021q VLAN for DSA ports
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

On Sat,  8 Apr 2023 23:58:23 +0800 Yan Wang wrote:
> The system hang because of dsa_tag_8021q_port_setup() callbcak
> stmmac_vlan_rx_add_vid().I found in stmmac_drv_probe() that
> cailing pm_runtime_put() disabled the clock when check the stmmac
> dirver.
> 
> First, when the kernel is compiled with CONFIG_PM=y,The stmmac's
> resume/suspend is active.
> 
> Secondly,stmmac as DSA master,the dsa_tag_8021q_port_setup() function
> will callback stmmac_vlan_rx_add_vid when DSA dirver starts. However,
> The system is hanged for the stmmac_vlan_rx_add_vid() accesses its
> registers after stmmac's clock is closed.
> 
> I would suggest adding the pm_runtime_resume_and_get() to the
> stmmac_vlan_rx_add_vid().This guarantees that resuming clock output
> while in use.

Hm, the patch is not making it to the @vger list, even tho it did make
it to lore.kernel.org, it seems. I couldn't spot anything wrong with it.
Could you try sending it to testing@vger.kernel.org and contacting
John (added to CC) who administers vger.kernel.org, to figure out
what's wrong?

Based on this conversation:
https://lore.kernel.org/all/9539b880-642d-9ac5-ccfa-2b237548f4fc@kernel.org/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
