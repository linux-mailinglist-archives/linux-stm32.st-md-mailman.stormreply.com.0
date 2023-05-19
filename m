Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5863670A2C6
	for <lists+linux-stm32@lfdr.de>; Sat, 20 May 2023 00:27:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2313C6B44D;
	Fri, 19 May 2023 22:27:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F0FDC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 22:27:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 622CF65B54;
 Fri, 19 May 2023 22:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EB8C433D2;
 Fri, 19 May 2023 22:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684535237;
 bh=3++Hz/H0Ny8iNnJK/HwTOxVy8iKIyU2vlNFkX6To6V8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pMNQ+KnSqIGNuGe3uYk1BjH4DhXTj3M0pEM6ts97Oe75qGoI4/bM7UJ81xFdYa01/
 28QeawEBbtM6Ou0uajuvn0QxJuWgODz3qt/84ZM5TDU5ZMAmrMzNW//56/tPSHI5yR
 DEgaNOKopY4SR0Zf/rw+81uy8zk+qRItdlE/WesPVVbQRc2OAYOJIqlBsAqNQPMEPo
 WC2oIi13vw709nUDVb48rqMMBjWwfojI1SgsVv3Xg0ManDOdMtIinOCKdXeHoYuiS9
 1ifR2XvFgM3XuVICy2X5RVtCXDlD21fS50Q5udLIhvdsGkyLDtEWTYInCEx3MTkyos
 YntJnPPLrqioA==
Date: Fri, 19 May 2023 15:27:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Min-Hua Chen <minhuadotchen@gmail.com>
Message-ID: <20230519152715.7d1c3a49@kernel.org>
In-Reply-To: <20230519115030.74493-1-minhuadotchen@gmail.com>
References: <20230519115030.74493-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Simon Horman <simon.horman@corigine.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: compare p->des0 and
 p->des1 with __le32 type values
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

On Fri, 19 May 2023 19:50:28 +0800 Min-Hua Chen wrote:
> -		if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
> +		if (p->des0 == cpu_to_le32(0xffffffff) &&
> +		    p->des1 == cpu_to_le32(0xffffffff))

Can you try to fix the sparse tool instead? I believe it already
ignores such errors for the constant of 0, maybe it can be taught 
to ignore all "isomorphic" values?

By "isomorphic" I mean that 0xffffffff == cpu_to_le32(0xffffffff)
so there's no point complaining.
-- 
pw-bot: reject
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
