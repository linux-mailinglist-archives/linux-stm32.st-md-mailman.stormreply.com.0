Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD43DD352
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CB8FC5A4DA;
	Mon,  2 Aug 2021 09:51:15 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03ED1C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 09:06:35 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id a127so15779946pfa.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9IQU1XJBFQYQ15MTVRnNOF1cm13VQasnGNEcBzZoe/w=;
 b=oLIAQ121oScItTcx8m5R/ZfOo0TfiXMwRtNYEcvauLq7LcgV8jgTiCvP9M7lF9ZAsZ
 DD/KsrBAZ4GxLeQnvodo+wj+/ezdbS5e1LjuF8FLh+lUPwYsAgBgkLMZ17e6Ynoh1zec
 /CvmrR9Vs4PXCdtXGu1mdWGoQ/TFvS143qEEJtPfuCOU4Ku9fKcPv6vyBXdg8tLm1tL6
 zMbuR05KFS6CZDEuyrcVMK8/vihYhFvHLm5RkrJW0H1DsDPoWTxBOgNZmOkr35M+VHaa
 nhNDsqL5nXar0bl5ltX8jFCpIcS7IzONolBr5tFzuUqkWRcffAYhnEm0Ttl3BchUhnZn
 rSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9IQU1XJBFQYQ15MTVRnNOF1cm13VQasnGNEcBzZoe/w=;
 b=g0XnMPmSihnld+nOooqpJg7Y5Hx2E/FxcYVYfhX7NabJddeBep/opesArav+uXCUQm
 Oj7J0I3GcyoJD3IqVp7o++gbkYqoOvfBgSRO02PTOpczbbxeq0SNkch6xqLd6dXFC7ZI
 1w4V2Wl5+Ion5sqx+AhLi6Fk4krAen7c3s+Fl+lWLq5KuS5ZW+Sg4BVijZ2yW9MHcaL2
 QzH9agYSx7sIla7xy+Q2sJGp0CRisFnjQewOk2cJm+Hnaj2oLIgFOAUByOz9IkbuPpDh
 cq+Vo91zYeXR1BxM0sAey4lOs66XJcnx6pNkCZ6yAunwGuzGYx6bo3mxQQnc08n8iv0Q
 HH1A==
X-Gm-Message-State: AOAM533b13A/rk2fisnp+5tvmdu7D+rb8Q68rq0GOWDSPaqUuPKVKZ+a
 ePriFAsVz4ZM1J36ryyk1EEO8cYHwPp5E9uRT82aDA==
X-Google-Smtp-Source: ABdhPJxImfuuET+9vna9WB+tlPcbjyrbgf+SbTnM7Ydv8QyP3BdwPDQOD7IZSDNsZoV6zPJmM4DiqzztgyKEyS3QyDk=
X-Received: by 2002:a62:581:0:b029:301:9082:7283 with SMTP id
 123-20020a6205810000b029030190827283mr51475094pff.37.1626080793051; Mon, 12
 Jul 2021 02:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210704140309.268469-1-jagan@amarulasolutions.com>
In-Reply-To: <20210704140309.268469-1-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 12 Jul 2021 11:06:22 +0200
Message-ID: <CAG3jFyumpONBLoafj9o4V0ddFvs7BaRDYHAiu50CN9VhHga3WQ@mail.gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:51:10 +0000
Cc: Jonathan Liu <net147@gmail.com>, Heiko Stubner <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com
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

Reviewed-by: Robert Foss <robert.foss@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
