Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 961311479C9
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 09:56:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56AEFC36B0C;
	Fri, 24 Jan 2020 08:56:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38ABBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 08:56:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 00:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,357,1574150400"; d="scan'208";a="260174149"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2020 00:56:29 -0800
Received: from pgsmsx114.gar.corp.intel.com ([169.254.4.192]) by
 PGSMSX101.gar.corp.intel.com ([169.254.1.131]) with mapi id 14.03.0439.000;
 Fri, 24 Jan 2020 16:56:28 +0800
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Thread-Topic: [PATCH net v3 1/5] net: stmmac: Fix incorrect location to set
 real_num_rx|tx_queues
Thread-Index: AQHV0QPigSDsI0BxMUeg/pQlin0Cyqf17B8AgAOVJYA=
Date: Fri, 24 Jan 2020 08:56:28 +0000
Message-ID: <AF233D1473C1364ABD51D28909A1B1B75C488EDC@pgsmsx114.gar.corp.intel.com>
References: <20200122090936.28555-1-boon.leong.ong@intel.com>
 <20200122090936.28555-2-boon.leong.ong@intel.com>
 <BN8PR12MB3266F0534CE20CE906AA3C06D30C0@BN8PR12MB3266.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3266F0534CE20CE906AA3C06D30C0@BN8PR12MB3266.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: Joao
 Pinto <Joao.Pinto@synopsys.com>, "Voon, Weifeng" <weifeng.voon@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Tan,
 Tee Min" <tee.min.tan@intel.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v3 1/5] net: stmmac: Fix incorrect
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



>-----Original Message-----
>From: Jose Abreu <Jose.Abreu@synopsys.com>
>Sent: Wednesday, January 22, 2020 5:56 PM
>To: Ong, Boon Leong <boon.leong.ong@intel.com>; netdev@vger.kernel.org
>Cc: Tan, Tee Min <tee.min.tan@intel.com>; Voon, Weifeng
><weifeng.voon@intel.com>; Giuseppe Cavallaro <peppe.cavallaro@st.com>;
>Alexandre TORGUE <alexandre.torgue@st.com>; David S . Miller
><davem@davemloft.net>; Maxime Coquelin <mcoquelin.stm32@gmail.com>;
>Joao Pinto <Joao.Pinto@synopsys.com>; Arnd Bergmann <arnd@arndb.de>;
>Alexandru Ardelean <alexandru.ardelean@analog.com>; linux-stm32@st-md-
>mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
>kernel@vger.kernel.org
>Subject: RE: [PATCH net v3 1/5] net: stmmac: Fix incorrect location to set
>real_num_rx|tx_queues
>
>From: Ong Boon Leong <boon.leong.ong@intel.com>
>Date: Jan/22/2020, 09:09:32 (UTC+00:00)
>
>> For driver open(), rtnl_lock is acquired by network stack but not in the
>> resume(). Therefore, we introduce lock_acquired boolean to control when
>> to use rtnl_lock|unlock() within stmmac_hw_setup().
>
>Why not use rtnl_is_locked() instead of the boolean ?

We know that stmmac_open() is called with rtnl_mutex locked by caller.
And, stmmac_resume() is called without rtnl_mutex is locked by caller.
If we replace the boolean with rtnl_is_locked(), then we will have the
following logics in stmmac_hw_setup():-

     if (!rtnl_is_locked)   ---- (A)
         rtnl_lock();
     netif_set_real_num_rx_queues();
     netif_set_real_num_tx_queues();
     if (!rtnl_is_locked)   ---- (B)
         rtnl_unlock();

For stmmac_open(), (A) is false but (B) is true. 
So, the stmmac_open() exits with rtnl_mutex is released.
Here, the above logic does not perserve the original rtnl_mutex
is locked when stmmac_open() is called.

For stmmac_resume(), (A) is true, and (B) is also true.
So, the stmmac_resume() exits with rtnl_mutex is released.
Here, the above logic works well as the original rtnl_mutex is released
when stmmac_resume() is called.
 
So, as far as I can see, the proposed boolean approach works fine for both
stmmac_open() and stmmac_resume().

Do you agree? 
 


 
 

 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
