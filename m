Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 956B313A123
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 07:54:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 493ACC36B0D;
	Tue, 14 Jan 2020 06:54:38 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99CF4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 06:54:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 22:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,431,1571727600"; d="scan'208";a="305065519"
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
 by orsmga001.jf.intel.com with ESMTP; 13 Jan 2020 22:54:30 -0800
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
 pgsmsx113.gar.corp.intel.com (10.108.55.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 14 Jan 2020 14:54:30 +0800
Received: from pgsmsx114.gar.corp.intel.com ([169.254.4.192]) by
 PGSMSX110.gar.corp.intel.com ([169.254.13.252]) with mapi id 14.03.0439.000;
 Tue, 14 Jan 2020 14:54:29 +0800
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Thread-Topic: [PATCH net 1/7] net: stmmac: fix error in updating rx tail
 pointer to last free entry
Thread-Index: AQHVyfokBfT9czhzrkq4pJYkkv91Cqfn3pcAgAHSG5A=
Date: Tue, 14 Jan 2020 06:54:29 +0000
Message-ID: <AF233D1473C1364ABD51D28909A1B1B75C45CBAC@pgsmsx114.gar.corp.intel.com>
References: <1578967276-55956-1-git-send-email-boon.leong.ong@intel.com>
 <1578967276-55956-2-git-send-email-boon.leong.ong@intel.com>
 <BN8PR12MB32661345472470F495EFAC0DD3350@BN8PR12MB3266.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB32661345472470F495EFAC0DD3350@BN8PR12MB3266.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Voon, Weifeng" <weifeng.voon@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, "Tan, Tee Min" <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 1/7] net: stmmac: fix error in
 updating rx tail pointer to last free entry
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

>From: Ong Boon Leong <boon.leong.ong@intel.com>
>Date: Jan/14/2020, 02:01:10 (UTC+00:00)
>
>> DMA_CH(#i)_RxDesc_Tail_Pointer points to an offset from the base and
>> indicates the location of the last valid descriptor.
>>
>> The change introduced by "net: stmmac: Update RX Tail Pointer to last
>> free entry" incorrectly updates the RxDesc_Tail_Pointer and causess
>> Rx operation to freeze in corner case. The issue is explained as
>> follow:-
>>
>> Say, cur_rx=1 and dirty_rx=0, then we have dirty=1 and entry=0 before
>> the while (dirty-- > 0) loop of stmmac_rx_refill() is entered. When
>> the while loop is 1st entered, Rx buffer[entry=0] is refilled and after
>> entry++, then, entry=1. Now, the while loop condition check "dirty-- > 0"
>> and the while loop bails out because dirty=0. Up to this point, the
>> driver code works correctly.
>>
>> However, the current implementation sets the Rx Tail Pointer to the
>> location pointed by dirty_rx, just updated to the value of entry(=1).
>> This is incorrect because the last Rx buffer that is refileld with empty
>> buffer is with entry=0. In another words, the current logics always sets
>> Rx Tail Pointer to the next Rx buffer to be refilled (too early).
>>
>> So, we fix this by tracking the index of the most recently refilled Rx
>> buffer by using "last_refill" and use "last_refill" to update the Rx Tail
>> Pointer instead of using "entry" which points to the next dirty_rx to be
>> refilled in future.
>
>I'm not sure about this ...
>
>RX Tail points to last valid descriptor but it doesn't point to the base
>address of that one, it points to the end address.
>
>Let's say we have a ring buffer with just 1 descriptor. With your new
>logic then: RX base == RX tail (== RX base), so the IP will not see any
>descriptor. But with old logic: RX base == (RX base + 1), which causes
>the IP to correctly see the descriptor.
>
>Can you provide more information on the Rx operation freeze you
>mentioned ? Can it be another issue ?

I recheck on my side, it seems like the fix needed for simics model at my
end and not needed for actual SoC. This is strange but I can check internal
team. I also read through the databook which says that for 40-bit or 48-bit
addressing mode, the tail pointer must be advanced to the location
immediately after the descriptors are set, for the DMA to know that
additional descriptors are available.

Now, relooking at the current logic which sets the rx tail pointer according
to the value of "dirty_rx" which can be "zero" as it takes value from entry
that is incremented through STMMAC_GET_ENTRY(entry, DMA_RX_SIZE).
This too can give a situation that the base and tail registers is pointing to
the same location.

According to SNPS databook, the DMA engine goes into SUSPEND state if the
Rx descriptors are not OWN=1. The operation can be resumed by ensuring that
the descriptors are owned by the DMA and then update the tail pointer.

What is your opinion here if we always update the Rx tail pointer to pointer
the boundary of the DMA size as follow without depending on dirty_rx.

rx_q->rx_tail_addr = rx_q->dma_rx_phy + (DMA_RX_SIZE *
		     sizeof(struct dma_desc))

Thanks
Boon Leong
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
