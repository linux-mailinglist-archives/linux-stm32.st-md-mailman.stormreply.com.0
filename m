Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F666D4FD2
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 20:01:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32130C6A610;
	Mon,  3 Apr 2023 18:01:14 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8AFCC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 18:01:12 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso16082839oti.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 11:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680544871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+2HyVBZpgIAk4A8UQ7TPXHjOeuEm1wa0e7V0v5arzY=;
 b=IhAUDXPdpybFf+oYYOaUECpS2JPrkYqvb+ixKHoSB0KuFjo67Sqs4KI/8zZ26hz0J2
 O/4Qvk1KHg8R+/GwuunpON1EC1OWDHzIcHlfwgsw60tdnIWp/jxzraS1vwfqXbCIljcW
 yClaLnEigVtWBHkP1tFwKeyojT9WlSemAERQ7kDsuKw9//psCxGwvbxkFHN6Fs3nKVn+
 60G6RX8fHOtQy74AjjAhEx25wLtPBaRcxEmPw6GjwXo+y+gnSjgd8UQWjy8R091wojGr
 Rmlz145R9z8OAIp34qYSpsikJzN6q7d1J5QQ3LFOJ18dYKmgxnVQ7bmBQ8pBoodXjJXg
 2R6Q==
X-Gm-Message-State: AAQBX9e1Cs9vIVha1ViZWTwWVVN42b5ooeOLBAliqTtAyHiD7+x5l3mT
 aVlfnH+E31m08ONapLt+kQ==
X-Google-Smtp-Source: AKy350YbposOHjUqSKPLp1r0c5pZmS2vrYBOO8PRSBJMRbIsZ8g5xLashYmoygD9IWOODdA8MPrzFQ==
X-Received: by 2002:a9d:63c5:0:b0:697:a381:a8f8 with SMTP id
 e5-20020a9d63c5000000b00697a381a8f8mr41722otl.3.1680544871315; 
 Mon, 03 Apr 2023 11:01:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d11-20020a9d5e0b000000b006a3170fe3efsm2707835oti.27.2023.04.03.10.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 10:59:56 -0700 (PDT)
Received: (nullmailer pid 1164679 invoked by uid 1000);
 Mon, 03 Apr 2023 17:59:39 -0000
Date: Mon, 3 Apr 2023 12:59:39 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Message-ID: <20230403175939.GA1162106-robh@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Olof Johansson <olof@lixom.net>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC 06/20] dt-bindings: clk: oxnas: remove
 obsolete bindings
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

On Fri, Mar 31, 2023 at 10:34:44AM +0200, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,

I can't spell it either, but checkpatch tells me it is: maintenance

> and since no new features will ever be added upstream, remove the
> OX810 and OX820 clock bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/clock/oxnas,stdclk.txt     | 28 ----------------------
>  1 file changed, 28 deletions(-)

Always great to see fewer bindings. 

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
