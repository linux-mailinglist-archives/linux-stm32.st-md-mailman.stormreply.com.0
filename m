Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3965B48DE35
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jan 2022 20:43:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCEF7C5F1F5;
	Thu, 13 Jan 2022 19:43:41 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C823C5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 19:43:40 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id c71so27040137edf.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 11:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3gm+gNo0zjsmtqAqZojO6FheaWTHrpjc/JFQYPb+89I=;
 b=Elpf6wzr/rTYwUH8dDbMnQY/eDnzUUmm6V69NIGrg24nZi5yWGtRxKEcJXZUyE4nKT
 6+TF1/R3CI09N0TxwNXFbWKVrUZZG7zcUY7a+8L1/I31dx2ROW2vvhkF51t709mJOD1Y
 ou1pdCySuHLCorZtWvidHkllvvBCi9qG+K1Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3gm+gNo0zjsmtqAqZojO6FheaWTHrpjc/JFQYPb+89I=;
 b=MnZXR18h4JbkK8Sg0h22+LBJN239xdEWkq1bLLh+8iwXGltMNBvRDR79NygMWK5Lk9
 t7xIImLrEaO8mWL4qPmdBnScGmNPBh6H2zmcIVjvFeec7v1SozfbfUGnnXZ0Qc42k3FX
 FKYFOUjmPaKOQ+xvmSmf49+CZygqM//6+wkWMgAa+S/FbTEFRh/t3tIjiN5qadLbEDsD
 GVSz8VLuwyk04pbQ06C+1SMHmcjCe0V+kyHcFpqozy0ZtFEJB2/w6b7a+MctDuCjUFlH
 UVXQKiRiNvWk2tE96LOe2vte/g7NA1Y7EWKgSETP+BEejMRcQwUkqvcGF362V07N6Y8w
 D7DA==
X-Gm-Message-State: AOAM5311M13udzi3QqYm093ko+4VPywhW8KGbkOZ9WSQzLEi9VIkoCsF
 BVfI7nK/s6U+leZBLIAbmgQFmqEwdCxdeknFiu/kSg==
X-Google-Smtp-Source: ABdhPJwSGzQMALZDzukZvCwFu3bEC7PAaQZfsvUvIf4CKj49ZhnRmcM+B3lppKCcQPik7TqQq7RqyylpbRv0o97G6ME=
X-Received: by 2002:a17:906:b003:: with SMTP id
 v3mr4797695ejy.770.1642103020036; 
 Thu, 13 Jan 2022 11:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20211112061741.120898-1-jagan@amarulasolutions.com>
In-Reply-To: <20211112061741.120898-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 14 Jan 2022 01:13:29 +0530
Message-ID: <CAMty3ZD_JUBzEDky8Q0N4QEmaWkpkd4gUYmLzDPBhKvi=eiVDQ@mail.gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Heiko Stubner <heiko@sntech.de>, Yannick Fertre <yannick.fertre@foss.st.com>
Cc: linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org
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

On Fri, Nov 12, 2021 at 11:47 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Replace atomic version of the enable/disable operations to
> continue the transition to the atomic API.
>
> Also added default drm atomic operations for duplicate, destroy
> and reset state API's in order to have smooth transition on
> atomic API's.
>
> Tested on Engicam i.Core STM32MP1 SoM.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

Gentle ping!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
