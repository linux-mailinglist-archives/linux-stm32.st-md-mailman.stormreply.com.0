Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8E58CB26
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Aug 2022 17:18:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D037C04000;
	Mon,  8 Aug 2022 15:18:13 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B23FC03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 15:18:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z17so11273049wrq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Aug 2022 08:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=GTevZuUiejguEpsgUOnmB47QMW/b8J20g/JC/eJOuvE=;
 b=Ha9+Yq3Ro24vG0M22gEXTKdT+8MKXJUxoz46rajkJVOlPIgQjDAhrEqSP0rt1hRqBQ
 rLVFkIYUFPRNSGpprIMx7NxSf0PqwhHklzuL/K6JV0gNP3EzNNV+uCxHLiVQed6sNArJ
 oHjzPhQHopsgqpBTU3H/IzuQJd0BH9Ahs9Xugqy0LwNkbjSRLno0aviXtFOqvIExRKwE
 Aqq1CPWRhKj0Pp9UmI+uZgmXU74GCVM5gZSh1mxg+t+9C3nfwEjHrZqpPuNrHKuNX5/0
 n/V7ohbx50K9gIxZ6IhddIlYqq1dJniWaNiQ1UvXtLMtpW0uW5KqwTEbS0lWp+tp1jJ/
 Vsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=GTevZuUiejguEpsgUOnmB47QMW/b8J20g/JC/eJOuvE=;
 b=3ydV4Y7OJ/HLwu06b5K3ExW9ZXT8q6CbbTF5ldjTzurrTE7wfvBnm2joukMSPUR3fO
 UZgquVJxI7DSlstTSdihrlMSyQIIXqHPAX4zpq7zt3Hu9b1Em7AlVxT4Kb/pRXIjl61G
 R35pm2clDVTMcY3enKWFICLbRuGv5P2z/jN3vbH5awzi0dj0TvArjTiTaz8qYd3FWEp3
 crvbQnvjpYJ+UtYlzdlcyaval5eMTWWcjKFbrGqWnGm14LiJ+n/MBrW4q/ky7MeTFOHx
 0yZmd9n0AYjWWBp1R+oUq+5qUuvbxIugrKpCrz37oDBmg96vilF7ZdVk5B8Wk/pAwb6J
 gP/Q==
X-Gm-Message-State: ACgBeo0YNsK2NL6YTn2hhq7qGTOlSv55xo5zl4RBAV/JpSJJeEZZPf7w
 q4PVOciP9cl01X+rLma/8pIpolDeP/4l6A==
X-Google-Smtp-Source: AA6agR6WY56OsLXZMVeNwAo7AIto/ZApH3k/yLb84Q9i7K35DrTs2jRfcVRioZF3DT8sVmQIlOtQ1A==
X-Received: by 2002:adf:d238:0:b0:21e:c972:7505 with SMTP id
 k24-20020adfd238000000b0021ec9727505mr12096009wrh.536.1659971892232; 
 Mon, 08 Aug 2022 08:18:12 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 n17-20020a7bc5d1000000b003a52969e89csm8572995wmk.4.2022.08.08.08.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 08:18:11 -0700 (PDT)
Date: Mon, 8 Aug 2022 16:18:09 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Message-ID: <YvEpMVmv7UQiEnAj@google.com>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-3-francesco.dolcini@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712163345.445811-3-francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/5] mfd: stmpe: Probe sub-function by
	compatible
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

On Tue, 12 Jul 2022, Francesco Dolcini wrote:

> Use sub-function of_compatible during probe, instead of using the node
> name. The code should not rely on the node names during probe, in
> addition to that the previously hard-coded node names are not compliant
> to the latest naming convention (they are not generic and they use
> underscores), and it was broken by mistake already once [1].
> 
> [1] commit 56086b5e804f ("ARM: dts: imx6qdl-apalis: Avoid underscore in node name")
> 
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2:
>  - remove define usage for compatible strings
>  - moved rotator removal from probe to a separate patch
> ---
>  drivers/mfd/stmpe.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
DEPRECATED: Please use lee@kernel.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
