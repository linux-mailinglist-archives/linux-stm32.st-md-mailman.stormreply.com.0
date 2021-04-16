Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1436247A
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 17:53:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE6C5C57B79;
	Fri, 16 Apr 2021 15:53:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6667C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 15:53:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFbugM017081; Fri, 16 Apr 2021 17:52:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WZGwdTXw15LpdfwZttz+Ac4D8BUSBjoH6Vd+2D7iLnY=;
 b=wm0fx4MDGYw//NCJ8CmLYgOHWPxQVmzrGumXlnDutw90Yv8fDRl7e2gEYGXrjfHAJNJl
 Pl44WsqT8pwG2oa2n5N1XI4X7vMj98Sx/O/kf+sckZh1EwEhxpv/Mpofx1QVJBQKqjAR
 88xYwdTrdfh3v1+BRq2vzvSSh/O9jIIIICv+4zfOrdp943QKcIfWDHy8oV+I9wFsjVrx
 4/SzXUSm6A+Ew+t671EhVypFFstOu2SrTxU66BXfhTRd2B64UClQw0o4IOxS0LtfXpRo
 JzTEuEy3cHKWAgMiwdheiDiM8thirPKzmgUsZ8h7M+03vq1YL0iy0G3aFGYmvG6Q7Wc7 fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xm4jrdgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 17:52:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C801710002A;
 Fri, 16 Apr 2021 17:52:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A25C125D00A;
 Fri, 16 Apr 2021 17:52:52 +0200 (CEST)
Received: from [10.211.14.227] (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 17:52:44 +0200
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-5-alexandre.torgue@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <bd85bd41-d899-7e7a-1878-35301a267eb9@foss.st.com>
Date: Fri, 16 Apr 2021 17:52:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210415101037.1465-5-alexandre.torgue@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/13] dt-bindings: mfd: stm32-timers:
 remove #address/size cells from required properties
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

On 4/15/21 12:10 PM, Alexandre Torgue wrote:
> address-cells and size-cells can't be declared as "required" properties
> as they are not needed if subnodes don't have a "reg" entry.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> index 0f16c8864a87..dace35362a7a 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml

Hi Alexandre,

Not sure if this matters: patches 3 and 4 could be swapped in the
series. Apart from that:

Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice
> @@ -119,8 +119,6 @@ patternProperties:
>        - compatible
>  
>  required:
> -  - "#address-cells"
> -  - "#size-cells"
>    - compatible
>    - reg
>    - clocks
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
