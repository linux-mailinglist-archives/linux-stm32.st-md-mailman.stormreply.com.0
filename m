Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E56A83317B7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 20:50:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F13EC57195;
	Mon,  8 Mar 2021 19:50:23 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E266C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Mar 2021 19:50:22 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id e7so9952897ile.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Mar 2021 11:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DSUyG3mu0/9jdTY7TVQwj3v3J1C7FTS41+rTEskb/9k=;
 b=apbyyJsoK0BOCbmcyyS0sLNym28IfdM4MTzpocSNuotC9iU3LyZ7P1kug0AkpwN1lt
 edG6meFb1qCyCuoR/OR55cW0KgdKznM/y6jlqsxHzxzdmrkkmy70C7qbWsAL1qbKWSMO
 eAGdRmYfiGwrsiFuO9p9CAo29YpG/5RbYFMEFZlBLt4kJo/M7Z7APpj19Sknx+JtA1KJ
 550xXVa8UvzjNb20W2MJap3Yya3M6u+Fu56jE7hBBjIICIVGAm7fVzNcHIqGDPMUHr9C
 Wgj9yV38eYMeaTR+T+u44DBy2vbc8OcnQWtAH2Y+gI+EiMzw9L4oIteSPJEMilEzEsz3
 qlPQ==
X-Gm-Message-State: AOAM530lwi2oF+CvkGm45jqj5sKmCNJBIpLhRbyiStmUduiDz+2bBojM
 jpxAnEoJ1qAMRuHAD8XTMw==
X-Google-Smtp-Source: ABdhPJxMFNZcs6lXUDVILq/ibVdC1V2O1oNCmei56AYh5VP3lqbdu8fcx8woUMSADxSUMJboA4LdTQ==
X-Received: by 2002:a05:6e02:1a03:: with SMTP id
 s3mr22436148ild.178.1615233020999; 
 Mon, 08 Mar 2021 11:50:20 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b9sm1966901ioz.49.2021.03.08.11.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 11:50:20 -0800 (PST)
Received: (nullmailer pid 2854890 invoked by uid 1000);
 Mon, 08 Mar 2021 19:50:17 -0000
Date: Mon, 8 Mar 2021 12:50:17 -0700
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20210308195017.GA2854839@robh.at.kernel.org>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-4-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614758717-18223-4-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, vladimir.murzin@arm.com,
 alexandre.torgue@st.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/8] dt-bindings: arm: stm32: Add
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

On Wed, 03 Mar 2021 16:05:12 +0800, dillon.minfei@gmail.com wrote:
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

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
