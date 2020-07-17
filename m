Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D427223BFD
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jul 2020 15:11:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD545C36B29;
	Fri, 17 Jul 2020 13:11:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD251C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 13:11:35 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HD8FkF006837; Fri, 17 Jul 2020 15:11:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=8nLQ4BLOPtd+RIo+7t6Sr5QwFj1DO7gwx3ZjhqT5Eqc=;
 b=zO+rgX64ROgs+lF5zjg2Yy02V/SQoYxtoIp9KNdRHL+vlJLK2bREDqeSaIxc1nz+6dUF
 0yma/xtUZ1cy2pcsQ1Td/wKo+wOwQsB/3dtQULkNvxCUZHe/58f4setL24egFq5FqvHM
 PUuzvOhAz9Xoq6hqRZXEVcCvMI5oamvVbtTrTlkku4MavOO0JnBWx97qiz+2OFK/tSaQ
 7vDkDme4w6L38O2GI+rNQQb5TXu5G1DXXtxRUET29qSYZPR53aJw4xt2xFfTEJnp49l8
 o9nXFZI/j30aEHnJDia1y08R5YIWGvS1bAHHJ2CRtfRvUPHhfla1vkvBS7uwdk0KpB3J 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 327btt8h2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 15:11:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CCD6A10002A;
 Fri, 17 Jul 2020 15:11:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF8102B4D2D;
 Fri, 17 Jul 2020 15:11:07 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 17 Jul
 2020 15:11:07 +0200
To: Marc Zyngier <maz@kernel.org>
References: <20200706081106.25125-1-alexandre.torgue@st.com>
 <202007081232.bA2RH80f%lkp@intel.com> <87imevemwg.wl-maz@kernel.org>
 <69fb49b4-6a41-edf4-fea3-3f10934817ca@st.com> <87eepaxqot.wl-maz@kernel.org>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c95f45ba-5c1f-b252-6779-d3c4e11c4b26@st.com>
Date: Fri, 17 Jul 2020 15:11:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87eepaxqot.wl-maz@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_06:2020-07-17,
 2020-07-17 signatures=0
Cc: marex@denx.de, kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>
Subject: Re: [Linux-stm32] [PATCH] irqchip/stm32-exti: map direct event to
	irq parent
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



On 7/17/20 2:37 PM, Marc Zyngier wrote:
> On Fri, 10 Jul 2020 10:37:47 +0100,
> Alexandre Torgue <alexandre.torgue@st.com> wrote:
>>
>> Hi Marc,
>>
>> On 7/10/20 11:31 AM, Marc Zyngier wrote:
>>> Alexandre,
>>>
>>> On Wed, 08 Jul 2020 05:57:24 +0100,
>>> kernel test robot <lkp@intel.com> wrote:
>>>>
>>>> [1  <text/plain; us-ascii (7bit)>]
>>>> Hi Alexandre,
>>>>
>>>> I love your patch! Perhaps something to improve:
>>>>
>>>> [auto build test WARNING on stm32/stm32-next]
>>>> [also build test WARNING on soc/for-next v5.8-rc4 next-20200707]
>>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>>> And when submitting patch, we suggest to use  as documented in
>>>> https://git-scm.com/docs/git-format-patch]
>>>>
>>>> url:    https://github.com/0day-ci/linux/commits/Alexandre-Torgue/irqchip-stm32-exti-map-direct-event-to-irq-parent/20200706-161327
>>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
>>>> config: arm-randconfig-s031-20200707 (attached as .config)
>>>> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
>>>> reproduce:
>>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>>           chmod +x ~/bin/make.cross
>>>>           # apt-get install sparse
>>>>           # sparse version: v0.6.2-31-gabbfd661-dirty
>>>>           # save the attached .config to linux build tree
>>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=arm
>>>>
>>>> If you fix the issue, kindly add following tag as appropriate
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All warnings (new ones prefixed by >>):
>>>>
>>>>      In file included from include/linux/build_bug.h:5,
>>>>                       from include/linux/bits.h:23,
>>>>                       from include/linux/bitops.h:5,
>>>>                       from drivers/irqchip/irq-stm32-exti.c:8:
>>>>      drivers/irqchip/irq-stm32-exti.c: In function 'stm32_exti_h_domain_alloc':
>>>>      drivers/irqchip/irq-stm32-exti.c:683:23: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
>>>>        683 |  if (desc->irq_parent >= 0) {
>>>>            |                       ^~
>>>>      include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
>>>>         58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>>>>            |                                                    ^~~~
>>>>>> drivers/irqchip/irq-stm32-exti.c:683:2: note: in expansion of macro 'if'
>>>>        683 |  if (desc->irq_parent >= 0) {
>>>
>>> Do you plan to address this? Looks like an actual bug to me.
>>
>> I'll fix it in v2, I was just waiting for other comments before
>> sending a v2. Do you prefer I send a v2 with this fix, and you'll do
>> your review on this v2 ?
> 
> I'm certainly not going to review something that has such a glaring
> issue.

Ok, I'll then send v2 quickly.

> 
> 	M.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
