Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED756BE1E8
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 08:29:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15F2AC69067;
	Fri, 17 Mar 2023 07:29:34 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95EBDC65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 07:29:32 +0000 (UTC)
Received: from maxwell ([109.42.112.148]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis) id
 1MJn8J-1pxDxV14DR-00K6xA; Fri, 17 Mar 2023 08:28:28 +0100
References: <20230316095306.721255-1-jh@henneberg-systemdesign.com>
 <20230316131503.738933-1-jh@henneberg-systemdesign.com>
 <ZBOhy02DFBlnIQR1@shell.armlinux.org.uk>
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Date: Fri, 17 Mar 2023 08:22:57 +0100
In-reply-to: <ZBOhy02DFBlnIQR1@shell.armlinux.org.uk>
Message-ID: <87edpng7l9.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5QIZD/zEoIlUl4J9g1YiRKLAvKnLDmfGku0rnPpP1GG1pOn9VFa
 gZ65HdQ0A+BnO6uOKrPi9+upVoPI97O/Vt5RPMeh+n9Yp7gDzxgJXLzIgNfbJoN0W+UT0+V
 g5vHPFtmWyMvG1ZqxHCzKb496+Q1ZfunoHrMGb8GRQla4ubIUed752mK8Q1uWvwhX6HNpJE
 Oo6tRW5cs3XaDQHjb2gzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7PiMw8IYENA=;k4c5pIjPJUsV5oRScIM0B9sC78P
 HjQyFk/eU/EPi0rAE0h+h6T1NUTPYSytJoYuLnow2QN9Bai97/Wpw5ZAxEiA8C8uCKrn30pcD
 O4q36cWjc7Tw4QMS4IoQyiEpNnJ1bYaUNgkjEk5YwE63pyvhF3ZO00N72zC1wlYI1GTV2+g9z
 Cgqui2M39MKGpH5YqXKxkj6p4o12zcN4cLG6/AEA0UdeZJXQd1EaRnSK+k1J7qq+FBfVc3GHM
 mBNDOYIk/046k5x2HgPRJlp9vRvl2ExAhLbYG2M10xR9TJd7Rrrg/C5TUNOHbbQhJIYLdLuV5
 7ssRvmZ3jjywLS66YPNvUHDVRMsXjAN34Z7Ia3EYEscnw8ew8fb0gexYfG4pc+Z4HC06K/EOp
 efyVVnjCbqQYkO0ahy7lWEEPfrfeYfk80mgPqKXiOAsqJ2/BMvgi9nmI+SVy5dLV0V22JcAF+
 +Paj4fxH3fvgqLZwcGv4B4btmESueFsBFoeY0ivu6gBw4hJSRWyrI/ISQGqu5dLUkSNr3cGS1
 Rl+K/n6hayQi8cDWYf/uCyGHJ3+lQbMGJHAofBZsAclRclNJmJIDMEtlDu+UWldoRV4n4UMqH
 NEVLn0rwTFsa6hJJlLL8+fmg6ZsLtO7JYLgWk4MTdf/Nw1y6gGg8gcsC8zNSAwFJGcnXlVghQ
 dEiUuZVi4zRt8zK/f6LdNNG+F3VK1wz332jRWT9eMA==
X-Topics: 
Cc: Voon Weifeng <weifeng.voon@intel.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 linux-mediatek@lists.infradead.org, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net V2] net: stmmac: Fix for mismatched
 host/device DMA address width
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


"Russell King (Oracle)" <linux@armlinux.org.uk> writes:

> On Thu, Mar 16, 2023 at 02:15:03PM +0100, Jochen Henneberg wrote:
>> Currently DMA address width is either read from a RO device register
>> or force set from the platform data. This breaks DMA when the host DMA
>> address width is <=32it but the device is >32bit.
>> 
>> Right now the driver may decide to use a 2nd DMA descriptor for
>> another buffer (happens in case of TSO xmit) assuming that 32bit
>> addressing is used due to platform configuration but the device will
>> still use both descriptor addresses as one address.
>> 
>> This can be observed with the Intel EHL platform driver that sets
>> 32bit for addr64 but the MAC reports 40bit. The TX queue gets stuck in
>> case of TCP with iptables NAT configuration on TSO packets.
>> 
>> The logic should be like this: Whatever we do on the host side (memory
>> allocation GFP flags) should happen with the host DMA width, whenever
>> we decide how to set addresses on the device registers we must use the
>> device DMA address width.
>> 
>> This patch renames the platform address width field from addr64 (term
>> used in device datasheet) to host_addr and uses this value exclusively
>> for host side operations while all chip operations consider the device
>> DMA width as read from the device register.
>> 
>> Fixes: 7cfc4486e7ea ("stmmac: intel: Configure EHL PSE0 GbE and PSE1 GbE to 32 bits DMA addressing")
>> Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
>> ---
>> V2: Fixes from checkpatch.pl for commit message
>> 
>>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |  2 +-
>>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 +--
>>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  2 +-
>>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 ++++++++++---------
>>  include/linux/stmmac.h                        |  2 +-
>>  6 files changed, 22 insertions(+), 19 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
>> index 6b5d96bced47..55a728b1b708 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
>> @@ -418,6 +418,7 @@ struct dma_features {
>>  	unsigned int frpbs;
>>  	unsigned int frpes;
>>  	unsigned int addr64;
>> +	unsigned int host_addr;
>
> Obvious question: is host_addr an address? From the above description it
> sounds like this is more of a host address width indicator.
>
> Maybe call these "dev_addr_width" and "host_addr_width" so it's clear
> what each of these are?

You are right. I chose the name because the original field was called
addr64 which follows the naming from the chip specification. I will
switch to host_dma_width which makes it more clear that it's a DMA
address width. For both the platform field as well as the driver's
private data.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
