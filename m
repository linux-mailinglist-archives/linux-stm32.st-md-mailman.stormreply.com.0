Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CA448E040
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jan 2022 23:29:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC6C4C5F1F5;
	Thu, 13 Jan 2022 22:29:21 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90CEFC5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 22:29:20 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id a7so8891914plh.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 14:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/1K/yKL2WvJn2YGUJo5lqXQyVrI3vSCmiCN73nfsZf0=;
 b=zEXhmHNz02RxVCbfspu8UevBoIHOwntAfwjELDVfcib02KtcHHCr83emWqVXZvUG5g
 ORk3BAuPg6rO+b8p8aS1ctaoBVAZ7sfyrTrALV+u/X483FmP03scphDbgix+/xy1URKP
 JaPyVQEigh8P5N1xmcNeRVdfPWcs3o2WAEJjMovYHdahAapP55kkuO/SlGbD64nsbHfY
 eYoU6Z8Mtq+2SNoJYYzpJeAEVC+XqSMClPYOwG7bYbaiX3zr+h11w0F5X+x4Yt3zDZnt
 l4jKFRGRCUZ+eAuDrgFBiOGs1YpXggpAIIjI6MHOBATAJZBj/13Sbpzx5sB67Pq0//oD
 d98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/1K/yKL2WvJn2YGUJo5lqXQyVrI3vSCmiCN73nfsZf0=;
 b=2M5hdv9KkFAcqEs3U7zUppTIvZTSNkVShIZxZiYEkoG9tnqz10r8Mbv9LCYhKFEghy
 1/C7A0snH0U1Lhk4+GiWjGe/xT38ZoxsRT8KKR5cXuBMTldh3XEGRS+XCCRJhtAAiX0b
 u9DNVDcN4nwg3dP8yGKFSu4L2+gIuFgOtK/PXkPDwag5uD2y266AjLiYE3f1+kGLoU7P
 ZVt+2LmX3Lhh5tpBBiwTaJ5Om+cVsJYZCd3m6Bq6p4PKhOfixqXLtehib81X3XL4/N6q
 JCxY8EJooN+a+KVN/pjp2Ca/vCNhDyrPCkeghCAVCM2HtPOpeSK4ycjxbC9EDxu4anKH
 jwig==
X-Gm-Message-State: AOAM532A3/J9MwPIx+A7Qanh83UIqbD5sTcOwgqJy7lH8fTHND8ajYpz
 aDbaq/Vyvxt9RGMmnLfzU36fCUlXB7PPiUf17hXtsA==
X-Google-Smtp-Source: ABdhPJzFlKwHmQIvDDrxARkQ+dVH6aAfYK79ymciXrpQfjKxHQ+oYkRfxCZT9peoGZcOcpvJA0wCSIjbeGeYZewWHr8=
X-Received: by 2002:a17:90b:3e8e:: with SMTP id
 rj14mr1025161pjb.179.1642112958996; 
 Thu, 13 Jan 2022 14:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20211112061741.120898-1-jagan@amarulasolutions.com>
 <CAMty3ZD_JUBzEDky8Q0N4QEmaWkpkd4gUYmLzDPBhKvi=eiVDQ@mail.gmail.com>
In-Reply-To: <CAMty3ZD_JUBzEDky8Q0N4QEmaWkpkd4gUYmLzDPBhKvi=eiVDQ@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 13 Jan 2022 23:29:07 +0100
Message-ID: <CAG3jFytf4XBQN3kfAtyE+f48zdN2bcSzUzcZQ9B2vYiSwSXQ5g@mail.gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Heiko Stubner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] drm/bridge: dw-mipi-dsi: Switch to atomic
	operations
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

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.

On Thu, 13 Jan 2022 at 20:43, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Fri, Nov 12, 2021 at 11:47 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Replace atomic version of the enable/disable operations to
> > continue the transition to the atomic API.
> >
> > Also added default drm atomic operations for duplicate, destroy
> > and reset state API's in order to have smooth transition on
> > atomic API's.
> >
> > Tested on Engicam i.Core STM32MP1 SoM.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
>
> Gentle ping!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
