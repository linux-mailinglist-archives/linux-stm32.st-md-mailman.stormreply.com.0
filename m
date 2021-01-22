Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BC3004B0
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jan 2021 15:00:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0812C424BE;
	Fri, 22 Jan 2021 14:00:58 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0204EC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 14:00:55 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id r189so6047422oih.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 06:00:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=EUaxXtMWBR0BSS8k6na/vc+HlfNaGeb+7ZCL4OicyZo=;
 b=K3z+k8UOuRS6Y0AUbn34PL8/ZXTyIpDBRilmtQY5VPdjBJUqdFRfKPNBtCtvMY4zfS
 GSnpdm7gTYAflwzCBgTk4JuxJImOrGWbYUwPpuQCPOtpWt+F15qV/zyWjjBZW/MEvEC2
 aTxs5xlP3x5TyWg+0Tdr5nwNFNAGpH8N1Ud1Gcl0l7jFSAEcKxMb7cy8tlrcHZef1U1u
 18JjLvqvEX3VfAYm4prYBotG+OzRhh5HWgpPSH+NXPJfzR6zzN6GgReuGh5MjfAEBn/o
 +7bDcqBXFzctMEKcb4muO589OwMCQJmI2iHLrjTtYl7xWsskLBzzrJ712WY+SAjoVQKe
 tNcg==
X-Gm-Message-State: AOAM5316hAFVSK2H1ah4kLo06uyXLdwWqX2c5Y+iwURdFwyjS7SAYVDY
 IqsbSDoVNPsflink4JF2FA==
X-Google-Smtp-Source: ABdhPJzuup2G8I4By0nwY5GjTeCgXxvfBNcb5i/dqcjgAbP+KwX1KNzEuKUqEobX9LeiIvN8oDTXpw==
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr3361372oia.54.1611324054240; 
 Fri, 22 Jan 2021 06:00:54 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p4sm1719630oib.24.2021.01.22.06.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 06:00:53 -0800 (PST)
Received: (nullmailer pid 674375 invoked by uid 1000);
 Fri, 22 Jan 2021 14:00:45 -0000
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@foss.st.com
In-Reply-To: <20210122105101.27374-14-gabriel.fernandez@foss.st.com>
References: <20210122105101.27374-1-gabriel.fernandez@foss.st.com>
 <20210122105101.27374-14-gabriel.fernandez@foss.st.com>
Date: Fri, 22 Jan 2021 08:00:45 -0600
Message-Id: <1611324045.701742.674374.nullmailer@robh.at.kernel.org>
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 13/14] dt-bindings: clock: stm32mp1 new
	compatible for secure rcc
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

On Fri, 22 Jan 2021 11:51:00 +0100, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Introduce new compatible string "st,stm32mp1-rcc-secure" for
> stm32mp1 clock driver when the device is configured with RCC
> security support hardened.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dt.yaml: rcc@50000000: compatible:1: 'st,stm32mp1-rcc' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dt.yaml: rcc@50000000: compatible: ['st,stm32mp1-rcc-secure', 'syscon'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml

See https://patchwork.ozlabs.org/patch/1430316

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
