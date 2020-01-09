Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9B1354A8
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2020 09:46:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24621C36B0B;
	Thu,  9 Jan 2020 08:46:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7433EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 08:46:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0098j471008889; Thu, 9 Jan 2020 09:46:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=uLATKF9ODz3kL4U3DLHRNE8pm/VoFFXN89GnTjH1WkU=;
 b=abGVxG8c7OxepqjZZQzy4p8LDf0vbN++fRIq9wAPLeOABBnWmLpMfqslmtrsgvINEdj7
 HCo9leQUvagMKl5kHeGMRuQ7y+6mHKhpUz93qBDUYWCcMQ7WAepVtcPsVCRV32/EYhxN
 Ajh5nxOnxPZq7vrDOOahTppdiurgyOfy4s/pBaN0WS8OEH2TFn7U9bvf0FPGKb4nzaUM
 geYLwaFwOBleCeogpzEs8ciocGvugqBT3yGy8af28wJTOny85HpMBkPhkxI7AUIvMk9M
 QEepVW/3XyK/VF1H5YFQLHlf+sVF9Euq/eJessKycjpnBR4TpRxOVDclhpVU8j3g8R4B NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2xdw8b14d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 09:46:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23CD510003E;
 Thu,  9 Jan 2020 09:46:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA514221FD0;
 Thu,  9 Jan 2020 09:46:13 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Jan
 2020 09:46:13 +0100
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Rob Herring <robh@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
References: <20191219121815.22987-1-arnaud.pouliquen@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <1df021db-98c4-706d-391a-393c40a3aff3@st.com>
Date: Thu, 9 Jan 2020 09:46:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219121815.22987-1-arnaud.pouliquen@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_02:2020-01-08,
 2020-01-09 signatures=0
Cc: Fabien Dessenne <fabien.dessenne@st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: update mlahb node
 according to the bindings
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

Hi Arnaud

On 12/19/19 1:18 PM, Arnaud Pouliquen wrote:
> Update of the mlahb node according to to DT bindings using json-schema
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 3dd570b10181..047051c56ef7 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1669,10 +1669,11 @@
>   		};
>   	};
>   
> -	mlahb {
> -		compatible = "simple-bus";
> +	mlahb: ahb {
> +		compatible = "st,mlahb", "simple-bus";
>   		#address-cells = <1>;
>   		#size-cells = <1>;
> +		ranges;
>   		dma-ranges = <0x00000000 0x38000000 0x10000>,
>   			     <0x10000000 0x10000000 0x60000>,
>   			     <0x30000000 0x30000000 0x60000>;
> 

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
