Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7245A5BD221
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Sep 2022 18:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F191C04003;
	Mon, 19 Sep 2022 16:24:58 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8697BC03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 16:24:56 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id a2so23791379lfb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 09:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=eAOafVCNVmR9N9v0Yvq51YsgQAP+hB4f5u0L/4nUBKA=;
 b=ethu0EynC43p9UpiI84ruyAXrMRMdZfuiof4jGWO3COHQkx9EjPMb0Llez11+BLPKc
 5EqefT79o5oAfWdTFyJjgnxiKXiq84VSTx1yMZv0TukcBhrSE770dxQz5AgwGe1/wdX2
 cUJsrSok2ZwMke4mNjZjszTcRrHhEleMa2aQSfFC8yHWRZB04kXsxZz6CdO77YeDIaKv
 W7FxT0sb23ogGQ7pc/WVP0aKVEqqH7TJDENRj5695hxAabD43bspb6BjFX+2A2W7QhTc
 h3skjS9SO/0P+2xMjVxsZpwoqFCCIKq/pCYKaq7GoKibRjTOB+55a8piA4ChmXfjbqDC
 To3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=eAOafVCNVmR9N9v0Yvq51YsgQAP+hB4f5u0L/4nUBKA=;
 b=SUvpZ6Tngy4ZoG1lpf+3gOOXPoPOcTt2Vw9p+Ku0F4PmnGVnezo3fzHXN010wPi02q
 9PastAcO9HnQAJYcAPsSxYDsVaqHqXczIPcgOtCKF6WkWkyDFY9/2ykzadCpwLBWV+/Q
 55PaGOXihYb6Syp4PYUeqEc1ytl7CzP4PHArTfvyZUppuKiKg/216CCr/zg/iHCBcq88
 iVnuYB153MBkTcxqUrLdfzVVvtjzksQ0Xd2rhcnJfNnannl2MY8mTtzQbtQUETjH0WDB
 fxU+zCiHwReXLNo5JCNQmhsgeSXnqjKEisggEWnmaQfS6QV+UHuz3ii+UHQ9uRHeelGl
 4cuw==
X-Gm-Message-State: ACrzQf3YicbK4mvXmPJpU1AcZsptAwBe723uqt70Zy4nVurmoNZa0O6C
 W4PDY1Bk/3AkMmOmGpfiRLK3zg==
X-Google-Smtp-Source: AMsMyM7Q5L1McMMFqSUa7fGLN03YMRs0ciA4N40x8PHN9GOTdAWbWDoQN39MejGALAtGiMvhd/RDEg==
X-Received: by 2002:ac2:4e0d:0:b0:49c:d593:9d6c with SMTP id
 e13-20020ac24e0d000000b0049cd5939d6cmr6740730lfr.37.1663604695831; 
 Mon, 19 Sep 2022 09:24:55 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a056512349700b00499d70c0310sm5061842lfr.3.2022.09.19.09.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:24:55 -0700 (PDT)
Date: Mon, 19 Sep 2022 18:24:53 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jianguo Zhang <jianguo.zhang@mediatek.com>
Message-ID: <20220919162453.4kkphzhc2tu6wzou@krzk-bin>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
 <20220919080410.11270-3-jianguo.zhang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919080410.11270-3-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: dt-bindings: dwmac: add support
	for mt8188
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

On Mon, 19 Sep 2022 16:04:10 +0800, Jianguo Zhang wrote:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


ethernet@1101c000: Unevaluated properties are not allowed ('clk_csr' was unexpected)
	arch/arm64/boot/dts/mediatek/mt2712-evb.dtb
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
