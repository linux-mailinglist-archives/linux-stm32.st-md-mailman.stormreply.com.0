Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 765891E8367
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2020 18:17:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20070C36B22;
	Fri, 29 May 2020 16:17:40 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E328AC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2020 16:17:37 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id a14so3072717ilk.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2020 09:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1WA+w4gWKVFAKdOjyjOP/tEtWPocATjUQITVK+3DOw8=;
 b=b5IwYAPCsfSP6+peB1cZgqhjPkV2c1wJv/2QmkWAZ2qb7i5PD/7AjFM80f6A8wu6LL
 /x9XSZydngMeEfjQfKLmh2Q8o86+p8KJLI36K3mLllrBxMPlWmhUjg3DERdlCndTtuoL
 Q9RQb6Lz93HMh4vRuqreihyQRlwc3lZU2ySW7rO5to0t5/BMH130GVOXdbgbjO3oQuSq
 4W7iEJUBm8YW9npctu0vxdp/L38IWIYLeKRZR2sELVgFo7u8vMFMZQ2QJx62oQWg1TdB
 G/7Ogib5Do7K2IlVmhtYKWP/IK6QSR17T3BVCD7tS3SEglwPifm+h1qX/4OWfe1l6st5
 kuTw==
X-Gm-Message-State: AOAM532mLtiuXc8stSx+BC+mc7jRV4UvVHjz8dGes5Py4dHIr33EKROg
 K1IhNjkdhR66PHvwo7R2qw==
X-Google-Smtp-Source: ABdhPJzaiMsri3Ce6ct811n/Nx3VT+C3nOOEcWn2ikVVXzQHkkLZAWZnsnOcN0C90jGOSCtG3QTx+Q==
X-Received: by 2002:a92:9142:: with SMTP id t63mr6838165ild.191.1590769056769; 
 Fri, 29 May 2020 09:17:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id j63sm1083926ilg.50.2020.05.29.09.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 09:17:35 -0700 (PDT)
Received: (nullmailer pid 2494095 invoked by uid 1000);
 Fri, 29 May 2020 16:17:32 -0000
Date: Fri, 29 May 2020 10:17:32 -0600
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20200529161732.GA2493963@bogus>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-5-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590564453-24499-5-git-send-email-dillon.minfei@gmail.com>
Cc: dillonhua@gmail.com, airlied@linux.ie, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 andy.shevchenko@gmail.com, p.zabel@pengutronix.de, mturquette@baylibre.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, noralf@tronnes.org,
 broonie@kernel.org, mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH v6 4/9] dt-bindings: display: panel: Add
 ilitek ili9341 panel bindings
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

On Wed, 27 May 2020 15:27:28 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Add documentation for "ilitek,ili9341" panel.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  .../bindings/display/panel/ilitek,ili9341.yaml     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
