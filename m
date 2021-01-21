Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D9F2FEFB2
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jan 2021 17:02:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB50EC3FADB;
	Thu, 21 Jan 2021 16:02:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED399C424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 16:02:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0082223118;
 Thu, 21 Jan 2021 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611244946;
 bh=ClBUDFhX2m6o6C6NQVp/H0xERYYuUpDQS2ROMyhuGbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U+CYrVK9yN7vLM4utwyBz7lo7CpLvyq15oFAispxoXRTi9lL+JF1wnBdKAxMltW+l
 Fpb7FRqHUt2eRiO4KTQMp3pqyqq+w2pIlUiKwq0hAGQQTUnUsM9BVkmuBC1EuDuIYt
 eBiJFsUOEFWVNiyumKNWHkiSXkgIcfOqiwJYFQtMTKR1dXQ98ibAxDk+DIXRDRxYB9
 Lcu7dIPXVHZukGsu+sySCI6weRBpZX8LolEP81lpjTg2T2TGv12vJQH2yHSbIKQCwj
 51lVZV5fR1ZWjZAMzmFnt2Uvljf2szDoYCq09cFq5xHEJ+Hf6px2jiG4AbVdS4XBHJ
 Q9/79XvskOs4w==
Date: Thu, 21 Jan 2021 11:02:24 -0500
From: Sasha Levin <sashal@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20210121160224.GD4035784@sasha-vm>
References: <20210120012602.769683-1-sashal@kernel.org>
 <20210120012602.769683-28-sashal@kernel.org>
 <20210119220815.039ac330@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210120142659.GC4035784@sasha-vm>
 <7564ebe1-20e9-36d5-11a7-bcfe27f70987@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7564ebe1-20e9-36d5-11a7-bcfe27f70987@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, David Wu <david.wu@rock-chips.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Jan 21, 2021 at 03:39:22PM +0100, Ahmad Fatoum wrote:
>On 20.01.21 15:26, Sasha Levin wrote:
>> On Tue, Jan 19, 2021 at 10:08:15PM -0800, Jakub Kicinski wrote:
>>> This was applied 6 days ago, I thought you said you wait two weeks.
>>> What am I missing?
>>
>> The "AUTOSEL" review cycle is an additional hurdle automatically
>> selected patches need to clear before being queued up. There are 7 days
>> between the day I sent the review for these and the first day I might
>> queue them up.
>
>I guess this could benefit from being documented in
>Documentation/process/stable-kernel-rules.rst? Or is this documented
>elsewhere?

This is not documented because it's not part of the -stable process,
it's just the way I currently handle AUTOSEL stuff. The timeline
requirement for -stable is:

	"It or an equivalent fix must already exist in Linus' tree (upstream)"
-- 
Thanks,
Sasha
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
