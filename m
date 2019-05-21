Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B924EBB
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 14:15:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD70BC7A837
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 12:15:21 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C69ECC7A836
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 12:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1558440920; bh=VGlJ9wO7InEXoKlQsJrI3YYXQgBrZfsVum4dwV9O/qw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H8itSFBTgfJexSfOsuGiRevevVee8AWok+TNwvYGh7+dE1NYC7HRI8brRhf87wLga
 d9QkGESJyeoaSCyRYs3EQ2grPw+h1Uha56OooMFMOlk4Sm5xTp26Bz32P9/VowQFZP
 xDHQqFWmk/FSFXR/1nm1hEhj9MMSZ7GIUAjIabwA=
Date: Tue, 21 May 2019 14:15:19 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190521121519.k343dgv3cgpewjl2@core.my.home>
Mail-Followup-To: Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mark Rutland <mark.rutland@arm.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-6-megous@megous.com>
 <20190521114611.ylmbo2oqeanveil4@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521114611.ylmbo2oqeanveil4@flea>
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v5 5/6] drm: sun4i: Add support for
 enabling DDC I2C bus to sun8i_dw_hdmi glue
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

Hi Maxime,

On Tue, May 21, 2019 at 01:46:11PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Tue, May 21, 2019 at 01:50:08AM +0200, megous@megous.com wrote:
> > From: Ondrej Jirman <megous@megous.com>
> >
> > Orange Pi 3 board requires enabling a voltage shifting circuit via GPIO
> > for the DDC bus to be usable.
> >
> > Add support for hdmi-connector node's optional ddc-en-gpios property to
> > support this use case.
> >
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 55 +++++++++++++++++++++++++--
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |  3 ++
> >  2 files changed, 55 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > index 39d8509d96a0..59b81ba02d96 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > @@ -98,6 +98,30 @@ static u32 sun8i_dw_hdmi_find_possible_crtcs(struct drm_device *drm,
> >  	return crtcs;
> >  }
> >
> > +static int sun8i_dw_hdmi_find_connector_pdev(struct device *dev,
> > +					     struct platform_device **pdev_out)
> > +{
> > +	struct platform_device *pdev;
> > +	struct device_node *remote;
> > +
> > +	remote = of_graph_get_remote_node(dev->of_node, 1, -1);
> > +	if (!remote)
> > +		return -ENODEV;
> > +
> > +	if (!of_device_is_compatible(remote, "hdmi-connector")) {
> > +		of_node_put(remote);
> > +		return -ENODEV;
> > +	}
> > +
> > +	pdev = of_find_device_by_node(remote);
> > +	of_node_put(remote);
> > +	if (!pdev)
> > +		return -ENODEV;
> > +
> > +	*pdev_out = pdev;
> > +	return 0;
> > +}
> > +
> >  static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
> >  			      void *data)
> >  {
> > @@ -151,16 +175,29 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
> >  		return PTR_ERR(hdmi->regulator);
> >  	}
> >
> > +	ret = sun8i_dw_hdmi_find_connector_pdev(dev, &hdmi->connector_pdev);
> > +	if (!ret) {
> > +		hdmi->ddc_en = gpiod_get_optional(&hdmi->connector_pdev->dev,
> > +						  "ddc-en", GPIOD_OUT_HIGH);
> > +		if (IS_ERR(hdmi->ddc_en)) {
> > +			platform_device_put(hdmi->connector_pdev);
> > +			dev_err(dev, "Couldn't get ddc-en gpio\n");
> > +			return PTR_ERR(hdmi->ddc_en);
> > +		}
> > +	}
> > +
> >  	ret = regulator_enable(hdmi->regulator);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to enable regulator\n");
> > -		return ret;
> > +		goto err_unref_ddc_en;
> >  	}
> >
> > +	gpiod_set_value(hdmi->ddc_en, 1);
> > +
> 
> Do you really need this to be done all the time? I'm guessing you
> would only need this when running .get_modes, right?

I don't think it hurts anything. Enabled voltage shifting circuit doesn't
draw any current, unless DDC is actually transmitting data. On most boards
I'd imagine this circuit is always on anyway (Orange Pi 3 schematic even has
an option to tie this signal to VCC-IO instead of GPIO).

Schematic: https://megous.com/dl/tmp/bfcdd32d655aaa76.png

thank you and regards,
	o.

> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
