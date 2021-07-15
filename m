Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CACBD3CA106
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 16:58:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6561CC59781;
	Thu, 15 Jul 2021 14:58:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1389C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 14:57:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FEuAdr023990; Thu, 15 Jul 2021 16:57:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5ZLSF66rx3uabHNQryMp8j9KoNQNiSpJSW/IwGEYFjM=;
 b=cLuGmxNFVxbKvDAwGske9H4tjddsiXAO61p4FkLcsh5KTMafxnpZXvB5z0wCvxcDl9dg
 VQ78Eyv+h1X6uNnrGEIRDGhJAq5q2ruvxJrRdukBGG/Zich39MzW8RhpUPzxRQLsVfQn
 jQpQjpZ66baosceaSm1oBpeynNX+L4qVOaJBxsiLyDrighTOTu3snjv0X5DlVD0Pnwqb
 2a5+SvxLjOnOv0X5X+w20WUYtEnxS/w5K1mg9uWoFKqdoizTZFy+4X3Pun0FP6pBQE4w
 n6JU71ilE1YzF7XWwYPo0bGolw47Icj9w1bWCp7JHMn7UHJcEC4Eft9zvNsvakkih2pS 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tac3v3cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 16:57:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0401B10002A;
 Thu, 15 Jul 2021 16:57:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF9F622FA3B;
 Thu, 15 Jul 2021 16:57:40 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 16:57:40 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210610150243.30017-1-marex@denx.de>
 <20210610150243.30017-3-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <802a96d6-383d-b016-cbfc-bc5fc9c55955@foss.st.com>
Date: Thu, 15 Jul 2021 16:57:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610150243.30017-3-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_10:2021-07-14,
 2021-07-15 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Add usbphyc_port1
 supply on DHCOM SoM
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

Hi Marek,

On 6/10/21 5:02 PM, Marek Vasut wrote:
> The port is unused, but shares the same supply with port0, so fill the
> DT property in. This fixes the following dtbs_check warning:
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dt.yaml: usbphyc@5a006000: usb-phy@1: 'phy-supply' is a required property
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: kernel@dh-electronics.com
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> index fb45c5aa878d..4b10b013ffd5 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> @@ -159,3 +159,7 @@ &usbphyc {
>   &usbphyc_port0 {
>   	phy-supply = <&vdd_usb>;
>   };
> +
> +&usbphyc_port1 {
> +	phy-supply = <&vdd_usb>;
> +};
> 

Series applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
