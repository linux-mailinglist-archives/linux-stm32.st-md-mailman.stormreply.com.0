Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8F63B5959
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 09:01:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45958C5719E;
	Mon, 28 Jun 2021 07:01:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32ABEC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 07:01:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15S6wbOj006266; Mon, 28 Jun 2021 09:01:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nmTbU+JNNbp7VzmAnslcoU+Y5KpKRuaSAbCAIK3+uWI=;
 b=VofqB4aMsyZqTqEHQ4oBSVVX1u4XranJVcWAuHhfwwkurpeWajARGnlCXjX0xAOsC8gL
 ebtA9jAhBIUfx54jc7kV1RETl+FLJUGukqmkn455D/cffx/aRmf/iA2N8JGQEnx6R6WJ
 MC6GocIE6Kys32j3/0NnnW4uJqRTPTOUwZ1K7NPjP+q7sleM+TxSumE7nQeUQgxIqJwc
 SEdArbq0wdA5brreGjgZA3FTDWe7gM9wGJ/Iq8PvXM6AZdfWa5AvIeoIFAm3x1yu0kFz
 eThlKPBz3IR/EgfhySXWKZBeVVypmOe4/TNJMQ1BbfSJ0+IAB/h3tiGmctyB+3AiABIo +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39f1xshvdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 09:01:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C55A10002A;
 Mon, 28 Jun 2021 09:01:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E7BD20E3A5;
 Mon, 28 Jun 2021 09:01:13 +0200 (CEST)
Received: from lmecxl0572.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Jun
 2021 09:01:12 +0200
To: Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Etienne Carriere
 <etienne.carriere@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, <marex@denx.de>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-7-gabriel.fernandez@foss.st.com>
 <162484414661.3259633.15807994186850314510@swboyd.mtv.corp.google.com>
From: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <d53bc6e0-523f-b13c-9e87-a3a2f0301802@foss.st.com>
Date: Mon, 28 Jun 2021 09:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <162484414661.3259633.15807994186850314510@swboyd.mtv.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_05:2021-06-25,
 2021-06-28 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 06/11] reset: stm32mp1: remove
	stm32mp1 reset
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

Sure, many thanks Stephen.

Best regards
Gabriel

On 6/28/21 3:35 AM, Stephen Boyd wrote:
> Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:09)
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> st32mp1 RCC reset driver was moved into stm32mp1 RCC clock driver.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
> 
> Applied to clk-next although it would be nice to get Philipp's ack
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
