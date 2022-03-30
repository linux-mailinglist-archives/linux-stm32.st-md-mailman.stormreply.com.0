Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99D4EBEAF
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 12:25:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 903DDC60467;
	Wed, 30 Mar 2022 10:25:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5728C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 10:25:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id h16so11942890wmd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HIWpi/8D1djUzx7THE7n67oIfPKGmrvE/SwlU2lSkLA=;
 b=lUWULG+IN08a/hn4fiOqt6bNpyrGelQJQQY1CO+dbSwLUb9LqmiaxxfEyaUmS1WD1E
 6Jh9UUc1S9Faj6gbNsE1UGXowCMXW9fox/hH8ydwEozmwmjHofa2kmtOeViq1U77opI2
 vWjMN/479f4tpGR1N/HBWVWKoSWriXnn5aTNLupu48ytgHgQfKXB5xNZ6wMEw6E/rd2f
 tga/3YYw9x4s3e7bXWWAxkM0GhNB8rXBdc0zwV20vnf/aqnBi6V5jV5sUyOQnWEhRkAA
 gGWeg1S5vX7034R0tAt8JAAr98CdjhB+5x56eT4ZrVkfDpatE41YlX20jXiou0JSMMot
 gnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HIWpi/8D1djUzx7THE7n67oIfPKGmrvE/SwlU2lSkLA=;
 b=UT0XNkTMTDnzvPVY92uO8VASgqXTXQogU+n8Ix5dG/GO0YrsiWoK3GAoNTN/DKyYN6
 3NOxDVxfdm/1XDTyr+LjGVaZDFGkQeJ824k3HATW77XdQVnfNTOlh91wqRp+hbNqT8Jm
 vQc7rdlhAeS0v6wdLwWZDhac58kbU1nB/mcljWddTcp1Uy29WUXQPres50wroUN4ysyL
 Ket7JpcplZycHPo9lMyI5NxqvrRZZH6ySg7nW/M60K7rpYcWusEbJxXHEBSZOzxxqT80
 NUjpUmP35u2PqDar0l9cbdcEInPSToRuEiaefCB/vuxF2V0YiBD37yOFWUHKYUtUFRWU
 KeeA==
X-Gm-Message-State: AOAM533zESo2TlAJF2HxY44ZncUeF+s2v0UmkHqfF5D5sx93JqoVCGvd
 ympXJJRrlNKgUSBKLHr6eMtdnQ==
X-Google-Smtp-Source: ABdhPJyG1sVXUz6I5tf6C8RXiwYzb3kTwXz6SO1D1h3jIBPDn8sAoDtDK/poWTpvBTCo65fGctX0OA==
X-Received: by 2002:a05:600c:34c5:b0:38c:30e3:1e6c with SMTP id
 d5-20020a05600c34c500b0038c30e31e6cmr3824774wmq.144.1648635933279; 
 Wed, 30 Mar 2022 03:25:33 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 g10-20020a5d46ca000000b00203fd86e198sm16609627wrs.96.2022.03.30.03.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:25:32 -0700 (PDT)
Message-ID: <b59fd0f0-cedd-dc48-52bf-090358ce7786@linaro.org>
Date: Wed, 30 Mar 2022 11:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
 <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
 <20220329153114.GA58120@thinkpad>
 <71b10ce2-7b87-14d5-c8e4-3a4598c889e0@foss.st.com>
 <20220329173322.GC58120@thinkpad>
 <CACRpkdaiOhMGzuWPwoRLZ05HyM8BO_-cZt4TiAqAYQvDaJA-mA@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CACRpkdaiOhMGzuWPwoRLZ05HyM8BO_-cZt4TiAqAYQvDaJA-mA@mail.gmail.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Marek Vasut <marex@denx.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@dh-electronics.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: mmc: mmci: add a
 property to disable DMA LLI
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



On 29/03/2022 22:16, Linus Walleij wrote:
> On Tue, Mar 29, 2022 at 7:33 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
>> [Yann]
>>> As for Prabhakar's answer, the IDMA here is inside our IP, and not used in
>>> any other IP. So I'm not sure it is really relevant to move that to another
>>> dmaengine driver.
>>
>> Okay, I think this justification makes sense. I was worried of DMA IPs that get
>> sandwiched into many peripherals like the one on Renesas platforms. It turned
>> out that each subsystem has to add internal DMA support for it :/
> 
> That is a justified worry.
> 
> Qualcomm has "BAM DMA" (I think it is called?) which is added to each IP
> that needs DMA. drivers/mmc/host/mmci_qcom_dml.c
> It's for older Qualcomm platforms but I *think* it is actually not just used
> for the MMCI, just noone ever got around to adding it to any other
> peripheral? Srini do you know?

There are multiple instances of BAM (Bus access manager) on Qcom SoC, 
some of these instances are dedicated for each peripheral instance.
In this particular case we have 4 instances of BAM each of which are 
dedicated to 4 instances of SD Controllers.

BAM dmaengine is used across many Qualcomm peripheral drivers.

--srini

> 
> Yours,
> Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
