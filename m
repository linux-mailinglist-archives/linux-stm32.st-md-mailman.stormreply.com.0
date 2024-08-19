Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F5956969
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 13:36:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A662C6DD94;
	Mon, 19 Aug 2024 11:36:42 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A719C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 11:36:35 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-530e062217eso5589909e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 04:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724067395; x=1724672195;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=78zmWX1R2MuUu3oiZjb6yXmGNi5evk9tkG6fthqDCQk=;
 b=BPGfK9eXN7j8N+0dzaeBncT3H8IlCF3QxgpKccjnxdZWOP6VsI5xpxnYT04n3kdCeH
 g2PoovdojLAKlEu8Um19tfXmOgcYgQiSkfVOLqUj00ZCxyB3llsC4AfE4yqGts3aY8q5
 lxarWAsPy+U8olJHP6jBKjpAAOufXE2sinM0bJrEdDu3uU83K8nLJi+yfDNtfRV7zt0F
 QRZ2y7Y8GfQRPRyhVj1UYFVjVgqKdJQb81++vynICWAlbz4lFWvHRI7B2E6zW273ZlaR
 eTTuZWBiTwacPPoO8hjJKl6eEoqfNEjNLnl6qScu0IcEZjGnGyhx9F35JotYO45zaiKq
 Um/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724067395; x=1724672195;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78zmWX1R2MuUu3oiZjb6yXmGNi5evk9tkG6fthqDCQk=;
 b=b612V+GX0v1sG19ixcaxuZQNDTT3486TtSmFqn/Vn0W3GRwUuFjw4aiJglgJiEN8ve
 XKtXYAC5Bi0xRPzFSgX1HVhNFUVeis0mFgDqOFyuBQOFKEh/9NMerMHqt2S56QkVes1h
 whhUukVHqgAj5D1xaf21tqmbzzdYbtY3GpMvp/wjE67LKcSX+ahCBU5B0JY13wvjc2ov
 VyCshQEjKG06o9i28W23RCrioERfzC+RpsSQiFoD9HGCGP9SDtrShakqSWE/MIqLjbMy
 +KEA1MgS32xByop9hc+Zdepes81qiaYgIZR5r/mVeo59K92YoyKCiSF5pck/BaXO4SJc
 cf0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQlUGToSiB9MB3pKPOeKbGX/bwYWJOqag3q9/+5YCPVISD0d/GilbqnCTaP4/YCLvxdTRQpBo+LTkj2Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzYVUzxeFv3DCVvMkfGZbIMTL4R6N9pc1GsKaKF+/62TJGlpudT
 dzUWv419ZOnHW50jS9TakRv3RCgDJdP87THDPvga7vDJrviQI1OA
X-Google-Smtp-Source: AGHT+IGke4g9LG82CUNKo1MIdeBQBLiC7DEdwsR4e5fBnnlRlr1KhhwfUBeUlTP2WItRZy2ABzDO0w==
X-Received: by 2002:a05:6512:1096:b0:530:daaa:271c with SMTP id
 2adb3069b0e04-5331c6a1a7bmr7372071e87.16.1724067394331; 
 Mon, 19 Aug 2024 04:36:34 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3afc45sm1469525e87.44.2024.08.19.04.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 04:36:33 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:36:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <iszw753okcfn6nximo3rovz7plbeo6yrcaoai7mb7x5blmiilw@kean47lp6ipv>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: clock: baikal,
 bt1-ccu-div: add top-level constraints
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

On Sun, Aug 18, 2024 at 07:30:10PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  .../devicetree/bindings/clock/baikal,bt1-ccu-div.yaml     | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> index bd4cefbb1244..30252c95700c 100644
> --- a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> +++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> @@ -134,9 +134,13 @@ properties:
>    "#reset-cells":
>      const: 1
>  
> -  clocks: true
> +  clocks:
> +    minItems: 3
> +    maxItems: 4
>  
> -  clock-names: true
> +  clock-names:
> +    minItems: 3
> +    maxItems: 4
>  
>  additionalProperties: false
>  
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
