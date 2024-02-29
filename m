Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF8286C51A
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Feb 2024 10:28:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C5F3C6C838;
	Thu, 29 Feb 2024 09:28:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B78DC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Feb 2024 09:28:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41T54AFB018062; Thu, 29 Feb 2024 10:28:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=lLzXK4ziQ0XZhX6SdDGA9H4+IrlVv8lehxYOD5oOBtY=; b=O6
 jGRkixP9Gjyj9Rfbee6LCP/TUEVsCY2dxkZf1Y1PQPu0n5iB8QqYLSjQco8Q/MGt
 dQrFrE8nrq7mT082pvBETart2Dp65Dcl2CITmwIzOkCJZVXkrNENr3RIhhR457jd
 0Rv0K6ev0WT++Aggfe6AHuk4ln2qD9EmxbbGJizllevUeIm266ztQ506KJh32dXw
 aXob2uFE6mXtNebPHWh6O0Oqkff9jwTCy7lZz4VpnZ0vygVJAKxXvidRv6EF/Lnr
 vHwDOATcES+wTZXNAG41422tAaqGmNfUestW555YrWeYIu/EEtJDl+IXaSRv2XcY
 /aq3NXFP4r5iKXlMPIUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4e1992-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Feb 2024 10:28:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0E7B840048;
 Thu, 29 Feb 2024 10:27:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3C39424F9C4;
 Thu, 29 Feb 2024 10:27:27 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 29 Feb
 2024 10:27:25 +0100
Message-ID: <1da6174d-a8b2-420b-a1f2-db6975d68948@foss.st.com>
Date: Thu, 29 Feb 2024 10:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Bourgoin <thomas.bourgoin@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20240219113745.92538-1-thomas.bourgoin@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240219113745.92538-1-thomas.bourgoin@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_01,2024-02-27_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Enable the CRC and CRYP IP on
	STM32MP135F-DK board.
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

Hi Thomas

On 2/19/24 12:37, Thomas Bourgoin wrote:
> Enable the CRC and CRYP internal peripherals on STM32MP135F-DK board.
> 
> The first 2 patches adds the node crc1 in file stm32mp131.dtsi and
> enables it for the board stm32mp135f-dk.
> The last patch of the patchset enables the node cryp for the board
> stm32mp135f-dk.
> 
> Lionel Debieve (2):
>    ARM: dts: stm32: add CRC on stm32mp131
>    ARM: dts: stm32: enable CRC on stm32mp135f-dk
> 
> Thomas Bourgoin (1):
>    ARM: dts: stm32: enable crypto accelerator on stm32mp135f-dk
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi    | 7 +++++++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts | 8 ++++++++
>   2 files changed, 15 insertions(+)
> 

Series applied on stm32-next.

Thanks
Alex


> --
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
