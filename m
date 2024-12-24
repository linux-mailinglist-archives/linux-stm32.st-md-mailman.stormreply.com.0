Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F329FB91D
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 05:17:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E059C78F67;
	Tue, 24 Dec 2024 04:17:06 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 429C7C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 04:16:59 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-540254357c8so4865061e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 20:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735013818; x=1735618618;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sBqVAasc5aaOLoOz1GUhccnE1y4WdkWmYtGpXlXBdiM=;
 b=rbcSqtFLmJXUsV6MI1JGzI42TvzmzeEIbU/afXB0YV16W4Pa6eLRWwsW/howpgReUJ
 5eAhYglyZrahDUZ6aHXgiV5GkalMFEI06D8Kia0Gb+sP3Vxc+16WRLQLbZoSVdyvJOBV
 Tr3Ar0IhWlQe3ThxlRHOF8bLpy/IOGtx/redwGGxXIxgClOVB6oLtcc9Ega8sxHA1P+y
 MGzOLUuqAGJEe9NqBe9wywSOg3arC4n3dQWQMNfRRQOjcMzJB1eSLOkzxeLU4tq6+7ih
 YsmEXXj0B8p032PF9zfCw9qz3zM9DTWyYFZgEt8phyxoHCSZ6JDOMqNiO7DbMterlp3M
 BLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735013818; x=1735618618;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sBqVAasc5aaOLoOz1GUhccnE1y4WdkWmYtGpXlXBdiM=;
 b=H3+ugxs8esi8b728HZawZZAqh/fK+PcWnzsONAjFoi5QRXvJhVP6Op0eC4icwiIjz6
 9MAADlyKCXgDdYhcHiDf0QIEbbHNuUL8CWJ5RVR1YUb/68SHqeeEvx7Ejn6n2sLoX97p
 czbXEszm/508c6eReMI/hg3JE2mp+uh97vyEXmp9ByXvdjl3vtNuY1iPQ55CDCCrTOlP
 lpdGOm7C2lxHwVfsOMwts5y4SsoHJ8g45pyBeL/Us1laz4Nkdaq4YYErepbr1Wpyz/km
 Rwnq49Pcsh/cTxWb1lYRr2rKyNORIHScy/9b4tSQz9BLHgSZWENfE2kgc5XCRmwbFL+H
 N/TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMDFhtxgO9zaf57VfeWhKoPnFWE3rZdz/FC1gn/qoblUh8R/jArkZ1eL++EHdLWW57Scck+/W+d+1H2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyATWUPADKcKca1clHI6tKC1zD8goK0nk1LnFV3i63pg+9DN9XC
 osfnC5YQ3FktIcAioxT8Oys22fcmlfuULhXddZumpVQeCWx38eKKRUfhgtGY5V8=
X-Gm-Gg: ASbGncvCmn2F51q/2q/IDx9E3/YYXlvOxweC4JK1vIEPbEWW156sCdIb+6nzjoWJAWW
 6N91ATuWJe6Q8nAX6hPP3g0/G3wPAAgoxbluGW83X/IkJespW/0F9bFGLB4noyen0XcMzmQpJlC
 hgJ/2f1URw+sIQ2gMIIG2WQkMRsOLd2dOF4gLrrLh5kLDnMBOTlVWxNZbKFsdYxscUZ1lbTt8L7
 Udh5DUo/Hrc58D7jP1JVmTGRNKC7JGqc88emAGokWp4JE5zADaHKp52+MQVBGw4cd2E99iKKIkX
 M74/KXLXxI0MTKy8ClAiof+AVlLYL1XNjVJa
X-Google-Smtp-Source: AGHT+IHMGmYGMF6q2MDHua7nxv0GhA7FnjWIVG2kKpKZJ4CxXoTwmdLNVjxPUwAUj8j/ub8sXpIJFg==
X-Received: by 2002:ac2:4c48:0:b0:540:3579:f38f with SMTP id
 2adb3069b0e04-542295821afmr5451612e87.37.1735013818146; 
 Mon, 23 Dec 2024 20:16:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238214b5sm1486186e87.187.2024.12.23.20.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:16:56 -0800 (PST)
Date: Tue, 24 Dec 2024 06:16:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <t7q7szqjd475kao2bp6lzfrgbueq3niy5lonkfvbcotz5heepi@tqdiiwalhgtg>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/3] Add standalone ethernet MAC
	entries for qcs615
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

On Tue, Dec 24, 2024 at 11:07:00AM +0800, Yijie Yang wrote:
> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
> compared to sm8150's 2.1.2.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
> Changes in v2:
> - Update the subject for the first patch.
> - Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com
> 
> ---
> Yijie Yang (3):
>       dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
>       dt-bindings: net: snps,dwmac: add description for qcs615
>       net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms
> 
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>  3 files changed, 20 insertions(+), 4 deletions(-)
> ---
> base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b

Which commit is it? I can't find it in linux-next

> change-id: 20241111-schema-7915779020f5
> 
> Best regards,
> -- 
> Yijie Yang <quic_yijiyang@quicinc.com>
> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
