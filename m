Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 767C45B75CC
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Sep 2022 17:55:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07AC1C640F0;
	Tue, 13 Sep 2022 15:55:31 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DA20C0D2BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Sep 2022 15:55:29 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-1279948d93dso33220316fac.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Sep 2022 08:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Q2pzBTs8AUPnlW7L4Dy5QX/7RTSl832U+8XEa+jPF14=;
 b=ISYast/74Uz9Maj+2pv4TME3yM1syKl/kW84872xalx8lOacz0GlAk+jUNTG8jTdjS
 dpLdRGPGl9iqwknbY9eWxgg/QCPxAwpj3lhZ3Qi2QRBkm9TraKFudfD1A4YI7CmuQ3gT
 Cv1d0YpzdY/JhffJAoQyJlQjwMjO77sOprviCrC3qzfSJFRva8qC2cT1NWAU+MycfFcE
 easC1VKBS1VjefE7T7LWkJbmmKEjOm15raHyyEpdAEveQ3PM6RrHnsaQpCGNLId83sHX
 m8muQdResqI7uSo/zcTamAArv52d4L+JVDspkG65hvje/SVmFm1d8R5YRM8QWVDiuv6d
 5fEA==
X-Gm-Message-State: ACgBeo0OPok84N2s6US+AJPXXBtIyJjeZUMTzNqxjXPzrm+aRnEpCtek
 zKHoz1BxWTbeo1sGfmuwsw==
X-Google-Smtp-Source: AA6agR73VBx3kyn5Mb+AYg6v7nseXC+ZG770Imn8LWQNahhPuIqiBSVJh2wKMMSrn+66t6bBMt2fRA==
X-Received: by 2002:a05:6808:2084:b0:34f:93ea:fac5 with SMTP id
 s4-20020a056808208400b0034f93eafac5mr1757751oiw.256.1663084528271; 
 Tue, 13 Sep 2022 08:55:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i4-20020a9d53c4000000b00654625c0c4dsm6103755oth.17.2022.09.13.08.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 08:55:27 -0700 (PDT)
Received: (nullmailer pid 3808048 invoked by uid 1000);
 Tue, 13 Sep 2022 15:55:27 -0000
Date: Tue, 13 Sep 2022 10:55:27 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20220913155527.GA3807992-robh@kernel.org>
References: <20220913074639.31932-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220913074639.31932-1-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: stm32: add missing
 entries for gpio subnodes
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

On Tue, 13 Sep 2022 09:46:39 +0200, Alexandre Torgue wrote:
> Add "interrupt-controller" and gpio-line-names to gpio subnodes in order to
> fix dtb validation.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
