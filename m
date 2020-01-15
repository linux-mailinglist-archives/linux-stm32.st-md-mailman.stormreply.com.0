Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B616F13D5C1
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 09:13:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64A5EC36B0F;
	Thu, 16 Jan 2020 08:13:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1F93C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 16:45:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00FGMsoa023045; Wed, 15 Jan 2020 17:45:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8feCXWODigq24yt5fsOi6kLQpPI2lmoDfYZvUUn8rxM=;
 b=GBj9ZzrpMtRXTlSf+R/Gy9fX0CwGP7GLBOeL322sLPdFHCKmIzoAI5/QDH593nOrbbFr
 lMhb478XtrzeURWg12fpjjfN2DIGHtsf9eSqRb4T9XYrhtJNnJwdLzA5CAPH0HhbKX6O
 qKR6H0052U6x6puCCYnfh/zgweJ7bQYwzQj71dW+TdsoqXZeseaPn7rUgHuZqNA4eDxg
 6JOLU/ifbL7NslszSdnMwAt9DYrmkld7ipN/IC0f1PkNBhlXW8QVXEKw9vB5eBY7jtxD
 kAj6E0ay5IGMWBu6VVXrZbyaQqO3sIy8k7o9nOZAhyusFnhfvZU4e/r5ynDkAWVgWbEG Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7jpmcm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2020 17:45:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF762100034;
 Wed, 15 Jan 2020 17:45:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A24B2BF9BF;
 Wed, 15 Jan 2020 17:45:38 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan
 2020 17:45:38 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 15 Jan 2020 17:45:38 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
Thread-Topic: [PATCH] ARM: dts: stm32: Add missing ETHCK clock to ethernet node
Thread-Index: AQHVy4iipc/ErGptfk6i556Of7H6oqfr7lxg
Date: Wed, 15 Jan 2020 16:45:37 +0000
Message-ID: <521254538ec74534a533b8ca4448855e@SFHDAG6NODE3.st.com>
References: <20200115094608.154386-1-marex@denx.de>
In-Reply-To: <20200115094608.154386-1-marex@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-15_02:2020-01-15,
 2020-01-15 signatures=0
X-Mailman-Approved-At: Thu, 16 Jan 2020 08:13:01 +0000
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add missing ETHCK clock
	to ethernet node
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Marek;

Add the Linux Maintainers for STM32M linux patch:

M:	Maxime Coquelin <mcoquelin.stm32@gmail.com>
M:	Alexandre Torgue <alexandre.torgue@st.com>
L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)


Hi Alexandre,

Can you review this patch.

Regards

Patrick

> From: Marek Vasut <marex@denx.de>
> Sent: mercredi 15 janvier 2020 10:46
> 
> Add missing 'eth-ck' clock to the ethernet node. These clock are used to generate
> external clock signal for the PHY in case 'st,eth_ref_clk_sel'
> is specified.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christophe ROULLIER <christophe.roullier@st.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi
> b/arch/arm/boot/dts/stm32mp151.dtsi
> index fb41d0778b00..e0ecc5ee7d83 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1369,10 +1369,12 @@ ethernet0: ethernet@5800a000 {
>  			clock-names = "stmmaceth",
>  				      "mac-clk-tx",
>  				      "mac-clk-rx",
> +				      "eth-ck",
>  				      "ethstp";
>  			clocks = <&rcc ETHMAC>,
>  				 <&rcc ETHTX>,
>  				 <&rcc ETHRX>,
> +				 <&rcc ETHCK_K>,
>  				 <&rcc ETHSTP>;
>  			st,syscon = <&syscfg 0x4>;
>  			snps,mixed-burst;
> --
> 2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
