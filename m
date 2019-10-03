Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A95C9BF1
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2019 12:16:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB9E4C36B0B;
	Thu,  3 Oct 2019 10:16:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BBCFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 10:16:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x93A1YhG005393; Thu, 3 Oct 2019 12:16:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=L4LLR9A842To83iMCr2kJJo+nQXIiFznTI7PhQwWL6M=;
 b=PFe9zeM2Zoy1K7RCpNUac4jSDN/qZtCabQVNCg/lYvXkJTRfa2Urog1hqg/aPyduHn8w
 MndtdtMz929onq4Rl3dbaFLli/rBuv/P/EZR6XvsdAJ1rMchgHJg3zvQNrocnJcmYtWN
 LbJEXZvBrQ/TKtzJHzULUkJnDEA/uw3N8AZi3hr6Cje012lbHwT+DAtYV1dfuSUgqMpu
 m1plOZpHDWATmcEigXunX2TEIHNsPIpoBrN2Z2pdeuSj1Dd5gbJZ+IfT2z5QEe5j2low
 05hPwvGKQpwo5bCPf0PqOQFtFFKWpVkxqwG7oWrsJ+1Pt7i3w11boqtPDguVugdvBkSH qg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vcem38uxw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 03 Oct 2019 12:16:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 43A0322;
 Thu,  3 Oct 2019 10:16:26 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 978052B7B2E;
 Thu,  3 Oct 2019 12:16:25 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 3 Oct
 2019 12:16:24 +0200
To: Christophe Roullier <christophe.roullier@st.com>, <robh@kernel.org>,
 <davem@davemloft.net>, <joabreu@synopsys.com>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <peppe.cavallaro@st.com>
References: <20190920053817.13754-1-christophe.roullier@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <7575369f-0f42-9afa-4212-bb82100a7a1b@st.com>
Date: Thu, 3 Oct 2019 12:16:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920053817.13754-1-christophe.roullier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-03_04:2019-10-01,2019-10-03 signatures=0
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] net: ethernet: stmmac: some fixes and
	optimization
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

Hi Christophe

On 9/20/19 7:38 AM, Christophe Roullier wrote:
> Some improvements (manage syscfg as optional clock, update slew rate of
> ETH_MDIO pin, Enable gating of the MAC TX clock during TX low-power mode)
> Fix warning build message when W=1
> 
> Christophe Roullier (5):
>    net: ethernet: stmmac: Add support for syscfg clock
>    net: ethernet: stmmac: fix warning when w=1 option is used during
>      build
>    ARM: dts: stm32: remove syscfg clock on stm32mp157c ethernet
>    ARM: dts: stm32: adjust slew rate for Ethernet
>    ARM: dts: stm32: Enable gating of the MAC TX clock during TX low-power
>      mode on stm32mp157c
> 

DT patches will be applied on stm32-next after dwmac-stm32 patches merge 
in net-next.

>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi     |  9 +++-
>   arch/arm/boot/dts/stm32mp157c.dtsi            |  7 ++--
>   .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 42 ++++++++++++-------
>   3 files changed, 38 insertions(+), 20 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
