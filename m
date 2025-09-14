Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5EBB56852
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Sep 2025 14:08:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B4E0C349C0;
	Sun, 14 Sep 2025 12:08:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9F3FC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Sep 2025 12:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757851722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
 b=imz9D0ZWulrhNzDA9ecq5NsgrmHxFAE22jVC/qw8KJNN3prtT1ImYL6dKQcMGnMcfjN3kg
 7pNJnJJPgdc0tTAKSAcvFfU3XnvL9LT/4du4A/9qLEu6VFkP3vCO4nCQ6T4QEks20jA3g8
 81W68oipXGK5MKoYBJ5XpezqP5DZzuQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-pUUfakb4My2DecQ8ValjDA-1; Sun, 14 Sep 2025 08:08:39 -0400
X-MC-Unique: pUUfakb4My2DecQ8ValjDA-1
X-Mimecast-MFC-AGG-ID: pUUfakb4My2DecQ8ValjDA_1757851718
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8178135137fso949523485a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Sep 2025 05:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757851718; x=1758456518;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
 b=RtyEswM+6qp6zCSrR2G9abCm9R7i1QO4z2dPg7HqcxQwddpFkLZgVXgco/GWvVNu2x
 Qg/ICx+FecZHWZzVrx6ErYIOZkmjuHDEQPNb3DfWAQXOzQCaQndgfMuydV5PPsHO2C1+
 Vk2XkuvKRs6SXSYfxm3eKsqk513eEBgYnIkBDBkOfTgzCKw7PV84Fv6MIpZsDErWNwpE
 hmo0j+v2395CtoD8gsrcf1vzaRHxyiLt8u6Bflb0oxrUtZlMsGDZmzJ2ULP5rMP8ZMI1
 B4zIviPGJIjfjEmWw1vLFJkOZL8pGnwTQ9ShoaDRHJrPdUXi/wl1UWlzFd3UXvKF/qOR
 Ef/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8/vI4V1xielexdK8i0bPpVig/rfc95qk/yxI5Ef9KiM2hyQyax0+GC/sPUWju2+TcyOzvMlJtg5oEHw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxEkYBh8IgRjOS2JRZHDWoDnBPzFwTn7G7LaVihHpHPA+5D2T5+
 kOWJTFCOTqdjDZPnaVc0jD7dbZYscKKFXgLD78TqUx2PvLVZNqBNaC1byWjMqZlMj8KwSGnkFH2
 mnG8KazdI6LBITI5SvrKphMJyhuN4lD+hSFjBXMcE1VEk4iY1lYOyKNQgdmiBPAxdyP5Q+mVZzc
 /0sZwaWQ==
X-Gm-Gg: ASbGncteIGg066wLbUiUdb51KLtH9kSnX1bViikchy9PjqsC/N6cUbS1EAFKVi7uNiQ
 w+iC3KwDax9wQBTTcqo0h9y4UKc0iMhijfsUqQJ5TQDHmQM6zBLQnx28WtZqRuK5XpGruPxHgdw
 DqMDC3gyw177HXvon2iYBHUXqneZ9p8OUNIR4w0bcZMzk92yXHvbdZoiXpScGihju7r9q+zgU3l
 oi81lYVhz8Pr7g5yzm531TzbvWKa9xr2bX5w0xw8Tg7xSJQpvav82+qFbq4pjmpv6lFFYloCjSm
 IpZc83TP1F2ThmrtaHubhY+oAebZ+kUSXEDynFxVp0B4CkY2Cbp7hUmm2seVmPziXXqGxSk3Eyn
 GKeb4Kuc5egKgKSZP4CyxHzwWlzSvhv4=
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id
 af79cd13be357-82401a95c9bmr1036168885a.69.1757851718239; 
 Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdCKGXPgtbhvJpUCdDwCaaC2B0DLna/CzbBAvfkLzYJU98qL9IvUSFcqawGBto49lPMPxgQ==
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id
 af79cd13be357-82401a95c9bmr1036164085a.69.1757851717778; 
 Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-820cfcaca15sm580413985a.71.2025.09.14.05.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:08:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Message-ID: <aMawQYUIjPw9m4IO@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XuywDDUTkSSkTTG5PSopczNRs7paG9kyTycFJMh7CLw_1757851718
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, imx@lists.linux.dev,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/9] drm: convert from clk round_rate()
 to determine_rate()
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

Hi all,

On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v1:
> - Drop space after the cast (Maxime)
> - Added various Acked-by and Reviewed-by tags

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

I'm not sure which tree(s) this should go through. All of the patches
except patch 1 have at least one Acked-by or Reviewed-by.

Thanks,

Brian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
