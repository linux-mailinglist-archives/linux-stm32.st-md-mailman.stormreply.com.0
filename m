Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BB4768DCE
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0733C6DD7F;
	Mon, 31 Jul 2023 07:17:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B5BCC6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 10:33:11 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36Q7mv1w023788; Wed, 26 Jul 2023 12:32:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9yD7Nv7FYCjZKupHugyp8v0ln3IVhj6t3qswQoubo9I=;
 b=rBYW43mlRrhhdX9YMbXL6MMRxpbClCpyZo8hKb2ZeqvJnN4hLiJ2zeBKq1nRYtvi538r
 wZRLFFB+hcO6jGWBE42hoauMRye1r0di2ci68xHmuXMBhqPc9es8J2VAp8e/Xn9KPSte
 l8ORxx9XceUspSSRZ487Vufjk+kxD0ko5guDlsgfccvfgAJ155tYfRqh+OhAicoocP+x
 itOth/GA8OgZa/04xw6Sqt8HEcnfENZuQBt6mj3giT0jhnaxxpZXbOdb1bLXv7yoxEEu
 Ej29kl9hMVZKhi1F/gCpeDX96ei7fWdwUQwULwbKeZsSUoCDj08qQyAZzARRd4+m3C0B Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2ye8h9ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 12:32:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22EAF10002A;
 Wed, 26 Jul 2023 12:32:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFB91216ED5;
 Wed, 26 Jul 2023 12:32:33 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 26 Jul
 2023 12:32:31 +0200
Message-ID: <46d4b5d2-55ca-0af3-bb02-7d49d9d2d4fa@foss.st.com>
Date: Wed, 26 Jul 2023 12:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Simon Horman <simon.horman@corigine.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-8-gatien.chevallier@foss.st.com>
 <ZMD027pTNT/HCLe6@corigine.com>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ZMD027pTNT/HCLe6@corigine.com>
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_04,2023-07-25_01,2023-05-22_02
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 robh+dt@kernel.org, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 07/11] bus: rifsc: introduce RIFSC
 firewall controller driver
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



On 7/26/23 12:26, Simon Horman wrote:
> On Tue, Jul 25, 2023 at 06:41:00PM +0200, Gatien Chevallier wrote:
> 
> ...
> 
>> diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
> 
> ...
> 
>> +static int stm32_rif_acquire_semaphore(struct stm32_firewall_controller *stm32_firewall_controller,
>> +				       int id)
>> +{
>> +	void __iomem *addr = stm32_firewall_controller->mmio + RIFSC_RISC_PER0_SEMCR + 0x8 * id;
>> +
>> +	__set_bit(SEMCR_MUTEX, addr);
> 
> Hi Gatien,
> 
> Sparse seem a bit unhappy about this.
> 
>   .../stm32_rifsc.c:83:9: warning: cast removes address space '__iomem' of expression
>   .../stm32_rifsc.c:83:9: warning: incorrect type in argument 2 (different address spaces)
>   .../stm32_rifsc.c:83:9:    expected unsigned long volatile *addr
>   .../stm32_rifsc.c:83:9:    got void [noderef] __iomem *addr
>   .../stm32_rifsc.c:83:9: warning: incorrect type in argument 2 (different address spaces)
>   .../stm32_rifsc.c:83:9:    expected unsigned long volatile *addr
>   .../stm32_rifsc.c:83:9:    got void [noderef] __iomem *addr
> 
> But it's not immediately apparent to me what a good solution is.
> 

Hi Simon,

This is indeed incorrect, set_bit is used to modify bit fields, not
writing to a register. I'll change to writel, as in
stm32_rif_release_semaphore(). Thank you for pointing this out.

Best regards,
Gatien
>> +
>> +	/* Check that CID1 has the semaphore */
>> +	if (stm32_rifsc_is_semaphore_available(addr) ||
>> +	    FIELD_GET(RIFSC_RISC_SCID_MASK, readl(addr)) != RIF_CID1)
>> +		return -EACCES;
>> +
>> +	return 0;
>> +}
> 
> ...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
