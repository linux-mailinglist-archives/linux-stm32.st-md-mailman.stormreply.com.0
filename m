Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3FCDA698
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2019 09:40:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CC51C36B0B;
	Thu, 17 Oct 2019 07:40:49 +0000 (UTC)
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48538C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2019 07:40:47 +0000 (UTC)
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iL0On-0005XG-Le; Thu, 17 Oct 2019 08:40:41 +0100
To: David Miller <davem@davemloft.net>
References: <20191016082205.26899-1-ben.dooks@codethink.co.uk>
 <20191016.132805.1945227679877403030.davem@davemloft.net>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <f351aba0-e55b-edf3-e917-945715beaaf7@codethink.co.uk>
Date: Thu, 17 Oct 2019 08:40:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016.132805.1945227679877403030.davem@davemloft.net>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix argument to
	stmmac_pcs_ctrl_ane()
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

On 16/10/2019 21:28, David Miller wrote:
> From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
> Date: Wed, 16 Oct 2019 09:22:05 +0100
> 
>> The stmmac_pcs_ctrl_ane() expects a register address as
>> argument 1, but for some reason the mac_device_info is
>> being passed.
>>
>> Fix the warning (and possible bug) from sparse:
>>
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2613:17: warning: incorrect type in argument 1 (different address spaces)
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2613:17:    expected void [noderef] <asn:2> *ioaddr
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2613:17:    got struct mac_device_info *hw
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> I'm still reviewing this but FYI you did not have to send this
> twice.

Yes, I accidentally sent the wrong patch out (already apologised
on the re-send as I noticed it about 10 minutes after sending).

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
