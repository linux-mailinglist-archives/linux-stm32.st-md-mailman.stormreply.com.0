Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAE2596C8
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Sep 2020 18:08:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCC45C36B26;
	Tue,  1 Sep 2020 16:08:51 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3DE9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Sep 2020 16:08:49 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s10so308963plp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Sep 2020 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XCC1MeRo0BRoasyj+5VGbw00gjoW3R7USmRQ2Ubh6Bk=;
 b=gGijq2cvjjnFqOBtVFVOUecKydlvZdUDmdEShkPQtQDERDF4peXrJgChqPs84f9ckP
 b9dFKbatiQXXJdwfBqjlgmu2mdiy6xjOhtUqfe0G/V909ePxhCpK9gRe5baQbfZehm7W
 zWVz+4iD1vAJFTJh9wRVk6cSj8CpV5DUfj4HOSOZl3tCOZN/4hdQVnjor8LnrINRnw6x
 TVVTz1PQ4v6wLqrpKv66juerPGmzJKRbdWniVq+0xnmFe3KXd9X3SA51YaCvc+0b4PAx
 9XqDu2Bg+nZ/EGO3CsDwVmCW9HcbyX07tAn62Vbkq6VX4JguDhyqh4E8aziGpxBusjyN
 xTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XCC1MeRo0BRoasyj+5VGbw00gjoW3R7USmRQ2Ubh6Bk=;
 b=udzti4UG9SYKKFOG00nkxys6WPgW20n/13LFp2tYr/0aEIneHtoGFm6IHNvWN9Wiuj
 KT4ygbYjTojo88omRP3Tt5kNBU7W+e2f8EPPq2UKFlNZxcqRmgvn+WJ+9RXOXVMlOHtJ
 XTB6DndGGYA1Tbm7huVsTIUoNY/6f7vMjE8LkNT9Nqr0/fHQN1FM7aCVneaadUZpDcIE
 IYwkBc8emY1uAPHUKF21ltd82ShgB3wBMzXu8F/YXtMa+bAFyM/Z5eJbImpCI/RvbBgD
 u0NCNm3wna+Thk6CHG5qlkgsrzNc+gDudpt9FyCn2Gb/uMj7+VQ1WJyX67jdAhjTqcmM
 vzog==
X-Gm-Message-State: AOAM532SyvTaEE7AGED2Fhm1kD07TYDnlM2yoxiee6YZ6LXP/CF9oh+X
 P13h26R1KDTHGi057NpBTTc=
X-Google-Smtp-Source: ABdhPJzMJlB1p6o9YUqwWsudQKNUJlMRUAuSiBfxFfepp8AQHGZU1/+/y1JGrTe2lZw+V7k8QgJFng==
X-Received: by 2002:a17:90b:4a07:: with SMTP id
 kk7mr2316459pjb.125.1598976527418; 
 Tue, 01 Sep 2020 09:08:47 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 d15sm2497723pfr.143.2020.09.01.09.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 09:08:46 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
References: <20200901152713.18629-1-krzk@kernel.org>
 <20200901152713.18629-4-krzk@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2fefe978-c91c-7c87-e342-32287c674a8f@gmail.com>
Date: Tue, 1 Sep 2020 09:08:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200901152713.18629-4-krzk@kernel.org>
Content-Language: en-US
Subject: Re: [Linux-stm32] [PATCH 04/11] spi: bcm2835: Simplify with
	dev_err_probe()
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



On 9/1/2020 8:27 AM, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
