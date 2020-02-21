Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C6C168279
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2020 16:59:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63061C36B0B;
	Fri, 21 Feb 2020 15:59:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D9B6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2020 15:59:01 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LFiJfe029798; Fri, 21 Feb 2020 16:58:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=q7m0eWQuKU+1f/Hc3O6mTWcHzdCj7QRgHso723d9XGs=;
 b=Euuq+vh1udcasMYA2o1zPDWwzgMu9mv5bfzyIn88vggmaGewnrpTUwhnCwwGrdPqIIZD
 GCg5H/MYu1732s2elAaqiu+3IaIyWw0h2zEy5nobAL+hBqGBGiJ+PDShKlivPGG5pYWK
 AHmu3XNHCAqS0pzBqtwTvfaR16Gh9PRd0dkB61cqAZAApNp0nILnnfiGu2h/0Xs6kS0F
 meqmiH0PBe69DVjW7tE2XlKaRtIzMcO4fcdV7Li/1QJwhSOTPWsP/t0UeYWGBLemVgJf
 x6+P1wDolnEzoMXxAdwglMUcUOItcZjhsU3nc3WP8zBxaF5/LZbOu82Fd1G+tFwefLDq RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y8ub1r41d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 16:58:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0275710002A;
 Fri, 21 Feb 2020 16:58:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF8EC2BC7CD;
 Fri, 21 Feb 2020 16:58:43 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 21 Feb
 2020 16:58:42 +0100
To: Erwan Le Ray <erwan.leray@st.com>, Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
References: <20200203140425.26579-1-erwan.leray@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <609b5744-cc1e-8ada-fe14-6cc199c0a91d@st.com>
Date: Fri, 21 Feb 2020 16:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203140425.26579-1-erwan.leray@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_05:2020-02-21,
 2020-02-21 signatures=0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Clement Peron <peron.clem@gmail.com>, Gerald Baeza <gerald.baeza@st.com>,
 Nathan Huckleberry <nhuck15@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/4] STM32 early console
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

Hi

On 2/3/20 3:04 PM, Erwan Le Ray wrote:
> Add UART instance configuration to STM32 F4 and F7 early console.
> Add STM32 H7 and MP1 early console support.
> 
> Changes in v3:
> - fix a missing condition for STM32MP1
>    
> Changes in v2:
> - split "[PATCH] ARM: debug: stm32: add UART early console configuration"
>    into separate patches as suggested by Clement into [1]
> 
> [1] https://lkml.org/lkml/2019/4/10/199
> 
> Erwan Le Ray (4):
>    ARM: debug: stm32: add UART early console configuration for STM32F4
>    ARM: debug: stm32: add UART early console configuration for STM32F7
>    ARM: debug: stm32: add UART early console support for STM32H7
>    ARM: debug: stm32: add UART early console support for STM32MP1
> 
>   arch/arm/Kconfig.debug         | 42 +++++++++++++++++++++++++++++-----
>   arch/arm/include/debug/stm32.S |  9 ++++----
>   2 files changed, 40 insertions(+), 11 deletions(-)
> 

Acked-by: Alexandre TORGUE <alexandre.torgue@st.com>

Russel, Arnd, Olof, Linus
Do I have to take this series in my next PR ? or you'll ?

Thanks
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
