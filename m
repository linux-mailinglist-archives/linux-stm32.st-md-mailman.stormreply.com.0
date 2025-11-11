Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB53C4B4FA
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 04:26:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FFC7C60497;
	Tue, 11 Nov 2025 03:26:39 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 514BBC60496
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 03:26:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A03E360202;
 Tue, 11 Nov 2025 03:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37601C4CEF5;
 Tue, 11 Nov 2025 03:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762831596;
 bh=SF8ejBUx63BEWVbo35HrIhmuFlhum3NF91vPz7W/S9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=arA+s8Lck9ZMVhIL7OYtfs+oWUJRLcttj4EpE7KRk7v1UFN/ft+8fCUgtsMc9gd76
 xbz4H/FDW92jLwUvPHG1/WqhhK/z+mVldQc2od6H+BtjiQB5JxvQ4gM5lD1vbzg+pb
 OIGUaErFPL8HlyvrJVGOJSgG6krBoN0V6JHOlVSp76LaFGEO6EWU5piCu0OvjblFrG
 F1/jjUCtMmVj/39yjWouTOw7gaRBlyA5oyUIXix6w4uHaltQIts5/VuBnRuBzJrWIH
 Cq/wXocuXrdrwYG9qhGNsItJ2oZ+mWg1KHT70AM/kbW2xbJC2oehFU+RZ7t/XXG9uM
 4U13e4tZIDmyA==
Date: Mon, 10 Nov 2025 19:26:34 -0800
From: Saeed Mahameed <saeed@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aRKs6jXqSvC3G_R0@x130>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
 <aQ7f1T1ZFUKRLQRh@x130>
 <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
 <20251110154643.66d15800@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251110154643.66d15800@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10 Nov 15:46, Jakub Kicinski wrote:
>On Sun, 9 Nov 2025 11:46:37 +0100 Jiri Pirko wrote:
>> >So, I checked a couple of flows internally, and it seems this allows
>> >some flexibility in the FW to decide later on which mode to pick,
>> >based on other parameters, which practically means
>> >"user has no preference on this param". Driver can only find out
>> >after boot, when it reads the runtime capabilities, but still
>> >this is a bug, by the time the driver reads this (in devlink), the
>> >default value should've already been determined by FW, so FW must
>> >return the actual runtime value. Which can only be one of the following
>>
>> I don't think it is correct to expose the "default" as a value.
>>
>> On read, user should see the configured value, either "full_csum" or
>> "l4_only". Reporting "default" to the user does not make any sense.
>> On write, user should pass either "full_csum" or "l4_only". Why we would
>> ever want to pass "default"?
>
>FWIW I agree that this feels a bit odd. Should the default be a flag
>attr? On get flag being present means the value is the FW default (no
>override present). On set passing the flag means user wants to reset
>to FW default (remove override)?
>
>> Regardless this patch, since this is param to be reflected on fw reboot
>> (permanent cmode), I think it would be nice to expose indication if
>> param value passed to user currently affects the fw, or if it is going
>> to be applied after fw reboot. Perhaps a simple bool attr would do?
>
>IIUC we're basically talking about user having no information that
>the update is pending? Could this be done by the core? Core can do
>a ->get prior to calling ->set and if the ->set succeeds and
>cmode != runtime record that the update is pending?
>

Could work if on GET driver reads 'current' value from FW, then it should
be simpler if GET != SET then 'pending', one problem though is if SET was
done by external tool or value wasn't applied after reboot, then we loose
that information, but do we care? I think we shouldn't.

>That feels very separate from the series tho, there are 3 permanent
>params in mlx5, already. Is there something that makes this one special?

In mlx5 they all have the same behavior, devlink sets 'next' value, 
devlink reads 'next' value. The only special thing about the new param
is that it has a 'device_default' value and when you read that from 
'next' it will always show 'device_default' as the actual value is only
known at run time ,e.g. 'next boot'.

I think the only valid solution for permanent and drv_init params is to
have 'next' and 'current' values reported by driver on read. 
Or maybe go just with  'set' != 'get' then 'pending' as discussed above ?

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
