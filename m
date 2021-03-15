Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A73C33C1B1
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 17:26:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B813CC57A41;
	Mon, 15 Mar 2021 16:26:51 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C26AC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 16:26:49 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id n132so34037285iod.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0ieBQNPwnDUff5E3dhDZ7DWgA7wwq4ZCQbYomZZouuY=;
 b=my7Okb38WpyqeDnXzoAOn1BfH/FVDY0Y0skmLviIKdupCWK9QGX+n/gefrjH95H5xR
 IXvx01QFupc3cMbuGLyBoNA5G8dc/Bz2bG2Zb/PEvh8aYu1FJIspp332DHQNILbc8Mw9
 IgenYI7ODLU3Hp28FnJiSNW2whEfY5Fvu30k88FEDVETJsrdIXl30+knZpQRxkuu2/43
 RC03xZyFrLVrC1Nzuu+pfa+/TE4LB/MXNn9+dw7849nb3N/DuXpsREFIFiIl5iMX51A+
 uC0dhTQz4T1xR4cNT7o47XMHwypyv3JZRxkRnFT1z83ut1w9W+civWJU71krc3GiLOVG
 sgQg==
X-Gm-Message-State: AOAM532TJAYwClUNRktTR+FCLpIPy6Bmvl2gLN431QkQ06SJ/vDtslRH
 LoJ/HRRm/cDHVr0hmrePpQ==
X-Google-Smtp-Source: ABdhPJxLIWknlh7o/MSDV+7LZUrCDS1i2kWkQTRH9ONlNxCo83oQ5gys+66T7t4mkSC+AdTd1uBUxg==
X-Received: by 2002:a05:6638:218f:: with SMTP id
 s15mr10351318jaj.58.1615825608370; 
 Mon, 15 Mar 2021 09:26:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id j5sm1410203ile.52.2021.03.15.09.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:26:47 -0700 (PDT)
Received: (nullmailer pid 982241 invoked by uid 1000);
 Mon, 15 Mar 2021 16:26:45 -0000
Date: Mon, 15 Mar 2021 10:26:45 -0600
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20210315162645.GA981570@robh.at.kernel.org>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
 <1615801436-3016-3-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615801436-3016-3-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, vladimir.murzin@arm.com,
 alexandre.torgue@st.com, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org, erwan.leray@st.com,
 mcoquelin.stm32@gmail.com, gregkh@linuxfoundation.org, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/9] dt-bindings: arm: stm32: Add
 compatible strings for ART-PI board
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

On Mon, 15 Mar 2021 17:43:49 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Art-pi based on stm32h750xbh6, with following resources:
> 
> -8MiB QSPI flash
> -16MiB SPI flash
> -32MiB SDRAM
> -AP6212 wifi, bt, fm
> 
> detail information can be found at:
> https://art-pi.gitee.io/website/
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
