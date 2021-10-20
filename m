Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D098434617
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Oct 2021 09:45:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB2A3C5C856;
	Wed, 20 Oct 2021 07:45:29 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3467C5C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Oct 2021 07:45:28 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CCC1140019
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Oct 2021 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634715923;
 bh=hn4G6B24NKuuI7XYmyB2qc+VHWq7V63yNRCu8uWR8QM=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=s8/qFgWZ8hEhHu89p0Ui5CDjoNfz79cOLyu8g5XWRgJBlUTqSbNrzeeasiiTNaTXn
 /rFDdpD7KguNqUk4dky1zpEDaZLGxsKfS+d8DWMzUnVXsLXRhxt5k6SYofjG4+SIGQ
 qHjOESKAoshIVXiTUuBob2uKBffH7xxx4mpq+w8A15a7nZX7ucDzxEae3BffxBLZiw
 Z1mJoFsSRaIrXhePe1hMhgcMq06YdW9bUHwmx7aLSZkksH+j6Fc2l9ucvdBMTMnHFE
 80XAory+VzyOPd0vKd7C9E9/tqGSLYQ2niKrK7uhzAQI4W2Cjwyy2AD8M4SrWqFoab
 OI29Iy4JAtHMQ==
Received: by mail-wm1-f70.google.com with SMTP id
 c5-20020a05600c0ac500b0030dba7cafc9so3723489wmr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Oct 2021 00:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hn4G6B24NKuuI7XYmyB2qc+VHWq7V63yNRCu8uWR8QM=;
 b=ZDujm987sf4457zylwxa7hvWFD/hbo0oVrTlIkDpSXZU1tcsuF1+NHeZMgCMgveNXa
 TZf8f5mcVgQNw7RNj+FxYquLWfZZ0X+jzSZcDijQgqsXOZ2aMLs9nYzQytkn0mf/NRXl
 M/P00BH4kU48ucC9WrnqgOcpSBsL81Ix0BkgF3RjQXuoEVVFnbiy9XHk81fVcg8UL+D3
 lodBxMpCVTVxqxfXYJ7+VNxZNWqNFlJx1OLeT7EQgwBYJzuMhqiMEuiL1/NCDaKZDR1W
 Rs0cOOJbn8vhhvughpp64qn26OFbDZ5MT5ChdYeTHOnqScimnY2/fJmyIITYbOpRxT1H
 +c+A==
X-Gm-Message-State: AOAM530hUnHGD6KWhnLZrmjh5cAX2mj6+mhy+2f3Dcz8eXq5+IpJ3dNj
 4/EX31yJwqM0qzJUk91EcKvpPlW4gex3jCzdq6lYXwTDzK1nPkY0Ks9ye1sS0gutpQVQpdnF6i2
 cmyHbgUI3GLzAyfsbBE9pgZCSh0i666FKLQRxe+oZdWbTFxJ/BxiS/4ve1w==
X-Received: by 2002:a05:651c:10ac:: with SMTP id
 k12mr11579132ljn.296.1634715906831; 
 Wed, 20 Oct 2021 00:45:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylw2trvF0ZXu7khnQZx/gnaE1TXWFJT87p6K5VtMB66Foj+aVE5ln4wd6dcSv0cFlFYuFolg==
X-Received: by 2002:a05:651c:10ac:: with SMTP id
 k12mr11579071ljn.296.1634715906590; 
 Wed, 20 Oct 2021 00:45:06 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id s10sm127484lfr.172.2021.10.20.00.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 00:45:06 -0700 (PDT)
To: patrice.chotard@foss.st.com, Rob Herring <robh+dt@kernel.org>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 michael turquette <mturquette@baylibre.com>, stephen boyd
 <sboyd@kernel.org>, herbert xu <herbert@gondor.apana.org.au>,
 "david s . miller" <davem@davemloft.net>, david airlie <airlied@linux.ie>,
 daniel vetter <daniel@ffwll.ch>, thierry reding <thierry.reding@gmail.com>,
 sam ravnborg <sam@ravnborg.org>, yannick fertre
 <yannick.fertre@foss.st.com>, philippe cornu <philippe.cornu@foss.st.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 vinod koul <vkoul@kernel.org>, ohad ben-cohen <ohad@wizery.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 baolin wang <baolin.wang7@gmail.com>, jonathan cameron <jic23@kernel.org>,
 lars-peter clausen <lars@metafoo.de>,
 olivier moysan <olivier.moysan@foss.st.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Matt Mackall
 <mpm@selenic.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dillon min
 <dillon.minfei@gmail.com>, Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 pascal Paillet <p.paillet@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Le Ray <erwan.leray@foss.st.com>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
Date: Wed, 20 Oct 2021 09:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020065000.21312-1-patrice.chotard@foss.st.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] dt-bindings: treewide: Update @st.com email
 address to @foss.st.com
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

On 20/10/2021 08:50, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Not all @st.com email address are concerned, only people who have
> a specific @foss.st.com email will see their entry updated.
> For some people, who left the company, remove their email.
> 

Please split simple address change from maintainer updates (removal,
addition).

Also would be nice to see here explained *why* are you doing this.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
