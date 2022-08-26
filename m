Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F665A2275
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 09:58:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECE2EC640F6;
	Fri, 26 Aug 2022 07:58:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDDFFC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 07:58:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q3teud026046;
 Fri, 26 Aug 2022 09:58:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KltPJl7Ifr5rnBSzdvpzScGg0CgWIPQrs+pS1su925I=;
 b=MvF+yqqFBjCMcsH12r7zmHsyJZnjzWaEp1mlgaQIXaE1cPGvAKKqu0V7Wc+RIEDw7LWe
 rjaIvm2qgC3vdXXpbwuAjJLSId5QXg7ZKHGoyaQ8FecRRFKth7IqzofSCYzYwlyvgbKA
 1Y9U1e2xROrzUlMMnVN5o0EqnIBXG63L1Obfa2e9Z3q8/3VKwoi6CFfsKd/7xjStqJLK
 C/eSeR2mvFIxYdBYzD3v2T4KxqO/KFy8rkcanvwLUpP9UlwtXSCv7uMsgjH0n2sL1yd8
 b2oGQTpwMDxH5+UB7wm5cU9Jn13Cu1+3niOGKf+UROU/wVyJAiZO7ApFvZk2c7IejE0V ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j52b11328-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 09:58:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BDF23100038;
 Fri, 26 Aug 2022 09:58:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B9503215130;
 Fri, 26 Aug 2022 09:58:09 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 26 Aug
 2022 09:58:08 +0200
Message-ID: <03b3c313-92b1-3955-4a16-f34b9901171b@foss.st.com>
Date: Fri, 26 Aug 2022 09:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>
References: <20220725075255.429869-1-alain.volmat@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220725075255.429869-1-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_03,2022-08-25_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] ARM: dts: stm32: add SPI on
	STM32MP13 platform
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

On 7/25/22 09:52, Alain Volmat wrote:
> This series adds DT entries related to all spi nodes for the
> STM32MP13 platform.
> 
> v2: reorder all node properties, starting with compatible and reg
> 
> Alain Volmat (2):
>    ARM: dts: stm32: add spi nodes into stm32mp131.dtsi
>    ARM: dts: stm32: add pinctrl and disabled spi5 node in stm32mp135f-dk
> 
>   arch/arm/boot/dts/stm32mp13-pinctrl.dtsi | 23 ++++++++
>   arch/arm/boot/dts/stm32mp131.dtsi        | 70 ++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp135f-dk.dts     |  7 +++
>   3 files changed, 100 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
