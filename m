Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 850456FD2F9
	for <lists+linux-stm32@lfdr.de>; Wed, 10 May 2023 01:13:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F8A2C6904F;
	Tue,  9 May 2023 23:13:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13217C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 23:13:26 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5DE8685BBE;
 Wed, 10 May 2023 01:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683674006;
 bh=kUKynXHnB7hQz14g5QVtrKhIA4Q4nRMRFctlKonAY14=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xd0GlAhRX/ZxrY1SIXIze2aQMNCXuQ9OTxiZTK2BTxYmU+9QM+B8UZUPzwqD80h0Q
 Vk7xMhzPt0xGKhfRgAFU4ZRd4qwrbCzXXdKTFKTbAuUT9fZm+MLIuXqxTxAg2vFhpm
 lrDZ5b9B6YLHPBaaDOxBumToO7XPbu6tyJiE8QjurksUyTamgWJTY5MybLdgC2/VY+
 2YDzFzpq7euGp1sG1lZWwmS41UfXr7oMZdDRQ6rOiFOydL9U+f7EoYFRovICGJqfoe
 EXeNByfRPLy4NE/AY2OW2gBWaig/nTF4680aIJzhqrDaXlZWSp+iz/7WDV85JvEepo
 9qEiyP7DvXrcw==
Message-ID: <92210ade-85fd-e89e-615e-d81965bf6508@denx.de>
Date: Wed, 10 May 2023 01:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Francesco Dolcini <francesco@dolcini.it>
References: <20230506235845.246105-1-marex@denx.de>
 <ZFqKPyCvFA7BD3y7@francesco-nb.int.toradex.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZFqKPyCvFA7BD3y7@francesco-nb.int.toradex.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Paolo Abeni <pabeni@redhat.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Harald Seiler <hws@denx.de>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Initialize
	MAC_ONEUS_TIC_COUNTER register
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

On 5/9/23 20:00, Francesco Dolcini wrote:
> On Sun, May 07, 2023 at 01:58:45AM +0200, Marek Vasut wrote:
>> Initialize MAC_ONEUS_TIC_COUNTER register with correct value derived
>> from CSR clock, otherwise EEE is unstable on at least NXP i.MX8M Plus
>> and Micrel KSZ9131RNX PHY, to the point where not even ARP request can
>> be sent out.
>>
>> i.MX 8M Plus Applications Processor Reference Manual, Rev. 1, 06/2021
>> 11.7.6.1.34 One-microsecond Reference Timer (MAC_ONEUS_TIC_COUNTER)
>> defines this register as:
>> "
>> This register controls the generation of the Reference time (1 microsecond
>> tic) for all the LPI timers. This timer has to be programmed by the software
>> initially.
>> ...
>> The application must program this counter so that the number of clock cycles
>> of CSR clock is 1us. (Subtract 1 from the value before programming).
>> For example if the CSR clock is 100MHz then this field needs to be programmed
>> to value 100 - 1 = 99 (which is 0x63).
>> This is required to generate the 1US events that are used to update some of
>> the EEE related counters.
>> "
>>
>> The reset value is 0x63 on i.MX8M Plus, which means expected CSR clock are
>> 100 MHz. However, the i.MX8M Plus "enet_qos_root_clk" are 266 MHz instead,
>> which means the LPI timers reach their count much sooner on this platform.
>>
>> This is visible using a scope by monitoring e.g. exit from LPI mode on TX_CTL
>> line from MAC to PHY. This should take 30us per STMMAC_DEFAULT_TWT_LS setting,
>> during which the TX_CTL line transitions from tristate to low, and 30 us later
>> from low to high. On i.MX8M Plus, this transition takes 11 us, which matches
>> the 30us * 100/266 formula for misconfigured MAC_ONEUS_TIC_COUNTER register.
>>
>> Configure MAC_ONEUS_TIC_COUNTER based on CSR clock, so that the LPI timers
>> have correct 1us reference. This then fixes EEE on i.MX8M Plus with Micrel
>> KSZ9131RNX PHY.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com> # Toradex Verdin iMX8MP
> 
> I think this commit should have a fixes tag, what about
> 
> Fixes: 477286b53f55 ("stmmac: add GMAC4 core support")

Fine by me.

>> NOTE: I suspect this can help with Toradex ELB-3757, Marcel, can you please
>>        test this patch on i.MX8M Plus Verdin ?
>>        https://developer-archives.toradex.com/software/linux/release-details?module=Verdin+iMX8M+Plus&key=ELB-3757
> I think you are right, your patch clearly makes a difference here.

Thanks for testing !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
