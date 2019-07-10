Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ABE64986
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2019 17:27:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8308ACDB63A
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2019 15:27:24 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF554CDB638
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2019 15:27:23 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id r12so2574595edo.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2019 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=SgkufzQSTv6apsZUdNJaHjQjszSiq6lRFJLPOSo/AdU=;
 b=MPgH/N4l+levG/VhKT8jjXObPZPdcPsPGW9l4OkxWmh5Mga2fY36xiK9/aWYGSDWoA
 bZRJFhK/XNZzPxm2cB6rV9EN2rfyFht230HqwAoiyw113/16g8xpwbQ4NmZqP/eQrGRT
 eHf2BSBk83dh088+VhXnml/jxzrTjM1zMyJMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=SgkufzQSTv6apsZUdNJaHjQjszSiq6lRFJLPOSo/AdU=;
 b=otOWzaB7nnsC+WmJJViS6oGKw6Y1VnWSiQ3RsyGpM8XykojAm8itC+bedXrJB7oBAp
 kXG66Bm0fH5s/DgI1bU63djHEQfAKWfoi+rc9vFBGHMbsnmv8NE9hSuVWjRfMX2ID0a1
 br2xbGm8qMuOtLXttVf+gA548S0EzFLMmBOgLoNovfE0jvLoGY+pCbbXl27YfrIDl2CG
 uDA4Zba0yROokha1Ran/BmqqPJeV/8FTYpYDVqhMv/U0ZxKpNh1A+68oiYLKS1T/0l8/
 zKn47JCweVi13p40szUDSunxW4nmxDDhKwWzteC2KHt4j5OvQpOZjkQI4Vbr0Z5NqElE
 +hXg==
X-Gm-Message-State: APjAAAUN5YC3jd6GHKeKd632WnU7dQHPl1GpYngtO1+Ny5qkQY0xFszJ
 iIdZe4+eKKoDtvWN3f8X4JAsBw==
X-Google-Smtp-Source: APXvYqxigJ129/HrafCJTtiUL+NQg3j1KH4mPx69jB2LtBZDhrvgMPNuqQpiv9e5nrCEaY/ZCC3gxA==
X-Received: by 2002:a17:906:12d7:: with SMTP id
 l23mr26929442ejb.282.1562772443347; 
 Wed, 10 Jul 2019 08:27:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q50sm811398edd.91.2019.07.10.08.27.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:27:22 -0700 (PDT)
Date: Wed, 10 Jul 2019 17:27:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Philippe CORNU <philippe.cornu@st.com>
Message-ID: <20190710152720.GR15868@phenom.ffwll.local>
Mail-Followup-To: Philippe CORNU <philippe.cornu@st.com>,
 Olivier MOYSAN <olivier.moysan@st.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "jsarha@ti.com" <jsarha@ti.com>
References: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
 <7c17b3f2-afee-7548-7620-b67d11d09b24@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c17b3f2-afee-7548-7620-b67d11d09b24@st.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "airlied@linux.ie" <airlied@linux.ie>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "jsarha@ti.com" <jsarha@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/bridge: sii902x: add audio graph card
	support
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

On Fri, Jul 05, 2019 at 12:41:03PM +0000, Philippe CORNU wrote:
> Hi Olivier,
> and many thanks for your patch.
> Good to have the audio graph card support, looks ok.
> Reviewed-by: Philippe Cornu <philippe.cornu@st.com>

Since you have drm-misc commit rights I'm assuming you're going to push
this too. Correct?
-Daniel

> Philippe :-)
> 
> On 7/3/19 10:04 AM, Olivier Moysan wrote:
> > Implement get_dai_id callback of audio HDMI codec
> > to support ASoC audio graph card.
> > HDMI audio output has to be connected to sii902x port 3.
> > get_dai_id callback maps this port to ASoC DAI index 0.
> > 
> > Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> > ---
> >   drivers/gpu/drm/bridge/sii902x.c | 23 +++++++++++++++++++++++
> >   1 file changed, 23 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> > index dd7aa466b280..daf9ef3cd817 100644
> > --- a/drivers/gpu/drm/bridge/sii902x.c
> > +++ b/drivers/gpu/drm/bridge/sii902x.c
> > @@ -158,6 +158,8 @@
> >   
> >   #define SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS	500
> >   
> > +#define SII902X_AUDIO_PORT_INDEX		3
> > +
> >   struct sii902x {
> >   	struct i2c_client *i2c;
> >   	struct regmap *regmap;
> > @@ -690,11 +692,32 @@ static int sii902x_audio_get_eld(struct device *dev, void *data,
> >   	return 0;
> >   }
> >   
> > +static int sii902x_audio_get_dai_id(struct snd_soc_component *component,
> > +				    struct device_node *endpoint)
> > +{
> > +	struct of_endpoint of_ep;
> > +	int ret;
> > +
> > +	ret = of_graph_parse_endpoint(endpoint, &of_ep);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * HDMI sound should be located at reg = <3>
> > +	 * Return expected DAI index 0.
> > +	 */
> > +	if (of_ep.port == SII902X_AUDIO_PORT_INDEX)
> > +		return 0;
> > +
> > +	return -EINVAL;
> > +}
> > +
> >   static const struct hdmi_codec_ops sii902x_audio_codec_ops = {
> >   	.hw_params = sii902x_audio_hw_params,
> >   	.audio_shutdown = sii902x_audio_shutdown,
> >   	.digital_mute = sii902x_audio_digital_mute,
> >   	.get_eld = sii902x_audio_get_eld,
> > +	.get_dai_id = sii902x_audio_get_dai_id,
> >   };
> >   
> >   static int sii902x_audio_codec_init(struct sii902x *sii902x,
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
