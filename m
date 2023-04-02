Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2AB6D371D
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 12:18:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50928C65E56;
	Sun,  2 Apr 2023 10:18:39 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D28F8C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 10:18:38 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id ew6so106348257edb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Apr 2023 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680430718;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sN4W0uppG11n4amgZQQ3mpLKRvCRZOSROsn8m2Kimkg=;
 b=jb+VJPdBqQST71dfQdR2PxUbmb8b02IKUIK2Nl00BYhPfKddUdEroPOVgXh5zH8cjW
 hT3PIhI0fncDCliWCt7mzQiKdfPcLIS9NpPFlqPg1wjloSsgZglYv2g9tXo6sXxlVhpv
 F1ZxTeu+g4yT8WAUGbizJsWrfQrI9Ck6M6ajArriv3d6TMFBfAupw95heEeutndZ2eZM
 h7A5KKcasAdAz3+zklThNj3h5nGmdqSI0jnHZBDxGlLh4Vag+yZ6jWlRe3RHzdps3aMZ
 WiXHL8dsKu+q+NaWMu12ZNa5se19Hb8+i3pVJXYsDDqt35BrNpNdRiqQWoBscwibJq3L
 w5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680430718;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sN4W0uppG11n4amgZQQ3mpLKRvCRZOSROsn8m2Kimkg=;
 b=LaimzMMrx8Lg4la3Ms7SAsBVNmwFrTZkybeQnnVrfhVhhelRPtebmKBdTwN0MOqvOn
 ip2ybu0w5eY1IyOyORJaR1J90flsmKL9BalobACTU32gFbIBJbelUOQO7yXvEcpjXtS7
 mQ8Aw9PL8rl+N6TAl+1b7kV9bPB/KgkQ48jGeZmpaTvwBOGzat8zlphRzTa4fiQZGcbk
 Ke/NYRQ2p0IsRsFU3prJ9mrlLFJZkKjn+eexeLhODnBSH1LxObGUGxbYDsSIXU1cThny
 nalGI4o/WZVfwNgegMhgEObwo+Mss6noW83F4gVTlEN7/EIcEn97SVkk3SnjUF3J4CGz
 6lXQ==
X-Gm-Message-State: AAQBX9fA4cXTClNHcDnxNlLvU9t0phbdIfkeI+LvKPxITCu7SK0ltO6/
 bTVcrb1FVVCuphyRA353Jhe5Ag==
X-Google-Smtp-Source: AKy350bl5AI/ffJhjWXPUZDpoMYhYVGYbPhasRbUNkSaaqKcK5VPx7QaTdan03JTQnaAu7+DbiZjzw==
X-Received: by 2002:a17:907:744:b0:946:fa68:1a91 with SMTP id
 xc4-20020a170907074400b00946fa681a91mr17736295ejb.75.1680430718427; 
 Sun, 02 Apr 2023 03:18:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5?
 ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a1709067cc300b0094776b4ef04sm3145749ejp.10.2023.04.02.03.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 03:18:38 -0700 (PDT)
Message-ID: <2c7e2f62-9f0e-3be4-0da2-e0cb89a197dc@linaro.org>
Date: Sun, 2 Apr 2023 12:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 clock bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
