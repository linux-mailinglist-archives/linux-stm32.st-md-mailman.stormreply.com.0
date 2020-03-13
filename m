Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7BC18473E
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2020 13:50:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45ACEC36B0E;
	Fri, 13 Mar 2020 12:50:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88BD0C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 12:50:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DClBBG009053; Fri, 13 Mar 2020 13:50:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=r4gx10/wtvNnRN5cGMpKMfyjngW05Zoe7Hit39sNOOI=;
 b=vsgXryl3gsHhysTHeFNVOvbdWiNlUdW0cEZqWoEBwuAtx9dMlhCnEfi1/5P/RApZgbKE
 cFQh5E/t/8unfbgFBVUzql5SDo5MBvM6I92G1WOpcqjzWwUcJsjgB2LhIUPkGK4XAsAv
 Phah9YYFe5kZnCjZgQkj8JUuhs3kjHxLI1jtmZ4X4Z/Iz2wLi6CJrJB2Z7fV6t3001op
 e7fXivhc9aGBE8JH6UpU/GXsCjU9aIsEtIr3Kfu4xCVIFDQVDiNHsKmwRPBY9eHrOq+j
 6ez0T8BGwCkFOybaUdKVuy2LE/0Qp96LR8FnLJIjTdqUvD/xY93n7gDmmsPenQDO7olc og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yqt82gm58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 13:50:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E27DF100038;
 Fri, 13 Mar 2020 13:50:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CED582A7F68;
 Fri, 13 Mar 2020 13:50:11 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 13 Mar
 2020 13:50:10 +0100
To: Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>,
 <robh+dt@kernel.org>
References: <1581355056-13884-1-git-send-email-alain.volmat@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <7f8a5f6d-4d62-3649-efda-3d02f89a4d07@st.com>
Date: Fri, 13 Mar 2020 13:50:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581355056-13884-1-git-send-email-alain.volmat@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_04:2020-03-12,
 2020-03-13 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: set i2c4 bus freq to
 400KHz on stm32mp15 DK boards
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

Hi Alain

On 2/10/20 6:17 PM, Alain Volmat wrote:
> On DK boards, all I2C4 bus slaves supports I2C Fast Mode hence setting
> the bus frequency to 400 KHz.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 7f5fcb2c5b03..2521f428ae67 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -221,6 +221,7 @@
>   	pinctrl-1 = <&i2c4_pins_sleep_a>;
>   	i2c-scl-rising-time-ns = <185>;
>   	i2c-scl-falling-time-ns = <20>;
> +	clock-frequency = <400000>;
>   	status = "okay";
>   	/* spare dmas for other usage */
>   	/delete-property/dmas;
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
