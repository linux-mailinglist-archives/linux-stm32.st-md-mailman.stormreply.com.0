Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 623AC29774
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 13:41:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA78CC597AD
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 11:41:23 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8E24C597AC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 11:41:22 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id f1so6885642lfl.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eJLDwVfH5VJnZx8ZM8GCRIzVJV8WcHMD+lvgI85Fwb8=;
 b=tFjCJYE4s1Z94dMb5aFsdWecVIC3UQ9ZA0iji4fhIgPiEbpjNkp6PM+YSIl/F0zg/8
 v067wNSAoldwvwxNc12hzdZ1o+Ue6PunKG5AFaw6SVX+axaqR+H6XYobKIQ2AOZfRVDT
 2MSu12IVDZlJVYeaEXVBJ6u0fHu/T+hQ38wwb9HMSr/yWO0eah4xbg1CG4Yx04vpm/Gl
 5waRRmDXldlktA4Axy7Gh6TMSlIUN0TR5TR6qQnFCE/iDu+Yu3IwGLAbBiOQYDTZkcO5
 7PFePDllYZl7eMyl9c9S364wV1ARtv7+Ho5BblphuAKfQYr1mTkL2OPyj3M5EdvOFQ9r
 bP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eJLDwVfH5VJnZx8ZM8GCRIzVJV8WcHMD+lvgI85Fwb8=;
 b=SfphxVJYoj43uTcQE8eZeckATqds/JIK5zOY9UItve7+dBQQ1TahtNBYRaZcPnMoHY
 wgX/25SRhcq+nPC3mSkx64PNdsLqTyrKJ0bfF8TuTZe9aFCOrW/8UoTLUfGlQJYti4Rk
 4zKeEXDMD2vb/PvyMou55+do6DfT7WWILzQFF7SIJ6AEQVN33lVkrDy797sHHkbCW4xm
 ziKFn5vOC4ug7GnSroO5sAbOQh+VaDnWQDgnN3hcpiEzy4tYEYQF/Epsz+kiCOu9GkTN
 8jgLit+cLrRxLN81dQuDI2/9W5erp989bJidrqrHJOHz5Lo0MjDrucRvZ3Vvl9bLYMZc
 FW7g==
X-Gm-Message-State: APjAAAUhP//I6j358fmRJBbuGNWv9RPcnyG1Rzn8VdORCEvuUwBbTn9l
 ZUELDZAWOI8O83uMhwb8BxRpAZqMz+Ai1EPa23h2jQ==
X-Google-Smtp-Source: APXvYqwlCU/Ve7G0DQMfQWyCLtGMK3SgbEDDMWwyMwxIxCdMA7wUKKKX4Ntzrp8svUCapzuA04ATKczG2IaW15wIr9U=
X-Received: by 2002:ac2:5935:: with SMTP id v21mr9226943lfi.117.1558698082036; 
 Fri, 24 May 2019 04:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
In-Reply-To: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 May 2019 13:41:09 +0200
Message-ID: <CACRpkdazPrbzL-oo6rhfgDcLftjCE1hrgPQCMvtE2TOUUnorVg@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: pinctrl: Convert stm32
 pinctrl bindings to json-schema
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

On Fri, May 10, 2019 at 5:45 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Convert the STM32 pinctrl binding to DT schema format using json-schema.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

What a feat. Well done!
Patch applied with Rob's Review tag.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
