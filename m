Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D1D300848
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jan 2021 17:11:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49B31C424BE;
	Fri, 22 Jan 2021 16:11:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43568C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 16:11:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10MFvSpQ011456; Fri, 22 Jan 2021 17:11:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GknI+0RJfk1sZ9blqX2D/3R0pwD/aK5WWTJAym2E0zE=;
 b=CimbqKiTOh1enInWS13BxPiuM75YHKuf3PSXL7JI2DBaO8A5Ra1Q0sUhr0oAuGU8kGqq
 nZKMdkAS1kb3gponUCk+wzYoX9Fl/tDDvF8FVtxKn28VSPv8G227vNP+MIpaqmelhd8+
 SLmdHWJtrH38LH9upRSHS5D+zpFaTz3L82ryxbkME39y55e9ZoVmTUq5s3EB3X6vpGV2
 4auao4YElMVqtWjOePmaLbAA1stcqu8Yav3+7TS6qnV8iX1TDsS921OhUNmmIIsN14Rj
 unAcCcGAlqnCJo7rKKIQiqls1QwakDfjktuKzx8ucKfRkeWcIt7q+DLoyvABBfFg7UAN iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pe38hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 17:11:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C6FED10002A;
 Fri, 22 Jan 2021 17:11:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B1A552B4D3D;
 Fri, 22 Jan 2021 17:11:11 +0100 (CET)
Received: from lmecxl0504.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Jan
 2021 17:11:10 +0100
To: Marek Vasut <marex@denx.de>, <linux-mmc@vger.kernel.org>
References: <20210116180424.57331-1-marex@denx.de>
 <20210116180424.57331-2-marex@denx.de>
From: Yann GAUTIER <yann.gautier@foss.st.com>
Message-ID: <8426a089-040a-a1d9-fa9b-fb2b80f913c7@foss.st.com>
Date: Fri, 22 Jan 2021 17:11:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210116180424.57331-2-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_11:2021-01-22,
 2021-01-22 signatures=0
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/4] mmc: mmci: Add support for probing
 bus voltage level translator
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

On 1/16/21 7:04 PM, Marek Vasut wrote:
> Add support for testing whether bus voltage level translator is present
> and operational. This is useful on systems where the bus voltage level
> translator is optional, as the translator can be auto-detected by the
> driver and the feedback clock functionality can be disabled if it is
> not present.
> 
> This requires additional pinmux state, "init", where the CMD, CK, CKIN
> lines are not configured, so they can be claimed as GPIOs early on in
> probe(). The translator test sets CMD high to avoid interfering with a
> card, and then verifies whether signal set on CK is detected on CKIN.
> If the signal is detected, translator is present, otherwise the CKIN
> feedback clock are disabled.
> 
> Signed-off-by: Marek Vasut<marex@denx.de>
> Cc: Alexandre Torgue<alexandre.torgue@st.com>
> Cc: Linus Walleij<linus.walleij@linaro.org>
> Cc: Ludovic Barre<ludovic.barre@st.com>
> Cc: Ulf Hansson<ulf.hansson@linaro.org>
> Cc:linux-stm32@st-md-mailman.stormreply.com

Hi Marek,

I've tested it on STM32MP157C-EV1 (which uses st,use-ckin) and 
STM32MP157C-DK2 (which doesn't). The mmc_test sessions are OK on both 
boards.
Feel free to add my:
Tested-by: Yann Gautier <yann.gautier@foss.st.com>


Regards,
Yann
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
