Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED58F8436C5
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 07:30:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C711C6B477;
	Wed, 31 Jan 2024 06:30:24 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5E0FC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 06:30:22 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-602c714bdbeso4794447b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 22:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706682621; x=1707287421;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XuBpfFrt6LIRFxGJEZUBYvlJzyC2OSdPPTTcyZFlpqs=;
 b=s1Em+psH2zw8Q1C16FysHqnQ+nRfEvpVrZzyQpUsp2Tuh5HJIVRvwqS4DAWM0/xMFj
 HgiCJJYXRNmX9tEZcAmkaopn1lHduM6upul8hma2hA9KPP1V2IQXFWMcENQBWBXw5sn6
 T17piskkuuGIMHmuJy5I17kULHqbsiE3UrvKikQReoYjngpUtJX/CX4y11s7D+zW1x9M
 uLqM2/O2ngrFw8Fk5ztTqsYinFZHSpKwKzkRStevuzIIu8psnsiak9k24ohALZZPEkGW
 F7hSd3Enm/3MgtZM+Iin2ja4x2hMirjhLPEyRNH7nidokJ6Qu7dm64b3PsrD6xFRcKNT
 rhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706682621; x=1707287421;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XuBpfFrt6LIRFxGJEZUBYvlJzyC2OSdPPTTcyZFlpqs=;
 b=vMOhwSYrMFeR0fXVcjst+pUruXKG6LnfpzS0TDZJRewoQUqZ+dNqjsXy7R3TUgXfOK
 eo0X9Y0acRxb983D2VLoHchQ+U83usLrT85a35E16ekclnBjtRCeO6MO4MMGCnjd4Iz/
 35bCC0Y6kMGN/0tOQ5qjse9pmPglDyOnqrwp4QvWdgkyU7G0NkxfPdQmd3zfYUZ9fqsF
 85GqSON3Yp7szk+il67at6cCx+XvZehXcsXAJ/q4kaYUMEyP36peK6EnAKGWFPQBPUr5
 k2kvf0xUVUvd4BsBAa1/HupZAdOH3tEafb/JqknCGifnw6yjUEhiMcc30UzXI+xhk/1C
 yM8Q==
X-Gm-Message-State: AOJu0YyXoZE5hlvfW4BAtNWThEBPG96El5StgZw/RHoIvyWGIuiB38Nd
 f52cCS4kJZywG2NRBNyIXraxspOA0/oo5CMBMNIcVKGLCbttMfmgpnXEyZ73165IcEB17yhzXIx
 TnqcMJVBdpCKiIrFxXvB9uOdMoQ4wfQ7/up6TYQ==
X-Google-Smtp-Source: AGHT+IFCSuHGBgOcgNRm+Jyx9Rk92WC70s7Qe1r45Ekea56q3x+YWZYnfOl+X2xsR2ea9MpX12ltkU9QLuvg4lUUs5g=
X-Received: by 2002:a81:6d16:0:b0:5ff:8152:64b with SMTP id
 i22-20020a816d16000000b005ff8152064bmr311187ywc.15.1706682621572; Tue, 30 Jan
 2024 22:30:21 -0800 (PST)
MIME-Version: 1.0
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 08:30:10 +0200
Message-ID: <CAA8EJpoRhS_yvJJUuC3YkWRAKT7e03k+-K=6QKfL_6TkB1XoxA@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 =?UTF-8?B?VXdlIEtsZWluZS1Lw4PCtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-omap@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, freedreno@lists.freedesktop.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, James Clark <james.clark@arm.com>,
 Saravana Kannan <saravanak@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Helge Deller <deller@gmx.de>, Alexey Brodkin <abrodkin@synopsys.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?Q?Niklas_S=C3=83=C2=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Harvey <tharvey@gateworks.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Emma Anholt <emma@anholt.net>,
 llvm@lists.linux.dev, Todor Tomov <todor.too@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, linux-sound@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Leo Yan <leo.yan@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 02/24] of: property: use unsigned int
	return on of_graph_get_endpoint_count()
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

On Wed, 31 Jan 2024 at 07:05, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> The return type and the variable of of_graph_get_endpoint_count()
> should be unsigned. Tidyup it.

'the variable'?

I'd have added a few words telling that return type can be unsigned
because there is no error reporting for this function.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 2 +-
>  include/linux/of_graph.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 4e879faa1710..25d73409aeee 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -817,7 +817,7 @@ EXPORT_SYMBOL(of_graph_get_remote_port);
>   *
>   * Return: count of endpoint of this device node
>   */
> -int of_graph_get_endpoint_count(const struct device_node *np)
> +unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>         struct device_node *endpoint;
>         int num = 0;
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 4d7756087b6b..a4bea62bfa29 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -41,7 +41,7 @@ struct of_endpoint {
>  bool of_graph_is_present(const struct device_node *node);
>  int of_graph_parse_endpoint(const struct device_node *node,
>                                 struct of_endpoint *endpoint);
> -int of_graph_get_endpoint_count(const struct device_node *np);
> +unsigned int of_graph_get_endpoint_count(const struct device_node *np);
>  struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
>  struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>                                         struct device_node *previous);
> @@ -68,7 +68,7 @@ static inline int of_graph_parse_endpoint(const struct device_node *node,
>         return -ENOSYS;
>  }
>
> -static inline int of_graph_get_endpoint_count(const struct device_node *np)
> +static inline unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>         return 0;
>  }
> --
> 2.25.1
>


--
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
