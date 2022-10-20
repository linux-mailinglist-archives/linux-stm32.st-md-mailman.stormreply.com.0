Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DD76065C9
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Oct 2022 18:28:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95A22C64106;
	Thu, 20 Oct 2022 16:28:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 232DFC55596
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Oct 2022 16:28:31 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KF1qro021421;
 Thu, 20 Oct 2022 18:28:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CQnbaJJD24/eCkMNlPXQ6jy0g+LXpZicbi52ALVu11g=;
 b=jGT7ul9zAX6+JXaK2nuetxh1LSLPO8MwAEbYqTcloDuFc6GYEQtQ3Z65CMbGPFVhcMUD
 dxjrA3RcJi8IzQ+EhNaYrUFeTtsEClUK73Ze5QBa7+mTzIs+r8ZA87UIsb1WXIWgvy3C
 fctlYh1/wXA8kih51B6wPZSXPFYKfsTC1VFwC4v82IeC2XkeTpVR5J939PHtVg2Dt4IC
 03SaxFH0kAAE2V2eOOouFU4UCQss4uuhlso+kPbx4gJp/rZ8xtm3q2gNJINm8EjCgg52
 ILR0bmk+MfxFCOrhGQwSZlaqoA/RfKUTc1QnYkN8UtUhG4vtitPsQk0MzXyz+UIls8GG MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k7j9ncat9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 18:28:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52F93100034;
 Thu, 20 Oct 2022 18:28:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E084245521;
 Thu, 20 Oct 2022 18:28:22 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 18:28:22 +0200
Message-ID: <9ad82fba-9c64-2cf5-0794-ed2bcea2c176@foss.st.com>
Date: Thu, 20 Oct 2022 18:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220926212958.505561-1-marex@denx.de>
 <20220926212958.505561-2-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220926212958.505561-2-marex@denx.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_07,2022-10-20_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: Add DHCOR based
	Testbench board
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

On 9/26/22 23:29, Marek Vasut wrote:
> Add DT for DHCOR Testbench board, which is a testbench for testing of
> DHCOR SoM during manufacturing. This is effectively a trimmed down
> version of AV96 board with CSI-2 bridge, HDMI bridge, WiFi, Audio and
> LEDs removed and used as GPIOs instead. Furthermore, the PMIC Buck3
> is always configured from PMIC NVM to cater for both 1V8 and 3V3 SoM
> variant.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/Makefile                    |   1 +
>   .../boot/dts/stm32mp151a-dhcor-testbench.dts  |  17 ++
>   .../boot/dts/stm32mp15xx-dhcor-testbench.dtsi | 171 ++++++++++++++++++
>   3 files changed, 189 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32mp151a-dhcor-testbench.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 1a718157d1a68..962e0003a8d62 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1214,6 +1214,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp151a-prtt1a.dtb \
>   	stm32mp151a-prtt1c.dtb \
>   	stm32mp151a-prtt1s.dtb \
> +	stm32mp151a-dhcor-testbench.dtb \
>   	stm32mp153c-dhcom-drc02.dtb \
>   	stm32mp153c-dhcor-drc-compact.dtb \
>   	stm32mp157a-avenger96.dtb \
> diff --git a/arch/arm/boot/dts/stm32mp151a-dhcor-testbench.dts b/arch/arm/boot/dts/stm32mp151a-dhcor-testbench.dts
> new file mode 100644
> index 0000000000000..e0f828ecc2faf


Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
