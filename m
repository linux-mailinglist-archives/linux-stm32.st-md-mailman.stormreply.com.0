Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF94C427C2
	for <lists+linux-stm32@lfdr.de>; Sat, 08 Nov 2025 06:38:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8C27C1A97F;
	Sat,  8 Nov 2025 05:38:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CD83C06935
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Nov 2025 05:38:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 45AC461902;
 Sat,  8 Nov 2025 05:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC516C19422;
 Sat,  8 Nov 2025 05:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762580313;
 bh=w6GXV8F8qq8Ivlsip/h/QX7gHcMdkkyqZQffmsH93Go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R6rzkZ9aOnGt/EQ9R93dim8mBYYjOjakJehQ5+rN7x3rvkrZwgPe3DNMNBLOS6Sh4
 mImZKwWN8OxH6gjwHfbPpky8S4xfaMEw4jAyYKPEkT3ztoZqWXNpmZBCg3s9GW11DH
 ubqLYGlFVZD9/bwsgi4HUeIL+tGoVZRpcmwSzbCHe4/tKN/YY1WJFNFfWmJhYpQvYq
 aLmPydUhP1j4nb/QPh4Bpfzi2TidyWlqi7OIYoBoMGpHxUbV0BbBU/eCT9rJf0d0LI
 UGX4tJ2pBMvLkxAGG5WdK5NuaGVKDGXY0wPCPhO3ZVQAVKzkoatva84A/KHH/1yljJ
 uT5/heaaQlZPQ==
Date: Fri, 7 Nov 2025 21:38:32 -0800
From: Saeed Mahameed <saeed@kernel.org>
To: Daniel Zahka <daniel.zahka@gmail.com>
Message-ID: <aQ7XWOI68rVDRewR@x130>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
 <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
 <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
 <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
 <78db1fab-e482-4ebc-82ce-ba84b3f561e2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78db1fab-e482-4ebc-82ce-ba84b3f561e2@gmail.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, Dave Ertman <david.m.ertman@intel.com>,
 linux-doc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jerin Jacob <jerinj@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com, Linu Cherian <lcherian@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Srujana Challa <schalla@marvell.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net/mlx5: implement
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 04 Nov 09:48, Daniel Zahka wrote:
>
>
>On 11/4/25 9:39 AM, Jiri Pirko wrote:
>>Tue, Nov 04, 2025 at 01:51:16PM +0100, daniel.zahka@gmail.com wrote:
>>>
>>>On 11/4/25 6:38 AM, Daniel Zahka wrote:
>>>>
>>>>On 11/4/25 5:14 AM, Jiri Pirko wrote:
>>>>>I did some research. 0/DEVICE_DEFAULT should not be ever reported back
>>>>>from FW. It's purpose is for user to reset to default FW configuration.
>>>>>What's the usecase for that? I think you could just avoid
>>>>>0/DEVICE_DEFAULT entirely, for both get and set.
>>>>I find that 0/DEVICE_DEFAULT is reported back on my device. I have
>>>>observed this same behavior when using the mstconfig tool for setting t=
he
>>>>parameter too.
>>>e.g.
>>>$ dmesg | grep -i mlx | grep -i firmware
>>>[=A0 =A010.165767] mlx5_core 0000:01:00.0: firmware version: 28.46.1006
>>>
>>>$ ./mstconfig -d 01:00.0 -b ./mlxconfig_host.db query SWP_L4_CHECKSUM_MO=
DE
>>>
>>>Device #1:
>>>----------
>>>
>>>Device type:=A0 =A0 =A0 =A0 ConnectX7
>>>Name:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CX71143DMC-CDAE_FB_Ax
>>>Description:=A0 =A0 =A0 =A0 ConnectX-7 Ethernet adapter card; 100 GbE OC=
P3.0;
>>>Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure Bo=
ot
>>>Device:=A0 =A0 =A0 =A0 =A0 =A0 =A001:00.0
>>>
>>>Configurations:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 Next Boot
>>> =A0 =A0 =A0 =A0 SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0)
>>This is next-boot value. You should query current (--enable_verbosity)
>>to show in param get.
>
>I am still seeing that DEVICE_DEFAULT(0) is read back:
>
>$ ./mstconfig --enable_verbosity -d 01:00.0 -b ./mlxconfig_host.db =

>query SWP_L4_CHECKSUM_MODE
>
>Device #1:
>----------
>
>Device type:=A0 =A0 =A0 =A0 ConnectX7
>Name:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CX71143DMC-CDAE_FB_Ax
>Description:=A0 =A0 =A0 =A0 ConnectX-7 Ethernet adapter card; 100 GbE OCP3=
.0; =

>Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure =

>Boot
>Device:=A0 =A0 =A0 =A0 =A0 =A0 =A001:00.0
>
>Configurations:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Default=A0 =A0 =A0 =A0 =
=A0 =A0 =A0Current =A0 =A0 =A0 Next Boot
>=A0 =A0 =A0 =A0 SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0) DEVICE_DEFAULT(0)=
=A0 =A0 =

>DEVICE_DEFAULT(0)
>

When default value of nvconfig is managed by FW, 0 will always mean
DEVICE_DEFAULT, and it is a way for the driver to reset back to default on
write, but on read FW should never return it, so this is a FW bug.

But this shouldn't block this series so just return 'default', from the =

driver perspective we should return 'default' when we know 0 means that.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
