Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A29EB6903B5
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:30:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63E62C6A5EA;
	Thu,  9 Feb 2023 09:30:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68732C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:30:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id bg26so1021171wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Feb 2023 01:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4feielQWuDIt1pW+0VIzkBUGQbtqwZGLuVccBda76iw=;
 b=ELRGeaICPjKmIFb0rFTLQceXoPsB4DjfxsSuePte8ZV4Cbnl4mPNLuHj5fm/gUguEG
 VDW4+19up5meaYBbMzPWCdAM7GW8WexAzOQrVfLNXvi4yhi3DO9bQE9B04hkHBoUjjNM
 vwQVXsLiiRM3p9mzwdwKrOLuFd0NhC9vSD1IwpsPy6J8T5AAV4M6YwB14xYPnNpumdOP
 hRcCQummzTuQt/NlCWPoRX8QZWvmNPZ8zb8Mi+ZOlcSZ6/hR63CMFPNNOkhnmBnqVS01
 xwuTWCFkQl0OEaqXg8UIG4Uam8EtS1+tokTzucSTMtRwB/9Kzfe+wxn+7xBctWp1Axn0
 TwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4feielQWuDIt1pW+0VIzkBUGQbtqwZGLuVccBda76iw=;
 b=mRYm+HRpowDBnUM7RYs5QUlea+rZbSloqEvammHZgNUj4q7kTe2iXzZ91pnCaAEgKc
 LyJEZUgOdtHTIghgAZ6YBe5eMwaYF6sXcqOdHMDHGGpUdc+HLhxkS/A/NqNaCcfdmFf1
 Zs1krxtd5qk2LmTUWQ6BNeJ+zi8nKUX4EdHC2yjnRZEt4pOcssTwZud/YLJWPqzpBFdz
 dGqEoWSv7uvc7jVmBTAWBH/7vvOWg1EiMxwkZU+JNXAV/ZVDIstSdvyd44NhBvuRyzdi
 eE2lzfBw8iMkC+tvvAh8lt/zABVjoyg/XVdSSI1hWE9wLUV5vMI3CujlRcw6rQ8DzNIa
 NgWA==
X-Gm-Message-State: AO0yUKUejLvXrW0SqwIusF65RqrGEX3hLYhq02YcdvZcmIckSW/5gxqw
 80vd5BXP6JLBf5bdeDTp/RQrOw==
X-Google-Smtp-Source: AK7set9zzTouo5DuxZavthCwhJ9UzxeJ3yZkjlwz0rAqtPF4TRq1WAJN5o/OdoY3L3ra+uZf2gp6QA==
X-Received: by 2002:a05:600c:180f:b0:3dc:557f:6126 with SMTP id
 n15-20020a05600c180f00b003dc557f6126mr12404547wmp.4.1675935039001; 
 Thu, 09 Feb 2023 01:30:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c450700b003dc42d48defsm1511532wmo.6.2023.02.09.01.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 01:30:38 -0800 (PST)
Message-ID: <5512bd3a-f4b5-1f65-c9eb-b5c8bcac7514@linaro.org>
Date: Thu, 9 Feb 2023 10:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Alain Volmat <avolmat@me.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20230209091659.1409-1-avolmat@me.com>
 <20230209091659.1409-6-avolmat@me.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209091659.1409-6-avolmat@me.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/11] dt-bindings: arm: sti: remove
 bindings for stih415 and stih416
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

On 09/02/2023 10:16, Alain Volmat wrote:
> STiH415 and STiH416 platforms are no more supported hence remove
> the bindings for those two platforms.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
