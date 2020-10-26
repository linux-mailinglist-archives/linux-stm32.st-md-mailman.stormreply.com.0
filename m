Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 592612995A0
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 19:45:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4BA4C36B37;
	Mon, 26 Oct 2020 18:45:36 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72B0FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 18:45:31 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id gs25so15198762ejb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 11:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gz0y0Kg1cNPHrgAtv63xzsEjT/xY3FlDGvII1tKwfUQ=;
 b=cJT4yCDgmgHTQjRktoZHMKg2a123AMZq2pKaa+B9+nAEen3fMroxsl8Yjt8owFzCWu
 aiNJXswnrwYxQ+GdPTfjce3dLgISiqCUIATVlxG5OJ+Kiq3X1QJLsvl0R+FAzlu2N5QL
 N6AxsXAD7HjUgSjRdK6Acc/mdFtiOLPcStegfgubdQPghJSxuvmLNiyQn0QMRM3qW9zQ
 vYfO8cdohYTSL3PXZMjeTkOizk5pWxUJOzLtTDsI1mQllZ8Fa4RMXGUrjwSHn/w/Pai2
 ERT+5kXQ6kpsrbfmoF3kd7So/iRBl4FthCUjzxnUXRQii8Py49frdZm42z3A/IWehhWz
 kw1A==
X-Gm-Message-State: AOAM533pw8kb/D4VPbDOVk99/NZKXB2nqnsAXmThVaHlyfLrQB3qQqFX
 PZTVmsscS6FecOGUAr8tC0g=
X-Google-Smtp-Source: ABdhPJwbHdC4xSeWIGeRgEm2uDYFTmmY8iCHzyomd4336nfeex1zjqBAeuLflDpHoOwgQbTXL2PdDQ==
X-Received: by 2002:a17:906:4803:: with SMTP id
 w3mr11735021ejq.406.1603737931324; 
 Mon, 26 Oct 2020 11:45:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id p14sm5615176eds.35.2020.10.26.11.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:45:29 -0700 (PDT)
Date: Mon, 26 Oct 2020 19:45:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20201026184527.GA165725@kozik-lap>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-8-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-8-post@lespocky.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 07/12] ARM: dts: exynos: Fix schema
 warnings for pwm-leds
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

On Mon, Oct 05, 2020 at 10:34:46PM +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Please trim the error logs in the future. No need to paste all warnings,
just one or two from the same type of error.  Also your local path
leading to Linux repo should be removed.

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
