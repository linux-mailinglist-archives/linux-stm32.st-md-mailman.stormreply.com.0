Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 422525ADC44
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 02:19:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB95DC640F0;
	Tue,  6 Sep 2022 00:19:24 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F026C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 00:19:23 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id l65so9782801pfl.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 17:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=v4JA0M0hCIbFC7NXFN+IygsKVK4ZMU4qWYqYqoR4tJc=;
 b=fHHlrsomzS5RX1w3UIei5qFtxTClmy9iSQEvGb1yFamLQYZo+o6zDJ8zJUVbJLL82Y
 pkr7UJu0RGPOf+0J7r9ut0astM8MHGg1EaaL+qlGu/ue2aBOikrSmX+DoJq6OVnfYCTQ
 FMcozHAuaegI9kVFEFk5BCS8NUELgRVLurFlc4zQR+4mEluidRXNcvb1Uq6r9730CALq
 i+o2Z457eW9sgjxUmvKSOZs27VXpd+EYrVSuTXtKTDhoWiowlHQASX22DQpd3afScQaO
 NjyzcFcZoXy1i9cNJaiHRj8JaHrrDq+3JIoFmZc3azTXuJLuoblV3/wMiYnfYqdVD2x3
 dUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=v4JA0M0hCIbFC7NXFN+IygsKVK4ZMU4qWYqYqoR4tJc=;
 b=p/jqpXqdBbpmZ/UawyZY1EXPrmolyayRAnzY8CK3JI8iYiPxYUnLU8ypi77UssdgOg
 vanAPeBBE+UrYUHdFXGFERxdN2APqfFXnFc83wx6DjggQ2/6fBx2Zecd9KyC0ToQDHPH
 3ahd+mwSw6za2x3kBRUeuN5nvEKZIOPcgFQlW9LlPyWU6inMH8HUONXBAVz5NNcE5W3e
 0IvwB7tntINWYcdg3cv5z46JZ6s2Qt64Pswjnu6aqUEOLnR34beC1Cmjf6435WBaYFYK
 Xw24s0/ULbT6sdoTdPun5XUzi7Tm0B8Ogn+JEo75ogflMdtLC1hobEFWj0QoWagDCXqB
 X2Tg==
X-Gm-Message-State: ACgBeo12F2ShN72On1Zj2q6IBd2XXG+GQBS2vn6sN13r7pnFqWq/nX5q
 ZzwChjnBe2S3n3Olys24tvs=
X-Google-Smtp-Source: AA6agR6BSwkY2FCM/mxUqmLHetzPYwEnkn1n9g0P2sCyTVfQpw3+hUsDHc+Gpjiwldy8UpbPbUcIag==
X-Received: by 2002:aa7:88c8:0:b0:536:926:700f with SMTP id
 k8-20020aa788c8000000b005360926700fmr53349294pff.72.1662423561657; 
 Mon, 05 Sep 2022 17:19:21 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a624e0a000000b0053e156e9475sm431528pfb.182.2022.09.05.17.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 17:19:21 -0700 (PDT)
Date: Mon, 5 Sep 2022 17:19:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <YxaSBRkAG/hKjFol@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-7-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-7-b29adfb27a6c@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 07/11] PCI: apple: switch to using
 fwnode_gpiod_get_index()
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

On Sun, Sep 04, 2022 at 11:30:59PM -0700, Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a2c3c207a04b..d83817d3ff86 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -516,8 +516,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	u32 stat, idx;
>  	int ret, i;
>  
> -	reset = gpiod_get_from_of_node(np, "reset-gpios", 0,
> -				       GPIOD_OUT_LOW, "PERST#");
> +	reset = fwnode_gpiod_get_index(of_fwnode_handle(np),
> +				       "reset", 0, GPIOD_OUT_LOW, "PERST#");

Hmm, I am looking at the driver and it leaks the reset gpio on
unbind/unload. I guess it does not matter in practice, but still nice
not to leak. Thankfully it is easy to cure by switching to devm option:
devm_fwnode_gpiod_get().

I'll send and updated patch with a new justification.

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
