Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDA545A7FD
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Nov 2021 17:34:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81965C5A4D4;
	Tue, 23 Nov 2021 16:34:53 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3AE8C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 16:34:51 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id w15so22310478ill.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 08:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0QKOHJ1OnKbL2a6U5UE9Sczj0KIVJUirLPHUpzoIxpE=;
 b=OgNUNIC/4r9OuGzuYsakhjea/4k3iVxPgxmRU00g30KitVJ3GwoWWyzVYXJ4c/TCxy
 F8l88kvRCBI6QgrL+fk9VuhvVGEM8DSh/wuqcS8da/GrGfXaKkP46eb/+2beRSTNVtY4
 Ofo27WyDXygpT6sFnwG7KBQ+e8j0Duj6zW7XDMbqNVhSqhCI5PYHoSGiv08j6dRoK6dB
 Sqeo1/3It6rEwb7gpg5KhXnNpGRHh+KuDLLTQsJmvNkX28ftUWLyJyD7q9Q1a/89afW9
 GefHrrk7JarWqKiHdhxVsEfHOTeAEGs3LXO89Bth/kJday3lHQamRWX2mAaf7SHAKKJW
 rGpg==
X-Gm-Message-State: AOAM531HgCFZGlsxOuuYNU6BjucOGZjFpiwQwqNk3kkBpzNfQMfuxQk2
 z5KuqSSTMu1Y/HmNehDWWg==
X-Google-Smtp-Source: ABdhPJwQbkkEsFEy5w9HCPyrvpKMWIAbN2aSLLV6mqx3Fn4hAA6t624FH30/QNlmaqLWwBm4sVG8Ow==
X-Received: by 2002:a92:c5ad:: with SMTP id r13mr2636828ilt.53.1637685290562; 
 Tue, 23 Nov 2021 08:34:50 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id t6sm3992225ios.13.2021.11.23.08.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 08:34:49 -0800 (PST)
Received: (nullmailer pid 3442924 invoked by uid 1000);
 Tue, 23 Nov 2021 16:34:29 -0000
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20211119144551.7577-2-olivier.moysan@foss.st.com>
References: <20211119144551.7577-1-olivier.moysan@foss.st.com>
 <20211119144551.7577-2-olivier.moysan@foss.st.com>
Date: Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.713393.3442923.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/9] ASoC: dt-bindings: stm32: i2s: update
	example
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 19 Nov 2021 15:45:43 +0100, Olivier Moysan wrote:
> Some STM32 SPI peripheral instances support I2S for audio.
> SPI and I2S features were initially described through two separated
> nodes in the SoC Device Tree. In the next SoC Device Trees
> a single node is used to describe SPI peripheral, leading
> to a change in node name for I2S.
> Change example in STM32 DT binding example to match this change.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1557188


audio-controller@4000b000: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
	arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
