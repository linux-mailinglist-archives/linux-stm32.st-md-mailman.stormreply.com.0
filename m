Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138B6957B0
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Feb 2023 05:10:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1934FC6A5F6;
	Tue, 14 Feb 2023 04:10:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFF47C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 04:10:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67C65B81B1F;
 Tue, 14 Feb 2023 04:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A04FC433EF;
 Tue, 14 Feb 2023 04:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676347817;
 bh=6YgtRESLJOJZw+w5fV3y/DLtb3rrTBK9V/y4YdS0XvU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TOftPHmCxZzmJE/bfGv8jV5niigTTok3GmcLCpoZLhsswswNj23ryqEDG6VQItFeB
 X3DRZiUNZwo+JjUxlf/nSFEYi67lzDdImNFQwh6Sooc3Gt3qoQFN7KVl4VyBCJVOuz
 Pv4vZleM1HUbegZB/TCy9eEs70NwZzcce9oG22r5VEjHrT4p8IMLOIg7m9b49U8qz1
 S7vQeoShHi/R9N1Zbl8cw5jfv0h0Lo9jIi0rd7onPn0vZaCK2hg3V+rDFKDlPe1MKp
 eu1oJWsAba58nYwjvpkoJDVjIILEH5JhKo/1igFkv0+05Nd0K6yUZ0Y5w+opCf1Dec
 pe07R5iuOjoqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DDDA6E270C2; Tue, 14 Feb 2023 04:10:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167634781689.18399.674406359781053459.git-patchwork-notify@kernel.org>
Date: Tue, 14 Feb 2023 04:10:16 +0000
References: <20230210143937.3427483-1-j.zink@pengutronix.de>
In-Reply-To: <20230210143937.3427483-1-j.zink@pengutronix.de>
To: Johannes Zink <j.zink@pengutronix.de>
Cc: kernel@pengutronix.de, davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix order of dwmac5
 FlexPPS parametrization sequence
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

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 10 Feb 2023 15:39:37 +0100 you wrote:
> So far changing the period by just setting new period values while
> running did not work.
> 
> The order as indicated by the publicly available reference manual of the i.MX8MP [1]
> indicates a sequence:
> 
>  * initiate the programming sequence
>  * set the values for PPS period and start time
>  * start the pulse train generation.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix order of dwmac5 FlexPPS parametrization sequence
    https://git.kernel.org/netdev/net/c/4562c65ec852

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
