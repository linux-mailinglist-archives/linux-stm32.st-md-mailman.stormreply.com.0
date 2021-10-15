Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CE742F38E
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Oct 2021 15:32:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32CA9C5C841;
	Fri, 15 Oct 2021 13:32:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC94DC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 13:32:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F8Pg0q020135; 
 Fri, 15 Oct 2021 15:31:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/vUjc4vKowSy/W2vHTh88FbFav5x8VQuf9Ux8qymYBs=;
 b=nTutEyibQh1xb9hPTZsDehO+kh2v3k/tPPfMkbXnIlEhIt9VwKkmoVrE2qpkA8z50ZRx
 xwVot+DUt/DXQPCM185TJ9Vmgi9LfEQw6XKn7vawQQqwNAehh7zV4qGT6ag9S9dOsb7Z
 lU1kPeYtqkrJPqVuGuA0/g/iIxC3CcaHK1Qf1sfRZulpelcmmcAGlEKUtvFA57Xqc+eU
 tuHvR7wOVwt23q1W0TAyF1PKCH4T2ztSi5H/fMsZ/Xwl3mSitI3up8NrQ+5FPPQCkqnO
 xK0qULJKGo8gLIhKIF3QpOYuFI+Hc24ytAbX1nkXD60P7hMqqqCZ2mzEp+zLljNdEnLr pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bpydfceym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 15:31:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 297C510002A;
 Fri, 15 Oct 2021 15:31:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 21A38231DC1;
 Fri, 15 Oct 2021 15:31:52 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct
 2021 15:31:51 +0200
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20211006095355.59078-1-amelie.delaunay@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <8bae8e79-97d4-f914-5adf-eee1b6526de6@foss.st.com>
Date: Fri, 15 Oct 2021 15:31:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006095355.59078-1-amelie.delaunay@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_04,2021-10-14_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: use usbphyc
 ck_usbo_48m as USBH OHCI clock on stm32mp151
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

On 10/6/21 11:53 AM, Amelie Delaunay wrote:
> Referring to the note under USBH reset and clocks chapter of RM0436,
> "In order to access USBH_OHCI registers it is necessary to activate the USB
> clocks by enabling the PLL controlled by USBPHYC" (ck_usbo_48m).
> 
> The point is, when USBPHYC PLL is not enabled, OHCI register access
> freezes the resume from STANDBY. It is the case when dual USBH is enabled,
> instead of OTG + single USBH.
> When OTG is probed, as ck_usbo_48m is USBO clock parent, then USBPHYC PLL
> is enabled and OHCI register access is OK.
> 
> This patch adds ck_usbo_48m (provided by USBPHYC PLL) as clock of USBH
> OHCI, thus USBPHYC PLL will be enabled and OHCI register access will be OK.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index bd289bf5d269..fe194c787e6c 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1452,7 +1452,7 @@ stmmac_axi_config_0: stmmac-axi-config {
>   		usbh_ohci: usb@5800c000 {
>   			compatible = "generic-ohci";
>   			reg = <0x5800c000 0x1000>;
> -			clocks = <&rcc USBH>;
> +			clocks = <&rcc USBH>, <&usbphyc>;
>   			resets = <&rcc USBH_R>;
>   			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
>   			status = "disabled";
> 

Applied on stm32-next

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
