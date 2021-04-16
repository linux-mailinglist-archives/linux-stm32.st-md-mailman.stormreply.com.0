Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A5D3622A7
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 16:40:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9328C57B7A;
	Fri, 16 Apr 2021 14:40:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04CCFC57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 14:40:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GEUtKK009382; Fri, 16 Apr 2021 16:39:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Xbx2b/X53e/YNr87udE0tvXK0AMuNYFQVa+rw8yKsYw=;
 b=xaSYVT3S5/RwrdOKAd8j68wAmCp00E1Ia2ecibHukCf8xQcQjttQFSgV5Y82sWwlPYAy
 kJabxPdxNjVVv3MrGTOypQZB5WFWgEPn/O5PifOvKLu/GmxB3ufcvEqE3sGXVLgSDZn3
 alm9CtstHU+A5cDVq4le1lGJFSrdamit096t86vgS9rVE8AGsYLxxOFULh8vyRMZRCTV
 NveiKlTFTDmeNHHEMTL12yVGwYV2tdccRPivevLZpRdcY7W7tmID811F6n4wYi4FO19Y
 LifTu0XnggeG3c3mr0epNi+7sQdguAK7Nb4Nr4yg7c17YExy9FUfSSd+pU1rgT2ZVjX6 Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xes12j0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 16:39:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F003710002A;
 Fri, 16 Apr 2021 16:39:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE6F3241576;
 Fri, 16 Apr 2021 16:39:46 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 16:39:46 +0200
To: Marek Vasut <marex@denx.de>, "gabriel.fernandez@foss.st.com"
 <gabriel.fernandez@foss.st.com>, <linux-arm-kernel@lists.infradead.org>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-3-marex@denx.de>
 <a1768f19-fd80-abd7-03ee-8e47c124a271@foss.st.com>
 <362315e2-1398-4d11-e179-0ab7ca64e591@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <ffcd327e-c5b7-089c-1009-cfc97219495b@foss.st.com>
Date: Fri, 16 Apr 2021 16:39:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <362315e2-1398-4d11-e179-0ab7ca64e591@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_07:2021-04-16,
 2021-04-16 signatures=0
Cc: linux-clk@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/7] clk: stm32mp1: The dev is always NULL,
 replace it with np
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

On 4/16/21 3:39 PM, Marek Vasut wrote:
> On 4/16/21 8:44 AM, gabriel.fernandez@foss.st.com wrote:
>> Hi Marek,
> 
> Hello Gabriel,
> 
>> I have a patch-set in progress using $dev (convertion into module 
>> driver).
>>
>> https://patchwork.kernel.org/project/linux-clk/list/?series=421767
>>
>> Then rebase of your patch, [PATCH 4/7] clk: stm32mp1: Add parent_data 
>> to ETHRX clock, can be done easily.
> 
> I suspect the aforementioned patchset will have to be reworked, since 
> the current approach to push SCMI onto every system and renumerate the 
> clock has been rejected, because it caused DT ABI break and boot 
> problems on many systems.

SCMI patches for clock drivers will be pushed (and merged one day :)). 
We only drop the DT part which will be done through dtbo in uboot/tfa/optee.

regards
alex

> 
> btw please don't top-post.
> 
>> Best regards
>> Gabriel
>>
>> On 4/8/21 8:57 PM, Marek Vasut wrote:
>>> Instead of passing around $dev to all the registration functions, which
>>> is always NULL, pass around struct device_node pointer $np. This way it
>>> is possible to use of_clk_hw_register*() functions and/or register clock
>>> with associated $np pointer.
> [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
