Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AE45E81A5
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 20:16:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4D63C0D2C1;
	Fri, 23 Sep 2022 18:16:02 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53F27C03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 18:16:01 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id k10so1531891lfm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 11:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=oCR6Bo3A4ofjsJSPRwu8W/6xTMTPUToxbtx6duza/9I=;
 b=QTFH6A6ALvOnrxdBlLXWwrPn4QlREymvd6XMlcentLZ7h/3fide79fdoCHB5KTem71
 yp6pWhrM2z41mtYT5qLU1Bh2iz6CQHypAeyWgu+d26gmF+IBSGIswW9vQE8qWgJ374M4
 J/sKG8vfLGHmHmWMmL0qpwPd+e/Bj/iWmYCd/15aKADo++tGMLkwakMCAyWOepF0i+ri
 dgeTUxMR2PMwWHVfXToHcEn+O+6EOAZsDDngC6NZ/U5fhtxvtdPZuOdXrK0VhBLVtBA2
 3FBSeqMz0DB1naWCCiR7W8HX0k883wfgPGcd/oly/dmRrF0ooaifWb7Sstlh8ULCJj1C
 B7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=oCR6Bo3A4ofjsJSPRwu8W/6xTMTPUToxbtx6duza/9I=;
 b=OH1E9vam0V/CYAwFja7DU/GLXBx31VmJq6yEJbrSbrD12Y0y0qTHr7cZrSGCqNB+xX
 NcPGEosikw9HkSAz7sZU2/tr3eAdaWrzmf9KV1i3prj1N1wwwELaWIZPpYielEN5LKAm
 xYUDVuDmaeaG+Pq1Mo5VjsGM/CTdT0LmdjTuqNTYJNvhIiKtAF+OCfA30YJbXGB1CU4s
 +NUiWlRdWfXye0j58a6CEBk5OqYIze/ZcxPR0Rtv4EYPsxpxDCTWqVbwOKPqlAHA/NFT
 M1Z5pQvuAF76wxZ3ySWs7r30Ab8AifTDUXniZvtklGmMGITnyYZ3L9VqgnEJBrf8L4Wp
 RQYg==
X-Gm-Message-State: ACrzQf28deQpbn/a0G1nxSEa6VOk2Vre/jh/A/Y0vE7G283MYY7uHBx7
 Kjy7+vZkWJ4m5fJulNnpEIJK1Q==
X-Google-Smtp-Source: AMsMyM5VPQHR6EgWnlQIIyiIzzfK4PFaph4377Xhq50FxdoZgzoCfLawcTAmFyxngXUm5xjobVChzg==
X-Received: by 2002:a05:6512:3295:b0:497:a156:795a with SMTP id
 p21-20020a056512329500b00497a156795amr3537914lfe.345.1663956960760; 
 Fri, 23 Sep 2022 11:16:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 j5-20020a2e6e05000000b0026c59d3f557sm1487798ljc.33.2022.09.23.11.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 11:16:00 -0700 (PDT)
Message-ID: <4f205f0d-420d-8f51-ad26-0c2475c0decd@linaro.org>
Date: Fri, 23 Sep 2022 20:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
 <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
In-Reply-To: <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
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

On 23/09/2022 20:14, Krzysztof Kozlowski wrote:
>> This is going to break MT2712e on old devicetrees.
>>
>> The right way of doing that is to check the return value of of_property_read_u32()
>> for "snps,clk-csr": if the property is not found, fall back to the old "clk_csr".
> 
> I must admit - I don't care. That's the effect when submitter bypasses
> DT bindings review (81311c03ab4d ("net: ethernet: stmmac: add management
> of clk_csr property")).
> 
> If anyone wants ABI, please document the properties.
> 
> If out-of-tree users complain, please upstream your DTS or do not use
> undocumented features...
> 

OTOH, as Angelo pointed out, handling old and new properties is quite
easy to achieve, so... :)

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
