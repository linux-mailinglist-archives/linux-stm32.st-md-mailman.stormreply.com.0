Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1188A297FB
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 14:26:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF9B0C5A4D8
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 12:26:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67E92C5A4D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 12:26:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4OCJ6Hq021165; Fri, 24 May 2019 14:26:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=MRkkLHdMQA+fa243SgLqmgSMuMqZksxq6zRTMMLwqTI=;
 b=UBkDOjp+86RcHTz7CrpA0k7LNC39DmwaTk3HVvoWoQGecrJtUjcvL29dWEKfb/b/sJgW
 qXPr18nlCniLI3rhEv4fCjUGz/9rNmlf6HeEwh3gEwxrNcSSJVcSSueBDcH1JVgmmFCT
 VWhdz34tvJpQLziQRDBJXlzWz3Q7g0D5ZMbAhL9v3MVnqAdC/IBzGyHRO/hoJmYsmO9b
 pgsVSILuEZvytnIPiBXjxUhdLNqkUxIxxkyLJLNcvbaPB7+U9nHiZKgwLf43Ialw9uJP
 QeOUiNJBLqyWdvOfSzReKN7Hsgd/oo9z9p4262dpW1KPVXLUSsAiRoaOHxGAJtJuCOlK BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj774nmu5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 24 May 2019 14:26:21 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23DA034;
 Fri, 24 May 2019 12:26:21 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEDDD2BCC;
 Fri, 24 May 2019 12:26:20 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 May
 2019 14:26:20 +0200
To: Linus Walleij <linus.walleij@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@st.com>
References: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
 <CACRpkdYgTbTa6RmM3y-myk31ZxLGZ+8KvLof1XHkockrX4tofA@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <4a35e070-b18a-e0f5-76b6-72054eb98b43@st.com>
Date: Fri, 24 May 2019 14:26:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdYgTbTa6RmM3y-myk31ZxLGZ+8KvLof1XHkockrX4tofA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-24_05:, , signatures=0
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/2] pinctrl: stm32: add suspend/resume
	management
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



On 5/24/19 1:24 PM, Linus Walleij wrote:
> On Fri, May 10, 2019 at 9:42 AM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> 
>> During power sequence, GPIO hardware registers could be lost if the power
>> supply is switched off. Each device using pinctrl API is in charge of
>> managing pins during suspend/resume sequences. But for pins used as gpio or
>> irq stm32 pinctrl driver has to save the hardware configuration.
>> Each register will be saved at runtime and restored during resume sequence.
> 
> Both patches applied.
> 
> On the same pinctrl devel branch is also Benjamin's patches to support
> the "link_consumers" property on the pin controller descriptor to
> enable links from pin control consumers back to their pin controller
> suppliers, especially important for STMFX.
> 
> Would you please check if it work fine if you turn on this feature
> for the SoC STM32 pin controller?
> 

Sure. Either today or next Monday.

I let you know.

regards
Alex

> I am working a bit on refining the patches, so I want to enable testing
> with some SoC pin controllers as well and possibly make the
> behavior default.
> 
> Yours,
> Linus Walleij
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
