Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01B19B566
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 20:25:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B940C36B0B;
	Wed,  1 Apr 2020 18:25:48 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BC70C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 18:25:47 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 20FEE120F5284;
 Wed,  1 Apr 2020 11:25:43 -0700 (PDT)
Date: Wed, 01 Apr 2020 11:25:42 -0700 (PDT)
Message-Id: <20200401.112542.1191455491464437178.davem@davemloft.net>
To: Jose.Abreu@synopsys.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <42e493820f707c5a5d3375676ef6b6a96988f846.1585762111.git.Jose.Abreu@synopsys.com>
References: <42e493820f707c5a5d3375676ef6b6a96988f846.1585762111.git.Jose.Abreu@synopsys.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 01 Apr 2020 11:25:43 -0700 (PDT)
Cc: Joao.Pinto@synopsys.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Fix VLAN filtering
 when HW does not support it
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

From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Wed,  1 Apr 2020 19:29:03 +0200

> If we don't have any filters available we can't rely upon the return
> code of stmmac_add_hw_vlan_rx_fltr() / stmmac_del_hw_vlan_rx_fltr(). Add
> a check for this.
> 
> Fixes: ed64639bc1e0 ("net: stmmac: Add support for VLAN Rx filtering")
> Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
