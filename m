Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE9FB2FF
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2019 15:58:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62568C36B0B;
	Wed, 13 Nov 2019 14:58:26 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DBCEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 14:58:24 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id y23so1539155vso.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 06:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P0gOVwnr8RZ3Od+Q+Wt9xsj7qG4zJHYItky1OrLz/7Q=;
 b=DntvAiimaxy5eO8WmD5HKsaq8paiLEDN0gZRqng+Xx9VyAUgIR4AjdrfvQMMtiSy+c
 kzIT1vF4PL6dW0q4lybAHUTIe/fZzxIfPJN9RiZYhS7TtFC33OI9cLMC+p8J1NFNgr+S
 WZjtZx1j7LqChx64foynsNatq1nK0axjAIv7cDN2Qi3ahX7gnhLFxIaefxu8Zl2L1/Bu
 cm/hKxxW2E7gV0/llr8hOWDu2HTnj3y3VD+Z0wLlyeGdgupdyArE1NA7g2xNoI7Z1i25
 aKclClidbXBgBWKKlVODU4ZNnkr4+R2uaHhlOkkhZqSP8r1MhySo2WiOit311x1n+NJV
 r9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P0gOVwnr8RZ3Od+Q+Wt9xsj7qG4zJHYItky1OrLz/7Q=;
 b=qBmXbqjiXN7gSL2Bf8qGSWQkAR1tbo8uD5PTN0y6QkIjW3bLxINPKkSUBYXBn+HJ+N
 NBZ39W+lWuwIL0NVrkTLBsl5UMOwNfECPu8u/pnPHK5teSZiEpmcv51Qrq/vFrLiumYM
 uDhaeiM86c/Klxme+YeU9iFhouFIdJC4orC/5dcvn6xXmoXDzN9rOYEgI+HFeVJFz0a7
 vMw4cV484ifvRz6zIAsOgoNyaJ4y5krDEQrHzZB5Mx0CeVhNvQSnc7s3CrXpD1xAPPzR
 lDeTe9AK+16YEVKMyB/frT/OwZZGVO6O+LntJK9mvE/U20zAIL16Z9jhDCQSzfifsqk5
 ih1A==
X-Gm-Message-State: APjAAAUk5DQG3sMIMF1nP1bLI4zcp4S5WDQQNFtLH9295fYCIhR9W/wo
 2hiOqS6BkolVkQ3LHh5EsoURZAKIAqgEAyNIL9E=
X-Google-Smtp-Source: APXvYqxOKdMQmyVzBi5/m0j44R6MDEw4mJPbYG+meE9Q68qt41BmgvfQGKrtpZllT36/0ae1bMdzT/KICvdwYOGzTAE=
X-Received: by 2002:a05:6102:20d1:: with SMTP id
 i17mr2197246vsr.186.1573657102968; 
 Wed, 13 Nov 2019 06:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
 <20191106163031.808061-2-adrian.ratiu@collabora.com>
In-Reply-To: <20191106163031.808061-2-adrian.ratiu@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 Nov 2019 14:57:55 +0000
Message-ID: <CACvgo51sNzSHCcix89giYEq=iGJa_-nYbgpOKY-MxPRGCM_cRQ@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/4] drm: bridge: dw_mipi_dsi: access
	registers via a regmap
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

On Wed, 6 Nov 2019 at 16:30, Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> Convert the common bridge code and the two rockchip & stm drivers
> which currently use it to the regmap API in anticipation for further
> changes to make it more generic and add older DSI host controller
> support as found on i.mx6 based devices.
>
> The regmap becomes an internal state of the bridge. No functional
> changes other than requiring the platform drivers to use the
> pre-configured regmap supplied by the bridge after its probe() call
> instead of ioremp'ing the registers themselves.
>
> In subsequent commits the bridge will become able to detect the
> DSI host core version and init the regmap with different register
> layouts. The platform drivers will continue to use the regmap without
> modifications or worrying about the specific layout in use (in other
> words the layout is abstracted away via the regmap).
>
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

I should have been clearer earlier - I didn't quite review the patch.
Is is now though.
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

Admittedly a couple of nitpicks (DRIVER_NAME, zero initialize of val)
could have been left out.
It's not a big deal, there's no need to polish those.

-Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
