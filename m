Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F4735FC7
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jun 2023 00:11:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40EC0C6B442;
	Mon, 19 Jun 2023 22:11:19 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9D58C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 22:11:17 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-340b8d6aabbso11546585ab.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 15:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687212676; x=1689804676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GzJl3YIufx24rrPPBjiGHwcJLGJVUI+UoKbrhxXg1M=;
 b=jf34gVZqDdqBbW8ztFpjRSvriC3H7qxX74bXq9APG+kUm+vSozbuDqdk1qtL8Hw7qD
 5AxGhooFs0CXIab9EvuaQMM6IX8Y3cYV+379VruFm+K8xgOI2YcHixKA2/O2kjy5ug34
 OpwVUsVrHilhZ9d9R6RAEvUOpD02N9xUEnQwoiyGFOluzog8fDWAs6fCw/e1HbdYIjuC
 jauohZiWo+ddu45k0duSJRXGtq/5Ht8sfNn+H9PgXDPa1cEhVZVc4lpO7uQ4H5hNZ8r2
 9DRDK1hSx6J0t67pXIwV0GlKjgEY0IRveAnqq0OktypqGqZ4JKPh+3U75gc+bVbFp2DG
 w8CA==
X-Gm-Message-State: AC+VfDxDLqnt33GOA8oNRr88K2FWCiqOOKka/OBL16vhI+tbUElKkxUF
 9Bwn/1h5pihGnJ4OUj+tZg==
X-Google-Smtp-Source: ACHHUZ6YHBtLREVH2RBkLmpN6iF2iPKgeZP7XF9P82sV7Y/BeGqT4CuDM3LoXhiiKoMP9nbsocyEXQ==
X-Received: by 2002:a92:c60a:0:b0:33e:6d37:ce76 with SMTP id
 p10-20020a92c60a000000b0033e6d37ce76mr6318463ilm.12.1687212676512; 
 Mon, 19 Jun 2023 15:11:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a92c6c2000000b0033bc3a3ea39sm170537ilm.70.2023.06.19.15.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 15:11:15 -0700 (PDT)
Received: (nullmailer pid 1611621 invoked by uid 1000);
 Mon, 19 Jun 2023 22:11:13 -0000
Date: Mon, 19 Jun 2023 16:11:13 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Message-ID: <20230619221113.GA1608794-robh@kernel.org>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
 <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
 <20230619-ion-decree-c63d2eb11e83@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230619-ion-decree-c63d2eb11e83@spud>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 4/6] dt-bindings: display: stm32-ltdc:
 add optional st, fb-bpp property
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

On Mon, Jun 19, 2023 at 09:18:25PM +0100, Conor Dooley wrote:
> Hey,
> 
> On Mon, Jun 19, 2023 at 06:55:23PM +0200, Dario Binacchi wrote:
> > Boards that use the STM32F{4,7} series have limited amounts of RAM. The
> > added property allows to size, within certain limits, the memory footprint
> > required by the framebuffer.
> 
> Hmm, this sounds quite a lot like "software policy", since the actual
> display doesn't have these limitations. Rob, Krzysztof?

Indeed. This doesn't belong in DT.

Rob

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
