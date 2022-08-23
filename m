Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35059E497
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Aug 2022 15:43:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37A96C640F3;
	Tue, 23 Aug 2022 13:43:17 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14A98C04003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 13:43:16 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id bt10so6751593lfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 06:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=h32xyk5qVyHWCWQbdLOYmYDB3SfGv1Ihtw0UlxutFSs=;
 b=j7WUm0iTG96tPDzGkHP6hVuPCpr84UKH3TJFLWMgVEmePKBlnIJ84/ybGASHI/Mra0
 RWoBVYr8ozv7fj7kVw9sz/+jeSaeJmZhqxjpClB6Y4Pc+TyxU6fwxL69LB6ZsgZVRpt4
 +67/Na/EvQDPdnAMEKtFkqfBZswAXsGGgVkMUrh3xQhkqgayWbeoGv4EiDoKTDvt+g8m
 7hnjfSGwI1hsTBEgbKg1rbjlb+j9eohQ8kbCn3L4Yx3sUt5sRi6aT75MLtTIBbihnk1+
 mBcHTr2H03kYnjC9aBF8s/sJoqSZF4kD1p4pgs+Euu2pRgwNJ8d/HJ5bsCMgn8mWlLbR
 +QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=h32xyk5qVyHWCWQbdLOYmYDB3SfGv1Ihtw0UlxutFSs=;
 b=nul7beDTPa2Pc71OIB9QrBRp8vjmepL5m4TR/tgr9H3wDuB//wFsQJB7zfPKvkRAQG
 UsQoKAd1sWUWUmopGoHw+6hMKUtu6pB0n5ZNw2D5uhAuPVvtV3kg8SZ+gPk4mfJQm2Qh
 /chRAkbtLRSPWx/TW7GQoHft9HT2U0rMQMNZx+q9dXOjm0tENLf04Zu918Ga41o6B6hL
 xbvNC/bsNd3JEqKEx5r6BT9kKuhZuQb9rZXk0famHa4rH7girju5CLBWmEp+OLXB/yQr
 RRF+SJzPCkjEcJGgOBfuRGf0KzYkjPYJ/Ql0mzsYOxibi+AjdK/B+0lRC2lLUehTj4jc
 dhdw==
X-Gm-Message-State: ACgBeo18YsplpoRs9h1bmiBNMXzQcp+pCcXla7bPpVrT9EeYGjfJLpTy
 8SbS1MsrDqWc0iGXu1NCBK56gQ==
X-Google-Smtp-Source: AA6agR5RZdIPZVcwdu1iI8zwdbElK6Q10jk3CELdg44yE6uN2YcKJda0sTTtvNcx5OKPyyPxtJP3ow==
X-Received: by 2002:ac2:5097:0:b0:493:109:f190 with SMTP id
 f23-20020ac25097000000b004930109f190mr355159lfm.180.1661262195492; 
 Tue, 23 Aug 2022 06:43:15 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056512360100b00493014c3d7csm107114lfs.309.2022.08.23.06.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 06:43:14 -0700 (PDT)
Message-ID: <c74b4464-ec28-eff6-86e2-2b0e5e9e992b@linaro.org>
Date: Tue, 23 Aug 2022 16:43:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
 <20220820082936.686924-4-dario.binacchi@amarulasolutions.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820082936.686924-4-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: Re: [Linux-stm32] [RFC PATCH v2 3/4] ARM: dts: stm32: add pin map
 for CAN controller on stm32f4
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

On 20/08/2022 11:29, Dario Binacchi wrote:
> Add pin configurations for using CAN controller on stm32f469-disco
> board. They are located on the Arduino compatible connector CN5 (CAN1)
> and on the extension connector CN12 (CAN2).
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Do not ignore review. This is not correct. You are mixing copyright with
SoC...

> 


> +			can2_pins_b: can2-1 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('B', 12, AF9)>; /* CAN2_RX */
> +					bias-pull-up;
> +				};
> +			};
> +

Don't ignore review.

That's second one, so that's a no.. :(

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
