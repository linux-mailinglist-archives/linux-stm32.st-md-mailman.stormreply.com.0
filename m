Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6DAC49AB0
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Nov 2025 23:58:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43E85C60460;
	Mon, 10 Nov 2025 22:58:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A98F5C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 22:58:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D5AAA44197;
 Mon, 10 Nov 2025 22:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE8DC16AAE;
 Mon, 10 Nov 2025 22:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762815514;
 bh=gp119oKTnpbHC1P/d+n3Qm9C5OlbMz4VTP9qPySDarM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wv5sTKvK8Fth+8Ulry2nulV4xCEtVBXnwIhWHQPmidsRNLKwkQ3d5V0GD068+lAO9
 LI3OqSg5CRVEyB//hIYRvUHrLnqzWExmmbDT9Z1UchTDbOP3Ryw9ll2uDjt6HDWyWj
 6KPxk/pHL763G49ToN0WUTIrt7+ddlaAHxfdQwJIFbCcTTqelmfK6pM2GNLDRQ4vys
 AfRF6fB43wY/PHKCpH1Uvy2oCOSMxac7NhkYiYrR01l/n/URrTywQFpukP74NlCWWD
 I99Zqwa+C5Z/WJT4fbNe3yCmM0qcOl3BeAEHvVNQphNd/uswiSxOEDkg692CA0h6BI
 d9gnLkn/HQN4w==
Date: Mon, 10 Nov 2025 14:58:31 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Zahka <daniel.zahka@gmail.com>
Message-ID: <20251110145831.15872b86@kernel.org>
In-Reply-To: <25ebaf18-f009-45de-a3e4-fe440c42ef19@gmail.com>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
 <mfuluoi4nebyc4avj52gkfs4nqikn6uwhqnkf4o6xfswtpceuq@zhpokcx6bb6l>
 <25ebaf18-f009-45de-a3e4-fe440c42ef19@gmail.com>
MIME-Version: 1.0
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, linux-doc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jerin Jacob <jerinj@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com, Linu Cherian <lcherian@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Srujana Challa <schalla@marvell.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, Dave Ertman <david.m.ertman@intel.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sunil Goutham <sgoutham@marvell.com>,
 Jiri Pirko <jiri@resnulli.us>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ido Schimmel <idosch@nvidia.com>, Roger Quadros <rogerq@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-omap@vger.kernel.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, linux-arm-kernel@lists.infradead.org,
 Petr Machata <petrm@nvidia.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mark Bloch <mbloch@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 hariprasad <hkelam@marvell.com>, Simon Horman <horms@kernel.org>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
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

On Mon, 10 Nov 2025 08:05:57 -0500 Daniel Zahka wrote:
> On 11/9/25 5:39 AM, Jiri Pirko wrote:
> > Daniel, I asked twice if this could be a non-driver param. Jakub asked
> > for clearer definition of this know in that context.
> >
> > Not sure why you are ignoring this :/
> >  
> 
> My apologies. I think there was a miscommunication. I assumed Jakub's 
> question was directed towards you. I have no objection to making it a 
> generic param; I will do so in v4. It sounded to me like Jakub was 
> wanting more information on what exactly this setting does beyond what I 
> was able to provide in the commit message and mlx5 devlink 
> documentation. My understanding is that this setting pertains to tx 
> csums and how the device expects the driver to prepare partial csums 
> when doing tx cso. I don't really know more than that. Especially not 
> something like what the FW's role in implementing this is.

Right, per To: field of my email I as asking Jiri for clarifications.

Since we struggle to understand the semantics nack on making this
generic. Chances are whoever reuses the "generic" param will have a
different interpretation of its meaning, so what's the point of making
it generic.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
