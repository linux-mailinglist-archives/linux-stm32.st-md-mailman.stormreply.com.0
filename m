Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ADF3B2F22
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 14:36:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D32FC57196;
	Thu, 24 Jun 2021 12:36:57 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2166DC5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 12:36:54 +0000 (UTC)
IronPort-SDR: qDQTyqA8LLnw0bdZPujDw7xaYq8uSjS5om1MRJr7gm9C/DKBqeGJMx2EkBMr1AzdJGMPw4Ayt1
 Uq6a6dmyDF6g==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207397094"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="207397094"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 05:36:52 -0700
IronPort-SDR: 9KysYK/2HzWxqWorwm4RDCvD9fzYUECjO+Kr/55Zbl/DRmlbCimO4edKqAHIWPRoPcJqgJVxQB
 +d0WGJ9B4vNg==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="487740905"
Received: from schulke-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.242])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 05:36:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YNR0m2DJsdIW3NAZ@orome.fritz.box>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com>
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de> <877dijtzl2.fsf@intel.com>
 <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
 <YNR0m2DJsdIW3NAZ@orome.fritz.box>
Date: Thu, 24 Jun 2021 15:36:24 +0300
Message-ID: <87zgvfsalz.fsf@intel.com>
MIME-Version: 1.0
Cc: hamohammed.sa@gmail.com, heiko@sntech.de, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, liviu.dudau@arm.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, melissa.srw@gmail.com, linux-tegra@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 linux@armlinux.org.uk, mihail.atanassov@arm.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, krzysztof.kozlowski@canonical.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wens@csie.org, jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-graphics-maintainer@vmware.com,
 intel-gfx@lists.freedesktop.org, bskeggs@redhat.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 rodrigosiqueiramelo@gmail.com, john.stultz@linaro.org,
 laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com, tomba@kernel.org,
 jyri.sarha@iki.fi, yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, christian.koenig@amd.com,
 linux-sunxi@lists.linux.dev, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, tiantao6@hisilicon.com, shawnguo@kernel.org,
 brian.starkey@arm.com, zackr@vmware.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 04/27] drm: Don't test for IRQ support
	in VBLANK ioctls
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

On Thu, 24 Jun 2021, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Jun 24, 2021 at 11:07:57AM +0200, Thomas Zimmermann wrote:
>> Hi
>> 
>> Am 24.06.21 um 10:51 schrieb Jani Nikula:
>> > On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> > > Hi
>> > > 
>> > > Am 24.06.21 um 10:06 schrieb Jani Nikula:
>> > > > On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> > > > > index 3417e1ac7918..10fe16bafcb6 100644
>> > > > > --- a/drivers/gpu/drm/drm_vblank.c
>> > > > > +++ b/drivers/gpu/drm/drm_vblank.c
>> > > > > @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>> > > > >    	unsigned int pipe_index;
>> > > > >    	unsigned int flags, pipe, high_pipe;
>> > > > > -	if (!dev->irq_enabled)
>> > > > > -		return -EOPNOTSUPP;
>> > > > > +#if defined(CONFIG_DRM_LEGACY)
>> > > > > +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
>> > > > > +		if (!dev->irq_enabled)
>> > > > > +			return -EOPNOTSUPP;
>> > > > > +	} else /* if DRIVER_MODESET */
>> > > > > +#endif
>> > > > > +	{
>> > > > > +		if (!drm_dev_has_vblank(dev))
>> > > > > +			return -EOPNOTSUPP;
>> > > > > +	}
>> > > > 
>> > > > Sheesh I hate this kind of inline #ifdefs.
>> > > > 
>> > > > Two alternate suggestions that I believe should be as just efficient:
>> > > 
>> > > Or how about:
>> > > 
>> > > static bool drm_wait_vblank_supported(struct drm_device *dev)
>> > > 
>> > > {
>> > > 
>> > > if defined(CONFIG_DRM_LEGACY)
>> > > 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>> > > 
>> > > 		return dev->irq_enabled;
>> > > 
>> > > #endif
>> > > 	return drm_dev_has_vblank(dev);
>> > > 
>> > > }
>> > > 
>> > > 
>> > > ?
>> > > 
>> > > It's inline, but still readable.
>> > 
>> > It's definitely better than the original, but it's unclear to me why
>> > you'd prefer this over option 2) below. I guess the only reason I can
>> > think of is emphasizing the conditional compilation. However,
>> > IS_ENABLED() is widely used in this manner specifically to avoid inline
>> > #if, and the compiler optimizes it away.
>> 
>> It's simply more readable to me as the condition is simpler. But option 2 is
>> also ok.
>
> Perhaps do something like this, then:
>
> 	if (IS_ENABLED(CONFIG_DRM_LEGACY)) {
> 		if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
> 			return dev->irq_enabled;
> 	}
>
> 	return drm_dev_has_vblank(dev);
>
> That's about just as readable as the variant involving the preprocessor
> but has all the benefits of not using the preprocessor.

Looks like a winner to me. :)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
