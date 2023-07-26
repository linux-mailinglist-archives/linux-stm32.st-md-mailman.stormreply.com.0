Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBA3762935
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 05:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E7B7C6A61A;
	Wed, 26 Jul 2023 03:22:59 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26B0EC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 03:22:58 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-78706966220so53146139f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 20:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690341777; x=1690946577;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NL3EuYyvjjhZCYD78dzuWYzAA4q7ImU5255kcivdAlA=;
 b=YrDQVT3n1O3EiYwvIGJo9jid1fKsLNw2s5BtVJ5JvGxYyPR1XjrUtnjfk86ybuDqvD
 mjkbbUuyR5VaB9rjSCR72ECLkPoHrMLk2ceMPKchY63bLMTQ0uCFoaZDI1rHSRdcZkBa
 Rj4LJYewPahFgAw+IE0I66Qm8T3wULByAcoETQYDq8VJzatnTf4P27YEUdI0SknFz3lz
 XEQP6TM/KY0h1JyYR68C89+l8h3L8U59mSzM8/oIOIzhC7QsCaK/HqQy8I1TjSgmiW8m
 rYeskGDA9hosrrCFYfjvbKnf/0CWiTVMAuWvQE8UyAnzJLx1bvG10rIKl4kTIK4KL4+E
 i4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690341777; x=1690946577;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NL3EuYyvjjhZCYD78dzuWYzAA4q7ImU5255kcivdAlA=;
 b=eYxHeefDGRXOJkbWKqMrBrSnTJen3epVgK4jCS8zkYVrKMcrrbXoJpTUWyjQr+3Rw/
 9grpRc/pV0PFOr7KwuSkpTV4zTRwZwlxyR8k3oo4x5op5Bg69//px+f9DUkuf5ess+L0
 UEYeytwMr5bVStVf+yL5SmgnT7oXuaq7FeJtwEIiKBg8ga75RD+cYJnWJiBtILocmqgU
 46eX4pCH602jjJMx/7XvlloHfnJEPR1J7GnK5XIEA7rHctavh63paghbytEVy0JSlYeE
 u23+c38x/r4hHF0/Tnz3I01rPeQjoj+a/XKiWRRawmpv60ruoa27AZxs2g3VkymCoy6x
 FvBw==
X-Gm-Message-State: ABy/qLbjPZII4Xr6KFxGfz3u/36cGRHyLE3H+lQ0ukvOEn3S9QzLdhel
 4GTSga1VpfTghYFPXel9VFhDKOWezMY=
X-Google-Smtp-Source: APBJJlH6yBw+cvBcbmXyvs1PZzwvZEc6/RU38mhLvcrD3wYRbKLXGce0SxktHOdc8rnQsf8pyEfhoA==
X-Received: by 2002:a6b:1446:0:b0:77a:ee79:652 with SMTP id
 67-20020a6b1446000000b0077aee790652mr603947iou.1.1690341776913; 
 Tue, 25 Jul 2023 20:22:56 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 i75-20020a639d4e000000b0055387ffef10sm134985pgd.24.2023.07.25.20.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 20:22:56 -0700 (PDT)
Date: Tue, 25 Jul 2023 20:22:53 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725200606.5264b59c@kernel.org>
Cc: Johannes Zink <j.zink@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

On Tue, Jul 25, 2023 at 08:06:06PM -0700, Jakub Kicinski wrote:

> any opinion on this one?

Yeah, I saw it, but I can't get excited about drivers trying to
correct delays.  I don't think this can be done automatically in a
reliable way, and so I expect that the few end users who are really
getting into the microseconds and nanoseconds will calibrate their
systems end to end, maybe even patching out this driver nonsense in
their kernels.

Having said that, I won't stand in the way of such driver stuff.
After all, who cares about a few microseconds time error one way or
the other?

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
