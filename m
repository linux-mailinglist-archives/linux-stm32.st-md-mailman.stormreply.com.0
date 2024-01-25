Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C13683CB0F
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 19:31:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CAACC6B477;
	Thu, 25 Jan 2024 18:31:29 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6CBDC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=u4CrcfRRouAam+gtwWUyS4EOA4ggi0EQiB/dLp0zrqw=; b=KmE9Igl9ur6EuxOtRm2zlEbgot
 Y3bbkrUZdnL/BP0h0RHhCuVPNs9nTvysVgfO0bX2GNuxI3GMZS6s3f+tlXgiqKHFl0wHuTZdleNOg
 Zn/wl1s8aIxd58g+gI554jVLQU9PI6wOiA+lV8BbIS13TkGk6mjzHib13aXNiRejZyyhDRN0ZKMQL
 eIrq0PqKa9pwDyImfXu9u34AkYjzIQWSWVrEqHNKeynYDvCr7DfpzFrMKVxHXUfDKz+QHLKHgps7t
 PRDHafOVZfJv+3yeDApsXSPN85ErAK5hBp/Hf2WmniPNX+LkZUZx6fKOhdgvxYHYxqZCYxAiQ5uH2
 CQCWwqPA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1rT4VY-000EIW-R1; Thu, 25 Jan 2024 19:31:24 +0100
Received: from [87.49.43.79] (helo=localhost)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <esben@geanix.com>)
 id 1rT4VX-000QQV-PI; Thu, 25 Jan 2024 19:31:23 +0100
From: Esben Haabendal <esben@geanix.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <081af630-ab5d-4502-a29a-a8577d414809@linux.dev> (Vadim
 Fedorenko's message of "Thu, 25 Jan 2024 17:11:08 +0000")
References: <cover.1706184304.git.esben@geanix.com>
 <5606bb5f0b7566a20bb136b268dae89d22a48898.1706184304.git.esben@geanix.com>
 <081af630-ab5d-4502-a29a-a8577d414809@linux.dev>
Date: Thu, 25 Jan 2024 19:31:23 +0100
Message-ID: <875xzh6z9g.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)
Cc: Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: dwmac-imx: set TSO/TBS
 TX queues default settings
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

Vadim Fedorenko <vadim.fedorenko@linux.dev> writes:

> On 25/01/2024 12:34, Esben Haabendal wrote:
>> TSO and TBS cannot coexist. For now we set i.MX Ethernet QOS controller to use
>> TX queue with TSO and the rest for TBS.
>> TX queues with TBS can support etf qdisc hw offload.
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
>> index 8f730ada71f9..c42e8f972833 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
>> @@ -353,6 +353,12 @@ static int imx_dwmac_probe(struct platform_device *pdev)
>>   	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
>>   		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
>>   +        for (int i = 0; i < plat_dat->tx_queues_to_use; i++) {
>> +                /* Default TX Q0 to use TSO and rest TXQ for TBS */
>> +                if (i > 0)
>> +                        plat_dat->tx_queues_cfg[i].tbs_en = 1;
>> +        }
>> +
>
> Just wonder why don't you start with i = 1 and remove 'if' completely?
> Keeping comment in place will make it understandable.

No good reason for now. Later on, we might have some setup in the same
lop that also applies to Q0. But the init value can be changed at that
point.

>
>>   	plat_dat->host_dma_width = dwmac->ops->addr_width;
>>   	plat_dat->init = imx_dwmac_init;
>>   	plat_dat->exit = imx_dwmac_exit;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
