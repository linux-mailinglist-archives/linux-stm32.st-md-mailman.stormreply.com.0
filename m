Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ACE9D97EC
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 14:04:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EE27C78F83;
	Tue, 26 Nov 2024 13:04:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B95AC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732623870; x=1764159870;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZTHfXgFGRlIILfuHL+qBGlAm9C8PxmMo8Z9AFzfvBdw=;
 b=Wkdq7HCTuo/o/CGVflLZAMBb0tweK/9uFPlY45lkEkQcS12IbPRYFOGv
 9BOJRogdtMo41Nrli2SJnSeRKEyVUI/6k/cWObfvd169Ht+HYhqAIdcdT
 A+FppUGtfXbmpUxOb4tn3d8pScPw+5UfqnfoRJMwJsHm1K/I9xSn5a+HJ
 EImwoDLZXHMQ/qKpDYNrZn7U5BhEaLSzxCc6NLvXwwmiP15kWrRzSmfZk
 wryD9m4B8cApTM/bdTW3jFPLbcbg6tjQ6D/gAFbiLva7ewVCLka67+WZ0
 qwIHr/98ZeSY0+6A1lg/ljzBhD9pjI9/CAMPev9wyLQJVIz9slLbEJWNh w==;
X-CSE-ConnectionGUID: kCvaZts/RbWMrw9QnGNd3Q==
X-CSE-MsgGUID: 7/sh9zmAQ9iT9cqC67c62w==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="55278923"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="55278923"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 04:24:22 -0800
X-CSE-ConnectionGUID: p7mmBzIqQaSRBB7X5+uHcw==
X-CSE-MsgGUID: wzxtY/mSSE24Fp3vXFkb0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="96661073"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 04:24:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <874j3uxptp.fsf@intel.com>
 <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
Date: Tue, 26 Nov 2024 14:24:12 +0200
Message-ID: <871pyyxjwz.fsf@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 Nov 2024 13:04:30 +0000
Cc: Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Nyekjaer <sean@geanix.com>,
 David Airlie <airlied@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 26 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Nov 26, 2024 at 12:16:34PM +0200, Jani Nikula wrote:
>> On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> > I wonder about the naming though (and prototype). I doesn't really
>> > validates a mode, but rather makes sure that a given rate is a good
>> > approximation of a pixel clock. So maybe something like
>> > drm_mode_check_pixel_clock?
>> 
>> Quoting myself from a few weeks back:
>> 
>> """
>> Random programming thought of the day: "check" is generally a terrible
>> word in a function name.
>> 
>> Checking stuff is great, but what do you expect to happen if the check
>> passes/fails? Do you expect the function to return on fail, or throw an
>> exception? Or just log about it? If you return a value, what should the
>> return value mean? It's hard to know without looking it up.
>> 
>> Prefer predicates instead, is_stuff_okay() is better than
>> check_stuff(). Or assert_stuff() if you don't return on failures.
>> """
>
> Both is_stuff_okay() or assert_stuff() return a boolean in my mind. If
> you want to return a mode status enum, I don't think they are better
> names.

Most functions returning enum drm_mode_status are called
something_something_mode_valid(). Not check something.

BR,
Jani.


-- 
Jani Nikula, Intel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
