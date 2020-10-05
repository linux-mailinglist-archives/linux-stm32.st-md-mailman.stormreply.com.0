Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B32836EA
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 15:51:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A979DC32EA7;
	Mon,  5 Oct 2020 13:51:38 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEC9EC32EA5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 13:51:35 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id q21so8625275ota.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Oct 2020 06:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+6o6Nhko1kPIF7bb/D566IYk+rcVxOYL8hgnCF/Sb70=;
 b=WKyxio/OoBhu1XEw2z71nuaFO2tMJ3M7TqmbmCL1sUwirtSNh4jG+0jO+8scncZUuq
 +K2fS12dnyMMn6NL4Bc9d1cM8aY3WkxFJZulDHZmwF1R5gzrIUsNWc3JrpzYqmOzCodC
 25CYTgUHjAXstnj5lFznBVK9EnL0T7jWpjkpiCdr126Ls5D6NPLrMxXpX6x/iHiRwBp0
 olpFs/GMDhGCZaCwgecSKocMsXvCBnslnJqZKhAlTkOhqh5rDejNWhLwzwiGLXtQld6f
 Hq+BvvE0HbSeZrCnJ8Yxhc6DG5dsoCmVYUIP0U4LGOa/yBgWDc40ReLZuEBn9dwqEKNW
 Nz5A==
X-Gm-Message-State: AOAM530dqHj1gvoqg+dLSlVx41GG0Gw3LKDwf/0Wx+mWbci8BvczR9TK
 ObtJHUODpYe1cY0Dgc0lBw==
X-Google-Smtp-Source: ABdhPJzAwIYiizyypF4j0t0rpTJ8sI9zgsna996D0Xvsy6AB7FQrOTjn13rToJHrnoBBPZBd3LbU1Q==
X-Received: by 2002:a9d:71ca:: with SMTP id z10mr11677488otj.307.1601905894166; 
 Mon, 05 Oct 2020 06:51:34 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m22sm2883051otf.52.2020.10.05.06.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:51:33 -0700 (PDT)
Received: (nullmailer pid 82320 invoked by uid 1000);
 Mon, 05 Oct 2020 13:51:32 -0000
Date: Mon, 5 Oct 2020 08:51:32 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20201005135132.GA81148@bogus>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930234637.7573-3-post@lespocky.de>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v6 2/7] dt-bindings: leds: Convert pwm to
	yaml
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

On Thu, 01 Oct 2020 01:46:32 +0200, Alexander Dahl wrote:
> The example was adapted in the following ways:
> 
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - tweake node names to be matched by new dtschema rules
> 
> License was discussed with the original author.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> 
> Notes:
>     v5 -> v6:
>       * removed pwm nodes from example (Rob)
>       * renamed led-controller node in example (Rob)
> 
>     v4 -> v5:
>       * updated based on feedback by Rob Herring
>       * removed Acked-by
> 
>     v3 -> v4:
>       * added Cc to original author of the binding
> 
>     v2 -> v3:
>       * changed license identifier to recommended one
>       * added Acked-by
> 
>     v2:
>       * added this patch to series (Suggested-by: Jacek Anaszewski)
> 
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-pwm.yaml


See https://patchwork.ozlabs.org/patch/1374765

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
