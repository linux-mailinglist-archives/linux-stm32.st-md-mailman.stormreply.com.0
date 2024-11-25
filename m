Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0138C9D935A
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 09:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8186FC7803C;
	Tue, 26 Nov 2024 08:34:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E028C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 16:01:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97DB85C59CB;
 Mon, 25 Nov 2024 16:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C71C4CECE;
 Mon, 25 Nov 2024 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732550482;
 bh=nOc3Xy7mhkWTw8qDkGMCJ3rROD2LNWSCNirVNpiwODg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=frwUvWjAT86MGYDE31mxgujfkohr2ef3K4nhK2HbJuEEMJjrBbhwlO8jDeCeKBr+h
 C2hzW+jG/wlwKgJ2s7UIhxhWAWykVR4hNVemAuy2gBl1kXoUbjDTsPwpzomUIhZdLC
 eh2vMbpMyNeUbxSJWLX/tGjNTuSwFMyAT10TpsrRV/sYMSuNeqZ2e2iHcDGjYvkOgs
 K3rfy1A6NPtU0CO//OjJ59wRRitpAxEHDAcdAeMLwnlxQzUPfAZrqOkonRz41u0zU6
 oXVv78t0UQsZZMydobXwafUq03sY/4SG7BxHadCaevt9YMMDVpoLB2CKCu15OAsz04
 dcOi1kLNnMMJw==
Message-ID: <08f3944d0330d17984641bb2cb94fb88@kernel.org>
Date: Mon, 25 Nov 2024 16:01:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sean Nyekjaer" <sean@geanix.com>
In-Reply-To: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 2/3] drm/sun4i: use
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

On Mon, 25 Nov 2024 14:49:27 +0100, Sean Nyekjaer wrote:
> Use new helper function for HDMI mode validation
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
