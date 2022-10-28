Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F75611624
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 17:40:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59529C640F9;
	Fri, 28 Oct 2022 15:40:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D7ECC0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 15:40:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SDUEtq006872;
 Fri, 28 Oct 2022 17:40:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NbSB6f9Ybohoa8sO7EshRv4xTh4x+pWRCcytboWIs/k=;
 b=pgoR/CsMI+tvg2md6eHJrB6jO6zrERgJg2N2jHt0sU1Z5pBoN3lBYLSbnB7Z/ePsMPOq
 p0lMnbv3WW7qzfqbTJ6QNtHXoLhzgufALSiXTG4XCj/u0vN+tG3ap8BDhMKwa1OMdhZM
 fApaV1qjCXw+jlVJtZzaFAnrTAWtoI9Cz6jK2aGxkvy1KCbKBrZNUrqFYsjo8xsfnSrS
 wpWHzjwKExqrCL7kOR4wAF7DLU3bIorcknYrxXICGA2HcUTphJWmew7/zdQkSiYHS4pg
 EHgBiad629AVF4n4zye3L1pry7665iN2jhMTIXD/3+UaHQg0KxN71IDOfZ0obYVtR0Wv 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kfajfdsyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 17:40:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C618F10002A;
 Fri, 28 Oct 2022 17:40:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1E60229A8C;
 Fri, 28 Oct 2022 17:40:00 +0200 (CEST)
Received: from [10.252.12.236] (10.252.12.236) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 17:39:57 +0200
Message-ID: <5cb2f55d-dfb1-7481-1907-007db8d25448@foss.st.com>
Date: Fri, 28 Oct 2022 17:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Alexandre TORGUE
 <alexandre.torgue@foss.st.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20221028145252.2115933-1-patrick.delaunay@foss.st.com>
 <20221028165150.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20221028165150.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
X-Originating-IP: [10.252.12.236]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
Cc: Rob Herring <robh@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: nvmem: add new stm32mp13
 compatible for stm32-romem
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

On 10/28/22 16:52, Patrick Delaunay wrote:
> Add a new compatible for stm32mp13 support.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Hi Patrick,

You can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> ---
> This patch is already sent separately in:
> https://lore.kernel.org/all/20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid/
> https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=685403
> 
> I create a serie for more efficient review.
> 
> Patrick.
> 
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> index 448a2678dc62..16f4cad2fa55 100644
> --- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> @@ -22,6 +22,7 @@ properties:
>    compatible:
>      enum:
>        - st,stm32f4-otp
> +      - st,stm32mp13-bsec
>        - st,stm32mp15-bsec
>  
>    reg:
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
