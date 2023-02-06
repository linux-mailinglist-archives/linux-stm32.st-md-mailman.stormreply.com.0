Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD4D68C97C
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Feb 2023 23:35:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0577C65E6A;
	Mon,  6 Feb 2023 22:35:51 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79D7FC6506E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Feb 2023 22:35:50 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id g18so12465293qtb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Feb 2023 14:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nmjD169NoXW3IkhaYFwz0SB6QUlkP+qjUZED7C6ZRTc=;
 b=ckgvtNbLHKE7zGp1hQQH2crONIjnVmrKh4uTLOwFVE59nzmNDXe2hY25Vy/SdS2hxO
 Dcps1DCCnhUR6uMUpbZAgd3e8d74QAybhTkzqbpGiY5KlAx4PxrkThbrKvdJQ9X6eFLI
 kYsBUj99TpNEuneLGJ33lau5G8cp9/7SsRvgWGqTGoFXEUGKo5+YBpVCCQROO1xtG8u+
 IoFe7ysj9JZNW2YtseYYgAOdEL5ZywEYqUMstLjxqHmT9iCp6KwTE5cTR2LZ6ZJxFCca
 sEIMEsh7SzKMoJb7WcrXJsAGFp3TzRG35VTOXk4ujeNHnd5JE2e3IbbQn8hYhVvvZmss
 dC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nmjD169NoXW3IkhaYFwz0SB6QUlkP+qjUZED7C6ZRTc=;
 b=MS+H7h71f5DhLeIb0MxkVMaaYqCE6eFUy7onWhcneqgeTCvMLZxyyG9y4HL/hzGMWb
 hcMJLRDeZZo4CQGHaX9+FkJHEgq+92Tr0+83a/8zR0Vr3WJ7PVC3Ro+bE8MmU+yGOaw+
 MKMuAhiY61++8FR2p8SO+CeTBFefafziRNpzB249V4OG4aHkxy7tb0TLOUe0m+jao0Mj
 eeHEcBnrgHuz1NkawaOKfVJMSSq8DJ2BfqQcvtzpWtdRXwtth5gbqWAI8MM6qynZkbwb
 Q0euDwMZLhDMhHhk9ruYYnWpmyQ9GJW+6nDfTdGC1QUU+i9MJoySXXxgg3bxHN3vwSeh
 delQ==
X-Gm-Message-State: AO0yUKUmQAeOTyw4n2HpeN8w6mMPLSpad122Q5N+Pfa5GpNinNbFxj2K
 goz13M7gTY4CE/Om/AhUF5o=
X-Google-Smtp-Source: AK7set+ds+mN/qWC4EpstrsfpJCHNe3e6+CXlaF5Nlwbm9/55WoErDc4Bw+yRg3MwF1VPLdJ7uZRmQ==
X-Received: by 2002:a05:622a:1753:b0:3b6:43ae:d5a3 with SMTP id
 l19-20020a05622a175300b003b643aed5a3mr1958776qtk.26.1675722949351; 
 Mon, 06 Feb 2023 14:35:49 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 16-20020a05620a041000b007201df7ff47sm8274920qkp.45.2023.02.06.14.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 14:35:48 -0800 (PST)
Message-ID: <6f276332-54fb-b814-1b64-4e8aa7960eb6@gmail.com>
Date: Mon, 6 Feb 2023 14:35:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael.j.wysocki@intel.com
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Haowen Bai <baihaowen@meizu.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Remove core header inclusion
	from drivers
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

On 2/6/23 07:34, Daniel Lezcano wrote:
> As the name states "thermal_core.h" is the header file for the core
> components of the thermal framework.
> 
> Too many drivers are including it. Hopefully the recent cleanups
> helped to self encapsulate the code a bit more and prevented the
> drivers to need this header.
> 
> Remove this inclusion in every place where it is possible.
> 
> Some other drivers did a confusion with the core header and the one
> exported in linux/thermal.h. They include the former instead of the
> latter. The changes also fix this.
> 
> The tegra/soctherm driver still remains as it uses an internal
> function which need to be replaced.
> 
> The Intel HFI driver uses the netlink internal framework core and
> should be changed to prevent to deal with the internals.
> 
> No functional changes
> 
> [ Applies to thermal/linux-next or linux-pm/linux-next ]
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

>   drivers/thermal/broadcom/bcm2835_thermal.c  | 1 -

Acked-by: Florian Fainelli <f.fainelli@gmail.com> # bcm2835_thermal.c
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
