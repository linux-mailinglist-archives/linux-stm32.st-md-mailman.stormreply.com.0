Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6626481
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 15:21:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1681BCBB56B
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 13:19:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01F0CC54510
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 13:19:25 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84AD421473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558531163;
 bh=xZL000OlxXJ3Olb6ufE2AzjLi7N4hMQu+kQzQcbFNCE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gLD4PFuG2hwP49yJVZICDJQP5YCoCakvNo4eFuMAo/m+51Da9NyXa6DMOTtmueeXq
 kFXEsH5izp28s4MHALCjJkaVEzRrn5CAXDKQ/rmVZGiBc5PXyPpq41JzbupZN+46mb
 MTtv0BImS6f/6ztOLOvPdYcUZwff2HhiaQFSttDM=
Received: by mail-qt1-f169.google.com with SMTP id h1so2272056qtp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 06:19:23 -0700 (PDT)
X-Gm-Message-State: APjAAAUFZw38Nel8IbAgQ16xzSMHRbtBksqKFZNZsbHqppHozfHsKPNL
 tdDNpj9QVuDNMLlpFHa126bpvsAdhSgfmDw4uQ==
X-Google-Smtp-Source: APXvYqyvYTuRn9kxbS1Z4NqODKeovcHPYdzWdAvI9bwxOBcedkYyTwND/I5vtUvsg9uaG6kVGsaTqAdvJBL/eqFqgL8=
X-Received: by 2002:a0c:929a:: with SMTP id b26mr70772394qvb.148.1558531161859; 
 Wed, 22 May 2019 06:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 22 May 2019 08:19:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
Message-ID: <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Mans Rullgard <mans@mansr.com>,
 Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>,
 David Brown <david.brown@linaro.org>, Liang Yang <liang.yang@amlogic.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Richard Weinberger <richard@nod.at>,
 Jonathan Hunter <jonathanh@nvidia.com>, Marek Vasut <marek.vasut@gmail.com>,
 Andy Gross <agross@kernel.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-oxnas@groups.io,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt: bindings: mtd: replace references to
	nand.txt with nand-controller.yaml
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

On Tue, May 21, 2019 at 2:28 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
> nand-controller.yaml replaced nand.txt however the references to it were
> not updated. This change updates these references wherever it appears in
> bindings documentation.
>
> Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")
>
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Mauro already sent a similar patch.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
