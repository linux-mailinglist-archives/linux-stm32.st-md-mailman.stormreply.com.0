Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE23BE747
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jul 2021 13:42:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31118C57B5B;
	Wed,  7 Jul 2021 11:42:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B71E7C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jul 2021 11:42:04 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v5so2711293wrt.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jul 2021 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=bKpgpEz+pk+V+ldgYqur++W1nBmK81ST14+xbKpmd58=;
 b=Fa/4vUyzf6E/EeDLy6JA+hJ9oLQfkIh9ABPr1r7T0uafu1NuvOHR3sFu5FyWw0L3GF
 ZFn6unFwsJeeh8WW+FhQFlWCsUjK/jt+pMYKIeStGioEptkrLw2RzPnHrzPO6uezZQHr
 im692Taa5fNCLajZnqP9itJUWEFobUwLQxw/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=bKpgpEz+pk+V+ldgYqur++W1nBmK81ST14+xbKpmd58=;
 b=QGOW561st/X+OZd6LQrmEYEjDkLdKduxwaZuD6f2rluBksgrr1NrwwEBaCYTPo3Xy2
 XjT89kSpoJMpVVNkhw755p3fU84cKFqpH387IOetN5JXzd1xBja5/49gEtz3nsezEAvf
 CaQcKh1AQ+bCWR57186FUVna4RufaVmMCm1as8kAQayndGMHt5JWhNRs59Uom/GzZqkm
 reA48mFTa75XmD6LFP9JBBqimvnbkdTZwz5o7BToofvD23x8pLRJQnw2BWW6Z1c7VAUo
 A+TsAMVUe2PCcLQSPzS8PGHrwFC9xgLjHHKNGxPdN8/ZB+MGUoqy6t3QtbzMfAdHx4qQ
 hXvw==
X-Gm-Message-State: AOAM533PzTVEyFykjwwRye5LNF4iVhqhlX066t3PhF18EdWvf5Uwjif6
 4a7ZwEQ0bZTlCDHjiR3UIyFwZA==
X-Google-Smtp-Source: ABdhPJz9VXlKr00wIlz5nQYZ/vo1ak+FD0N7gT29dc1uZMdxDAOtpeV9ocDO/8PFl/9HtziAzBi5Qg==
X-Received: by 2002:adf:d1cc:: with SMTP id b12mr20190027wrd.410.1625658123765; 
 Wed, 07 Jul 2021 04:42:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d186sm6226981wmd.14.2021.07.07.04.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 04:42:03 -0700 (PDT)
Date: Wed, 7 Jul 2021 13:42:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Message-ID: <YOWTCSpOZTGZS2qP@phenom.ffwll.local>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
 Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Yannick FERTRE <yannick.fertre@st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <31K3xupK1-7HNWorHqIwGwgEJl-1XdFjUQEoNYm6yB-lRoZ8kq5quRji_r3mzPZ0bUayLef6xPfQDiETgZp9lR7vUpDn2nB_37ncSd-J0Wc=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31K3xupK1-7HNWorHqIwGwgEJl-1XdFjUQEoNYm6yB-lRoZ8kq5quRji_r3mzPZ0bUayLef6xPfQDiETgZp9lR7vUpDn2nB_37ncSd-J0Wc=@emersion.fr>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philippe CORNU <philippe.cornu@st.com>, Matt Roper <matthew.d.roper@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
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

On Wed, Jul 07, 2021 at 09:03:03AM +0000, Simon Ser wrote:
> Hi,
> 
> Thanks for working on this. Do you have plans for user-space
> implementations and IGT?

Note that these parts are mandatory, and there's a patch floating around
further clarifying what's all expected for new properties:

https://lore.kernel.org/dri-devel/20210706161244.1038592-1-maxime@cerno.tech/

Cheers, Daniel

> 
> Thanks,
> 
> Simon

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
