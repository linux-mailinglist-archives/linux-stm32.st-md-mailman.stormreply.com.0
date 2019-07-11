Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4CB65473
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 12:25:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD0F4D1FD13
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 10:25:30 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 205D6D1FD12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 10:25:30 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id r12so5253611edo.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7U2G4EIDTohj4GLJBc1CsAdYb3Srm8+cHCV4KhEDuP0=;
 b=WheCH8IDb1xLjYRkQ1wHhqBOQvwu9yadLjHXO+2GvTWatmnx3ohVHucMEFlWsb327e
 8oBL/JN3VnzQDpfznayYp5BYRXFtNz+qzfi7kDxf+viYPUc2s5/GMiZFA6C2e95tFaaH
 5eYJT5wwV5q1SpRg5tWMqZl9lM/DrKXjd8GJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=7U2G4EIDTohj4GLJBc1CsAdYb3Srm8+cHCV4KhEDuP0=;
 b=sSoKtahLD1M1JTkxNIzNsKcRctpJynmzvZZANrj0chITq+lA8FgtAnsX6boQiWoEEr
 wQz+7NPQzsmcTEqEJQ0gQA/TAP0ikykGNLb7zur7DDadBLZ0BjITjge2fux+OET6gFW6
 vH7NHnU0QDzxvyv2UNOVwZqYS/udO/1xN4NhQMjbaJlL/5SHa5je0TU5YkW5jxYyIEBa
 d6rdrRA+z+edlYADRwGCI3eq4FPCuyYOWoTAxjpR/rFD7e0UqwwtXg380y/1+q1JS7E5
 BUMdIVjmcQmdM0CoUd9NPgY1lkudiofD9z4wYNmwjD5q0B2+coPlwmHuCvKFwM5ADLG8
 Ip3Q==
X-Gm-Message-State: APjAAAX/TFZ6tNIUULalkJqfDbWFb3ayoAnIBs+THjV0CJeWlC5CEA44
 dv9hxT3xlQ85HNz8KpYyIcQ=
X-Google-Smtp-Source: APXvYqzOdFxx7QODvOuCnqI1mfdfr7m02Yx0mnJ15UPVOkEHhP7boRm7tJmqJjhEcUWKcHsDYq9N6A==
X-Received: by 2002:aa7:cd17:: with SMTP id b23mr2648368edw.278.1562840729665; 
 Thu, 11 Jul 2019 03:25:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y3sm1436461edr.27.2019.07.11.03.25.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 03:25:28 -0700 (PDT)
Date: Thu, 11 Jul 2019 12:25:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Philippe CORNU <philippe.cornu@st.com>
Message-ID: <20190711102526.GK15868@phenom.ffwll.local>
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
 <20190710152720.GR15868@phenom.ffwll.local>
 <e29c1671-99fb-581d-bfb7-61ca2cfa8622@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e29c1671-99fb-581d-bfb7-61ca2cfa8622@st.com>
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

On Thu, Jul 11, 2019 at 09:27:30AM +0000, Philippe CORNU wrote:
> Hi Daniel,
> 
> 
> On 7/10/19 5:27 PM, Daniel Vetter wrote:
> > On Fri, Jul 05, 2019 at 12:41:03PM +0000, Philippe CORNU wrote:
> >> Hi Olivier,
> >> and many thanks for your patch.
> >> Good to have the audio graph card support, looks ok.
> >> Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
> > 
> > Since you have drm-misc commit rights I'm assuming you're going to push
> > this too. Correct?
> 
> Regarding this patch in particular, there is still missing an acked-by 
> from a "bridge" maintainer. Also it could be nice to wait for the 
> reviewed-by from Jiry as it knows well this sii driver and sent recently 
> good patches on it (already merged).

The bridge maintainer is looking for new bridge maintainers (atm we have
only one, defacto), so for bridge driver patches I really don't think it's
a good idea to gate on that single bottle-neck. Infrastructure is a bit a
different thing.

> With that, Benjamin or I (or a bridge maintainer) can push this patch + 
> the serie named "drm/bridge: sii902x: fix audio mclk management" as I 
> think it is better to push this serie *before* this patch.

Wahtever you feel like, just wanted to make sure you're not stuck
twiddling thumbs. The entire point of drm-misc is to facility mesh review
and maintainership, because the strict hierarchy just doesn't work for
smaller things. Exactly because you're always blocked on a bottleneck
somewhere.
-Daniel

> 
> Thanks,
> Philippe :-)
> 
> 
> >> Philippe :-)
> >>
> >> On 7/3/19 10:04 AM, Olivier Moysan wrote:
> >>> Implement get_dai_id callback of audio HDMI codec
> >>> to support ASoC audio graph card.
> >>> HDMI audio output has to be connected to sii902x port 3.
> >>> get_dai_id callback maps this port to ASoC DAI index 0.
> >>>
> >>> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> >>> ---
> >>>    drivers/gpu/drm/bridge/sii902x.c | 23 +++++++++++++++++++++++
> >>>    1 file changed, 23 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> >>> index dd7aa466b280..daf9ef3cd817 100644
> >>> --- a/drivers/gpu/drm/bridge/sii902x.c
> >>> +++ b/drivers/gpu/drm/bridge/sii902x.c
> >>> @@ -158,6 +158,8 @@
> >>>    
> >>>    #define SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS	500
> >>>    
> >>> +#define SII902X_AUDIO_PORT_INDEX		3
> >>> +
> >>>    struct sii902x {
> >>>    	struct i2c_client *i2c;
> >>>    	struct regmap *regmap;
> >>> @@ -690,11 +692,32 @@ static int sii902x_audio_get_eld(struct device *dev, void *data,
> >>>    	return 0;
> >>>    }
> >>>    
> >>> +static int sii902x_audio_get_dai_id(struct snd_soc_component *component,
> >>> +				    struct device_node *endpoint)
> >>> +{
> >>> +	struct of_endpoint of_ep;
> >>> +	int ret;
> >>> +
> >>> +	ret = of_graph_parse_endpoint(endpoint, &of_ep);
> >>> +	if (ret < 0)
> >>> +		return ret;
> >>> +
> >>> +	/*
> >>> +	 * HDMI sound should be located at reg = <3>
> >>> +	 * Return expected DAI index 0.
> >>> +	 */
> >>> +	if (of_ep.port == SII902X_AUDIO_PORT_INDEX)
> >>> +		return 0;
> >>> +
> >>> +	return -EINVAL;
> >>> +}
> >>> +
> >>>    static const struct hdmi_codec_ops sii902x_audio_codec_ops = {
> >>>    	.hw_params = sii902x_audio_hw_params,
> >>>    	.audio_shutdown = sii902x_audio_shutdown,
> >>>    	.digital_mute = sii902x_audio_digital_mute,
> >>>    	.get_eld = sii902x_audio_get_eld,
> >>> +	.get_dai_id = sii902x_audio_get_dai_id,
> >>>    };
> >>>    
> >>>    static int sii902x_audio_codec_init(struct sii902x *sii902x,
> >>>
> > 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
