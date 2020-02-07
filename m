Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BB21552D7
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2020 08:21:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFFFCC36B0B;
	Fri,  7 Feb 2020 07:21:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32C35C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2020 07:21:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 23:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,412,1574150400"; d="scan'208";a="250325781"
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
 by orsmga002.jf.intel.com with ESMTP; 06 Feb 2020 23:21:39 -0800
Received: from pgsmsx114.gar.corp.intel.com ([169.254.4.192]) by
 PGSMSX104.gar.corp.intel.com ([169.254.3.14]) with mapi id 14.03.0439.000;
 Fri, 7 Feb 2020 15:21:38 +0800
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: David Miller <davem@davemloft.net>
Thread-Topic: [PATCH net v4 1/6] net: stmmac: Fix incorrect location to set
 real_num_rx|tx_queues
Thread-Index: AQHV3AI9OlvIBg8tJE+vuiHHv7FbVKgMFToAgAM6L7A=
Date: Fri, 7 Feb 2020 07:21:38 +0000
Message-ID: <AF233D1473C1364ABD51D28909A1B1B75C4A8F7E@pgsmsx114.gar.corp.intel.com>
References: <20200205085510.32353-1-boon.leong.ong@intel.com>
 <20200205085510.32353-2-boon.leong.ong@intel.com>
 <20200205.143924.1875004608052019375.davem@davemloft.net>
In-Reply-To: <20200205.143924.1875004608052019375.davem@davemloft.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "Tan,
 Tee Min" <tee.min.tan@intel.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "alexandru.ardelean@analog.com" <alexandru.ardelean@analog.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v4 1/6] net: stmmac: Fix incorrect
 location to set real_num_rx|tx_queues
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

From: David Miller <davem@davemloft.net>
Date: Wednesday, February 5, 2020 9:39 PM

>From: Ong Boon Leong <boon.leong.ong@intel.com>
>Date: Wed,  5 Feb 2020 16:55:05 +0800
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 5836b21edd7e..4d9afa13eeb9 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -2657,6 +2657,10 @@ static int stmmac_hw_setup(struct net_device
>*dev, bool init_ptp)
>>  >--->-------stmmac_enable_tbs(priv, priv->ioaddr, enable, chan);
>>  >---}
>>
>> +>---/* Configure real RX and TX queues */
>> +>---netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
>> +>---netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
>> +
>>  >---/* Start the ball rolling... */
>>  >---stmmac_start_all_dma(priv);
>>
>
>It is only safe to ignore the return values from
>netif_set_real_num_{rx,tx}_queues() if you call them before the
>network device is registered.  Because only in that case are these
>functions guaranteed to succeed.
>
>But now that you have moved these calls here, they can fail.
>
>Therefore you must check the return value and unwind the state
>completely upon failures.
>
>Honestly, I think this change will have several undesirable side effects:
>
>1) Lots of added new code complexity
>
>2) A new failure mode when resuming the device, users will find this
>   very hard to diagnose and recover from
>
>What real value do you get from doing these calls after probe?
>
>If you can't come up with a suitable answer to that question, you
>should reconsider this change.
>
>Thanks.

We have patch that implements get|set_channels() that depends on this fix.
Anyway, we understand your insight and perspective now. So, we will drop
this patch in v5 series.

Thanks
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
