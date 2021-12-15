Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9D6475083
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 02:30:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F051C5E2C5;
	Wed, 15 Dec 2021 01:30:22 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C404FCFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 01:30:21 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id o13so35333591wrs.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 17:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ssImNAp25VSfpjtWIa6nzdRJnou4SLqvIgmNzKI3Ps8=;
 b=qydlwCrFMmktBUYxvY5tXGUsd2Ig/GOL2jM1OdBRqZoyXmiVcpR5pagBVHD03wkAFm
 zUtiW7nUvWS5OyhX3HY9a19PdDYBmrJTaAZhXxjtAk12t7q1ohm3/VDZibA6rlrFz4Ec
 l/PnpyOmevBH4Z/DSXcJZrYb7ms5A0kqP9qV6C4tWTp+7+irH23kOMpi7y2+LqcQOY6P
 LE3GNep6Uc6kAOauIeJoszvyV37B2IzGk3crkH6WER57f/5CqtywGg3DSzOHdqHDdwPg
 WfQVyKmfaaE3bPv/4+6Y967fU1Tk52Oyy/25MVbOZtQOIbdUwtknv88l8C1b/8qMoe13
 9Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:user-agent:mime-version
 :content-transfer-encoding;
 bh=ssImNAp25VSfpjtWIa6nzdRJnou4SLqvIgmNzKI3Ps8=;
 b=GKhg2CK3inrTavEVtRoH/7F28/RtVsq3k4295jmIOMR1kFu3f7PTQnkVcSLWRAlqta
 6yqYm914S2Yj+PX+AOvcyWQOZ/iz2Ep/PauTYP4SCM0hnCfPpFOBwBdHlbgM8V9LNXVh
 lFPOxvw9vYhJvYBzt2LaIq0mK56JatV2btZedmIAu5HwX7zi/TK7AUv7GDBwAs1JshRL
 5mQXg1OkyTFFhNG2nsetg3DGSrL0e285W+r0pV52dMHtFb17TqzbC38O7NGs5O5osQPg
 rexDbKwcvmjNeQw5IpbrgcKiAGZApltrMcUC6XbBsy5XWBHdGBb4Ni9h+yea+0VI5Up6
 k8Ww==
X-Gm-Message-State: AOAM533j5iw1Io/lZr0+1xino44MWCj+TNdbnOvVWNezTjFoGE0XVtVp
 oJXZI3RutXTWrrgCBROZ4qs=
X-Google-Smtp-Source: ABdhPJypix1kagUzDsn4lpHSfEOLbPLySXi8Ej51HQIsQO0pv/fgBwdDpn3W3hTQqsB9xdvXPM9oMQ==
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr2159648wrn.423.1639531821452; 
 Tue, 14 Dec 2021 17:30:21 -0800 (PST)
Received: from mars.fritz.box ([2a02:8070:bb0:8700:3e7c:3fff:fe20:2cae])
 by smtp.gmail.com with ESMTPSA id e7sm524323wrg.31.2021.12.14.17.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:30:20 -0800 (PST)
Message-ID: <4204e95bc2306796fb834e74a01d75a47d45ecbc.camel@googlemail.com>
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Dec 2021 02:30:19 +0100
In-Reply-To: <46f07510-b6aa-4619-9c54-048464bfbaf3@foss.st.com>
References: <a5b8e3ea13de0b2976bb9622dd410dd110f3f66c.camel@googlemail.com>
 <46f07510-b6aa-4619-9c54-048464bfbaf3@foss.st.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Revert "pinctrl: stm32: fix the reported
 number of GPIO lines per bank"
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
Reply-To: chf.fritz@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 2021-12-14 at 15:17 +0100, Fabien DESSENNE wrote:
> I have been able to reproduce the issue you reported.
> Instead of reverting the guilty patch, I am working to fix it.
> I am currently testing a candidate patch, and will share it in the 
> coming days.

FYI, the regression was also merged into most of the stable and
longterm stable releases: 5.15, 5.10, 5.4 and 4.19.
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
