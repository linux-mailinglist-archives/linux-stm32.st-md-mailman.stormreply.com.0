Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0786D5E8199
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 20:14:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7CC6C04004;
	Fri, 23 Sep 2022 18:14:11 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8BB2C03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 18:14:09 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id l12so924481ljg.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=oMvGRyf6B1xSW6jldiB/4L2hCW2oiTVar6DgwfxZevA=;
 b=joMXbDUN23NrSPuFVRuQxyZ18+85jHWvFlgB5rHkyQB6MuTQv+11Blst3Emk2PKY+n
 nQnCehdvxQMvsQA4btPpAyPP7A2rskO/wpWNTd326VLi8qNLiaxtGTsbjoX+ObpiCpJm
 J0XwvrZycGuZOZVovoupWtzvwrgXa8V/+Stgj+L2zVD5+vIf8S8/dQGNT4ECX7/na9dK
 5ZrHOBzj5+T0zFen0C0YlgJjDGjqrrYvSllJnoBgLL1qLQEjpVVCO3efy9H6SOOqBcm7
 TV+wstyMe4wWuqQKw6QpkQHV2tLOj0lk3tSZefrxu3+P5luZKiLRGS3ChfdurG1sEBAZ
 2YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=oMvGRyf6B1xSW6jldiB/4L2hCW2oiTVar6DgwfxZevA=;
 b=KbdX6KisoYx/UOmSgGmb9XpZFGETyEl36rgB7v5/MUqnhEKHp45JckN0Yrf7VVNBpR
 KLRbjvKD+ETA5H1M3Dw4G5H3nq9p1Z9zLQ3Y82vFSW3OFoyT0n1z+SY85pCnCGjntD0I
 Mas2vlXAvRs8Nr6uAw6nLBoSQ2pytYXIKsKxjVGsuaspobf4zBSGxLcAnwevMNsUvHHa
 LbZZmjQ5rSTUj6fTUPqh2MN4mgI9x6l6FYJ7RYclmMxFOJqbjKyOVYywMoxsXOvTinmb
 ueocRPTLwmFuXo4Lv+ZUI8SIESfGMAfJdRC37lQh8OKajn1uXJrzDY4jHwwiPkRD+spx
 MZpg==
X-Gm-Message-State: ACrzQf0+kGGE+/qmHio48rcq8/X6XYI1gM2+vA8opJH3HbVRxUSjB0vG
 tlW2rlwNLijgLPdPa6NyNvzRUg==
X-Google-Smtp-Source: AMsMyM6ZNkXX2AkLZWL390O0wf6Nou5HbOXvCjEuUZ/Qb6dNDl3VBmNR01p6Z/h5HcJXrDEEqprZhA==
X-Received: by 2002:a05:651c:19a6:b0:26c:4a66:aa42 with SMTP id
 bx38-20020a05651c19a600b0026c4a66aa42mr3624111ljb.231.1663956849278; 
 Fri, 23 Sep 2022 11:14:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056512368800b004a0526b11ffsm415225lfs.133.2022.09.23.11.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 11:14:08 -0700 (PDT)
Message-ID: <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
Date: Fri, 23 Sep 2022 20:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] net: stmmac: Update the name of
	property 'clk_csr'
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

On 23/09/2022 11:10, AngeloGioacchino Del Regno wrote:
> Il 23/09/22 07:28, Jianguo Zhang ha scritto:
>> Update the name of property 'clk_csr' as 'snps,clk-csr' to align with
>> the property name in the binding file.
>>
>> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index 9f5cac4000da..18f9952d667f 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -444,7 +444,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>   	 * or get clk_csr from device tree.
>>   	 */
>>   	plat->clk_csr = -1;
>> -	of_property_read_u32(np, "clk_csr", &plat->clk_csr);
>> +	of_property_read_u32(np, "snps,clk-csr", &plat->clk_csr);
> 
> This is going to break MT2712e on old devicetrees.
> 
> The right way of doing that is to check the return value of of_property_read_u32()
> for "snps,clk-csr": if the property is not found, fall back to the old "clk_csr".

I must admit - I don't care. That's the effect when submitter bypasses
DT bindings review (81311c03ab4d ("net: ethernet: stmmac: add management
of clk_csr property")).

If anyone wants ABI, please document the properties.

If out-of-tree users complain, please upstream your DTS or do not use
undocumented features...

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
