Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA271DDAB
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 10:27:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 604CBC35E03
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 08:27:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2F36C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 08:27:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3T8HDBq003668; Mon, 29 Apr 2019 10:26:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=/F7blK1EGqFXY58nMXu21tmRUNkOeht4WEwQ9K/sVWM=;
 b=kAt21Ma5POzlMvXF7jSN3A+IgXFFbjItqckL+IoSRkkL+5pKFfcmmnQAArWDqZVQMJRy
 MZXiQCpId5XgCTYgJGTIKs8+ltltvU7TrvAcBLj5f579Lhxe5++zY9nvJW3A5jmagWFl
 WPtgLDArp/1SIX3Jy1LdmG/VhobLRsAlL/QuNwiTkFyyfKbaHwuOZ3nglvS+vUWzeEqG
 ULHARVjRbsWdw/ptFAlt4OxO/81xx0to4eukTxGJ/aOZNwTWb73u9o2N7mL413ELU1T6
 9HlGccZH9pB3kZ84y22Yl0WfLiiXCQDsR71/c/n0J40A6d3Pyb6KxybuhCbJUasZEtUW 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s4c743r13-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Apr 2019 10:26:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6EFAA43;
 Mon, 29 Apr 2019 08:26:54 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D88E11340;
 Mon, 29 Apr 2019 08:26:53 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 29 Apr
 2019 10:26:53 +0200
To: biao huang <biao.huang@mediatek.com>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
 <1556433009-25759-3-git-send-email-biao.huang@mediatek.com>
 <24f4b268-aa7f-e1f7-59fc-2bc163eb8277@st.com>
 <1556525353.24897.30.camel@mhfsdcap03>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <738b37cd-4719-9257-18fc-aab1dc7424f4@st.com>
Date: Mon, 29 Apr 2019 10:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556525353.24897.30.camel@mhfsdcap03>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_04:, , signatures=0
Cc: jianguo.zhang@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 yt.shen@mediatek.com, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] net: stmmac: fix csr_clk can't be
	zero issue
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



On 4/29/19 10:09 AM, biao huang wrote:
> Hi,
> 
> On Mon, 2019-04-29 at 09:18 +0200, Alexandre Torgue wrote:
>> Hi
>>
>> On 4/28/19 8:30 AM, Biao Huang wrote:
>>> The specific clk_csr value can be zero, and
>>> stmmac_clk is necessary for MDC clock which can be set dynamically.
>>> So, change the condition from plat->clk_csr to plat->stmmac_clk to
>>> fix clk_csr can't be zero issue.
>>>
>>> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
>>> ---
>>>    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> index 818ad88..9e89b94 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> @@ -4376,7 +4376,7 @@ int stmmac_dvr_probe(struct device *device,
>>>    	 * set the MDC clock dynamically according to the csr actual
>>>    	 * clock input.
>>>    	 */
>>> -	if (!priv->plat->clk_csr)
>>> +	if (priv->plat->stmmac_clk)
>>>    		stmmac_clk_csr_set(priv);
>>>    	else
>>>    		priv->clk_csr = priv->plat->clk_csr;
>>>
>>
>> So, as soon as stmmac_clk will be declared, it is no longer possible to
>> fix a CSR through the device tree ?
> 
> let's focus on the condition:
> 1. clk_csr may be zero, it should not be the condition. or the clk_csr =
> 0 will jump to the wrong block.
> 2. Since stmmac_clk_csr_set will get_clk_rate from stmmac_clk,
> the plat->stmmac_clk is a more proper condition.
> 

Ok, but here you remove one possibility: stmmac_clk and clk_csr defined. 
no ?

Other way could be the following code + initialize priv->plat->clk_csr 
with a non null value before read it in device tree (in stmmac_platform).

if (priv->plat->clk_csr >= 0)
	priv->clk_csr = priv->plat->clk_csr;
else
	stmmac_clk_csr_set(priv);



> In some case, it's impossible to get the clk rate of stmmac_clk,
> so it's better to remain the clk_csr flow.
> 
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
