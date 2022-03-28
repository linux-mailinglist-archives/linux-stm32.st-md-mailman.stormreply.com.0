Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F074E9A47
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 16:59:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D93BC5C842;
	Mon, 28 Mar 2022 14:59:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FFE4C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 14:59:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SDsu15025436;
 Mon, 28 Mar 2022 16:59:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kltjsirzntSwfHTV/4WKoQM0uiln7XLsDRSP3qmSBh4=;
 b=NecfBsKyQWBqiXma1Zhw2cVJtVl4UDOKML7BTAe3e+LFAcTdfXlyw7wklCzcffFl/EDp
 rSyYsr6Irm3guATATSJnlScoZDze8MKQAUzD73gV/CVt5XOl91XVuLu5E8KRLC1iZXyN
 ctiHoAjA4oy5Tc2npoOG5dLc1f9k9JoCbc8sa066ciP2XwmPPnwd6ASka2hD0tBrNcpj
 M5gOYnzVCzR06iV7BjkQdTNhnrX6LWS3LEZGhMXkxiWXt6Ypck4UgYtve25lGkEGmx58
 kY9D7nQU2JTpeA/AKR/eRLS0OcDWs0X3Lc0SGhgLk3QCqqgkroGdaxnEKSRsGWVIVZX2 ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1tkm3ec9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 16:59:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE38110002A;
 Mon, 28 Mar 2022 16:59:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9521235F0D;
 Mon, 28 Mar 2022 16:59:05 +0200 (CEST)
Received: from [10.201.21.172] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar
 2022 16:59:04 +0200
Message-ID: <0d0653d4-8272-7052-e0c5-447506a13a64@foss.st.com>
Date: Mon, 28 Mar 2022 16:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
 <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
 <CACRpkdYMWXEX6dpT0aUrCrFd-8-U35OG9Zmpkfty=zMH=mQqbA@mail.gmail.com>
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CACRpkdYMWXEX6dpT0aUrCrFd-8-U35OG9Zmpkfty=zMH=mQqbA@mail.gmail.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_06,2022-03-28_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Marek Vasut <marex@denx.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@dh-electronics.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: mmc: mmci: add a
 property to disable DMA LLI
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

On 3/25/22 21:12, Linus Walleij wrote:
> On Tue, Mar 15, 2022 at 9:26 AM Yann Gautier <yann.gautier@foss.st.com> wrote:
> 
>> The STM32 variant uses an internal DMA, and the DMA functions are in its
>> dedicated file. So I was planning to do the same as what is done in
>> meson-gx-mmc.c: using a bounce buffer to copy from/to in case DMA
>> constraints are not fulfilled. Not sure it can help for Ux500.
>>
>> Ulf, before I send my new series (although it is not ready yet), would
>> you be OK with the bounce buffer idea?
> 
Hi Linus,

> Would it not be better if the bounce buffer is something available
> for all MMCI variants and not restricted to the STM32 DMA add-on?

The issue was seen with the internal DMA of the STM32 variant of PL180.

> 
> What I'm thinking is that this is a problem with the MMCI hardware
> rather than with the DMA hardware, so the problem kind of gets
> fixed in the wrong place if the bounce buffer is in the DMA add-on
> code.
> 
> Maybe this is how you fixed it in later patches, I'll take a look.

I've pushed a new version there to correct latest remarks from Ulf:
https://lore.kernel.org/all/20220328145114.334577-1-yann.gautier@foss.st.com/


> 
> Yours,
> Linus Walleij

Best regards,
Yann

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
