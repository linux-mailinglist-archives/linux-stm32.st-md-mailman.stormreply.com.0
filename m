Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0D47ECF
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 11:49:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25658D0C9F0
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 09:44:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0E41D0C9E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 09:44:41 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H9gHDt003329; Mon, 17 Jun 2019 11:44:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=vSNS/bq0veNCYFxKoKYyEQdlakEJCBWCIdyquEymrxE=;
 b=KgqofR0T2LgJCXq1TE3zLLmC4ABVK94VpPhryD+CPlLTkwdOCoBRSbYv9cczm2YNKKlO
 AfWoFBnANPtX4y7W/fwtI9XB+/8LocEuw7wVMGt5UNd8Bb8LRih0aPaPr1v7U0oihnFk
 5u8X7eMB6ZP+ZBoMSYCI5OkIG2lgBoC+nIlj4KfK9/AGTxVEB1Gby+dshQzUow57V7hq
 8pAXfOIiJhKEZ4vqHFz7KB6PdmQLc/dVzLeNb4I0DTPDpVkn3UdFPh31Kcmq8DlStJrS
 zUTQxz0cWb1LmNgXqiQHtgu7Hnu9yGVEKk7xLJjKFeEeqn/8IiGE+42HUrZpxdydlbu6 OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t4peu1nxf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 11:44:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 097E259;
 Mon, 17 Jun 2019 09:44:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDA2B25CC;
 Mon, 17 Jun 2019 09:44:32 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 17 Jun
 2019 11:44:32 +0200
To: Olivier Moysan <olivier.moysan@st.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, <robh@kernel.org>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1560253556-18399-1-git-send-email-olivier.moysan@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <4f3f0728-d9b3-dcbc-8dfe-e7f55a9bd204@st.com>
Date: Mon, 17 Jun 2019 11:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560253556-18399-1-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_05:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add sai id registers to
	stm32mp157c
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

Hi Olivier

On 6/11/19 1:45 PM, Olivier Moysan wrote:
> Add identification registers to address range
> of SAI DT parent node, for stm32mp157c.
> 
> Change-Id: I696363794fab59ba8d7869b3ffbc041dacdf28de
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index e98aad37ff9e..0c4e6ebc3529 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi


Applied on stm32-next. Next time, don't forget to remove your gerrit 
changeID please.

Thanks.
Alex



> @@ -746,7 +746,7 @@
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges = <0 0x4400a000 0x400>;
> -			reg = <0x4400a000 0x4>;
> +			reg = <0x4400a000 0x4>, <0x4400a3f0 0x10>;
>   			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
>   			resets = <&rcc SAI1_R>;
>   			status = "disabled";
> @@ -778,7 +778,7 @@
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges = <0 0x4400b000 0x400>;
> -			reg = <0x4400b000 0x4>;
> +			reg = <0x4400b000 0x4>, <0x4400b3f0 0x10>;
>   			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
>   			resets = <&rcc SAI2_R>;
>   			status = "disabled";
> @@ -809,7 +809,7 @@
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges = <0 0x4400c000 0x400>;
> -			reg = <0x4400c000 0x4>;
> +			reg = <0x4400c000 0x4>, <0x4400c3f0 0x10>;
>   			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>   			resets = <&rcc SAI3_R>;
>   			status = "disabled";
> @@ -1164,7 +1164,7 @@
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges = <0 0x50027000 0x400>;
> -			reg = <0x50027000 0x4>;
> +			reg = <0x50027000 0x4>, <0x500273f0 0x10>;
>   			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>   			resets = <&rcc SAI4_R>;
>   			status = "disabled";
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
