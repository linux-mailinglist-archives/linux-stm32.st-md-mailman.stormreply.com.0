Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA650694B53
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Feb 2023 16:38:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7946CC69069;
	Mon, 13 Feb 2023 15:38:31 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CA89C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 15:38:29 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id a10so13438861edu.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 07:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/87Mt+OfWS54SLniYHSHhoF1OzMVcQInuz6lOAm1ITI=;
 b=DcL8qHxlUq7m+jzFei+ruzi2AgHEokmeZkHsi4p1k4sCN+qEgPTGibaN1zVvvIj6jZ
 M8kd/kn59Khh54bOSJgGqVHUxU/xfSZuvI29vcS1MNnqBkfl6NviBXfmEPipnf3rDzRi
 QygQZC0oP5t5vHPO3Qt71W9RA9XXeWsdsvQuWOddzZhDiyjCzYe889s1cvfCu+kWeL5V
 gNkjoyWp4Qj5VCNAo3XcJNSRERnefM06On4S54aE9r7S7ixBRXgjXkvCX3673O5Sqd3y
 rTc08ekvkmufmbqHoWJfUgxv7FqHzlLIEmtC266jIgS/E29g5Iado4vPmCA38xFB+LBC
 2a2g==
X-Gm-Message-State: AO0yUKUsIBrYorMhWh4PiRwWUsF7NdOMeXm1HoT2Sa9EetDHOYx92IGP
 UGLawR+tiBdePx3LruiHDmG3v3i688QsJUq/6QQ=
X-Google-Smtp-Source: AK7set/gPlIC2eOAY2XqGE6GdihDj9jHSedBktD5q34/c7R5wMsZ0nx0m0yQIbiWvGC7F0L1/Il/JyPSJjgkmU9F/oY=
X-Received: by 2002:a50:baab:0:b0:4ac:cdd9:1c97 with SMTP id
 x40-20020a50baab000000b004accdd91c97mr1078170ede.6.1676302708989; Mon, 13 Feb
 2023 07:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
 <20230210094056.GC175687@linaro.org>
In-Reply-To: <20230210094056.GC175687@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 13 Feb 2023 16:38:17 +0100
Message-ID: <CAJZ5v0iEYtFJAh94w+K-T90PXLRDzyUgvb_OPL9aOvphTH2CGg@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Haowen Bai <baihaowen@meizu.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, rafael.j.wysocki@intel.com,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Remove core header inclusion
	from drivers
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

On Fri, Feb 10, 2023 at 10:41 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> Hi Rafael,
>
> On Mon, Feb 06, 2023 at 04:34:29PM +0100, Daniel Lezcano wrote:
> > As the name states "thermal_core.h" is the header file for the core
> > components of the thermal framework.
> >
> > Too many drivers are including it. Hopefully the recent cleanups
> > helped to self encapsulate the code a bit more and prevented the
> > drivers to need this header.
> >
> > Remove this inclusion in every place where it is possible.
> >
> > Some other drivers did a confusion with the core header and the one
> > exported in linux/thermal.h. They include the former instead of the
> > latter. The changes also fix this.
> >
> > The tegra/soctherm driver still remains as it uses an internal
> > function which need to be replaced.
> >
> > The Intel HFI driver uses the netlink internal framework core and
> > should be changed to prevent to deal with the internals.
> >
> > No functional changes
>
> Are you ok if I take this patch ?

Well, you've already done that.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
