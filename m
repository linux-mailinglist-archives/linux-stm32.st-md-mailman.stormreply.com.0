Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC5762D52C
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Nov 2022 09:39:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82A85C65067;
	Thu, 17 Nov 2022 08:39:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35FE8C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Nov 2022 08:39:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AH3t5Mi012405; Thu, 17 Nov 2022 09:39:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zjW9wwA2jcQGFfNp1jQLkq84t89ANnAhyv8Cin6QXW8=;
 b=sI1JXQfHkU5dSLRQQUA8gG4cFbVfpe4ds9RlozDgFvSI5wI62U3XpchB8AmPDHJarsCT
 ETSDDgmqi7DWwHtNOggMrVp7ekABo/q6pOZ0jzDTsrREYlozk9B3OpLntnud0JdVMX36
 nUvV3x68muKn1+fa9N4cPqifVHaXkPgJVIf+Sx7t6XcZ+tWyqWvNLvgGfEwpVPJtXu1x
 OkbLT3L5FgOM+HT8p/qQEyBRZ+z9GwiO5aFDkNjohDnS5kGRpGdAEIGjMMGH4sQZvxhX
 2jzmXWGpwaUY4zXV9Xjs0qRTa0ElCTfZe6B+LIMyOTBv0RqsyDHck8BbwdrkIznDlaFa QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kv9ydnc7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 09:39:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C738100038;
 Thu, 17 Nov 2022 09:39:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BF5F216EDC;
 Thu, 17 Nov 2022 09:39:44 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 17 Nov
 2022 09:39:43 +0100
Message-ID: <1b93a9a8-3edb-8406-9d74-f1e47dba8f46@foss.st.com>
Date: Thu, 17 Nov 2022 09:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20221027183826.43872-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20221027183826.43872-1-marex@denx.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_04,2022-11-16_01,2022-06-22_01
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Rename mdio0 to mdio on
 DHCOR Testbench board
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

Hi Marek

On 10/27/22 20:38, Marek Vasut wrote:
> Replace "mdio0" node with "mdio" to match mdio.yaml DT schema.
> 
> Fixes: c8ce0dd75515b ("ARM: dts: stm32: Add DHCOR based Testbench board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
> index c7dcee4ee3d1d..5fdb74b652aca 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
> @@ -62,7 +62,7 @@ &ethernet0 {
>   	max-speed = <1000>;
>   	phy-handle = <&phy0>;
>   
> -	mdio0 {
> +	mdio {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		compatible = "snps,dwmac-mdio";


Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
