Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48C725473
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 08:39:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F8A8C6A5FA;
	Wed,  7 Jun 2023 06:39:49 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8266FC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 06:39:47 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-565a3cdba71so86726937b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 23:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119986; x=1688711986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9L06aF4LwKWj5hfdOMd+MrYkDeMA9aJC8eR6IR8Wfw=;
 b=n7UlghKU7iVC4sUgtzuRUGh5Sqy5kuvOGWOJXgUYkxlT5OJU9e7g6csIyCdV5S7Dl0
 RcVzhuTakyeOs9AiNq5QE8rMSiABCJio9m9renL0jgB1/Ivt2muwRWvRbyoyw5917TB6
 xbQrA+15xwUOYelw/jj0xua3r6VrOH/7+eZ98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119986; x=1688711986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9L06aF4LwKWj5hfdOMd+MrYkDeMA9aJC8eR6IR8Wfw=;
 b=PPqlb4mdQdnKHxP62q35+Lgb8+rTlRpydmJ783nTfd9wckoEaSD04StkkEr4mHuaij
 P2i7BrcDDC2so1Oq2gv1RIxt3KPIGsrHeMSquYmivGFrNlDx9z4Tv7VB3Y306T4I3Lw9
 wNYOdHv0kgpftrP6VzJLsri2qmZmGcjPyKC4mlNmCvctN6RkxXWIcVLRcO59dNgG7eHc
 xy9Vs2dfUt3Vt1d71TDvl24bo60WTM1vnxACuYZ7qwPc9Jir1fsHrND4d7Ut2p2pVJe6
 3r7inaaWRBf+E2dvw5a1OzemcJ+gtKP5j3uxF21OXWnULVFffDpA10634wWjvU6pt6wX
 EBvA==
X-Gm-Message-State: AC+VfDxq6nF2hnJh2GwHJ20HnfUdB3ivoR72mQaEr6nlXBoObthyxGit
 T6uVTXHeVm+QWOpAaZzyW9VxAuMEilc7ypuQ+5+egA==
X-Google-Smtp-Source: ACHHUZ5MLUcNr10jCCVCPftKZqMlEQzEGS+hleq7z3iUEO2rU3lYS++w6zXNkmIERoJeKf8bE2U2hR1toHG8B8bERJQ=
X-Received: by 2002:a0d:cb01:0:b0:569:16a4:392f with SMTP id
 n1-20020a0dcb01000000b0056916a4392fmr5177520ywd.41.1686119986439; Tue, 06 Jun
 2023 23:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-6-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230607063139.621351-6-dario.binacchi@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 7 Jun 2023 12:09:34 +0530
Message-ID: <CAMty3ZB7Xnd3kp+1Cdxy0GzPCyZKEOz_jj5b8wBzRCtLSXha+Q@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 kernel test robot <lkp@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 5/6] drm/panel: simple: add
 support for Rocktech RK043FN48H panel
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBKdW4gNywgMjAyMyBhdCAxMjowMeKAr1BNIERhcmlvIEJpbmFjY2hpCjxkYXJpby5i
aW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBBZGQgc3VwcG9ydCBmb3Ig
Um9ja3RlY2ggUkswNDNGTjQ4SCA0LjMiICg0ODB4MjcyKSBMQ0QtVEZUIHBhbmVsLgo+Cj4gU2ln
bmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4K
PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA2MDIw
MzQzLmpOVFdlTTBQLWxrcEBpbnRlbC5jb20vCj4KPiAtLS0KClJldmlld2VkLWJ5OiBKYWdhbiBU
ZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
