Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08025E46EC
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2019 11:18:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C707C36B0B;
	Fri, 25 Oct 2019 09:18:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82756C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2019 09:18:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9P96A3g017758; Fri, 25 Oct 2019 11:17:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ogtXbD8YCbZhHddxE/GGtQWxu+Zf+FrFAhHcJX4a6z8=;
 b=bcliYt9Y1Z8yuL67LQhR1TgH4QQuJmb34pX1v/qi2WMthk5GZMwTdLdbSEY+RVTltzGj
 Z419O6nfaAR1pUDBm/feTmXo33peLMfb6fXxAffP8Jyfd1x74HBD0eJvTVcdoiIiu2DV
 XsSg4HcybnZMS8oHQCpp4/UZRmHl4tm38+BVBIS1KfAOJa6r6pBQFyNT1FSyRVyFEHJI
 B6wSWP1sj1n4zYiI0HDzkBSne1nZGwFfjNQKX9brH3aw7uM3X6OtsJyBROpMU2qiBz8V
 bdvXrzPpj4PzM6iuSeDLlPUJyTQM0SqncLbHW4IAoRupiGw4f+EB2fqLme8WmPl9T2tc ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1xsw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 11:17:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C513310002A;
 Fri, 25 Oct 2019 11:17:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag4node3.st.com [10.75.127.12])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A67972BE24C;
 Fri, 25 Oct 2019 11:17:52 +0200 (CEST)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG4NODE3.st.com
 (10.75.127.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 11:17:52 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Fri, 25 Oct 2019 11:17:52 +0200
From: Christophe ROULLIER <christophe.roullier@st.com>
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Thread-Topic: [PATCH 0/5] net: ethernet: stmmac: some fixes and optimization
Thread-Index: AQHVceL3e0a57DJk3UajMeBpRhFzv6drJNMA
Date: Fri, 25 Oct 2019 09:17:52 +0000
Message-ID: <085bdbc4-4845-a3ae-d8f3-bf4f2d753226@st.com>
References: <20190920053817.13754-1-christophe.roullier@st.com>
 <20190922151257.51173d89@cakuba.netronome.com>
 <1d5dfc73-73e1-fe47-d1f6-9c24f9e5e532@st.com>
In-Reply-To: <1d5dfc73-73e1-fe47-d1f6-9c24f9e5e532@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <A62F2998CAC83B42B39FF92B83102F7D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_05:2019-10-23,2019-10-25 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Peppe CAVALLARO <peppe.cavallaro@st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/5] net: ethernet: stmmac: some fixes and
	optimization
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

Hi all,

Just a "gentleman ping" about this series

Regards,

Christophe.

On 9/23/19 9:46 AM, Christophe ROULLIER wrote:
> Hi Jakub, all,
>
> It is not urgent, no problem to wait next merge window (release 5.5)
>
> For patch 1 and 3, it is improvement/cleanup because now syscfg clock 
> is not mandatory (I put code backward compatible).
>
> Regards,
>
> Christophe
>
> On 9/23/19 12:12 AM, Jakub Kicinski wrote:
>> On Fri, 20 Sep 2019 07:38:12 +0200, Christophe Roullier wrote:
>>> Some improvements (manage syscfg as optional clock, update slew rate of
>>> ETH_MDIO pin, Enable gating of the MAC TX clock during TX low-power 
>>> mode)
>>> Fix warning build message when W=1
>> There seems to be some new features/cleanups (or improvements as
>> you say) here. Could you explain the negative impact not applying
>> these changes will have? Patches 1 and 3 in particular.
>>
>> net-next is now closed [1], and will reopen some time after the merge
>> window is over. For now we are only expecting fixes for the net tree.
>>
>> Could you (a) provide stronger motivation these changes are fixes; or
>> (b) separate the fixes from improvements?
>>
>> Thank you!
>>
>> [1] https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
