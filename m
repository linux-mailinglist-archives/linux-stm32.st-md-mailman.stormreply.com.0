Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC925FEFC3
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 16:07:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D6FDC65040;
	Fri, 14 Oct 2022 14:07:17 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D74B0C6411E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 14:07:15 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-136b5dd6655so5977460fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 07:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yyAUCq/XeIgOsn5nW4H0/zi1fPyOR16Z+9WtLfC5Vo=;
 b=UXiPw9MpxkFZ5j6s27AmphxbzTQIkJsac1LAT9LwZ/N1u61p3BMJ5ZUKWVsroIVljq
 US9eO1U2ejV2a00dPS8l86ftoTBBvcF/c4+jMd5eCShL+Haozlcui78aNH6Bsd8zeVeh
 WydmtO05G+x5C+z5n69gN+GuvRQKyEpRJRG1r1E6Jv7iJUSPoWCcCUO2lqafuWST39Jh
 9ylfQgXE6JWRTIyRHjkG717YrFbr+K/DzVZQeuRg3mZtIvYTBDia3nrj9RbLhPbjWI8a
 c2gR2S+XwkPgGs5KfMifi4Q+x3x4LAX2QN5sWPzcGKJTXXh1I1VG8cSlBGulUIVHHWca
 3fHQ==
X-Gm-Message-State: ACrzQf1/4AbbRA/pI2YEdcuwuuIsRy8lLWnX9w3zzm0xOR8X364iPYda
 bWWoy6cibtVRjJ84yMtQgw==
X-Google-Smtp-Source: AMsMyM6o1zHniDWcovTDfOXfFp60qv41U2PCX8VKv1wcpj7BcPxz5mirIT0ybjjPvkw0bJE1KDZhwA==
X-Received: by 2002:a05:6870:5585:b0:136:8a4d:f131 with SMTP id
 n5-20020a056870558500b001368a4df131mr8796172oao.239.1665756434519; 
 Fri, 14 Oct 2022 07:07:14 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020a0568301bc300b00661a05691fasm1182394ota.79.2022.10.14.07.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 07:07:14 -0700 (PDT)
Received: (nullmailer pid 1857839 invoked by uid 1000);
 Fri, 14 Oct 2022 14:07:14 -0000
Date: Fri, 14 Oct 2022 09:07:14 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166575643424.1857656.14810437673054950633.robh@kernel.org>
References: <20221013221242.218808-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013221242.218808-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-mmc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: mmc: arm,
 pl18x: Document interrupt-names is ignored
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

On Fri, 14 Oct 2022 00:12:40 +0200, Marek Vasut wrote:
> Due to inconsistency of existing DTs regarding the content of this IP
> interrupt-names DT property, document this such that interrupt-names
> is not used by this IP bindings.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Yann Gautier <yann.gautier@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: Add deprecated:false to interrupts: description
> ---
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
