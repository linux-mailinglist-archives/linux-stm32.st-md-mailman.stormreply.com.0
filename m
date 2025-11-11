Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ED9C4ECAF
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 16:34:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3802C030CD;
	Tue, 11 Nov 2025 15:34:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25630C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 15:34:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8B02660205;
 Tue, 11 Nov 2025 15:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F987C4CEF5;
 Tue, 11 Nov 2025 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762875255;
 bh=/IiWVNswHcrotcXImuZbhDizvXR5f83IzztpfhJsS3g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C387oCWRJx0kXDCxVdceMrAw7Xp2ONrwf4fzsso3ilHBN5eUDEfDZc5gln26HIGHS
 QREeK2eYI5DB0V23P5YE8svKzYb0H0AfOXgoYultzhBBFQiTNuKRdO+ACLwEiqbOKy
 vFXuH/7UdT7zdJsvrSeDbmZNG7p2v0YmZOXzVdxc1ejFVQmXzaTVfQB+CL4ky9CiLP
 XkADHhMZkYQsAmvyySufJL72zovyGm+I26vbA/NJmxqPjzNLCA7O/HCSG9hLnQ0h3T
 1sR4//vn0OwcGa60PW9qgnyqkXWU9IY7XQADFO6bAuP8DOdUZyRkBfYhAVf8i0zu+w
 3DOhKUCwD9ZsA==
Date: Tue, 11 Nov 2025 07:34:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Saeed Mahameed <saeed@kernel.org>
Message-ID: <20251111073412.5aa12e38@kernel.org>
In-Reply-To: <aRKu0Iknk0jftv2Z@x130>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
 <aQ7f1T1ZFUKRLQRh@x130> <20251110150133.04a2e905@kernel.org>
 <aRKu0Iknk0jftv2Z@x130>
MIME-Version: 1.0
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, linux-doc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jerin Jacob <jerinj@marvell.com>,
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
 Jiri Pirko <jiri@resnulli.us>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ido Schimmel <idosch@nvidia.com>, Roger Quadros <rogerq@kernel.org>,
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

On Mon, 10 Nov 2025 19:34:40 -0800 Saeed Mahameed wrote:
> On 10 Nov 15:01, Jakub Kicinski wrote:
> >On Fri, 7 Nov 2025 22:14:45 -0800 Saeed Mahameed wrote:  
> >> Plug in the err, NL_SET_ERR_MSG_FMT_MOD(.., .., err);
> >> other locations as well.  
> >
> >Incorrect. extack should basically be passed to perror()
> >IOW user space will add strerror(errno) after, anyway.
> >Adding the errno inside the string is pointless and ugly.  
> 
> ernno set by stack. err set by driver. we can't assume err will propagate
> to errno, this is up to the stack.
> 
> And not at all ugly, very useful debug hint to the user, unless you
> guarantee err == errno.

Not propagating errno should be fixed, if that happens.
We need clear expectations to avoid the messages being all over 
the place. Historically we haven't included err because formatting
was not an option. So I think we should continue this way.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
