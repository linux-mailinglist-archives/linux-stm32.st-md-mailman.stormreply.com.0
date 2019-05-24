Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA92A0BB
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 23:55:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1679FC06B94
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 21:55:53 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B31A3C072EC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 21:55:51 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id t24so9989494otl.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 14:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1Hd5HUE8FtAVIHZ0zOMuprsDH1qucHlAidVwNXNR0kE=;
 b=RvuDoW4rtWu/nxjj8XadfJCMeVKf+YeV4tBv51k2dROeLuzlAzpnTysvsdPsiM8y84
 hLhFVMexkkcgS88DV9DyDkn79fUzPsVS/werfPvhFGl/5C7YK8s4K3yE4Ac9yOskcicF
 0V1EYNt9gV8wJQd9UdrouPt2qhwh7KGSYVnXTsK9iJhlJICfAqQDlshgw0MJVWZMpuOW
 HRZcMbFC5hEBkDmnrQeP/SqI9madqTAaefqzJdd/T9EN87uOXt76ayibZlx/SuHsD0ny
 cbb17y5punajC++raNivv3hI1qenhJh+gD5LCYqHuq2gNRyWmKQ0pAOSZ+wxnGLRkEWH
 RFXg==
X-Gm-Message-State: APjAAAXxnD6imDSD+6Z/ya9HUQHBtXtjyCEnjoBSzqEVw6K5K1G15Q8x
 XfC33kkCfCzeWaV8K2G8LQ==
X-Google-Smtp-Source: APXvYqx38nwGxFFCwmvC358jGtt2sCWNYPbMOthN/1AGAmXZzhMX9GG7akLemxmhb6zk5JKBh2ArBw==
X-Received: by 2002:a9d:6312:: with SMTP id q18mr14150968otk.45.1558734950429; 
 Fri, 24 May 2019 14:55:50 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b25sm1193569otq.65.2019.05.24.14.55.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 14:55:49 -0700 (PDT)
Date: Fri, 24 May 2019 16:55:49 -0500
From: Rob Herring <robh@kernel.org>
To: megous@megous.com
Message-ID: <20190524215549.GA13928@bogus>
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-5-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520235009.16734-5-megous@megous.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v5 4/6] dt-bindings: display:
 hdmi-connector: Support DDC bus enable
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

On Tue, 21 May 2019 01:50:07 +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> Some Allwinner SoC using boards (Orange Pi 3 for example) need to enable
> on-board voltage shifting logic for the DDC bus using a gpio to be able
> to access DDC bus. Use ddc-en-gpios property on the hdmi-connector to
> model this.
> 
> Add binding documentation for optional ddc-en-gpios property.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/display/connector/hdmi-connector.txt     | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
