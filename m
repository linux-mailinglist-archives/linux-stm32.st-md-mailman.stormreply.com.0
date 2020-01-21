Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B4D1442EA
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2020 18:13:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6224C36B0C;
	Tue, 21 Jan 2020 17:13:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD3ACC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 17:13:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LH8CrC009260; Tue, 21 Jan 2020 18:12:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ygrZ6vhbHOsTbhfRWsc+9Z8MYthtA5vNN2mD+D4l4E0=;
 b=l5HLodWzW5GxXy4u9b9oxqOy7CdnadxD9GkWnQP9qvvLBkIjqrSvwsjMMIXfNB6mp2Pj
 saLd/UpB3SmshFSuvVnEl/AnQrPs6eQaPPyyJ+Dzu3qK99Qgbn4oVA+fDfD+4yd0mm48
 KtjB0R7f7TLwzXKqkpcZrHLhTL9EEnbWZuxaSgvHEpNcfXpbdF2QDHcAwlY7egugFSyR
 ssevN4A+C79Uso+SjCMelcg5bNP6QVOufOYsWQoSEZ2rYQJk1bnRKGqZBfzzC2Bekjqg
 801/w0z2LaFaQm3Sl/kz3yBhebYn87hB+v1rMivN8D4zUmeV5RRfDlHKPtfLsjA+ewOB ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrp27xhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 18:12:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF97610002A;
 Tue, 21 Jan 2020 18:12:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A85202A8476;
 Tue, 21 Jan 2020 18:12:50 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jan
 2020 18:12:50 +0100
To: Marek Vasut <marex@denx.de>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20bb72d0-8258-abc0-e729-4d3d5a75c41c@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <d6e02817-2464-51b9-246a-7720b607b8d6@st.com>
Date: Tue, 21 Jan 2020 18:12:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20bb72d0-8258-abc0-e729-4d3d5a75c41c@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.634
 definitions=2020-01-21_05:2020-01-21,
 2020-01-21 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Linux-stm32] STM32MP1 level triggered interrupts
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

Hi Marek,

On 1/20/20 7:32 PM, Marek Vasut wrote:
> Hi,
> 
> I have a device connected to STM32MP157C which requires active-low
> level-triggered interrupt sink. The device interrupt line is connected
> to the SoC gpio-C bank, which has it's interrupt line routed into EXTI,
> which can only handle edge triggered interrupts to my understanding.

correct.

> 
> However, ARM GIC should be able to do both and EXTI has this irqmux /
> EXTImux functionality, which -- if my understanding is correct -- is
> capable of routing a select GPIO line directly into the GIC as an EXTIn
> interrupt signal. Thus, this might permit handling active low
> level-triggered interrupts. Is there some DT binding to configure this yet ?
> 
> Or is there some other, better, way ?
> 

For SPIs, GIC controller handles rising edge triggered interrupt and 
active high level-sensitive. GIC integration in STM32MP157c makes that 
only active high level-sensitive configuration for SPI interrupts is 
supported.

Concerning, your question:

Setting your gpioC interruption as "falling edge" should be enough. On 
gpioCx falling edge, a high-level signal is generated by exti and sent 
to GIC (which triggers GIC interrupt). This signal remains high until 
stm32_irq_ack is called.

So you only need: (ex for gpioc 1).

interrupt-parent = <&gpioc>;
interrupts = <1 IRQ_TYPE_EDGE_FALLING>;


regards
Alex


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
