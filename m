Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D625AEC1
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Sep 2020 17:25:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E58A2C36B26;
	Wed,  2 Sep 2020 15:25:05 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06E28C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Sep 2020 15:25:03 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id v196so2352494pfc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Sep 2020 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9egEgwHbell+Vp+FzaRF5HQxPX8jduHhbTufKmGyrCM=;
 b=mxVwxBdbeCaRpCy8dMALx19AWZCNbqDvFiqlOKHGsaWAFlLLVNCLuBJyoOt/Pq4a4B
 kPrBcUCY1S3D1P1/0v9mtR63ullGPIoZ7ui2JsClIAmwOpZXebJuwzoKld7esZVgwIHd
 Tz3vUTXvsoSQDGGXLj9VV1hm11tx7pCxRJn+c15Cm0gP4WaLBKJ7OjWyZPxejLY6ti2a
 qFwsx6f1R2QO0s7IYqexyjIbbxhUjjEoY71vM8HcLVxAF8/hgfW4bOut19EgDQKd54zf
 a/y++XOFDSFm037j4fqvFuNUP1yPvs7wPsuszb+JYI7vpqaxeTWrQSOMCxrM8eILYHno
 SWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9egEgwHbell+Vp+FzaRF5HQxPX8jduHhbTufKmGyrCM=;
 b=hDehbQ6zhxOFhCQgYQcCCRGphQVndfeCiVQe+hjlwy/UHNTC1RS1ioesBKZbHIuOSI
 SwkHLopRddOGj5MjBHldLcBMxLSxuAkReHPVjlgHEfof1QQKX+N83IJac//C7OwWYVnE
 4omFIxKheS+Y4AY+U7oqwj0iRj6v80SQdp2QedK1s7lzga581zUXnpc0hs8nild3cWH/
 C+foGIbHmV2YynIhYA5TWeacHHNvGYdi1vkkiOg8CNgIXmUaTP5fghdl9ctSoxXh7nuL
 D7KE354Z40ovU9MYWKZD5oKEkarlyjccj5n80oUDU3FhA8I4HPVBHigqH+qpVsQFmkl3
 gfDQ==
X-Gm-Message-State: AOAM532iSuMylfxGKQu8LW7bFR1t8J6xFwEV31BnFdBNoMSPaoHpgpNn
 QskQK/AB4FJF+Fv2TW5a99tGK5Q0OuA=
X-Google-Smtp-Source: ABdhPJwpzMqqhegc92irnbmZ7DqXPb2X+KXRPw2ICETQlHugEduxoNrNbfoVAN6znE19G8LcmHVMag==
X-Received: by 2002:aa7:9427:: with SMTP id y7mr3705007pfo.12.1599060301995;
 Wed, 02 Sep 2020 08:25:01 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 p68sm6147744pfb.40.2020.09.02.08.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 08:25:00 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Michal Simek
 <michal.simek@xilinx.com>, Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Peter Rosin <peda@axentia.se>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-3-krzk@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7867b520-950d-aa8e-a7a1-f3590abb98c6@gmail.com>
Date: Wed, 2 Sep 2020 08:24:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-3-krzk@kernel.org>
Content-Language: en-US
Subject: Re: [Linux-stm32] [PATCH 3/9] i2c: bcm2835: Simplify with
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



On 9/2/2020 8:06 AM, Krzysztof Kozlowski wrote:
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
