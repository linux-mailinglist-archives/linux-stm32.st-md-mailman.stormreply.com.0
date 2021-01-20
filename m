Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A87A92FD293
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jan 2021 15:27:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58F76C3FADB;
	Wed, 20 Jan 2021 14:27:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43500C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 14:27:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 826062336D;
 Wed, 20 Jan 2021 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611152820;
 bh=DSvaDm4XhrGo3TRVwU920cVaThyOHtM52UGaxj6lzG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=asZRWy2LQeD3p9pnCwJMVoE2tk+lUdWhaMha6sb6wpIaR0+yUhRRLp9cvMHR6Ibx4
 0E+mFHl4rcQc1NnlgHMVIIRy68M0zJtFD4GXM31M3xvX5FabIWzw2GGI+/lHf9+SYY
 M0/bhQFr4fdx9l/ww8K0dbr5DpIcV4kWDcAsIWbjLBKDxbmwp1kiJQfZIKVZVgOuNX
 I4vACTktGjyioDWRdsXxu2S6g0X8a+629+4WKr7V9ifq87Bjx/r0xKcnR6g595na+0
 a7d38+Vt6fYZkjZlfKidL6KUWXyiS4ZMZ2Od2eRbihtcW3BA8h7BJVm/ZCic9dYQ2C
 0nwn87Xszi6BA==
Date: Wed, 20 Jan 2021 09:26:59 -0500
From: Sasha Levin <sashal@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20210120142659.GC4035784@sasha-vm>
References: <20210120012602.769683-1-sashal@kernel.org>
 <20210120012602.769683-28-sashal@kernel.org>
 <20210119220815.039ac330@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119220815.039ac330@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, David Wu <david.wu@rock-chips.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH AUTOSEL 5.10 28/45] net: stmmac: Fixed mtu
 channged by cache aligned
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Jan 19, 2021 at 10:08:15PM -0800, Jakub Kicinski wrote:
>On Tue, 19 Jan 2021 20:25:45 -0500 Sasha Levin wrote:
>> From: David Wu <david.wu@rock-chips.com>
>>
>> [ Upstream commit 5b55299eed78538cc4746e50ee97103a1643249c ]
>>
>> Since the original mtu is not used when the mtu is updated,
>> the mtu is aligned with cache, this will get an incorrect.
>> For example, if you want to configure the mtu to be 1500,
>> but mtu 1536 is configured in fact.
>>
>> Fixed: eaf4fac478077 ("net: stmmac: Do not accept invalid MTU values")
>> Signed-off-by: David Wu <david.wu@rock-chips.com>
>> Link: https://lore.kernel.org/r/20210113034109.27865-1-david.wu@rock-chips.com
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This was applied 6 days ago, I thought you said you wait two weeks.
>What am I missing?

The "AUTOSEL" review cycle is an additional hurdle automatically
selected patches need to clear before being queued up. There are 7 days
between the day I sent the review for these and the first day I might
queue them up.

This mail isn't an indication that the patch has been added to the
queue, it's just an extra step to give folks time to object.

If you add up all the days you'll get >14 :)

-- 
Thanks,
Sasha
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
