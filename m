Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 819047FABA6
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 21:36:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 310FDC6B469;
	Mon, 27 Nov 2023 20:36:54 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47615C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 20:36:52 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-58d12b53293so2705664eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 12:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701117411; x=1701722211;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FC+FugQldxH8ozFUppzyiz48ydYS76ZkBSAy4uUEC3I=;
 b=UPioYKkUvz0GZegdvilGriNyboA+RY3EdBRddo256eUaTLWuznQvVHVBLwCYPefzu/
 C44y/qQ6Ks4pLvWsUFzc9aVdlp3IegVB2H3fXINQ5X4Ff7zJwrPYJuN0+UnF4veMJxOd
 KlnlW4/FHU8BJqfkSl2yDrQsnKPyh5QVWT7wvZ/EbPC/itjZ+EwWSMcgHbfiGVtdrNfq
 7XqkiltUZTFE3E+B5Ov8UkWg/TVZi+PsuR8p2noL1LbUeaTGaM8KROrmelt6sT94KpED
 3xd30bRKF2bt08xg0fLvGMJchzMGMIIkpYDCO0Aj45+rP6h35x4tnHjIgpP6uGDPCFdc
 mWaQ==
X-Gm-Message-State: AOJu0YxnhAGgeTc/dURtya7uIO94yNghEwkgBglaOm8Uo10pBtnGC18N
 Q/SCZLZN99vcPvJCFoQCkw==
X-Google-Smtp-Source: AGHT+IHZRrQ6avLBuDCqee8jWm6NVmmBIMYAZVCC1trSeLZ24qZkYvVy9lfibseNEz8WUf5rtqrYbw==
X-Received: by 2002:a05:6820:2225:b0:58d:5c9e:ebe3 with SMTP id
 cj37-20020a056820222500b0058d5c9eebe3mr9420861oob.0.1701117411030; 
 Mon, 27 Nov 2023 12:36:51 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 62-20020a4a0041000000b00587aaf6add7sm1695922ooh.9.2023.11.27.12.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 12:36:50 -0800 (PST)
Received: (nullmailer pid 3226763 invoked by uid 1000);
 Mon, 27 Nov 2023 20:36:49 -0000
Date: Mon, 27 Nov 2023 14:36:49 -0600
From: Rob Herring <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <170111740896.3226593.5878779539402327826.robh@kernel.org>
References: <20231122185235.2017642-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122185235.2017642-1-a.fatoum@pengutronix.de>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: stm32: don't mix
 SCMI and non-SCMI board compatibles
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


On Wed, 22 Nov 2023 19:52:33 +0100, Ahmad Fatoum wrote:
> SCMI-enabled boards may restrict access to resources like clocks, resets
> and regulators to the secure world.
> 
> A normal world bootloader or kernel compatible with the non-SCMI-enabled
> board is thus not guaranteed to be able to deal with the SCMI variant.
> 
> It follows, that the SCMI-enabled board is not compatible with the
> non-SCMI enabled board, so drop that compatible.
> 
> This change is motivated by the barebox' bootloader's use of bootloader
> specification files[1][2]: barebox for non-SCMI DK2 will compare its
> own top-level "stm32mp157c-dk2" compatible with all compatibles
> listed in the device tree referenced by each bootloader spec file.
> If the boot medium contains a configuration with
> compatible = "st,stm32mp157c-dk2-scmi", "st,stm32mp157c-dk2", "st,stm32mp157";
> it will match, because of the second compatible and boot a kernel with
> SCMI enabled, although no SCMI may exist on the platform.
> 
> [1]: https://uapi-group.org/specifications/specs/boot_loader_specification/
> [2]: https://www.barebox.org/doc/latest/user/booting-linux.html#boot-loader-specification
> 
> Fixes: 8e14ebb1f08f ("dt-bindings: arm: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  .../devicetree/bindings/arm/stm32/stm32.yaml     | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
