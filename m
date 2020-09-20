Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 843C427179B
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Sep 2020 21:39:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14D01C32EA3;
	Sun, 20 Sep 2020 19:39:22 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1CE2C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Sep 2020 19:39:19 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id n13so10763415edo.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Sep 2020 12:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EjOn6uRQVdPuymFl16y3sShxeseL+O0M4hlLdZpwFpM=;
 b=NG1dj99XKiAlVMwmS3Dw7iReM2RPsvpnQj6lzcHjIY3frkrvexP5DNEMfIyLJAyU9V
 /JQbte2sUqy5+hrLUHRv/pPndQyGENF2s+N+0YWluh3Px0TVtmKcl48yOHaHuickUkdh
 0BO9hIkQdLcRfodF9ys0K1dH3q2GMIomjrjdFVvjY852+e3rM4ph+C4AQUmEe/PfbYfk
 oYTV0uJ75RXyrS0gN+37S/TqRfS6MRFe9hUmCPaDLl9Hhky57O/ShaPQ0/D74wr6vZJt
 3edf3py++zNu1z8E44zNoEcXVFp6nKt0+DDlEbGJfP/6lcHT2mKsPH8hPSlAQP7VwYso
 R1/w==
X-Gm-Message-State: AOAM532gzAMLYHJGZv6LOhsMDJn13A1CCTTY9UKzxUCzgyMngfmtmgbW
 Yc/Yg1LIfPCI3gtJhURjAgA=
X-Google-Smtp-Source: ABdhPJxm64DrxO2BCAhB/Z2FKAFGkrjja3e7GI7Mop9Y1YiJS/Mzx02Jc3rgIeVCd0fm8AibxTyTyA==
X-Received: by 2002:a05:6402:326:: with SMTP id
 q6mr48977643edw.216.1600630759279; 
 Sun, 20 Sep 2020 12:39:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
 by smtp.googlemail.com with ESMTPSA id bf25sm6956900edb.95.2020.09.20.12.39.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 20 Sep 2020 12:39:18 -0700 (PDT)
Date: Sun, 20 Sep 2020 21:39:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20200920193915.GA31074@kozik-lap>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 01/13] dt-bindings: gpio: add common
 schema for GPIO controllers
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

On Fri, Sep 18, 2020 at 08:30:02AM -0600, Rob Herring wrote:
> On Thu, Sep 17, 2020 at 10:53 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > controllers.  The schema enforces proper naming of GPIO controller nodes
> > and GPIO hogs.
> 
> Did you not see my previous reply about a common schema? We already
> have a common GPIO and hog schema in dtschema. Please add to it
> whatever is missing.

Indeed, I'll enhance the dt-schema.

The trouble is that each in-kernel YAML file still has to mention
possible gpio-hogs nodes. Is the proper solution to put them in common
YAML inside kernel sources?

> 
> My goal is all common schema end up in dtschema, but I haven't pushed
> folks to do that yet. Ones I've done are there though. One issue is
> what's in dtschema should be GPL/BSD and the existing text bindings
> are default GPL, so there's a relicensing exercise. In some cases, the
> schema is there but I haven't copied over the descriptions.

Right, I'll skip the descriptions when posting to dt-schema.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
