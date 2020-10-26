Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD4E29881C
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 09:12:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B2CFC36B37;
	Mon, 26 Oct 2020 08:12:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50852C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 08:12:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09Q8BiPj030048; Mon, 26 Oct 2020 09:12:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IJtekzXmv9vxatMxkzleF5Mc4SjVvGCd4JV42MjXd1s=;
 b=lBfFwwFq8lydzld/V0z0+73qjeH43FVB82XfKUjag/S610ajGRlb0/lb9RJughCs2khu
 4deVm9PxoBOnVNcuPq1TUQzMAwUCwbO016alB/eBjTRCUOKym0CFSWIyYXIEW2UiR+LU
 0qJBkVqxouP68KY61q+i7brvrrThZmvkNi/s84tgEyQ/gQC9PsgYw6MtOtgHWJcRkC3L
 NF5cQu85xmBNL5GAdYGS4WEucn+6cgEE0i7lB4x5+3Nqr8iZz9rHH/zvl6R0lyVDXqPH
 0BMWYouUwAtndXE9fTsoyo6HGarM6r1WI1S+d/si6rVcKixshzMEHHG5q5TlyefUwKuQ rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccmqk1kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 09:12:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8879100034;
 Mon, 26 Oct 2020 09:12:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9CF22ADA16;
 Mon, 26 Oct 2020 09:12:26 +0100 (CET)
Received: from SFHDAG1NODE3.st.com (10.75.127.3) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct
 2020 09:12:26 +0100
Received: from SFHDAG1NODE3.st.com ([fe80::ad8b:a44d:504a:670d]) by
 SFHDAG1NODE3.st.com ([fe80::ad8b:a44d:504a:670d%20]) with mapi id
 15.00.1473.003; Mon, 26 Oct 2020 09:12:26 +0100
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Martin Kaiser <martin@kaiser.cx>, Jassi Brar <jassisinghbrar@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>
Thread-Topic: [PATCH 2/2] mailbox: stm32-ipcc: remove duplicate error message
Thread-Index: AQHWqgodECjhJ37krEyKtF2uVISUUampepkA
Date: Mon, 26 Oct 2020 08:12:26 +0000
Message-ID: <fc47f0cd-ebbf-8093-6197-43e98e7ffc73@st.com>
References: <20201024133154.22767-1-martin@kaiser.cx>
 <20201024133154.22767-2-martin@kaiser.cx>
In-Reply-To: <20201024133154.22767-2-martin@kaiser.cx>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <2E3CF5225217A24BA58D4A4D273B94B5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_04:2020-10-26,
 2020-10-26 signatures=0
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] mailbox: stm32-ipcc: remove duplicate
	error message
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

Hi Martin


Thank you for the patch

On 24/10/2020 3:31 pm, Martin Kaiser wrote:
> platform_get_irq_byname already prints an error message if the requested irq
> was not found. Don't print another message in the driver.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>


Reviewed-by: Fabien Dessenne <fabien.dessenne@st.com>


> ---
>   drivers/mailbox/stm32-ipcc.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
> index ef966887aa15..ab8fe56af948 100644
> --- a/drivers/mailbox/stm32-ipcc.c
> +++ b/drivers/mailbox/stm32-ipcc.c
> @@ -257,9 +257,6 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
>   	for (i = 0; i < IPCC_IRQ_NUM; i++) {
>   		ipcc->irqs[i] = platform_get_irq_byname(pdev, irq_name[i]);
>   		if (ipcc->irqs[i] < 0) {
> -			if (ipcc->irqs[i] != -EPROBE_DEFER)
> -				dev_err(dev, "no IRQ specified %s\n",
> -					irq_name[i]);
>   			ret = ipcc->irqs[i];
>   			goto err_clk;
>   		}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
