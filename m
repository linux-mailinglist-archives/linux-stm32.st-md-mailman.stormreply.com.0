Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C429EA90
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 12:32:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 846A3C3FAD5;
	Thu, 29 Oct 2020 11:32:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EA11C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 11:32:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TBT2ho015110; Thu, 29 Oct 2020 12:32:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=cUDfsyMLBZwwHgRqMnfVV+OV2A2kx7Khz7i3EBjHkbU=;
 b=wuuikyCXCb0PXaWjYUO3rOJWAzLt+3HLpfrGoYCkB5OrrjS798C/bleMZax2DAAoTNDN
 Topy5pDO3+uRmTsKYW5AWQpn9BKIYPq9EX8dzWRJ6hsqdeYT3MYW43DfXkyUX8stvk2h
 GthdhhIF+Jwf8PpE31HHBOdzrAHZm0kwZDZktdyUcJjZ+XCp7KQfZShJJkr41ngFnQMk
 yFyxsitQ5WNN7TXRSafPk0wYkyZ/SqBaPcs831/BXvKc4PmMn6hDMAblmB2JvDwc11nF
 GMV46Mq+gwV+tzI8tbekj6sUAZF3SuHKKznxQcoEtxwsPqFTxVrBGuiwkWB+71GOxsyH OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccf3yw6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 12:32:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39B90100034;
 Thu, 29 Oct 2020 12:32:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1598D2823BF;
 Thu, 29 Oct 2020 12:32:10 +0100 (CET)
Received: from [10.48.1.149] (10.75.127.47) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 12:31:55 +0100
To: Coiby Xu <coiby.xu@gmail.com>, <linux-i2c@vger.kernel.org>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
 <20201029074654.227263-5-coiby.xu@gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <699f4908-1ea1-6075-3375-7f1dfc6fb225@st.com>
Date: Thu, 29 Oct 2020 12:31:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029074654.227263-5-coiby.xu@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_06:2020-10-29,
 2020-10-29 signatures=0
Cc: open list <linux-kernel@vger.kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Alain VOLMAT <alain.volmat@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 5/5] i2c: stm32: remove unnecessary
	CONFIG_PM_SLEEP
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

On 10/29/20 8:46 AM, Coiby Xu wrote:
> SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index f41f51a176a1..95ac9dfdf458 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2262,7 +2262,6 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP

Hi Coiby,

This generates warnings when building with W=1 and CONFIG_PM_SLEEP=n.
Could you please add also "__maybe_unused" for relevant routines below ?

>  static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
             ^
e.g. insert: __maybe_unused

Best regards,
Fabrice
>  {
>  	int ret;
> @@ -2356,7 +2355,6 @@ static int stm32f7_i2c_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
>  	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
