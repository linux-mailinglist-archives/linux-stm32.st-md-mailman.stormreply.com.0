Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161F9D935D
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 09:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2B82C78F80;
	Tue, 26 Nov 2024 08:34:45 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAAAEC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 07:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID; bh=R8NfXxb4+/NJAJ65Ze1umnCGTdbcdo4c6k5GC848Gkg=; b=dIZYjO
 vdy5KsYHNKWZSDRzJgTsSDHimEwTwgJjXzVJDkY68bwVV+NsHlQYh0vzsU7uI3gh8d+tGEx6cXzLd
 Zjlx4VB63hLPoWA9Cw+tBw2JZgJBI7XPx3ZAD3inl8+qSS7oVlirf/hM58vg7U9GrsPHyzXj5JV+V
 ht0X1SXl32OEUCTMVQuxhdXzrHBk3crlaX93EAtCqIqcW3hDtT/ueG1JYp7ziIEW4EbBoheIInrnJ
 aoY/dmYE1KD78F6yJkN5zkcpK8Ud/Yu5sDWQWeTzr9cq0VLNMZ3B/+G2fWQw6jINr3LLH93QI4iIL
 /EK62LIIyf+9Lv0fjyKWBKtfBLCA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1tFq78-00092F-UK; Tue, 26 Nov 2024 08:36:02 +0100
Received: from [185.17.218.86] (helo=Seans-MacBook-Pro.local)
 by sslproxy04.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1tFq77-000LDH-2a;
 Tue, 26 Nov 2024 08:36:01 +0100
Date: Tue, 26 Nov 2024 08:36:00 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27468/Mon Nov 25 10:36:56 2024)
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:34:44 +0000
Cc: Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] drm/modes: introduce
 drm_mode_validate_mode() helper function
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

On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
> Hi Sean,
> 
> On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
> > Check if the required pixel clock is in within .5% range of the
> > desired pixel clock.
> > This will match the requirement for HDMI where a .5% tolerance is allowed.
> > 
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> >  drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
> >  include/drm/drm_modes.h     |  2 ++
> >  2 files changed, 36 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4d977b297f5d5359 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
> >  }
> >  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
> >  
> > +/**
> > + * drm_mode_validate_mode
> > + * @mode: mode to check
> > + * @rounded_rate: output pixel clock
> > + *
> > + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> > + * CVT spec reuses that tolerance in its examples, so it looks to be a
> > + * good default tolerance for the EDID-based modes. Define it to 5 per
> > + * mille to avoid floating point operations.
> > + *
> > + * Returns:
> > + * The mode status
> > + */
> > +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
> > +					    unsigned long long rounded_rate)
> > +{
> > +	enum drm_mode_status status;
> > +	unsigned long long rate = mode->clock * 1000;
> > +	unsigned long long lowest, highest;
> > +
> > +	lowest = rate * (1000 - 5);
> > +	do_div(lowest, 1000);
> > +	if (rounded_rate < lowest)
> > +		return MODE_CLOCK_LOW;
> > +
> > +	highest = rate * (1000 + 5);
> > +	do_div(highest, 1000);
> > +	if (rounded_rate > highest)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	return MODE_OK;
> > +}
> > +EXPORT_SYMBOL(drm_mode_validate_mode);
> 
> Thanks a lot for doing that!
> 
> I wonder about the naming though (and prototype). I doesn't really
> validates a mode, but rather makes sure that a given rate is a good
> approximation of a pixel clock. So maybe something like
> drm_mode_check_pixel_clock?

Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.

Would it make sense to have the pixel clock requirement as a input
parameter? For HDMI it is 0.5% and in my case the LVDS panel 10%.

enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
					    unsigned long long rounded_rate, unsigned tolerance)
?

And maybe a drm_mode_validate_mode_hdmi() with the default tolerance of
.5%?
> 
> We probably need some kunit tests here too.

Good idea, will be my first :)

/Sean
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
