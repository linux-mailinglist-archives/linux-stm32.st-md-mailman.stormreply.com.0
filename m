Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C12C749484
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 06:03:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC1F9C6B45B;
	Thu,  6 Jul 2023 04:03:37 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 941D3C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 04:03:36 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6b8decf09e1so250502a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Jul 2023 21:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688616215; x=1691208215;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FYnNIawbku4DKzQ1lg5ea0ay/M1V65V06UjetuXA9iA=;
 b=m0mCMyE1InXnqQ5cdii/3F7YbEoSK9lxA+z+DQdZTCfCx8cXChj8jRFysYNlLPMEAe
 EptgGsCkDLVwc4TzxOPyiJY0RfeO17V+Of1nSUEmvNq0zgf+8VEFmJVxIZuNjyQ8wtcP
 DZru+OMi/twpsdDVsIA/y1fSYVd0IJIYbi77ufYGez2Aj3f4lqGVrLsrBppNJFmEy0AQ
 3AQ2zZSaWxkkQhc2jhlgo9NRpxi2/0ljjvSbK1oY0yuwgj3qzZGtyRs9TXS2GHo3HdLn
 9E2J+F0p2vIrbu26KS4Mca5vOmuA8XX+F/HjF7XNyFoA5bWQrynh87gmX2sTdqRtGktl
 khUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688616215; x=1691208215;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FYnNIawbku4DKzQ1lg5ea0ay/M1V65V06UjetuXA9iA=;
 b=dCzsa1mbXEpJi7Rm8KEfRd1+gHgdmcMuutPcq9ipxPuS7oi4w5YYiUzPJqbptWfamO
 l19t+2ApBumX91MxoTM8mAjPQHJkYPGJwWAo5oeJFf6fpuUgt2vqnsGYUd9/ct/RdQ6m
 fU8fZmPK5MA6E7G2aV0Y99RaPahAo1QbuzXhGjUUBedMv4VjV20lmzpuoJOT2V7Gc4Hm
 3BtP3X6R3fzLtWNzw03C9RnzOLtZdt6KQUHwVJm81Zj/ly0imT2fmkPO8z9RgGowmsrk
 yeso64v7EhhMTF0Lzx7LyzqrTp61OBkku8Z/TjlKYo00VT6lndTJXsfFyhH1zq2EhApR
 qvHw==
X-Gm-Message-State: ABy/qLYEdJbZ7Jryn2dQ5usdbbpBHCkX9MXFQQkMw1vZTMGzgBR/lggs
 ufc1R7WgBCzdk7aFx+H80km/eQ==
X-Google-Smtp-Source: APBJJlEqmZLxNQQuzUk///fUNFmjd1X6nxiU+4HGt0ELa+ZA5RK91Tyw0++U5t+sxlKc/LKULTeoPg==
X-Received: by 2002:a05:6358:4196:b0:134:d122:b681 with SMTP id
 w22-20020a056358419600b00134d122b681mr580552rwc.20.1688616215142; 
 Wed, 05 Jul 2023 21:03:35 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 fk25-20020a056a003a9900b0063f0068cf6csm263890pfb.198.2023.07.05.21.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 21:03:34 -0700 (PDT)
Date: Thu, 6 Jul 2023 09:33:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230706040331.izqrdsq7wfrm6fqp@vireshk-i7>
References: <20230705150033.293832-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705150033.293832-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: st: add missing space before {
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

On 05-07-23, 17:00, Krzysztof Kozlowski wrote:
> Add missing whitespace between node name/label and opening {.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/st/spear1310.dtsi                    |  2 +-
>  arch/arm/boot/dts/st/spear1340.dtsi                    |  2 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
