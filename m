Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96078274C49
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 00:40:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42A86C3FAD5;
	Tue, 22 Sep 2020 22:40:04 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 092EDC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 22:40:02 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id s88so18928153ilb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 15:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ts/H5lGkxCVpSIUsT+nwlHs+QYSEjYzumhKnYN5QEbQ=;
 b=NdTqQ/pCcMf3BcTELIvfiGB02jbWkpqnl3hdo5GDD8oGX50wg2ayZE+IyvGZJ8gZz2
 meJkdBGIv/z3jOBTur/V8NKsLikURSHYLb7zePHKfeQgfPshHCS0+/7ovj5Lv1s9WF/M
 QEDHpyv+DLKHdzvOIo3wERapjZtJ/a0/Xt4Ujj1c5gs/XXAAgtJ2iorumc+bGRA9qZZy
 eg6g+E+SvzuIqHoUW59Bhfh7M24TBylA+VFau7Ttw0E0fkvpfux2wempS6JWLHUMLR4P
 NhddEkJupbbAZ+W6tHp5N3107Vz3U23Nw8oBSqP2EnSbpvYrAzCUsKj5J9zOkRP/qmJR
 sotw==
X-Gm-Message-State: AOAM530D883UFssM6h70TR8pg7zjLXmAq+/D/MW3L1YTFYnrwK3lQFA0
 qyXQpBg9ld1ZFguorjHZZg==
X-Google-Smtp-Source: ABdhPJzHf0W5nJgwpFfumBS1r8ILyOBzztbl7WxBBhsWTRLofS+g1hJjBquRMnQNVN/s/620iReBwg==
X-Received: by 2002:a92:5ac9:: with SMTP id b70mr6098813ilg.110.1600814401820; 
 Tue, 22 Sep 2020 15:40:01 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s17sm9889563ilb.24.2020.09.22.15.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 15:40:01 -0700 (PDT)
Received: (nullmailer pid 3391920 invoked by uid 1000);
 Tue, 22 Sep 2020 22:40:00 -0000
Date: Tue, 22 Sep 2020 16:40:00 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200922224000.GA3391859@bogus>
References: <20200911091952.14696-1-olivier.moysan@st.com>
 <20200911091952.14696-2-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911091952.14696-2-olivier.moysan@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, broonie@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] ASoC: dt-bindings: add mclk provider
 support to stm32 i2s
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

On Fri, 11 Sep 2020 11:19:51 +0200, Olivier Moysan wrote:
> Add master clock provider support to STM32 I2S.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
