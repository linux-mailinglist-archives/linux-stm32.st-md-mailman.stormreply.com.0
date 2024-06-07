Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAE3900448
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 15:01:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2C56C7129F;
	Fri,  7 Jun 2024 13:01:37 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B012C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 13:01:30 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45791XeZ002121;
 Fri, 7 Jun 2024 15:01:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=izTn309sBFxMIU+38BZ1YgRh
 qdX8pwOMf5KwVszBqGY=; b=OKXB9OeCkTNLxMNMr6nGEpjOz1tA6NpESPVVdPE/
 PfAU0R8U0g0/G+oVZtUCUjqQ0Ybr39G1T/QqYXvMrF18IytWc6uqafs03+oluFd7
 FY7Q3Q5rP7GrJJSOf0HHv8SYt0P+AOeuzA0pXuDSHn7M719M5yO8aEO/IGSJcavd
 vcmKfxo2DnK3W9NstUAaZLjX7nE0Rr6GfYVvGaAjsf98Cbg7dHcuV6D8WK4IyMV2
 C9TRGsLM7F01qvNzWn2smrZhKUFw5HYgI8c4h1tWObN4Ucv31s7j92kxSZVuxI4J
 DnnVHP2BKJFvKOX19uc+w4P9Rs6VZgDOoKtbwaATHriWfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ygekj91uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2024 15:01:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1E53A40045;
 Fri,  7 Jun 2024 15:00:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0496D21A214;
 Fri,  7 Jun 2024 14:59:43 +0200 (CEST)
Received: from [10.252.19.205] (10.252.19.205) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 14:59:39 +0200
Message-ID: <c3e21cbf-bf9e-45d5-b6eb-f1f4d50e39a3@foss.st.com>
Date: Fri, 7 Jun 2024 14:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-9-christophe.roullier@foss.st.com>
 <6f44537a-3d60-46f5-a159-919cc2a144ec@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <6f44537a-3d60-46f5-a159-919cc2a144ec@denx.de>
X-Originating-IP: [10.252.19.205]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_07,2024-06-06_02,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 08/12] net: stmmac: dwmac-stm32: add
 management of stm32mp13 for stm32
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
Content-Type: multipart/mixed; boundary="===============1578479069632068998=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1578479069632068998==
Content-Type: multipart/alternative;
	boundary="------------T1wJ9k0U0JeEbz6CeDymi0bT"
Content-Language: en-US

--------------T1wJ9k0U0JeEbz6CeDymi0bT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 6/7/24 14:48, Marek Vasut wrote:
> On 6/7/24 11:57 AM, Christophe Roullier wrote:
>
> [...]
>
>> @@ -224,11 +225,18 @@ static int stm32mp1_configure_pmcr(struct 
>> plat_stmmacenet_data *plat_dat)
>>   {
>>       struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
>>       u32 reg = dwmac->mode_reg;
>> -    int val;
>> +    int val = 0;
>
> Is the initialization really needed ? It seems the switch-case below 
> does always initialize $val .

Yes it is needed otherwise:

>> drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c:239:4: warning: variable 'val' is uninitialized when used here [-Wuninitialized]

val |= SYSCFG_PMCR_ETH_SEL_MII;
                            ^~~
    drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c:228:9: note: initialize the variable 'val' to silence this warning
            int val;

>
>>       switch (plat_dat->mac_interface) {
>>       case PHY_INTERFACE_MODE_MII:
>> -        val = SYSCFG_PMCR_ETH_SEL_MII;
>> +        /*
>> +         * STM32MP15xx supports both MII and GMII, STM32MP13xx MII 
>> only.
>> +         * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
>> +         * acts as a selector between 0:GMII and 1:MII. As STM32MP13xx
>> +         * supports only MII, ETH_SELMII is not present.
>> +         */
>> +        if (!dwmac->ops->is_mp13)  /* Select MII mode on STM32MP15xx */
>> +            val |= SYSCFG_PMCR_ETH_SEL_MII;
>>           break;
>>       case PHY_INTERFACE_MODE_GMII:
>>           val = SYSCFG_PMCR_ETH_SEL_GMII;
>
> [...]
>
> This way of adding MP13 support definitely looks much better.
>
> Also, split the series, drivers/ stuff for netdev (and make sure to 
> include the net-next patch prefix , git send-email 
> --subject-prefix="net-next,PATCH") , DTs for linux-arm-kernel , config 
> patch also for linux-arm-kernel .
--------------T1wJ9k0U0JeEbz6CeDymi0bT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/7/24 14:48, Marek Vasut wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6f44537a-3d60-46f5-a159-919cc2a144ec@denx.de">On 6/7/24
      11:57 AM, Christophe Roullier wrote:
      <br>
      <br>
      [...]
      <br>
      <br>
      <blockquote type="cite">@@ -224,11 +225,18 @@ static int
        stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
        <br>
          {
        <br>
              struct stm32_dwmac *dwmac = plat_dat-&gt;bsp_priv;
        <br>
              u32 reg = dwmac-&gt;mode_reg;
        <br>
        -    int val;
        <br>
        +    int val = 0;
        <br>
      </blockquote>
      <br>
      Is the initialization really needed ? It seems the switch-case
      below does always initialize $val .
      <br>
    </blockquote>
    <p>Yes it is needed otherwise:</p>
    <pre class="moz-quote-pre" wrap=""></pre>
    <blockquote type="cite" style="color: #007cff;">
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c:239:4: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
</pre>
      </blockquote>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">val |= SYSCFG_PMCR_ETH_SEL_MII;
                           ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c:228:9: note: initialize the variable 'val' to silence this warning
           int val;</pre>
    <p></p>
    <blockquote type="cite"
      cite="mid:6f44537a-3d60-46f5-a159-919cc2a144ec@denx.de">
      <br>
      <blockquote type="cite">      switch (plat_dat-&gt;mac_interface)
        {
        <br>
              case PHY_INTERFACE_MODE_MII:
        <br>
        -        val = SYSCFG_PMCR_ETH_SEL_MII;
        <br>
        +        /*
        <br>
        +         * STM32MP15xx supports both MII and GMII, STM32MP13xx
        MII only.
        <br>
        +         * SYSCFG_PMCSETR ETH_SELMII is present only on
        STM32MP15xx and
        <br>
        +         * acts as a selector between 0:GMII and 1:MII. As
        STM32MP13xx
        <br>
        +         * supports only MII, ETH_SELMII is not present.
        <br>
        +         */
        <br>
        +        if (!dwmac-&gt;ops-&gt;is_mp13)  /* Select MII mode on
        STM32MP15xx */
        <br>
        +            val |= SYSCFG_PMCR_ETH_SEL_MII;
        <br>
                  break;
        <br>
              case PHY_INTERFACE_MODE_GMII:
        <br>
                  val = SYSCFG_PMCR_ETH_SEL_GMII;
        <br>
      </blockquote>
      <br>
      [...]
      <br>
      <br>
      This way of adding MP13 support definitely looks much better.
      <br>
      <br>
      Also, split the series, drivers/ stuff for netdev (and make sure
      to include the net-next patch prefix , git send-email
      --subject-prefix="net-next,PATCH") , DTs for linux-arm-kernel ,
      config patch also for linux-arm-kernel .
      <br>
    </blockquote>
  </body>
</html>

--------------T1wJ9k0U0JeEbz6CeDymi0bT--

--===============1578479069632068998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1578479069632068998==--
