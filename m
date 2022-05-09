Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E2C520807
	for <lists+linux-stm32@lfdr.de>; Tue, 10 May 2022 00:55:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31839C5F1D3;
	Mon,  9 May 2022 22:55:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 640B7C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 May 2022 22:55:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5204B81730;
 Mon,  9 May 2022 22:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216F8C385B3;
 Mon,  9 May 2022 22:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652136926;
 bh=eOxOKk3ZG98rLra0WnplqxNnsGlWGScNzyOmq/fwewM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iVwc7ON6x7KA8RL7JKq7syWCbuOrk3bj+ONYR7nESKE+4dRrKHNDCsMv1VrZsBsT3
 5MMZ1Yb1jhA3Rxv0uFyPQaq9CJcxMgRQEj5/YqD3mqvwG3y25+OGDyFgK+0eXqAeSY
 q6T2pdkQyaPb5AlzJbdSpK3TRzqrlV04hUDXGHF3RMA91W4qswKZ0EVjylOp6OyW0B
 m8LAeAdoZVIpCAvZP7XzPyieIp2T4MaRMXYSbnKJXDv9Nya5kYqtrv5tGzxzMkz6ab
 RvQQOXsMfGxEKidoKLCkv1bbRiInpuBek1ikEdkLXQA6EmCuXpNy9xvfBd84YcbT0N
 yPHO0nuRdsU2w==
Date: Mon, 9 May 2022 15:55:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <20220509155525.26e053db@kernel.org>
In-Reply-To: <20220506094039.3629649-1-yangyingliang@huawei.com>
References: <20220506094039.3629649-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 edumazet@google.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix missing
 pci_disable_device() on error in stmmac_pci_probe()
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

On Fri, 6 May 2022 17:40:39 +0800 Yang Yingliang wrote:
> Fix the missing pci_disable_device() before return
> from stmmac_pci_probe() in the error handling case.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Here indeed pcim_enable_device() seems like a better fit.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
