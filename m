Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB43E6940F8
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Feb 2023 10:25:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8060FC03FC1;
	Mon, 13 Feb 2023 09:25:30 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 939C3C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 09:25:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y1so11417498wru.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 01:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xSldNry3NWzuJ0zp8Ypcr2h0zI4yvHSm7LEOUZUqMKw=;
 b=OQ5yMzSQ7q+ZY08Q8rg+9cPVvhvYSSpp/vgo+xhT/XLgxQ/r+zI7EO5vb9rcYSCQSt
 mbwcinxALpM0bjyKNRslIzyCJ/W5VfVvQePr6ntDxS2Czpnc4xSvuNK9evWMsL6kgOG5
 7XNEk1Sax2GzoIzMCkBFUhHPPFJzmx6HozvsrAnDkRYfTF6EbjNFKjXCtUwpJgWpyfSA
 0AALWPB3KjKEnbaJ6qHbUeDasMdAKurhOD0sebSQpuEru2s4c1AEk1NpF3Si+vrZpTYh
 x5XIeTK4Gopo5SoJnGBLlxFVsw9oDMeTgid+4sYvjUT1YE2LPQh3iohtL7skakEG52eX
 m1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xSldNry3NWzuJ0zp8Ypcr2h0zI4yvHSm7LEOUZUqMKw=;
 b=1yMFbeyB/Pnmwu75xr5iX4bKR53VFcARjKA/YaN7xQ+6m2cKBD2os3H2JBhmvgSHdL
 mETMBFYwXQjT1U+nFMMTzokc48KgA60ANuYfrwV5fyhgX53HiXxGwEgjK+HkYaIqxtWB
 B6cSxY6fciooqD958U/a8RZLCTxuVlo70xKmSTOs9IWYNAfdP9CJgjkj6d3BHkr/Lo94
 KrWWJpWLhmeSfjf6VW67VCc3Rg2W96hUYQFpFpfqseeo2luCTqS2Q3+Y4bCzRcmAJZQp
 IMaz8WqPAaERnIlNhNM5vUqqTK3ZoQ0tmn0/fQmA2KS9fkBHK2Qt10svIehsTJzYyjX7
 y29w==
X-Gm-Message-State: AO0yUKVED5gUqqwPpX3Uim1dfYarlcH+xK5OpKE8z2k7DBOO8Yh4/T6U
 0DdhF6bNjRraORO9K7Tg5UrrGQ==
X-Google-Smtp-Source: AK7set9ZqU8XLcewYFcYk+YS1UR5EMjdCdUAe+0yn67Ao2gAARnvEvunO2pnpdKZ5aph1W8194djhw==
X-Received: by 2002:a05:6000:147:b0:2c5:3cd2:b8e with SMTP id
 r7-20020a056000014700b002c53cd20b8emr10262827wrx.1.1676280329198; 
 Mon, 13 Feb 2023 01:25:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d5409000000b002c558228b6dsm2670211wrv.12.2023.02.13.01.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:25:28 -0800 (PST)
Message-ID: <5e7cf78c-9402-1b27-6a19-8326fe5c8e18@linaro.org>
Date: Mon, 13 Feb 2023 10:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/12] dt-bindings: net: Add StarFive
	JH7100 SoC
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

On 11/02/2023 04:18, Cristian Ciocaltea wrote:
> Add DT bindings documentation for the Synopsys DesignWare MAC found on
> the StarFive JH7100 SoC.
> 
> Adjust 'reset' and 'reset-names' properties to allow using 'ahb' instead
> of the 'stmmaceth' reset signal, as required by JH7100.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  15 ++-
>  .../bindings/net/starfive,jh7100-dwmac.yaml   | 106 ++++++++++++++++++


FYI, there is conflicting work:

https://lore.kernel.org/all/20230118061701.30047-5-yanhong.wang@starfivetech.com/

It's almost the same, thus this should be dropped.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
