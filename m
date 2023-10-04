Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B77B8DBF
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 22:00:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BCCFC6C831;
	Wed,  4 Oct 2023 20:00:11 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45C87C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 20:00:09 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1c723f1c80fso1229415ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Oct 2023 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696449608; x=1697054408;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ap9v2/olcKGyDJBva73j5fNeLRwk/nHTTkPfYp92Z2w=;
 b=UXi1gyIsbzRnBF70b8Y3Ltr3rm1W4vppf27086gv5lV5JveqYJChaCHXI2zkxz5tyv
 xmJIlLln9upFZEGxhBhYpqwiJtVt7uRUL2aKF5/gHKbEAKMvppw+xQDfB6Dsdi0dGd8o
 IjjI2KkM4znLr1depm9yPi7lw9ir1Cj4FQyca4bih/+6zmikJ0ie4/fWl6XmmhUERs+C
 bkpZy3otzDyiBG4hofvesIWBwBKQMlNN4z3QfGuKw6nAjs8nSTpRl4tO/oNEDWggwEBI
 7vIPhq8mBnngG/AoT4J6u9JyZ74ibwu0ZnHaDpDYY/cKB89/tH1PnnJsYPQ22Ot6cFe2
 wDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696449608; x=1697054408;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ap9v2/olcKGyDJBva73j5fNeLRwk/nHTTkPfYp92Z2w=;
 b=Kg6a9THKKe8uDBs4sjisS+rpauoNqVHSzd2D1BC3lBpogdThlDCXG6jIRSp2FIYBLQ
 6fOtUy+nNKHVn7F96h+fcfgVIbU51bGOph67gBvB6tSe8hqR5nGe6vwRddbKoKg3jKn8
 4fuQjuSoN7cC98ANS/CKmhfbvUI32cP2YRI3Es8BQ1o4u0zVZJtuNBffMS0uczcrIcLD
 zPtqVZcahELL0KwQD9j1CbIxvVdq//hfqEusxW8F/lOK0sGfDuunSxvaUmoS/WR/tyCc
 9q1mug7zVlh52JL4oxtHtxrDxT/bh6qvlWTKwKE2AU8eIbVIlpdMacaLxB6sROvKp8vN
 +OlA==
X-Gm-Message-State: AOJu0Yzgd5S3KdN04mGKR6JiEQA0wihFEqAXhKaAFD1by/6pVrdJ3+Sq
 tBw6tXx0pjCwbuVzHx02zJ8=
X-Google-Smtp-Source: AGHT+IHYC4jt43Gfku5aZSNDpR07NTDay27HY62vg6gt6GiG9D1S0+ovBRiEpFsdKaryVQlPB403FA==
X-Received: by 2002:a17:902:db04:b0:1c6:2acc:62f3 with SMTP id
 m4-20020a170902db0400b001c62acc62f3mr4249797plx.9.1696449607653; 
 Wed, 04 Oct 2023 13:00:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 d1-20020a170902b70100b001c5de06f13bsm4113787pls.226.2023.10.04.13.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 13:00:07 -0700 (PDT)
Message-ID: <643c55ca-4eca-4dfc-9176-cf46c2504057@gmail.com>
Date: Wed, 4 Oct 2023 13:00:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20231004195442.414766-1-shenwei.wang@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20231004195442.414766-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-imx: request high
	frequency mode
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

On 10/4/23 12:54, Shenwei Wang wrote:
> Some i.MX SoCs like the i.mx8mq support adjusting the frequency of the
> DDR, AHB, and AXI buses based on system loading. If the dwmac interface
> in the driver does not request a HIGH frequency, it can significantly
> degrade performance when the system switches to a lower frequency to
> conserve power.
> 
> For example, on an i.MX8MQ EVK board, the throughput dropped to around
> 100Mbit/s on a 1Gbit connection:
> 
>      [ ID] Interval           Transfer     Bitrate
>      [  5]   0.00-10.00  sec   117 MBytes  97.9 Mbits/sec
> 
> However, throughput can return to expected levels after its driver requests
> the high frequency mode. Requesting high frequency in the dwmac driver is
> essential to maintain full throughput when the i.MX SoC adjusts bus speeds
> for power savings.
> 
> Signed-off-by: Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Tested-by: Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>

I assume that you cannot go full dynamic and adjust the bus frequency 
based upon the negotiated link speed? There may be a need to adjust the 
bus frequency prior to starting any DMA transfers, otherwise dynamic 
frequency scaling of the bus may cause all sorts of issues?

Regardless of the answer:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
