Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E855E5E3
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 18:17:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0905EC5F1EF;
	Tue, 28 Jun 2022 16:17:04 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15044C5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 16:17:01 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id g4so11506983ybg.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+P6wSeN2x0ZvD2/JjzHKyqS9/n/5A6tY5jiA6Lhnb8=;
 b=svPPiUXmjLu4A2+b3rJgoCqrzxWVmAH7KXTvVP4AwaLTDrIN9AN3BtNG2XiV2ycJ8x
 6Y9oMX5BQlCl6K+KL9J1KxqNRcb1MdTb/c18nJgwvmc5rVyOe8EKUyj+KrCbNC70iJoL
 OlJOsi9x5Scvw9W8cP8d/OYBAk6luTiA/PE8w/jzj7tOJ+ICpHFzyCnfh2xqrRn3YVLo
 nvgpT4pJzONw4hikJOgq/y8DRHjrG2lOfrc2hEWRc02ovhuxlfgkK9/gOnTwVGME5DOU
 4AXMX65QfUYiz76GEkrT/465op3M51kj45IkhJmeQobRe1+J32FVHZumFFaJBd9Gan88
 /wYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+P6wSeN2x0ZvD2/JjzHKyqS9/n/5A6tY5jiA6Lhnb8=;
 b=x/1w23KDzRJlI9RS3Y4n7A1+u3Pw4MafavGRd3IZoRyP5J1yWQOfu9/q07PYArOg/Q
 vekGisr/lqwWQFpzUFMedDwg6llpdZpGmELDSjNlu9z4Ruse9/Y9FJsy3lNZ3SPAz/R2
 PFPpt1msA8t+GwmCmnDt2vZ9T50skfU1u5/+v4iWyNiRN6FhgTqOVZ3c3fbiqeyreCfS
 vQ+dWBkRRdLrs9ALO6gxMxgROQ2tgNlPLTXLZI+xqpIcHpkSfXx9zAVsc9ma/I0XLC1y
 FrD7DTfQ8PaOLTW4UVtWhfvYKG4BewlJIj/TfDnZ1uFCxZbJbeeujUsBgHGTa3F0bhvM
 rAbg==
X-Gm-Message-State: AJIora+STtXl7g29Aq0phx/WmmenecCai6et+/JTpEoSPn/6MCIMf40m
 vZhhW4bzbx6PQCHkfQrFAt4uui6cWn7bUMMgKfSLfA==
X-Google-Smtp-Source: AGRyM1vHa4WRnJlk4sln0xuJGdVhcpu8QS15R2N9PrbVvkglI7Nzwr0PBFdp1lTun6HJ/nUSS1O/TmeoEjFZPidRK0U=
X-Received: by 2002:a25:5bc3:0:b0:669:b722:beb8 with SMTP id
 p186-20020a255bc3000000b00669b722beb8mr20258885ybb.447.1656433020483; Tue, 28
 Jun 2022 09:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220628020110.1601693-1-saravanak@google.com>
 <20220628020110.1601693-3-saravanak@google.com>
 <20220628140025.qpom64ptru4ub6fu@distanz.ch>
In-Reply-To: <20220628140025.qpom64ptru4ub6fu@distanz.ch>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 28 Jun 2022 09:16:24 -0700
Message-ID: <CAGETcx_7jS3H2cphiXdk=NBfmuPzsusEwPBx75n3PrP6YTnjnA@mail.gmail.com>
To: Tobias Klauser <tklauser@distanz.ch>
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@xilinx.com>,
 Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 sascha hauer <sha@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>,
 linux-mips@vger.kernel.org, kernel-team@android.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andreas Farber <afaerber@suse.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>,
 heiner kallweit <hkallweit1@gmail.com>, ulf hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>,
 linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>,
 kevin hilman <khilman@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 paolo abeni <pabeni@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org,
 Timur Tabi <timur@kernel.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
 iommu@lists.linux-foundation.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Baruch Siach <baruch@tkos.co.il>, Liviu Dudau <liviu.dudau@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, joerg roedel <joro@8bytes.org>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, jakub kicinski <kuba@kernel.org>,
 will deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>, netdev@vger.kernel.org,
 david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] serial: Set probe_no_timeout for
	all DT based drivers
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

On Tue, Jun 28, 2022 at 7:00 AM Tobias Klauser <tklauser@distanz.ch> wrote:
>
> On 2022-06-28 at 04:01:03 +0200, Saravana Kannan <saravanak@google.com> wrote:
> > diff --git a/drivers/tty/serial/8250/8250_acorn.c b/drivers/tty/serial/8250/8250_acorn.c
> > index 758c4aa203ab..5a6f2f67de4f 100644
> > --- a/drivers/tty/serial/8250/8250_acorn.c
> > +++ b/drivers/tty/serial/8250/8250_acorn.c
> > @@ -114,7 +114,6 @@ static const struct ecard_id serial_cids[] = {
> >  static struct ecard_driver serial_card_driver = {
> >       .probe          = serial_card_probe,
> >       .remove         = serial_card_remove,
> > -     .id_table       = serial_cids,
>
> Is this change intentional? All other drivers are only changed to set
> .probe_no_time and I don't see anything mentioned in the commit message
> re. this driver's change.

No, that's a mistake. Thanks for catching it! I'll check this patch again.

-Saravana
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
