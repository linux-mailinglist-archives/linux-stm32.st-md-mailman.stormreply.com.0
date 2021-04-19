Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D83FB36459D
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Apr 2021 16:04:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 940E0C57196;
	Mon, 19 Apr 2021 14:04:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1725EC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 14:04:24 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13JE1JPa005836; Mon, 19 Apr 2021 16:04:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OXaauSRjk+zYc9QtLxaKiJoUKuIYku9vCcs2vSIe314=;
 b=xm0vfKYH4RfavqXSCDEG56lsKxSLAGH/1vKj3XM3QCsbGBIBBwGYY+om8iR/HEoZlKc/
 eeJXar3zcjyznTceE5SVhnlfO5DaDgcdVsMXso+QUhyr3faVzlHKjIVOzWb5mnrcbIXK
 cJbyF5jY3d8tQyAW04vMfzZVpp+LSnMd0kxGhNvEuTsszk5GTQ+EWj3RMe3wCUbo8SWX
 pRRPfY4yW3UL6YWoXIeBXR1jBEvEM3TuKBUqBhfpgZlXaZHUTKYmrbFOBUNkSiD2lxGm
 Y2Lw31YG/P6a3yMbUoJoHzoVj6fq0qbl5iYChIUHgEPSp9eTrS+AZWtjq79nvPihfzUt ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380wj64130-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 16:04:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB42B10002A;
 Mon, 19 Apr 2021 16:04:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 845B92200B1;
 Mon, 19 Apr 2021 16:04:03 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr
 2021 16:04:02 +0200
To: Arnd Bergmann <arnd@arndb.de>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-13-alexandre.torgue@foss.st.com>
 <ececc78c-4fca-bb93-ef62-5d107501d963@pengutronix.de>
 <96da49dc-f24d-aa12-e1d8-39b5a5b6fbc9@foss.st.com>
 <CAK8P3a1bGAUbqTGqyz+PB=7fuVLkJce0awtx1Z9PE3uiX6uysQ@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <f37abf6d-f82b-e253-d9f9-772df0b800d1@foss.st.com>
Date: Mon, 19 Apr 2021 16:04:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1bGAUbqTGqyz+PB=7fuVLkJce0awtx1Z9PE3uiX6uysQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_10:2021-04-19,
 2021-04-19 signatures=0
Cc: Marek Vasut <marex@denx.de>, DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 12/13] ARM: dts: stm32: fix DSI port node
	on STM32MP15
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



On 4/19/21 3:57 PM, Arnd Bergmann wrote:
> On Thu, Apr 15, 2021 at 2:23 PM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>> On 4/15/21 12:43 PM, Ahmad Fatoum wrote:
>>> On 15.04.21 12:10, Alexandre Torgue wrote:
>>>> Running "make dtbs_check W=1", some warnings are reported concerning
>>>> DSI. This patch reorder DSI nodes to avoid:
>>>>
>>>> soc/dsi@5a000000: unnecessary #address-cells/#size-cells without
>>>> "ranges" or child "reg" property
>>>
>>> This reverts parts of commit 9c32f980d9 ("ARM: dts: stm32: preset
>>> stm32mp15x video #address- and #size-cells"):
>>>
>>>       The cell count for address and size is defined by the binding and not
>>>       something a board would change. Avoid each board adding this
>>>       boilerplate by having the cell size specification in the SoC DTSI.
>>>
>>>
>>> The DSI can have child nodes with a unit address (e.g. a panel) and ones
>>> without (ports { } container). ports is described in the dtsi, panels are
>>> described in the dts if available.
>>>
>>> Apparently, the checker is fine with
>>> ports {
>>>        #address-cells = <1>;
>>>        #size-cells = <0>;
>>> };
>>>
>>> I think my rationale for the patch above was sound, so I think the checker
>>> taking offense at the DSI cells here should be considered a false positive.
>>
>> If it's a "false positive" warning then we need to find a way to not
>> print it out. Else, it'll be difficult to distinguish which warnings are
>> "normal" and which are not. This question could also be applied to patch[3].
>>
>> Arnd, Rob what is your feeling about this case ?
> 
> I don't have a strong opinion on this either way, but I would just
> not apply this one for 5.13 in this case. Rob, Alexandre, please
> let me know if I should apply the other patches before the
> merge window, I usually don't mind taking bugfixes late before the
> merge window, but I still want some level of confidence that they
> are actually correct.

For me, we can keep this series for the v5.14 cycle.

regards
alex

> 
> Ahmad, if you feel strongly about this particular issue, would you like
> to suggest a patch for the checker?
> 
>          Arnd
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
