Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F983DD358
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DDC6C5A4FE;
	Mon,  2 Aug 2021 09:51:16 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3B99C5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 10:03:21 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so3446511pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xbq9QWxbvPd3Ex/7ehiQ//FvYDyflKiEA2zaoPSUUMg=;
 b=xq8SztoFusZOuKEHPHsxf+kDj7xILPciXnRFCd4Ep6hEbCl9/Scoq6l0bwwrTeLZ62
 2zAZnz/1JYTSMgzBUzWVvpvB81jsZEYTx9BmNw7e7AaztX2ZLH73FJiwN2r6DehgtvkI
 g8kAom+PHhbZmyWK4vTHp7zJXR+6sFen6LfBKl6/w9t5kdfFnXE9Z3tHQzt5Srw6132h
 M9bySDLsQzpRH1BF3sN7uRM3WgUyv9kLNeeAYxsuoP4ZslQ91xx5OBmLlX4+Mf9h9E33
 rEc13Kft56nes1m9kzB9H5letw/s2mnIDY9rSI1RZuhzL25KGSeC7mXofVL3EDxrQ5bk
 ee3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xbq9QWxbvPd3Ex/7ehiQ//FvYDyflKiEA2zaoPSUUMg=;
 b=SKehWxMxqGYKaaCJLZjpH1Sz9jQKT/v4jCts9RW6E3PbnCwWfHbxYc25Y3q+InaWfw
 qqgyuKPpz8nhQyW/qqkjxqu6kOwlzapF5fp7Tw0SC0hrPZ8Y0C2PEQC/mceqvH1Z5Pff
 6kNvdrn/WsvUeeXMM0KmWXnRRHgCvIHbOSFCtAvM9kgUuWFnjD8VeWg0opIJA2n0rXZ6
 CH/dtKNykRmTjYxBEAKHfEoJRpyqcReFNpudsc7Tv3GIMo8uiNVcr5NYa9LTI86KLReU
 RBJgwF7C1GLhNFZCjrn/lDfDizV2Pdpw3N5V4pf81E7LzZmHvnRsHJvzrx2UwaHnrDo1
 ZLFQ==
X-Gm-Message-State: AOAM532Agt9ML7RK3U04SeftknekrUnstF1N+MvBTn+vUxCBmHs3rE9H
 618tpIrQHpsfDeQWKVJgfYn57AlS7v1ggRzWX1u9lQ==
X-Google-Smtp-Source: ABdhPJx3XNDvCiLqXu77rXCJS5kd4qAypwbtHwYRXrq0bCzY7tSYPrXJnWrd+u7HWvCvunSKRBIr0Bts+j5xf2sTkJ4=
X-Received: by 2002:a63:ee0a:: with SMTP id e10mr22774606pgi.385.1627380199920; 
 Tue, 27 Jul 2021 03:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210704140309.268469-1-jagan@amarulasolutions.com>
 <8327301.GXAFRqVoOG@diego>
In-Reply-To: <8327301.GXAFRqVoOG@diego>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 27 Jul 2021 12:03:08 +0200
Message-ID: <CAG3jFytkBZpjWF0NMzavhBruk2hsprgvprJ=Uhd8dqJaSxXRRw@mail.gmail.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:51:10 +0000
Cc: Jonathan Liu <net147@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH] drm/bridge: dw-mipi-dsi: Find the
	possible DSI devices
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

Pushed to drm-misc-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
