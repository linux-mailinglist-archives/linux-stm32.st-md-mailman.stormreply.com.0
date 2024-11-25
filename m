Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 176AC9D935C
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 09:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DABBC78F6C;
	Tue, 26 Nov 2024 08:34:45 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90EDDC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 16:01:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A042DA4182A;
 Mon, 25 Nov 2024 15:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F267AC4CECE;
 Mon, 25 Nov 2024 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732550498;
 bh=TktsUwGeNhxSeHi0bdQOkR9d4PL26TzalaIYfQZs+o4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=aYqZLs9V5Pxn7mIDQ5JSas85KEi//yGTAKVknCvaz0D7gciR09Pvhjk/kdo8YTLg7
 yw1p7r2yI4yEmXdzv8CgDGoX187WTjrfLsunESoR4rfMUJGdi22W3qjaptiS5kiTM2
 wlvpCXqNp4sFtCKa03uGLsUP0zw91Vd1XT8Rwq1orgIOKcwZcH9lynO+5b1lZ4jsd+
 T3yVlX3WoRq86USUd1D0aqjkMIJV4kPc0kRkixUdWc9396mYbv6bNqZOMWNblTlQAd
 KRXEeb6MK4eCcxqLcpXQadelJTRvL9OuRPyOis5oP5UuFVPS/y80skLhNLYN0UCPWz
 pR2WSlqxE5v9w==
Message-ID: <1b1c0819f0a4ecafc13ed25c19e5d3d7@kernel.org>
Date: Mon, 25 Nov 2024 16:01:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sean Nyekjaer" <sean@geanix.com>
In-Reply-To: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:34:44 +0000
Cc: Maxime Ripard <mripard@kernel.org>, Simona
 Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Yannick
 Fertre <yannick.fertre@foss.st.com>, Samuel Holland <samuel@sholland.org>,
 Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David
 Airlie <airlied@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] drm/stm: dsi: use
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, 25 Nov 2024 14:49:28 +0100, Sean Nyekjaer wrote:
> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> to reguire the requested and the actual px clock to be within
> 50Hz. A typical LVDS display requires the px clock to be within +-10%.
> 
> In case for HDMI .5% tolerance is required.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
