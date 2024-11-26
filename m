Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7749D97EA
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 14:04:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 926CEC78F80;
	Tue, 26 Nov 2024 13:04:31 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72754C7801B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID; bh=fPHzRXhcBL/qtJnpL3/OZFvPlNjRqASdJESrY85bw0I=; b=DhRRFc
 UN0xzU37DjRn1oU1/gBRd8wRXM6sWuUQ0DOLtuxsBOJutpFh4jEMe1pGznBXLYshoP1OFLPXaAxfK
 tOe7gRdfCFMJexnjnWTA5OH9WvOvcn/Mos8jRMj+F5L4WzmO2Ri0s8tNsxmsNWLhHAtBKVbBBJ4vT
 TpS+kja1I3YwoflDtW9oX1PpJJRUyd8nnuoEApLCiFAp8c2bovd8TWdFTmTV2z/mTmBPLGIx03izF
 1qh+GrZRK5ticDbiOxOM+wmwjZL/LuRgYVZQN8vbEyEbNW5qaaOlGUWuH/ORlQ0IvgQVjikK/zK/w
 mDUNpa3wpkajpiu2lfMnOLvOljhA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1tFuPu-000FS1-0K; Tue, 26 Nov 2024 13:11:42 +0100
Received: from [185.17.218.86] (helo=Seans-MacBook-Pro.local)
 by sslproxy06.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1tFuPs-000LCg-30;
 Tue, 26 Nov 2024 13:11:40 +0100
Date: Tue, 26 Nov 2024 13:11:40 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <ycvevzp46wv4hr6ktexxjkpifav3wi4glat4a5jagghclcpagb@3jpiyehl2fn7>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
 <20241126-refreshing-slick-pig-baebab@houat>
 <zmrcuqiyz5gojhusysy7cytluedslqmfgzuslutqeg65iv7ju6@bggk7qbm6eas>
 <20241126-observant-coyote-of-glee-3b94dd@houat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126-observant-coyote-of-glee-3b94dd@houat>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27469/Tue Nov 26 10:58:20 2024)
X-Mailman-Approved-At: Tue, 26 Nov 2024 13:04:30 +0000
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

On Tue, Nov 26, 2024 at 01:09:10PM +0100, Maxime Ripard wrote:
> On Tue, Nov 26, 2024 at 12:34:26PM +0100, Sean Nyekjaer wrote:
> > Hi,
> > 
> > On Tue, Nov 26, 2024 at 09:38:55AM +0100, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Tue, Nov 26, 2024 at 08:36:00AM +0100, Sean Nyekjaer wrote:
> > > > On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
> > > > > On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:

[...]

> > > > > 
> > > > > Thanks a lot for doing that!
> > > > > 
> > > > > I wonder about the naming though (and prototype). I doesn't really
> > > > > validates a mode, but rather makes sure that a given rate is a good
> > > > > approximation of a pixel clock. So maybe something like
> > > > > drm_mode_check_pixel_clock?
> > > > 
> > > > Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.
> > > > 
> > > > Would it make sense to have the pixel clock requirement as a input
> > > > parameter? For HDMI it is 0.5%
> > > 
> > > This code was only used for panels so far. It reuses the same tolerance
> > > than HDMI because we couldn't come up with anything better, but it
> > > should totally apply to other things.
> > > 
> > > > and in my case the LVDS panel 10%.
> > > 
> > > 10% is a lot, and I'm not sure we'll want that. The framerate being
> > > anywhere between 54 and 66 fps will trip a lot of applications too.
> > > 
> > > Why do you need such a big tolerance?
> > 
> > I don't need it, it was just from the datasheet for the LVDS panel :)
> 
> So you mean the panel accepts a pixel clock within +/- 10%?

Yes :)

> 
> That makes sense, but then we should also adjust the mode timings to
> match so we still keep 60fps. There's much more to *that* than the
> helpers you try to create though, so let's keep it aside for now.

Ok

> 
> Maxime

/Sean
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
