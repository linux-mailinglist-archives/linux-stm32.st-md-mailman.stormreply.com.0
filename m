Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8525EB485
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 00:26:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80D99C63326;
	Mon, 26 Sep 2022 22:26:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50045C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 22:26:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2369D614A7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 22:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B19C4347C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 22:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664231214;
 bh=wcYE9M8ijRqSDSr5BsuRtnLvrNWnMcPeWOckcANE2CA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VFnBApnqclQ6KB4PGoCFA/qf0P0iPOu3WoOg+JoYM4WrZfzllS+JxxdGFEn/nsA+k
 ySoQyeTgvhpaqtNFFbJPFj6JJFKOnAiRG7L/1NkvrI/JG3vAwmejwk2lBc0D49PJ0k
 oulz0PfUqsorkBjHIwq5i9zRJ24nFg9zPiRRJXFI/Vln9ubCeX7eSVcTR8kz4LkZPn
 FAyh3BJLqSXMmL+3I1aDVDIM+NOKu0YAsBTvfHF4V4O0SIaq0Lbag6VnZgKKql8yls
 zl+s/8Go1pMEhEoRN8oSMlIyV6EJ8ZlbQSkf0n43IKGulbrahh+lsAyt+Op53ByNK0
 f/yUxxqDipTtA==
Received: by mail-ua1-f50.google.com with SMTP id u14so2959634ual.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:26:54 -0700 (PDT)
X-Gm-Message-State: ACrzQf13qx9nYRnRglsIRMluyw7HPhtXFIOW6994F6q6sHuznVab1LOn
 6KSjJeMtFS7QLEfrgJ1ZtlwQdxaeSODdHFaETA==
X-Google-Smtp-Source: AMsMyM7E8xGJRct+CnZ9p0EHZWcWNbWQOZGN1JjsRpfZtMm4FGh/MblAQ1Zm1QXSrO7bNywYg+cpegS44/rsQWWAWNw=
X-Received: by 2002:ab0:2715:0:b0:3c9:90c2:1aea with SMTP id
 s21-20020ab02715000000b003c990c21aeamr7329284uao.77.1664231213526; Mon, 26
 Sep 2022 15:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220926222003.527171-1-marex@denx.de>
In-Reply-To: <20220926222003.527171-1-marex@denx.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 26 Sep 2022 17:26:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLfLsTW-c82GgUQhv5U52tmefFBLKKT_QTtgV0Bza84rQ@mail.gmail.com>
Message-ID: <CAL_JsqLfLsTW-c82GgUQhv5U52tmefFBLKKT_QTtgV0Bza84rQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: memory-controller: st,
	stm32: Fix st, fmc2_ebi-cs-write-address-setup-ns
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

On Mon, Sep 26, 2022 at 5:20 PM Marek Vasut <marex@denx.de> wrote:
>
> The property st,fmc2_ebi-cs-write-address-setup-ns should really be
> st,fmc2-ebi-cs-write-address-setup-ns (there is underscore _ between
> fmc2 and ebi and there should be a dash - instead). This is a remnant
> from conversion of old non-upstream bindings. Fix it.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
