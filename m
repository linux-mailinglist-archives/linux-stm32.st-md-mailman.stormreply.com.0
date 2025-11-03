Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C122C2E3A0
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 23:14:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E98DC62D38;
	Mon,  3 Nov 2025 22:14:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE6DEC62D37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 22:14:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6AC38402C3;
 Mon,  3 Nov 2025 22:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CA6C4CEE7;
 Mon,  3 Nov 2025 22:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762208039;
 bh=G5G/nJ6BwUDbjhos8smIO/3KjLQpgzD5ntWtzL13rts=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VTLqZ0hL1/6PHxQ6NOhzlLM6gCmDmZLOEBjsopkNlCfT1UDEUzEpPJ9dRNKIC0lpk
 5IP+NEjFrjtzZVi9MxoejBWIBOkHCXcmGUgODEYUdCpVLHPVh0cAJSOTWB1fhrl1iF
 z5hTda/0Y1Q5VJjkd598Vr+sNABtNOoGLJsImaT4TxCqGru5AW2vpM+yUdVgTQvw9e
 /xQrqh0iCogqr918cBXp+vPSsanb+KqgUvy7E+gfIndbbpFuHJomc+J7CSVORGK8ey
 IER03KXPAHJ9fglF87N61IoFLE7kR2HkjQvV097joGTXbveYEVNBBe/8GgHu9hoePF
 1hperBfe4REqA==
Date: Mon, 3 Nov 2025 14:13:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Zahka <daniel.zahka@gmail.com>
Message-ID: <20251103141356.3470701b@kernel.org>
In-Reply-To: <20251103194554.3203178-2-daniel.zahka@gmail.com>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-2-daniel.zahka@gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/2] devlink: pass extack
 through to devlink_param::get()
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

On Mon,  3 Nov 2025 11:45:52 -0800 Daniel Zahka wrote:
> Allow devlink_param::get() handlers to report error messages via
> extack. This function is called in a few different contexts, but not
> all of them will have an valid extack to use.
> 
> When devlink_param::get() is called from param_get_doit or
> param_get_dumpit contexts, pass the extack through so that drivers can
> report errors when retrieving param values. devlink_param::get() is
> called from the context of devlink_param_notify(), pass NULL in for
> the extack.

Warning: drivers/net/ethernet/intel/ice/devlink/devlink.c:618 function parameter 'extack' not described in 'ice_devlink_tx_sched_layers_get'
Warning: drivers/net/ethernet/intel/ice/devlink/devlink.c:1533 function parameter 'extack' not described in 'ice_devlink_local_fwd_get'
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
