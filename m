Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983B1B4D86
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 21:42:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41293C36B0B;
	Wed, 22 Apr 2020 19:42:37 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AF1CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 19:42:35 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id r25so2962926oij.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=huAsohfgPjKhobu8tGI0Z2yU/DwK8rb6r7ozAP98pjc=;
 b=kRlhG6awH9N+AEHUj9p7theVNX6KIZ3OYnZ/EeZQtPKwVn220uLAV8tIvHUm6UQVLK
 MtonzupLPncyVmqLfr94f5sLih2iL8XOvb7Y/5a7ujzZPcbXd1yh8GFGO92Fywjlu04Z
 ud5TfJE7uYcWD4l79d/cz1YrFJRne+RB5KT3zkk5q5F0kt/wnYVKZnb3exw3rsGaJLs6
 KGE8NnCqCOj+zJrIlhjoz0S0VnBkFV9iS6S3PI5Z9Ovp4JJo9oZNKgjDtPeXFlKSmkGY
 0fkGUhFeG3C3U9QF88p26ktNYYox+oO6UoNCKuUk4mAol9ru+crMjUMihbTYjhT/LL44
 TQKQ==
X-Gm-Message-State: AGi0PuZALhSOz/1z/jLDw0EgRWZw8ijuHbG0ChWgyTt5Rc0z+K6TO6VE
 aAs0BX5K7L6fgVZGrz5+FA==
X-Google-Smtp-Source: APiQypIhe/Vj/x+9Tj76bJkE00Ecb+4p/RQomG76rndQXNYWtXWXHpxdZCnJwyfvOc0r/Nbba51iYQ==
X-Received: by 2002:aca:ecd7:: with SMTP id k206mr432558oih.113.1587584553937; 
 Wed, 22 Apr 2020 12:42:33 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h137sm46208oib.33.2020.04.22.12.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 12:42:33 -0700 (PDT)
Received: (nullmailer pid 8268 invoked by uid 1000);
 Wed, 22 Apr 2020 19:42:31 -0000
Date: Wed, 22 Apr 2020 14:42:31 -0500
From: Rob Herring <robh@kernel.org>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Message-ID: <20200422194231.GA6333@bogus>
References: <20200421161610.1501827-1-adrian.ratiu@collabora.com>
 <20200421161610.1501827-6-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421161610.1501827-6-adrian.ratiu@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, Heiko Stuebner <heiko@sntech.de>,
 Adrian Pop <pop.adrian61@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martyn Welch <martyn.welch@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [Linux-stm32] [PATCH v7 5/8] dt-bindings: display: add i.MX6
 MIPI DSI host controller doc
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

On Tue, 21 Apr 2020 19:16:07 +0300, Adrian Ratiu wrote:
> This provides an example DT binding for the MIPI DSI host controller
> present on the i.MX6 SoC based on Synopsis DesignWare v1.01 IP.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Tested-by: Adrian Pop <pop.adrian61@gmail.com>
> Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
> Changes since v6:
>   - Added ref to the newly created snps,dw-mipi-dsi.yaml (Laurent)
>   - Moved *-cells properties outside patternProperties (Laurent)
>   - Removed the panel port documentation (Laurent)
>   - Wrapped lines at 80 chars, typo fixes, sort includes (Laurent)
> 
> Changes since v5:
>   - Fixed missing reg warning (Fabio)
>   - Updated dt-schema and fixed warnings (Rob)
> 
> Changes since v4:
>   - Fixed yaml binding to pass `make dt_binding_check dtbs_check`
>   and addressed received binding feedback (Rob)
> 
> Changes since v3:
>   - Added commit message (Neil)
>   - Converted to yaml format (Neil)
>   - Minor dt node + driver fixes (Rob)
>   - Added small panel example to the host controller binding
> 
> Changes since v2:
>   - Fixed commit tags (Emil)
> ---
>  .../display/imx/fsl,mipi-dsi-imx6.yaml        | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.6/dist-packages/dtschema/schemas/display/bridge/snps,dw-mipi-dsi.yaml'
Documentation/devicetree/bindings/Makefile:11: recipe for target 'Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dts] Error 255
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1274360

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
