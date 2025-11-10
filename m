Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDF1C49CE9
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 00:46:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB108C60460;
	Mon, 10 Nov 2025 23:46:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD589C5A4C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 23:46:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 599E744595;
 Mon, 10 Nov 2025 23:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E6FC4CEF5;
 Mon, 10 Nov 2025 23:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762818406;
 bh=4e1bgpUV/iimHsy8hCdENWKdiFeyy00W/2NkO5sEUAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oP2yrdDG0/mUFvFidbKQaKe6gJ9F/49YmJX2dk2zIRQVnLBAUt5Bk09EXUhtxHglT
 RAHcKDqMcD6UbGffywoOsfuUPYOzyut01P+a224sUF9Q/lCufFp9yx3N1QHe8hHzQ1
 h1Gcdd3ZW0XNvLVdJLo0EU9+29ceM4l9zpj0MH6jJCfTtB7C1/yevHRx8d/7412s8d
 I7WAj66CpWa5b2UnoISnNm/NI/L7rkfg3Llh78AlgAm4kaqySG0bWidh4Tqr8v6nCf
 UIrKMk8d7m0dQaOHa+KAQEtIcdyh5ignOrmz8lLJaeASJcxf/Y4qB4NfmGN21hdN5y
 KC7cNoFQCREBw==
Date: Mon, 10 Nov 2025 15:46:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jiri Pirko <jiri@resnulli.us>
Message-ID: <20251110154643.66d15800@kernel.org>
In-Reply-To: <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
 <aQ7f1T1ZFUKRLQRh@x130>
 <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
MIME-Version: 1.0
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, linux-doc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com, Linu Cherian <lcherian@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 Daniel Zahka <daniel.zahka@gmail.com>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Srujana Challa <schalla@marvell.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, Dave Ertman <david.m.ertman@intel.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sunil Goutham <sgoutham@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 Roger Quadros <rogerq@kernel.org>, Saeed Mahameed <saeed@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-omap@vger.kernel.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, linux-arm-kernel@lists.infradead.org,
 Petr Machata <petrm@nvidia.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mark Bloch <mbloch@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 hariprasad <hkelam@marvell.com>, Simon Horman <horms@kernel.org>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Jerin Jacob <jerinj@marvell.com>,
 Johannes Berg <johannes@sipsolutions.net>, Vladimir Oltean <olteanv@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Geetha sowjanya <gakula@marvell.com>,
 Vlad Dumitrescu <vdumitrescu@nvidia.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net/mlx5: implement
 swp_l4_csum_mode via devlink params
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

On Sun, 9 Nov 2025 11:46:37 +0100 Jiri Pirko wrote:
> >So, I checked a couple of flows internally, and it seems this allows
> >some flexibility in the FW to decide later on which mode to pick,
> >based on other parameters, which practically means
> >"user has no preference on this param". Driver can only find out
> >after boot, when it reads the runtime capabilities, but still
> >this is a bug, by the time the driver reads this (in devlink), the
> >default value should've already been determined by FW, so FW must
> >return the actual runtime value. Which can only be one of the following  
> 
> I don't think it is correct to expose the "default" as a value.
> 
> On read, user should see the configured value, either "full_csum" or
> "l4_only". Reporting "default" to the user does not make any sense.
> On write, user should pass either "full_csum" or "l4_only". Why we would
> ever want to pass "default"?

FWIW I agree that this feels a bit odd. Should the default be a flag
attr? On get flag being present means the value is the FW default (no
override present). On set passing the flag means user wants to reset
to FW default (remove override)?

> Regardless this patch, since this is param to be reflected on fw reboot
> (permanent cmode), I think it would be nice to expose indication if
> param value passed to user currently affects the fw, or if it is going
> to be applied after fw reboot. Perhaps a simple bool attr would do?

IIUC we're basically talking about user having no information that 
the update is pending? Could this be done by the core? Core can do 
a ->get prior to calling ->set and if the ->set succeeds and 
cmode != runtime record that the update is pending?

That feels very separate from the series tho, there are 3 permanent
params in mlx5, already. Is there something that makes this one special?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
