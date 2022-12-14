Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA0964C2EF
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Dec 2022 04:57:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 736B3C6507A;
	Wed, 14 Dec 2022 03:57:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83D4FC63327
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 03:57:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C4BD617D2;
 Wed, 14 Dec 2022 03:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34E0C433EF;
 Wed, 14 Dec 2022 03:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670990267;
 bh=9Fwdb6UkaihMRSEfK001Y3G03HTv4XMJAaNO27+EnLI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vJh90S4b4ebIu2I9NFRN1zPgqpQ+spLU75qN4M8N2gjtmCnDsqOShogznQ48wbBBS
 b8FRs5kQSut/hayrutyYDLcXzJhgn7tnjno2K1K7ME5LPJXHcoYuZZlkzbFGi0sxIH
 09CsSl6ufXnqwSiTr/tWTeW8EgBXnfHTr3mtdQ8h0PJ2KgcI2ANkm71pRak7MYFTsS
 Vnj1/4IccWl+r9vLdzYkV0QThMMkQo5DN1fs3djWf2y4lZvHh7fuDyK7c2hXG2d/XZ
 4Mt44siO7BXecZhoGv+CNF3kjwffi7DGh5Iy2uR/+tRWxUa1BJe/vSAuhp6u7+fvpt
 ekrSooyxJ+ypQ==
Date: Tue, 13 Dec 2022 19:57:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <20221213195746.10b488c8@kernel.org>
In-Reply-To: <ae0f5e46-afb2-e103-0c24-2310ad326e55@huawei.com>
References: <20221212021350.3066631-1-cuigaosheng1@huawei.com>
 <20221213191528.75cd2ff0@kernel.org>
 <ae0f5e46-afb2-e103-0c24-2310ad326e55@huawei.com>
MIME-Version: 1.0
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, john.fastabend@gmail.com,
 ast@kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix possible memory leak
 in stmmac_dvr_probe()
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

On Wed, 14 Dec 2022 11:55:27 +0800 cuigaosheng wrote:
> Thanks for taking time to review this patch.
> 
> I am sorry I missed the errno, and I have submit a new patch to fix it.
> 
> Link: https://patchwork.kernel.org/project/netdevbpf/patch/20221214034205.3449908-1-cuigaosheng1@huawei.com/

Perfect, thank you!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
