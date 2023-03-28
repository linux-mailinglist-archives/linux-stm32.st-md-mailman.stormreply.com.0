Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D206CC27D
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 16:45:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B400BC6905A;
	Tue, 28 Mar 2023 14:45:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95620C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 14:45:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SE1iZM005926; Tue, 28 Mar 2023 16:45:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VPS+rVteWfwSBB4nelu3zcEct18pfJrZLIvhIcyLJDg=;
 b=skjs44Q8egMAbOsx+UqKBgVqAuUgQBtV7SRK1cQ3bkbAPmpzgPJ+fPWdOVj0oHjPwQTg
 sfXDEnVArODe7h1CNgvfnD/oLz7HwiQlaF5KZhkZY/u+W+cotFNOm+XCCGRmjy0hvPUx
 3JBLXkZGuftyq0axjdddTYl+NHaG8hVFzog9hbWeWpnYaA4irw9KQ8TSI6h/7YQgknTv
 EAnZ2oKpXHiF6a80xPClWWfKrpV6frwkHuCluw42hNTprv3Mk3D0qpQFM/8orrC8Nhcd
 7wqdzGyMDKNTNIcjtYidBAKhW5jpok3CuL5JsF51RHJfh2bbR6GT7wwAYiJA6SSd8ewn vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pk5xkjg4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 16:45:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6E1E100039;
 Tue, 28 Mar 2023 16:43:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A55AC217B91;
 Tue, 28 Mar 2023 16:43:24 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 16:43:24 +0200
Message-ID: <e89aed99-12b6-d1ba-26a5-5e98c4cd6298@foss.st.com>
Date: Tue, 28 Mar 2023 16:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Roan van Dijk <roan@protonic.nl>, <linux@armlinux.org.uk>
References: <20230328093311.1258948-1-roan@protonic.nl>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230328093311.1258948-1-roan@protonic.nl>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
Cc: linux-kernel@vger.kernel.org, David Jander <david@protonic.nl>,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] arm: mach-stm32: board-dt.c: Add support
	for STM32MP151
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

On 3/28/23 11:33, Roan van Dijk wrote:
> This patch adds initial support of STM32MP151 microprocessor (MPU)
> based on Arm Cortex-A7. New Cortex-A infrastructure (gic, timer,...)
> are selected if ARCH_MULTI_V7 is defined.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Roan van Dijk <roan@protonic.nl>
> 
> ---
>   arch/arm/mach-stm32/board-dt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
> index 2ccaa11aaa56..5dcc4ddd1a56 100644
> --- a/arch/arm/mach-stm32/board-dt.c
> +++ b/arch/arm/mach-stm32/board-dt.c
> @@ -21,6 +21,7 @@ static const char *const stm32_compat[] __initconst = {
>   	"st,stm32mp131",
>   	"st,stm32mp133",
>   	"st,stm32mp135",
> +	"st,stm32mp151",
>   	"st,stm32mp157",
>   	NULL
>   };


Applied on stm32-next by changing the commit titile (ARM: stm32: ...).

You could send a patch in Documentation/arm/stm32 to highlights main 
feature of this SoC or deltas with MP157.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
