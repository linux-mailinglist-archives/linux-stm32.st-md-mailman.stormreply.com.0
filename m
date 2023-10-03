Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FAB7B62CE
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 09:50:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A854C6B476;
	Tue,  3 Oct 2023 07:50:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D87EC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 07:50:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3935SjWV027905; Tue, 3 Oct 2023 09:50:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=3/Hv815GUU/fuX7VWT988Bdp+kCcO+DlPNC5bXYdkbY=; b=5o
 18RN9ayOAIh8wPtoql7MzAuoX0gHmwKrI19F0f4OeoMyYQb32T6hEn6iHSmLIeoZ
 UYH34kzvwxIHG+LcyhrlZ/spgqWe9OTVx3uB/gFUSeBwcpH2GYZGtU8qbGH1GToP
 raC70KSjUhSU/bbmbm0TSdZ3jG0g9W+34iFCctUnDElQ9fia3Q1ToReudbGHx9a8
 EakmKOsovEJBskhZKbRRFCtMyl2TSX3Xtr8vySPewxveFQHHg7nl0Bm0hJ4gFFNs
 1KjaMkhDrLBpk2S9wx5hSlH9qlM96Mrkj/Tb7nNR/bAd6AUoopOSJwpOG4l1siTn
 otRbwD3Id9HUtiPdGfkg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3teb0xag60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Oct 2023 09:50:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CE05100057;
 Tue,  3 Oct 2023 09:50:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1526022A6E7;
 Tue,  3 Oct 2023 09:50:25 +0200 (CEST)
Received: from [10.201.20.35] (10.201.20.35) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 3 Oct
 2023 09:50:24 +0200
Message-ID: <2c812b4c-294b-d54e-172a-3dfc11fc71b4@foss.st.com>
Date: Tue, 3 Oct 2023 09:50:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Alain Volmat <alain.volmat@foss.st.com>, Andi Shyti
 <andi.shyti@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, M'boumba Cedric Madianga
 <cedric.madianga@gmail.com>, Wolfram Sang <wsa@kernel.org>
References: <20231002084211.1108940-1-alain.volmat@foss.st.com>
Content-Language: en-US
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20231002084211.1108940-1-alain.volmat@foss.st.com>
X-Originating-IP: [10.201.20.35]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_04,2023-10-02_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Fix PEC handling in case of
	SMBUS transfers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Alain,

Sounds good to me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 10/2/23 10:42, Alain Volmat wrote:
> The PECBYTE bit allows to generate (in case of write) or
> compute/compare the PEC byte (in case of read).  In case
> of reading a value (performed by first sending a write
> command, then followed by a read command) the PECBYTE should
> only be set before starting the read command and not before
> the first write command.
> 
> Fixes: 9e48155f6bfe ("i2c: i2c-stm32f7: Add initial SMBus protocols support")
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 579b30581725..0d3c9a041b56 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1059,9 +1059,10 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  	/* Configure PEC */
>  	if ((flags & I2C_CLIENT_PEC) && f7_msg->size != I2C_SMBUS_QUICK) {
>  		cr1 |= STM32F7_I2C_CR1_PECEN;
> -		cr2 |= STM32F7_I2C_CR2_PECBYTE;
> -		if (!f7_msg->read_write)
> +		if (!f7_msg->read_write) {
> +			cr2 |= STM32F7_I2C_CR2_PECBYTE;
>  			f7_msg->count++;
> +		}
>  	} else {
>  		cr1 &= ~STM32F7_I2C_CR1_PECEN;
>  		cr2 &= ~STM32F7_I2C_CR2_PECBYTE;
> @@ -1149,8 +1150,10 @@ static void stm32f7_i2c_smbus_rep_start(struct stm32f7_i2c_dev *i2c_dev)
>  	f7_msg->stop = true;
>  
>  	/* Add one byte for PEC if needed */
> -	if (cr1 & STM32F7_I2C_CR1_PECEN)
> +	if (cr1 & STM32F7_I2C_CR1_PECEN) {
> +		cr2 |= STM32F7_I2C_CR2_PECBYTE;
>  		f7_msg->count++;
> +	}
>  
>  	/* Set number of bytes to be transferred */
>  	cr2 &= ~(STM32F7_I2C_CR2_NBYTES_MASK);

-- 
--
~ Py MORDRET
--
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
