Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4613E3ACC17
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Jun 2021 15:25:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6CDBC59780;
	Fri, 18 Jun 2021 13:25:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D75FC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 13:25:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IDDV7W029190; Fri, 18 Jun 2021 15:25:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TGRIuYa1RneAyuabvPhXlPbKaYa/GapaD9l0+sSWxuw=;
 b=dYE9THOnJzJSBCZl456P8kNA/msyy19+tGQb5Vx6BD38esDf/EU4cnqS7tsS6PhHm/CA
 tWTYLmsUyq58RsUrUbDSsVekrCj4lN3+BEED0Hd8z1W8lTsHS0rh8ItWTz1KI1lsjhue
 yzPC/OGmaNq6/Ye0Lrb2vveUo/H7/2X6tuvgJpGb0FY/Vy+WhXUlFtIMShGDNmoHYMLn
 5/LQN6xCeSTh47SvBfT3sTjgwlRDJiYFBrXikeLb2NZz3B75r92EzmmIz1Qh/xEdQJ2E
 TA58zqL77NJyFzTMkU5IZ9peZnUbaaQY6zl8MeYN5/yxwvvdFLfJ/vBeCec/T4SGTeGP RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 398qqg9nvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 15:25:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8259E10002A;
 Fri, 18 Jun 2021 15:25:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60ED122B9C0;
 Fri, 18 Jun 2021 15:25:00 +0200 (CEST)
Received: from lmecxl0572.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 15:24:59 +0200
To: Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Etienne Carriere <etienne.carriere@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-12-gabriel.fernandez@foss.st.com>
 <14a81ad2-d646-30ca-46f0-d2078b09c4f2@denx.de>
From: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <e7952251-b3bb-5042-65bd-7ab7ef37ac93@foss.st.com>
Date: Fri, 18 Jun 2021 15:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14a81ad2-d646-30ca-46f0-d2078b09c4f2@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_07:2021-06-18,
 2021-06-18 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 11/11] clk: stm32mp1: new
 compatible for secure RCC support
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

Yes we could have considered it as a feature but we think it's better to 
manage it as a layer of our driver via a compatible.

On 6/17/21 8:46 AM, Marek Vasut wrote:
> On 6/17/21 7:18 AM, gabriel.fernandez@foss.st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> Platform STM32MP1 can be used in configuration where some clock
>> resources cannot be accessed by Linux kernel when executing in non-secure
>> state of the CPU(s).
>> In such configuration, the RCC clock driver must not register clocks
>> it cannot access.
>> They are expected to be registered from another clock driver such
>> as the SCMI clock driver.
>> This change uses specific compatible string "st,stm32mp1-rcc-secure"
>> to specify RCC clock driver configuration where RCC is secure.
> 
> Should this really be a new compatible string or rather a DT property ? 
> I think the later, since this is the same clock IP, only operating in 
> different "mode" , no ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
