Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F8122B0EC
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 16:02:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40408C36B27;
	Thu, 23 Jul 2020 14:02:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93C4CC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 14:02:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NDrCdw019917; Thu, 23 Jul 2020 16:02:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=2s9++maMnmQlaHoFweGqpleGAEqmizK6DFBHoz7LIV4=;
 b=RVPyEEp93S5zGSAdEbIBRtATQnRmu2fwnM3B+KN55e564gWntEnnsFdrugQOZJGBNqCY
 0AOs7cPq9KbLg3rG8oc9Ogi2iwyTzKLJbwgdzu/uiN4x1Sr2Pv/E/fDwY8jznUXpnk9Z
 tXtxY28F1NFZSNN3K/pwQ36ylU29Cg+Luz8NU7CzhUGGyMkh8+71Um8Aa07y2tylfHqV
 Opn96A4NwmtmUhj+1C3VbbX3xkrXX58iQ+Mll6GOa49hm6xH0VL5YwVO3OoOCa9UUjsY
 Yda7aJ9UiCL7Gth0GwNXS3Hv0BnzLGGimrfDMJwimBMb6JL/gBWjgQHIVHs7scHOPPLD xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsahb4as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 16:02:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C5E210002A;
 Thu, 23 Jul 2020 16:02:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DFDA2B8A05;
 Thu, 23 Jul 2020 16:02:35 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jul
 2020 16:02:33 +0200
To: Linus Walleij <linus.walleij@linaro.org>
References: <20200615124456.27328-1-alexandre.torgue@st.com>
 <CACRpkdbWUop6hyKM80zxaz85oQ8BfDLCtxBTzjOypnDpUm-a4Q@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <7f9648bd-6dcc-de70-a713-e889caf021ba@st.com>
Date: Thu, 23 Jul 2020 16:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbWUop6hyKM80zxaz85oQ8BfDLCtxBTzjOypnDpUm-a4Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_06:2020-07-23,
 2020-07-23 signatures=0
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: use the
 hwspin_lock_timeout_in_atomic() API
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



On 7/23/20 3:20 PM, Linus Walleij wrote:
> On Mon, Jun 15, 2020 at 2:44 PM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> 
>> From: Fabien Dessenne <fabien.dessenne@st.com>
>>
>> Use the hwspin_lock_timeout_in_atomic() API which is the most appropriated
>> here. Indeed:
>> - hwspin_lock_() is called after spin_lock_irqsave()
>> - the hwspin_lock_timeout() API relies on jiffies count which won't work
>>    if IRQs are disabled which is the case here.
>>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> Patch applied, sorry for missing this one.

No pb, thanks.

> 
> Yours,
> Linus Walleij
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
