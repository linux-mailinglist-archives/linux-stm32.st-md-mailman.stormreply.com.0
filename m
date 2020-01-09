Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8AE13550E
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2020 10:01:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CC3FC36B0B;
	Thu,  9 Jan 2020 09:01:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34600C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 09:01:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0098vluo027339; Thu, 9 Jan 2020 10:01:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=VrpNqw1ml8Zy129ySb4TfJry+4/8mCEXYVXi+jrwUo4=;
 b=Ex9Eg7dwD08Sqq4AnJ4VKMz3942ON5mW6GSfi09pXE0WW191YtZAisAaWCGBdxfOM/c0
 +L36s7Y8wXA2XNDhbMWlBE3xDgKh0vt4Lp3ZqT1EUHJHNQK0MBS4qJf55ikNF+tpwJdu
 17xK4xrsqfKIbIEIpEkJo/rW/325R8lIcAlTHUqcbK6oYl/eCU1bUp3bXa1CCp6y5AkQ
 XmaNsD3S+ebYb1xpG3BUge2ypZ7lY5wAY2+YlqIpFUimdLhzF+lsBl0Ts2qJivyvioMg
 IrtcXNwgrJZvnCQr5o3b9hiGz8gMT+FqzJXdT7SNR4O4LJSPQxDx3BJri8lVEXNzPM7C VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakur0ggh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 10:01:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8495A10002A;
 Thu,  9 Jan 2020 10:01:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AFAB2A4D7B;
 Thu,  9 Jan 2020 10:01:04 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Jan
 2020 10:01:03 +0100
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 <srinivas.kandagatla@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <fabrice.gasnier@st.com>
References: <20191219144117.21527-1-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c3326bf5-f3f8-489b-5245-3b9fd47324bb@st.com>
Date: Thu, 9 Jan 2020 10:01:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219144117.21527-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_02:2020-01-08,
 2020-01-09 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Convert STM32 ROMEM to json-schema
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

Hi Benjamin,

On 12/19/19 3:41 PM, Benjamin Gaignard wrote:
> Convert STM32 ROMEM to json-schema and fix the issues detected on stm32 dtsi
> files.
> Note that stm32mp1 patch should be applied on top of the stm32-next tree.
> 
> Benjamin Gaignard (3):
>    dt-bindings: nvmem: Convert STM32 ROMEM to json-schema
>    ARM: dts: stm32: change nvmem node name on stm32f429
>    ARM: dts: stm32: change nvmem node name on stm32mp1
> 
>   .../devicetree/bindings/nvmem/st,stm32-romem.txt   | 31 ---------------
>   .../devicetree/bindings/nvmem/st,stm32-romem.yaml  | 46 ++++++++++++++++++++++
>   arch/arm/boot/dts/stm32f429.dtsi                   |  2 +-
>   arch/arm/boot/dts/stm32mp151.dtsi                  |  2 +-
>   4 files changed, 48 insertions(+), 33 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
>   create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> 

DT patches applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
