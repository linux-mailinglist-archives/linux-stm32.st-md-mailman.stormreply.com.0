Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E67821F0C
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jan 2024 16:58:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA887C6DD69;
	Tue,  2 Jan 2024 15:58:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDC03C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jan 2024 15:58:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B4366118C;
 Tue,  2 Jan 2024 15:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CF8C433C7;
 Tue,  2 Jan 2024 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704211089;
 bh=gsBgM/SJ5swumfn/cuVueJtKXK9nInmvCfn1DD55G2Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hjRyV52srkWcrFMd9p6aHkxAvUkzcYMa2RWZPQEwAxmGtHyGaxQfbs/v+npGYXCIT
 6nX2lufBMDX4XoQhsQIv3YMo83DPc7XTW6iQxSMAtrHgte2dIP9cs8JqwUgLlfs3GI
 jWftuUfNohpebYe4v9tCOTdbHFT68XR6Py2mOIOe4nvsGeCrnBy0LNTaZkYHuSOxR4
 6m+BzIMKiNgZjYj5yIR2bhYJEiPR4TAFyxM4iCtkctS/vsmGAHD9Y3UujEG4K9Xe7g
 XKAc+BDP9yNbZSWpiaiCX4tyELCk89f/wvAvpjyazjxFg0jj+n1BaftTt/JPatw0pn
 kte5fS0oDAw2g==
Date: Tue, 2 Jan 2024 07:58:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: fuyao <fuyao@sjterm.com>
Message-ID: <20240102075807.1a4cac92@kernel.org>
In-Reply-To: <ZYPmZj8l01eQsDS5@debian.cyg>
References: <ZYKvCQBD-SY9uVLF@debian.cyg> <2370947.NG923GbCHz@jernej-laptop>
 <ZYPmZj8l01eQsDS5@debian.cyg>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] gmac: sun8i: r40: add gmac tx_delay
	support
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

On Thu, 21 Dec 2023 15:16:54 +0800 fuyao wrote:
> I don't see it in the user manual also.
> 
> it works fine in 100M, but it doesn't work good in 1G without tx_delay
> in my board.
> 
> Read the sdk from allwinner I found in:
> 
> https://sourcegraph.com/github.com/tinalinux/linux-3.10/-/blob/arch/arm/boot/dts/sun8iw11p1.dtsi?L1826
> https://sourcegraph.com/github.com/tinalinux/linux-3.10@r40-v1.y/-/blob/drivers/net/ethernet/allwinner/sunxi-gmac.c?L877
> 
> And I add it to my board, it works fine.
> 
> So, I think it may be exist register but not documented.

Unless Allwinner can chime in we should at least document the situation
clearly in the commit message (incl. what HW+config was tested, exactly)
and add a comment in the code?
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
