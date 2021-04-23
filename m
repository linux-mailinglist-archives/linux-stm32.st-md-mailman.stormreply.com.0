Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7D3691B4
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Apr 2021 14:03:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE50DC57B54;
	Fri, 23 Apr 2021 12:03:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 464B2C57195
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 12:03:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NC24LM015246; Fri, 23 Apr 2021 14:02:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WD96ZYftirjps1b7STHm3D8G2o7VrvWXKlGU+slnDzA=;
 b=QWSIQn0rA70SBTvEpG87q+vOwzUeAmH0wACwXjBG3/R2Ea0L/S54z06W3ZrQE0GlJCtS
 uqJWHodePUjdqSpzSc5/0t67nZ7z8s7QCbF18/ckwlqbPnOkGDlIHxrl0W0eYeov4sSR
 pUMUHufdMwNomVUk9LoimzsgObDivNC+RLBEs2JNi0J8xHc5CRRajqQ7FcgFMqfRnIBk
 k7QCXQI/VufY5LZCZKc58r1ujSXOPoZzepuaWmD/6trAwoUm8er4L+ZHMHz8rKQ5HQbP
 /aBJKbujf2Bt9TqoH/V2+0FuMUvNVZsRMvn67HF0OB8exABPzj9kTrMGuYwvYWsHNJdt nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3836fcqekv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 14:02:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FD7A10002A;
 Fri, 23 Apr 2021 14:02:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E926229DBC;
 Fri, 23 Apr 2021 14:02:40 +0200 (CEST)
Received: from [10.48.0.224] (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Apr
 2021 14:02:39 +0200
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@st.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Boris Brezillon <bbrezillon@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20210423101815.119341-1-krzysztof.kozlowski@canonical.com>
From: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <86a216db-b9b7-da45-ab74-a32538da6e00@foss.st.com>
Date: Fri, 23 Apr 2021 14:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20210423101815.119341-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_04:2021-04-23,
 2021-04-23 signatures=0
Subject: Re: [Linux-stm32] [PATCH 1/2] memory: stm32-fmc2-ebi: add missing
 of_node_put for loop iteration
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

Hi Krzysztof,

On 4/23/21 12:18 PM, Krzysztof Kozlowski wrote:
> Early exits from for_each_available_child_of_node() should decrement the
> node reference counter.  Reported by Coccinelle:
> 
>    drivers/memory/stm32-fmc2-ebi.c:1046:1-33: WARNING:
>      Function "for_each_available_child_of_node" should have of_node_put() before return around line 1051.
> 
> Fixes: 66b8173a197f ("memory: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/memory/stm32-fmc2-ebi.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
> index 4d5758c419c5..ffec26a99313 100644
> --- a/drivers/memory/stm32-fmc2-ebi.c
> +++ b/drivers/memory/stm32-fmc2-ebi.c
> @@ -1048,16 +1048,19 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
>   		if (ret) {
>   			dev_err(dev, "could not retrieve reg property: %d\n",
>   				ret);
> +			of_node_put(child);
>   			return ret;
>   		}
>   
>   		if (bank >= FMC2_MAX_BANKS) {
>   			dev_err(dev, "invalid reg value: %d\n", bank);
> +			of_node_put(child);
>   			return -EINVAL;
>   		}
>   
>   		if (ebi->bank_assigned & BIT(bank)) {
>   			dev_err(dev, "bank already assigned: %d\n", bank);
> +			of_node_put(child);
>   			return -EINVAL;
>   		}
>   
> @@ -1066,6 +1069,7 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
>   			if (ret) {
>   				dev_err(dev, "setup chip select %d failed: %d\n",
>   					bank, ret);
> +				of_node_put(child);
>   				return ret;
>   			}
>   		}
>

Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>

Regards,
Christophe Kerello.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
