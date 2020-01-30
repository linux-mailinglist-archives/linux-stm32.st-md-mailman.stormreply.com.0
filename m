Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC9B14DBE5
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jan 2020 14:30:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB899C36B0B;
	Thu, 30 Jan 2020 13:30:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CA69C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 13:30:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00UDNhRE005759; Thu, 30 Jan 2020 14:30:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DDE7wRVrKC8L3nY1nmBlLG8DjibQ4CfnKv8w7/2QhPU=;
 b=T2ffEgEjN/DMXOY2HgMx42+9Qeuasz4Zl5qAECuKJeXBe0JiI+Z5YfCa6AouqnQm5mcv
 ZlHUuDE/xzlUlF/DiZhmpY1vNaS9E7RbPuNIFaJCYKkjeJtpXt/OvtaDohE362vHhGKJ
 40fribYB498l3vlZFqz/qoTfwcnfgFffuuOdUWnwm0DPOO+NPunxz41cKYRroq3qbiVD
 4x8DLE4Ji32iPI2wG7F6I319uTcRJD7Xqc+4oQWEoUA6hllvmW8T6IYged0JrXW72AAv
 S9izNaMquA24kcdPLuuLXzgw8c9RRaoauvVBwpyKL/Yba1LdVLzi+8EkQGV5YqMA+4Oo Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpb8sp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2020 14:30:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21FCE10002A;
 Thu, 30 Jan 2020 14:30:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA4BF2D5CFA;
 Thu, 30 Jan 2020 14:30:05 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 30 Jan
 2020 14:30:05 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 30 Jan 2020 14:30:05 +0100
From: Christophe ROULLIER <christophe.roullier@st.com>
To: David Miller <davem@davemloft.net>
Thread-Topic: [PATCH 1/1] net: ethernet: stmmac: simplify phy modes management
 for stm32
Thread-Index: AQHV1pIW1y791lwjMUusjpFyRZvewKgDJNKA
Date: Thu, 30 Jan 2020 13:30:05 +0000
Message-ID: <05adc7cc-19cb-7e6e-f6df-07ec8f5e841f@st.com>
References: <20200128083942.17823-1-christophe.roullier@st.com>
 <20200129.115131.1101786807458791369.davem@davemloft.net>
In-Reply-To: <20200129.115131.1101786807458791369.davem@davemloft.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <C6EE503FF153424FB0ED17B9583F7CA4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_03:2020-01-28,
 2020-01-30 signatures=0
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Peppe CAVALLARO <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] net: ethernet: stmmac: simplify phy
 modes management for stm32
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

On 1/29/20 11:51 AM, David Miller wrote:
> From: Christophe Roullier <christophe.roullier@st.com>
> Date: Tue, 28 Jan 2020 09:39:42 +0100
>
>> No new feature, just to simplify stm32 part to be easier to use.
>> Add by default all Ethernet clocks in DT, and activate or not in function
>> of phy mode, clock frequency, if property "st,ext-phyclk" is set or not.
>> Keep backward compatibility
>> -----------------------------------------------------------------------
>> |PHY_MODE | Normal | PHY wo crystal|   PHY wo crystal   |  No 125Mhz  |
>> |         |        |      25MHz    |        50MHz       |  from PHY   |
>> -----------------------------------------------------------------------
>> |  MII    |	 -    |     eth-ck    |       n/a          |	    n/a  |
>> |         |        | st,ext-phyclk |                    |             |
>> -----------------------------------------------------------------------
>> |  GMII   |	 -    |     eth-ck    |       n/a          |	    n/a  |
>> |         |        | st,ext-phyclk |                    |             |
>> -----------------------------------------------------------------------
>> | RGMII   |	 -    |     eth-ck    |       n/a          |      eth-ck  |
>> |         |        | st,ext-phyclk |                    |st,eth-clk-sel|
>> |         |        |               |                    |       or     |
>> |         |        |               |                    | st,ext-phyclk|
>> ------------------------------------------------------------------------
>> | RMII    |	 -    |     eth-ck    |      eth-ck        |	     n/a  |
>> |         |        | st,ext-phyclk | st,eth-ref-clk-sel |              |
>> |         |        |               | or st,ext-phyclk   |              |
>> ------------------------------------------------------------------------
>>
>> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> If anything, this is more of a cleanup, and therefore only appropriate for
> net-next when it opens back up.
Thanks David, It is not urgent, do you want that I re-push it with 
"PATCH net next" ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
