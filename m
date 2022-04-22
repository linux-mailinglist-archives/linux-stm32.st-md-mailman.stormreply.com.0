Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E050B4F1
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 12:25:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1419FC6049A;
	Fri, 22 Apr 2022 10:25:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23327C60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 10:25:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M9H37f028185;
 Fri, 22 Apr 2022 12:25:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8wWAgJP7/dwDs/xoLVcxe4nIqREZiN+wBYa1KXpuRmg=;
 b=6Q6XD2F7blTKGNKtrJkuBSgcIBay7/WHXALf5SbnlaHEVWmrwcpe2Dt/v6qP1TcQwm/L
 FzSDOCoajGN3N2Fb2jFiwuzkZlrJuMPlAUq191jsxSTkoK0COhmgZRxqUk88t85WC2iw
 OGzIPUmOYfGUOJs1IAjXdi1W76vXRcr2uJhgpMrnwgziRiaupIEIy7C6YIkHJSD7rIqJ
 P0P1C+W/WU/I75p01hM9aKcgdAApUXFZPOzUCTVL9Exz5M7npacYtGBa43k4x2jnNEts
 xjYajYWaE4HXZIXkbiwpmjoOo1NWy06/qSxYsE+QeH/Aiy7N1UmAtpHlqBZB7QCHElLf zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fkskgrcdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 12:25:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E57D100034;
 Fri, 22 Apr 2022 12:25:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83FC721FE9A;
 Fri, 22 Apr 2022 12:25:31 +0200 (CEST)
Received: from [10.211.7.146] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 22 Apr
 2022 12:25:30 +0200
Message-ID: <85d3b83b-4c2c-7cd8-2147-0a58c5bb8251@foss.st.com>
Date: Fri, 22 Apr 2022 12:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
References: <20220421140827.214088-1-marex@denx.de>
 <5f3aa91e-0ca3-a13a-1ea3-daae982b3d8f@foss.st.com>
 <878rrxa0rr.wl-maz@kernel.org>
From: Fabien DESSENNE <fabien.dessenne@foss.st.com>
In-Reply-To: <878rrxa0rr.wl-maz@kernel.org>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-22_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] irqchip/stm32: Keep pinctrl block clock
 enabled when LEVEL IRQ requested
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

Hi Mark and Marek,

My intention was to have a single commit, instead of two commits with 
the second one making a part of the previous one obsolete.

Nevertheless I understand your points which are valid, so I will review 
Marek's patch first before submitting another patch.

BR
Fabien


On 22/04/2022 12:08, Marc Zyngier wrote:
> On Fri, 22 Apr 2022 10:20:36 +0100,
> Fabien DESSENNE <fabien.dessenne@foss.st.com> wrote:
>>
>> Hi Marek,
>>
>> I agree there is something wrong with the clock management in IRQ
>> context here and your patch goes in the right way.
>> There are also some other problems regarding performance (enabling /
>> disabling clock each time we want to change the IO value, ...).
>> For these both issues I have a patch, which basically keeps the GPIO
>> clocks enabled from probe.
>> I did not have time to submit it, but, considering your concerns, I
>> will do it in the coming days.
>> For the time being I suggest that we do not apply your patch.
> 
> Why? This fixes a glaring issue, and there are no alternatives at the
> moment. So if there is something to improve on, please base your patch
> on top of Marek's.
> 
> Thanks,
> 
> 	M.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
