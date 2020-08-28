Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A54302557AE
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 11:31:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E871C32EA6;
	Fri, 28 Aug 2020 09:31:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F409C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 09:31:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07S9RKLH005422; Fri, 28 Aug 2020 11:30:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=GZcXYK4IQ/ttyWbgQ2w+8/AUl4mLyk/JntubDt8xpu4=;
 b=iUJdiq08j1aAdX0H//CuLIvKCyuHq+0qo06HR0veCNKqtfts+9GPogoz7knCy4K6H2Tn
 rII6qYVUpDXcqmuN2R0T010lAr8/3hIeUNaCs48mgCAMxjSkLcbuhj168DSlabMBrPB8
 UbzyAqIycsEyWw0NfqB9/v/EohNmJRNe8FH5aK9W+ZOqXrDx0eVzEEcGSxIAiWsM3sB5
 qtjPsBRjuo2xWipwyiMeUAbrQCZF+usgqdzZFm125aVg5bTXq9sbdTojV/8HiF6vfaDn
 HNQgrnRPXS4jTFLUciLAAyKgaiHN3j4tm6bvLLXALI28xEY5BaKPfDGmxatcXU+ux7Bz NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 332t8g5mm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 11:30:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 753D510002A;
 Fri, 28 Aug 2020 11:30:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 547472AD2DE;
 Fri, 28 Aug 2020 11:30:38 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Aug
 2020 11:30:37 +0200
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20200809164450.289731-1-marcin.sloniewski@gmail.com>
 <20200809164450.289731-3-marcin.sloniewski@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <8a95db7e-865a-db34-ae8a-b2fe3533ab8d@st.com>
Date: Fri, 28 Aug 2020 11:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200809164450.289731-3-marcin.sloniewski@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_05:2020-08-28,
 2020-08-28 signatures=0
Cc: robh@kernel.org, kuninori.morimoto.gx@renesas.com, arnd@arndb.de,
 mani@kernel.org, allen.chen@ite.com.tw, linus.walleij@linaro.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, lkundrak@v3.sk,
 devicetree@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 mcoquelin.stm32@gmail.com, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 3/3] ARM: dts: stm32: add initial
 support for stm32mp157-odyssey board
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

Hi Marcin,

On 8/9/20 6:44 PM, Marcin Sloniewski wrote:
> Add support for Seeed Studio's stm32mp157c odyssey board.
> Board consists of SoM with stm32mp157c with 4GB eMMC and 512 MB DDR3 RAM
> and carrier board with USB and ETH interfaces, SD card connector,
> wifi and BT chip AP6236.
> 
> In this patch only basic kernel boot is supported and interfacing
> SD card and on-board eMMC.
> 
> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
> ---

Series applied on stm32-next.

Regards
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
