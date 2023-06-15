Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F787311B4
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 10:05:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CC2CC6A610;
	Thu, 15 Jun 2023 08:05:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 818ACC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 08:05:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35F6XFam007602; Thu, 15 Jun 2023 10:05:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rWAsqAnk1NOFfSrch2LiFEFQGq9N0Hnm6C4sCs+M3D4=;
 b=31hrIaUG+w5OmHV87NzjL1XMuVANMHUndDS+geuV4yaGOSRyXOQRfrlPlvbdn+erMk7E
 seB4ccjWnvillD/+0LWQqybK3wYbzQ0F/izSPJp+NRdgSK5DI4Mr6gWxIxcgZOdLuUzr
 2z9XHUE5ln/oMt3V24fhGcdbX0kC8U7nfGLX0K+IVs6YJZ39NXk2UAkJOWVsNjk5I516
 GYI+lm/SOr36nXOntV77sX9+UlnVpI66N0ucc9sf7C+sNe/62ElSfEJZfQT+6cUrnIeH
 1FHYqTd3vTsl4+AfGLyhqFH6jw9P74Qbr16A05ZXcAY0wxa/4m5aDyF744wdhOqMPmSA KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r7s1maacb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 10:05:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 343B010002A;
 Thu, 15 Jun 2023 10:05:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27FA2216EC2;
 Thu, 15 Jun 2023 10:05:39 +0200 (CEST)
Received: from [10.252.8.64] (10.252.8.64) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 15 Jun
 2023 10:05:38 +0200
Message-ID: <2785de74-69b2-8ebc-09c9-f834adb870c0@foss.st.com>
Date: Thu, 15 Jun 2023 10:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Mark Brown <broonie@kernel.org>
References: <20230614102628.202936-1-valentin.caron@foss.st.com>
 <d0b62ef2-5355-4c00-9ff6-4ea9995ec0e1@sirena.org.uk>
Content-Language: en-US
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <d0b62ef2-5355-4c00-9ff6-4ea9995ec0e1@sirena.org.uk>
X-Originating-IP: [10.252.8.64]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_04,2023-06-14_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] spi: stm32: add spi slave mode
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


On 6/14/23 14:16, Mark Brown wrote:
> On Wed, Jun 14, 2023 at 12:26:23PM +0200, Valentin Caron wrote:
>> STM32 SPI can operate in slave mode.
>> This series add this functionnality in spi-stm32 driver.
> The more modern terminology here is device mode.

Hi Mark,

Thanks for your review. I have resent a "v3" with this improvement.

Regards,
Valentin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
