Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A12476D9A
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 10:44:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E456FC5E2C5;
	Thu, 16 Dec 2021 09:44:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCF88C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 09:44:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BG4BBpb032006;
 Thu, 16 Dec 2021 10:44:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=V5ZIMz/aPi5v3BQ3aLEg97h6IbRb7qKQ5CfjX76CSD4=;
 b=JJkMGEWzDvhRE/iYKtH31anMVtaBskikUfsRvGvQYkZkF8jA0+J5dbmdpTlZ87B/waUZ
 69l88X7SzgdeJSgNubggT5CUO3aVBAfYa4ME4258in8/LvpTWgEVyPx5HXSN6Z2rQXyM
 X41T/ZSZZRcPfedR1I3OUxUBI01L38Wp0EsfBcm9BqL6AmFABsa4px+9IgIvqTCIJgWB
 O8GE3/QFdYYO5siLhYz/JDmazb+JDALVk3mJ4gNrO0wh/bcJLsg9hPJIRY70Bg+rNY4V
 5zDJmubei7Le6VW9MOPUjl3VlY50CtXHWE/qi91cuo6nXFlm952Fj0YgfC1I1MUIKuM2 IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cyfpxnm0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 10:44:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E3B210002A;
 Thu, 16 Dec 2021 10:44:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 741EB229A83;
 Thu, 16 Dec 2021 10:44:10 +0100 (CET)
Received: from lmecxl0504.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 16 Dec
 2021 10:44:09 +0100
To: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>, Russell
 King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 Vladimir Zapolskiy <vz@mleia.com>, <u.kleine-koenig@pengutronix.de>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Ludovic Barre
 <ludovic.barre@foss.st.com>,
 <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20211215141727.4901-1-yann.gautier@foss.st.com>
 <20211215141727.4901-5-yann.gautier@foss.st.com>
 <c4528bc5-a826-a4ed-c4d6-e0ab84651ea2@denx.de>
From: Yann Gautier <yann.gautier@foss.st.com>
Message-ID: <b7ef5887-ce9e-9ba1-5819-765e68104cc5@foss.st.com>
Date: Thu, 16 Dec 2021 10:44:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c4528bc5-a826-a4ed-c4d6-e0ab84651ea2@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_03,2021-12-14_01,2021-12-02_01
Subject: Re: [Linux-stm32] [PATCH 4/4] mmc: mmci: add hs200 support for
	stm32 sdmmc
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

On 12/16/21 10:14 AM, Marek Vasut wrote:
> On 12/15/21 15:17, Yann Gautier wrote:
>> Use feedback clock for HS200 mode, as for SDR104.
>> The HS200 mode can be enabled through DT by using mmc-hs200-1_8v.
>> It is possible to use it on STM32MP13, but not STM32MP15 platforms.
> 
> HS200 is possible even on the MP15, it just doesn't yield any 
> (performance) benefits due to the slower bus clock (125 MHz or so?), so 
> it isn't worth enabling it on MP15. It is nice to see MP13 can do better.

Hi Marek,

There is a limitation on MP15, please see errata sheet [1], chapter 2.3.19.
HS200 (and SDR104) shouldn't be enabled on MP15.

Best regards,
Yann

[1] https://www.st.com/resource/en/errata_sheet/dm00516256.pdf
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
