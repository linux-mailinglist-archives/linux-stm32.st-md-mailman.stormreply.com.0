Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4F274B47F
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jul 2023 17:45:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A729EC6B45C;
	Fri,  7 Jul 2023 15:45:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A802FC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 15:45:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 367CH9mW027393; Fri, 7 Jul 2023 17:44:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UirHfJWJ0M0c3P66CSNWUmzBZIs0e0lzSHowOTIQOxY=;
 b=R077onV69jpX15gfnwED6gCxOl6yExQaqxA53M7kAUStTuqI6BK8nT5z07EXtUEmHolY
 riyqdNY+iqw2vdORFsm8Ff3OR9V6cs5mzg/rbN1iDNyCpDtaXAmAKIeIylrkc1PkUjmO
 hchsdwamHlynmEL1RY40fiFNk47LZKTBA5P1Qhnz+JMV18+Ew+dTtXCkzH1eRGffvA8x
 wlSz5XaqZE2Y2se0KTE7WNPLGB6T8d3cDevC2/gA7JAHKnptpGkPK72PlMBcPaae7E88
 vBYPyaIvZL1KHTdsxqUau3JWVd60dpGsiUNHy8ji7tFOVFiy85DSPwi1zOkp0W8r83d2 SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rpjjtsepn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 17:44:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39181100050;
 Fri,  7 Jul 2023 17:44:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FC1C22A6F1;
 Fri,  7 Jul 2023 17:44:36 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 7 Jul
 2023 17:44:34 +0200
Message-ID: <c6533f17-6100-5901-7281-256bff5db773@foss.st.com>
Date: Fri, 7 Jul 2023 17:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
 <2023070748-false-enroll-e5dc@gregkh>
 <febd65e1-68c7-f9d8-c8a4-3c3e88f15f3e@foss.st.com>
 <2023070744-superjet-slum-1772@gregkh>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <2023070744-superjet-slum-1772@gregkh>
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, hugues.fruchet@foss.st.com, lee@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alsa-devel@alsa-project.org, richardcochran@gmail.com, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 05/10] firewall: introduce stm32_firewall
	framework
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



On 7/7/23 17:10, Greg KH wrote:
> On Fri, Jul 07, 2023 at 04:00:23PM +0200, Gatien CHEVALLIER wrote:
>> I'll change to (GPL-2.0-only OR BSD-3-Clause) :)
> 
> If you do that, I'll require a lawyer to sign off on it to verify that
> you all know EXACTLY the work involved in dealing with dual-licensed
> kernel code.  Sorry, licenses aren't jokes.

I was worried about the interactions with software running on BSD
license, hence my (poorly written) proposal. Looking back at it
there's no good reason to use a dual-license here.
GPL-2.0-only is fine.

> 
> thanks,
> 
> greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
