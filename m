Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A751B41156
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 02:30:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC72DC3089F;
	Wed,  3 Sep 2025 00:30:35 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07A93C3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 00:30:34 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-327ae052173so3717283a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Sep 2025 17:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756859433; x=1757464233;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CmMfbXYYghLau518ZkBS9EQ6iyJ6tyWuJVdbkNRuMJc=;
 b=ChsjEzLJeRp6Ozybw3HXcpTFi9CZmlVOqKttEszlpb3cGKH1R1geUNNtW7BHWvL2dl
 G7wwTkJqCWdh8WRU0Fy5gplLILFigZPrvoPviD1kpg49QlYBBaIuBQedU75v22Jcraqa
 sNQ5pAPepZbs33ZNRbz6RiWLDiyYUMAo18JXTHvdLwHuWB2Q91oMAT6vIRqsGXh+8eAQ
 zj+ewq5IQMQplbUv8bRjrduU3oW/sddVtTfgPA8HBnNwBIkGjP7M/Oi+2frAdtstdnE9
 z4pWxfsYFh7JBhUBGYHKNiWWD4M/MGbz3OJqpUa1dnA0ZKJ4rPZkFTMgOMRbpcQbgsfb
 py2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756859433; x=1757464233;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmMfbXYYghLau518ZkBS9EQ6iyJ6tyWuJVdbkNRuMJc=;
 b=nWGWp5lcOfPo4+5ZjjLqLNZEozdiJx2KCs2ub7hTWqwPh18esz/lScz37dZ3s1QbMz
 aaoL7q/2knwvJsZFTaIGPenvIDxGdBEOWQabQXdtMVKD78O1wG9Yh1adOqwnBeFJ/Osc
 IkQiJAkWh2atBEFrjp65W8Ip58PY8HG7voCo/6kW+NzVGQyDupNam+WGb7i22ytJpt22
 LB954TH7LhDOwKvQpCfOlog+T3RXb7mYiVMtntQG7b37doMRBEztm/7UPGlOz3U1gMFb
 TNm4y0RG7PjveNAyHr6utWBXiH7ELnW+m/6pM8+7RbZ1/eBGgroXkBkRxei/mSlAv0y+
 sYrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIOBZ6SiX7WKmIj1sFEwhiR8YEMRC01RBJC6FR/yHhNl8kUmW407n/dOTVwxYMrWw0nhRRd3cea2/ZZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzaYr5xBjUwY63myZcxdWzKPHWcquOD4oX0St897+NU0fArJCrW
 Rxb0zx8JkM/Qk6NKqvY/h26D/5THZlfjXi/Z/k5UUPxB9D9SV3poqTqn
X-Gm-Gg: ASbGncvs9oxMzCCXCaRBTH8DUj+ksrjP96wAp2tGRZmfuDg9yLMrbUhGheJTfJ06L0Q
 ILNaIEro9KurrhV5iA7hEhpju8eLSQSxwDgg2sG5xPKcs7d2VSCa/RHDpAaIm7tquASLf0VWqpK
 pubENHGE0cpK61LJD+0/EnSCjXW7tnrTH4z9o+OXKPSym1W1YHeuR4OZd9n+R0qBP19dYKVy83E
 zs8OqAa5jz9D+VJ+3P/OY58xyT2ZB/iAJLaXkXs+bgOZ4B8YTOVHBiUrd5ObK/9XzTEVnaQQjXE
 yQ3wNgc6+cHBv67K/EFLvU7rmIC3fR2pURvHgWlzkDaFyHhxWmd+q5sLJCZkNZH1LsX/el7XfLB
 8j+2hHfokvrOm5fHXBmm0Zw==
X-Google-Smtp-Source: AGHT+IHKuGow4ZFuttu6aoYR+s2VkdzBbs1o2jEf8YSpdi38rlMbKdEgFtFxfdUZ56XgWRNUklItiw==
X-Received: by 2002:a17:90b:1b12:b0:323:7e80:8818 with SMTP id
 98e67ed59e1d1-328156e5627mr18724374a91.37.1756859433210; 
 Tue, 02 Sep 2025 17:30:33 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329e23858ecsm3480217a91.14.2025.09.02.17.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 17:30:32 -0700 (PDT)
Date: Tue, 2 Sep 2025 20:30:30 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Message-ID: <aLeMJjfhisYSIEph@yury>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 llvm@lists.linux.dev, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Eric Dumazet <edumazet@google.com>, Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 linux-phy@lists.infradead.org, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Jaehoon Chung <jh80.chung@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-clk@vger.kernel.org, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-media@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-mmc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Justin Stitt <justinstitt@google.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 00/20] BYEWORD_UPDATE: unifying (most)
 HIWORD_UPDATE macros
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

On Mon, Aug 25, 2025 at 10:28:20AM +0200, Nicolas Frattaroli wrote:
> This series was spawned by [1], where I was asked to move every instance
> of HIWORD_UPDATE et al that I could find to a common macro in the same
> series that I am introducing said common macro.
> 
> The first patch of the series introduces a new header file,
> hw_bitfield.h, which contains two new macros: FIELD_PREP_WM16 and
> FIELD_PREP_WM16_CONST. The latter can be used in initializers.
> 
> I've cheekily added the hw_bitfield.h header to the BITMAP API section
> of the MAINTAINERS file.
> 
> This macro definition checks that the mask fits, and that the value fits
> in the mask. Like FIELD_PREP, it also shifts the value up to the mask,
> so turning off a bit does not require using the mask as a value. Masks
> are also required to be contiguous, like with FIELD_PREP.
> 
> For each definition of such a macro, the driver(s) that used it were
> evaluated for three different treatments:
>  - full conversion to the new macro, for cases where replacing the
>    implementation of the old macro wouldn't have worked, or where the
>    conversion was trivial. These are the most complex patches in this
>    series, as they sometimes have to pull apart definitions of masks
>    and values due to the new semantics, which require a contiguous
>    mask and shift the value for us.
>  - replacing the implementation of the old macro with an instance of the
>    new macro, done where I felt it made the patch much easier to review
>    because I didn't want to drop a big diff on people.
>  - skipping conversion entirely, usually because the mask is
>    non-constant and it's not trivial to make it constant. Sometimes an
>    added complication is that said non-constant mask is either used in a
>    path where runtime overhead may not be desirable, or in an
>    initializer.

Applied in bitmap-for-next for testing.

Thanks,
Yury
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
