Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8442FA08
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Oct 2021 19:22:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F9D0C5C841;
	Fri, 15 Oct 2021 17:22:34 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72A81C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 17:22:32 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 34-20020a9d0325000000b00552cae0decbso3520645otv.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 10:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8GXf6iIkeLSmbnCwp/TnDsH3fwbQUD1XiOH8muSbIdM=;
 b=AzlT/VF3vNrvaXMA6yupvoTzvJVIPoxbKtPfW8YnVJaJ6TvF75GPEm8I4v8TBAuHwD
 xXYMe3/F5qzdc2toQmMpBJSi9ufh/kCygFWvbceu3OB5hvfjZenyOaoDv/DaCxg8Pr5b
 b3A+1O8vmB3bA6FY9c4XPjwoTNYLEvt4DEKLfLyVisJRLl/sj4+qjBYAS4JL+Aje633l
 UJ6BvkSmhvdUJYWiRgjmsebeqbbwUFMELtCNLmRyjheSv8M6Sq2bsWw1onXUQEIWWN++
 693DPX65oIdROYAMmDNG8DTq/cOg5xD9+/IHzoeqmtl72bYa+FJHBSrFOwpyxe+bKkmY
 g5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8GXf6iIkeLSmbnCwp/TnDsH3fwbQUD1XiOH8muSbIdM=;
 b=7o4wEtsZ9mgT5OT8hvvqeRFK7vxEzy7ZS6DO1QH4ob1hDYRiiIchYOywK73lFriX9w
 AgXI4L4KWGuzxrRmWPZOBGpSskXAh36uHEDyigXg5NMBE8V9+hfK+avByB8pbfMtlrrh
 Fwz7qj8IC2MiMP9+6vI7ISsRF/IRRZqdcu9iiB0ahQnjogl9tyR4wDEfRjNOz/rkZBhZ
 on2M0mCGfITTyOY5MAlpZpGX56uphXf+nb8CFn86iGHvo33yskB+Ke44VriFgHRKTzZm
 pFoB8m1Tw0Ta0WZP2/fg8niFL37/HTrYuzlMi6vFgAXcRNIyPrHx1o+ztPlQPQraD0X+
 92Rw==
X-Gm-Message-State: AOAM533sqFnniWLEcpSUwqUNHSw8me+4WHjl3ddSFtLiyXRj9wlbKe85
 KCmYPBIQcQef4gxg+VZQC/c7Sw==
X-Google-Smtp-Source: ABdhPJw43C2jPHke2r6UygEFoXfBVXJc2rkJUM25RFmbv18wSheOEBVNo3sZzMCBhf8p+nKZSpfNiQ==
X-Received: by 2002:a05:6830:2805:: with SMTP id
 w5mr9028837otu.248.1634318549944; 
 Fri, 15 Oct 2021 10:22:29 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 10:22:29 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Date: Fri, 15 Oct 2021 12:22:20 -0500
Message-Id: <163431847249.251657.9669509178222541492.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-amlogic@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/9] treewide: simplify getting
	.driver_data
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

On Mon, 20 Sep 2021 11:05:12 +0200, Wolfram Sang wrote:
> I got tired of fixing this in Renesas drivers manually, so I took the big
> hammer. Remove this cumbersome code pattern which got copy-pasted too much
> already:
> 
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
> +	struct ep93xx_keypad *keypad = dev_get_drvdata(dev);
> 
> [...]

Applied, thanks!

[1/9] dmaengine: stm32-dmamux: simplify getting .driver_data
      (no commit info)
[2/9] firmware: meson: simplify getting .driver_data
      (no commit info)
[3/9] gpio: xilinx: simplify getting .driver_data
      (no commit info)
[4/9] drm/msm: simplify getting .driver_data
      (no commit info)
[5/9] drm/panfrost: simplify getting .driver_data
      (no commit info)
[6/9] iio: common: cros_ec_sensors: simplify getting .driver_data
      (no commit info)
[7/9] net: mdio: mdio-bcm-iproc: simplify getting .driver_data
      (no commit info)
[8/9] platform: chrome: cros_ec_sensorhub: simplify getting .driver_data
      (no commit info)
[9/9] remoteproc: omap_remoteproc: simplify getting .driver_data
      commit: c34bfafd7c6ce8bdb5205aa990973b6ec7a6557c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
