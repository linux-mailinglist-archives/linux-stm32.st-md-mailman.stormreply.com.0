Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F701564F10
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 09:53:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D32FCC640EC;
	Mon,  4 Jul 2022 07:53:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBEAAC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 07:53:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2647eOVW026847;
 Mon, 4 Jul 2022 09:52:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=90rBVkywbc4yedzfSXCh4wXU9NTyZeI/HyxQ3VaQqIg=;
 b=8YoK6FsikK5REcfYcJGxKfvz2QvQ1KE8RwXyv73Nz6rBT+Mj5lwQ38KfTPqm0xgqlgo4
 UVbtrLke1/KSafSOy8v71n6xmDAN7MFEn9/mFiL1HZ7FHFgFEHEi/LlBu1/Jy7+w9rYa
 oUOXAf1PtZhtfQXN1/0qK9G/UQ7lLiPDaQCAY+2S9x7JBvhGXXnzanadPvkh6QbAUAIq
 WuTvbEaabB6+69lJwOxOe00dVseHhygCV0LILx7RUT+71P5yci5fI1ICEjary8C0TAf/
 1JLhHfr6CmletR79krIqWLkBS5HBXOx8hl7UL8704u7fe11x0Byc1wyrtUHatVAAfNAy NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2b5a8sjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 09:52:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 582D710002A;
 Mon,  4 Jul 2022 09:52:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FFE02128BE;
 Mon,  4 Jul 2022 09:52:46 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 4 Jul
 2022 09:52:45 +0200
Message-ID: <a1b80bbf-11a6-d5f7-ce40-04a644039eaa@foss.st.com>
Date: Mon, 4 Jul 2022 09:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
References: <85e47007-bfba-7a64-db75-893b0d20d025@foss.st.com>
 <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_07,2022-06-28_01,2022-06-22_01
Cc: Kevin Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.19 #2
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

On 7/1/22 15:25, Arnd Bergmann wrote:
> On Fri, Jul 1, 2022 at 2:05 PM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
>> Hi ARM SoC maintainers,
>>
>> Please consider this second round of STM32 DT fixes for v5.19 cycle. It
>> mainly concerns fixes for SCMI version of ST boards introduced in v5.19-rc1.
>>
>> The following changes since commit ea3414e1249ea35bc02debe28d4cbfeb6261657c:
>>
>>     ARM: dts: stm32: move SCMI related nodes in a dedicated file for
>> stm32mp15 (2022-06-07 17:22:21 +0200)
>>
>> are available in the Git repository at:
> 
> Hi Alex,
> 
> I get a merge conflict because I had picked up the "ARM: dts: stm32: move SCMI
> related nodes in a dedicated file for stm32mp15" commit from the mailing
> list, so it now has a different commit ID from the one you are based on.
> 
> As far as I can tell, the patches are identical, but since the files
> are modified
> further in your tree, this confuses the git merge algorithm and leads to a
> somewhat ugly git history with two identical commits if I fix it up.
> 
> Can you rebase this pull request on top of v5.19-rc4 and resend?
> (note: don't rebase the non-fixes pull requests unless you have to).

Hi Arnd,

No pb, I'm going to send a v2. If it is not an issue for you, I would 
prefer to rebase also the stm32-next to avoid conflicts during the merge 
on your side.

Alex

> 
>        Arnd

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
