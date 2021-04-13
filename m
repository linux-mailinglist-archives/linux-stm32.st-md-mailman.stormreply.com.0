Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3A35D941
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 09:48:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFDB1C57B78;
	Tue, 13 Apr 2021 07:48:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C7BCC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 07:48:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13D7kK66004778; Tue, 13 Apr 2021 09:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ScwxoI9yGOHOYLA1E0c1jakVAFuAFJxEnP0S/4GDUk8=;
 b=Cj9Bd5KD/HT8osPfvrFqEfHzKpG9kkZzMtQ+cWwqhrAZerYzrmRwzptdY+eUAn36pO3K
 MMruzQXg3dIchbt4QFHtsvQRnbYdHM7kc6pldNqwePRmViyH0uFLT0KXPhQAe5ujtGAb
 kO9WvNyzuxRG6W6dfYRU3SiZHLDd5NVq8VLNZ7Wcfp0YOHllgPFoeJCa9U70MsH15Kx8
 R7A9I7DQ/QxcLSq5qpuDeO5cVc+z9TP7oZDSYIJ+9Cr4ZBIsKfol3vb0DrWCMCsGk4uf
 Dv2ax8oKHj3Ez5IbLcfMnS4HwWYxGq2LT/W1MNHAFongA4/8kUtrVPF5+KT4HHVN5ajl 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vrp5c0jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 09:48:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C30510002A;
 Tue, 13 Apr 2021 09:48:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D1D721EAAC;
 Tue, 13 Apr 2021 09:48:12 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr
 2021 09:48:11 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210408185731.135511-1-marex@denx.de>
 <b81d6a69-713f-eda7-0837-d6e80d691c6a@foss.st.com>
 <2c410c1b-2a1d-b291-a128-c5d5979be1ef@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <340d32f1-3afb-2159-fa94-70a45aecd88c@foss.st.com>
Date: Tue, 13 Apr 2021 09:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2c410c1b-2a1d-b291-a128-c5d5979be1ef@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_03:2021-04-13,
 2021-04-13 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 0/7] ARM: dts: stm32: clk: Switch ETHRX
 clock parent from ETHCK_K to MCO2 on DHCOM SoM
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

Hi Marek

On 4/12/21 8:44 PM, Marek Vasut wrote:
> On 4/12/21 10:09 AM, Alexandre TORGUE wrote:
>> Hi Marek
> 
> Hello Alex,
> 
> [...]
> 
>>> All the above still only discusses the clock part of the problem. 
>>> Even if
>>> the clock cyclic dependencies could be solved, it would be necessary to
>>> resolve legacy dwmac st,eth-clk-sel and st,eth-ref-clk-sel DT properties
>>> and avoid DT ABI break.
>>
>> Thanks for those clear explanations and for this series. As discussed, 
>> this approach looks good to me as it doesn't break our current 
>> strategy for dwmac clock integration. I don't know if those cyclic 
>> redundancies will be fixed one day but we can have a look on dwmac DT 
>> properties (the gain to change them, the effort to keep the backward 
>> compatibility, code readability, ...).
>>
>> Your DT patches looks good. I'll merge them soon.
> +CC Stephen ; the DT patches depend on the clock driver changes. Would 
> it make sense to pick the clock patches through the same tree or how 
> should that be handled ?

In this situation, I prefer to wait that Stephen takes clock patches in 
his tree. Then I'll take DT ones in mine. (I assume that taking only 
clock patches will not break mp1 boot or Ethernet usage).

Regards
Alex


> 
> [...]
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
