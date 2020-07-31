Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E20234BA6
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 21:36:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CCE1C36B35
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 19:36:16 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C8ADC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 19:36:13 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t4so26254830iln.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 12:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wab/tJu5E5sJ5/QDRPXn9ffk/Ado7aM/lOvbhkRuf2o=;
 b=LmhTRtEv0lVUk1yOHmmLuGeB2Aewl+CA9Mx/F0ZPnULUfCnfLsR3GhGz/33yP1pJUF
 QiPKG2rCJDhLilNJdZ92fBIGDaups8pB1D5Wi7f9yWEy4wxT3GKtoWchqNwvKoA/2Dc+
 mSk7VlruDNTm/64SN6Rp2Q9qQt6KGh1TWBFS3UmEOOtO7/xgMJ+SUjoXlSlaOz/u/9LX
 OFbuHqqbpMgRjQIl4QNocPVaX0PSL4Skeyjevp77loUG0WDQwz6hVMxkgABxmr3e4Cvl
 3oN7gQtgIbXE3shQMNyZQs5RJFQv9lRnPf71pHy4d/MXUEMD5Ck7fExbQrt8hvV4tuLR
 WKxA==
X-Gm-Message-State: AOAM531jLzz9yAr0lbDfqw/+pvAxNlOKyBsdLwiCCZz4PDD22ls+GISS
 BBgebwrXk7nctcFTvX+U4w==
X-Google-Smtp-Source: ABdhPJxd3lQOTaVRgxLwJUQxUo45C+8bAgkoIH99FoVPc4CMnGqeFkTWOBiQJFT3e7AswKOHVk7nWQ==
X-Received: by 2002:a05:6e02:dd1:: with SMTP id
 l17mr5194141ilj.136.1596224172324; 
 Fri, 31 Jul 2020 12:36:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id h1sm5079948iob.8.2020.07.31.12.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 12:36:11 -0700 (PDT)
Received: (nullmailer pid 643496 invoked by uid 1000);
 Fri, 31 Jul 2020 19:36:09 -0000
Date: Fri, 31 Jul 2020 13:36:09 -0600
From: Rob Herring <robh@kernel.org>
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>
Message-ID: <20200731193609.GA643298@bogus>
References: <20200731143053.44866-1-marcin.sloniewski@gmail.com>
 <20200731143053.44866-2-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731143053.44866-2-marcin.sloniewski@gmail.com>
Cc: devicetree@vger.kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, robh+dt@kernel.org,
 broonie@kernel.org, mcoquelin.stm32@gmail.com, allen.chen@ite.com.tw,
 sam@ravnborg.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 2/3] dt-bindings: arm: stm32: document
 Odyssey compatible
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

On Fri, 31 Jul 2020 16:30:52 +0200, Marcin Sloniewski wrote:
> Document device tree bindings of Seeed SoM and carrier board.
> 
> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
