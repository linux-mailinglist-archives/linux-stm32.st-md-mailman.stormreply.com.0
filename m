Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C78259679B
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Aug 2022 05:03:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC06C640F1;
	Wed, 17 Aug 2022 03:03:42 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AEEDC03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 03:03:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B157AB80B4C;
 Wed, 17 Aug 2022 03:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDA7C433C1;
 Wed, 17 Aug 2022 03:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660705419;
 bh=j34Y0IvnP4PIUZa4lmiS/njGfPbOT1P5mPXfCn2SqXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LJwB5PyM7KRn9sh6SHSyW+E4p9BqquodqZlA6nZ89lvX7aSi/Sg/NQC88ep/TYGS8
 FkNFs6AROYzWcFi75c+xXZhemebqAQOtFp6thpwtwQxLfJhQWpowc9H9cE9ZBgdlvd
 e/+zbDZrV9JnD4r8ytHLoLW9E63iUrD1o5AiOShEXjHLbOaSLDvVS47LIksKIrIn/I
 tpc0b9inuJrj+IY7m8BdRbOWNudJ2YOMHQcer4NvQR7ci/yQjZTje4fXYY+tSNSYS0
 odxGREHH1lYy46PDL9R9F4OtJDwPoxI+qkgNoEVdEjA+B+/bpHndj4+HuWUhUcnxRr
 qWcFcyB3HY8fw==
Date: Tue, 16 Aug 2022 20:03:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vee Khee Wong <veekhee@apple.com>
Message-ID: <20220816200337.35befaad@kernel.org>
In-Reply-To: <4C6D4699-3BC3-4F31-86E2-B5CD7410CC0A@apple.com>
References: <4C6D4699-3BC3-4F31-86E2-B5CD7410CC0A@apple.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, tee.min.tan@linux.intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next 1/1] stmmac: intel: remove unused
	'has_crossts' flag
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

On Tue, 16 Aug 2022 15:30:07 +0800 Vee Khee Wong wrote:
> The 'has_crossts' flag was not used anywhere in the stmmac driver,
> removing it from both header file and dwmac-intel driver.
> 
> Signed-off-by: Wong Vee Khee <veekhee@apple.com>

Your MUA corrupted the patch, it stripped the leading spaces.
Can you resend with git send-email ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
