Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ACE80AE03
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 21:37:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9048C6A613;
	Fri,  8 Dec 2023 20:37:06 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12859C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 20:37:06 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-58e256505f7so1162973eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Dec 2023 12:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702067825; x=1702672625;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtLCjRr60799H2MKwM/QzmmaJzcd7IJTQn1+Afg4EXM=;
 b=HeGW+Q2O4Jnr+JGCMwt1bTMKTPbPZPVXkyNAk9AhIuORWQ9sKYn2hOpQry6m9StVyN
 1y/dxSyx2yWYWwQJQuDFK2R7rT97pzS4WWP0nPIQRtumB1ZQhijJtKtfaYuswK/9afm3
 H2nQgUvNLISx3zwtNnF9IaXfl53c6LsRESwCRqVb3aw6u9UftaOUvkqZdcWu568CUZCs
 7TroLsECMSH8BZV2/F3L1t89iUDlSyumkQKkmoOqrPBkGF1Sm84S2t9cj2iC+6PJZo+0
 SuusMK+9WL7e8lel9Kq0L6Yk+hOaeN5lw/1k1x1f6uF7eTpm1IQnsh/ZUHpY35AHFzkd
 6Xzg==
X-Gm-Message-State: AOJu0YzM0eVDU2WinrUSN6rwPi08501ZGd7s/f/A3u/CW1fxbrIjhHCi
 rxq4DxUk/IZ87+JWUx1sqA==
X-Google-Smtp-Source: AGHT+IF6nHBrpdI9PdRJ4tPrY8/hF9C+fJyV7AZgkGumgP+nDJ+h9st1ng57n985M8whf2xhzvAPCg==
X-Received: by 2002:a05:6820:556:b0:58d:d525:6b68 with SMTP id
 n22-20020a056820055600b0058dd5256b68mr1039807ooj.7.1702067824630; 
 Fri, 08 Dec 2023 12:37:04 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n27-20020a4a345b000000b0057e88d4f8aesm440586oof.27.2023.12.08.12.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 12:37:03 -0800 (PST)
Received: (nullmailer pid 2661606 invoked by uid 1000);
 Fri, 08 Dec 2023 20:37:02 -0000
Date: Fri, 8 Dec 2023 14:37:02 -0600
From: Rob Herring <robh@kernel.org>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <170206782161.2661547.16311911491075108498.robh@kernel.org>
References: <cover.1701939695.git.quic_jsuraj@quicinc.com>
 <87bdedf3c752d339bf7f45a631aa8d5bf5d07763.1701939695.git.quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bdedf3c752d339bf7f45a631aa8d5bf5d07763.1701939695.git.quic_jsuraj@quicinc.com>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@quicinc.com,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/3] dt-bindings: net: qcom,
 ethqos: add binding doc for safety IRQ for sa8775p
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


On Thu, 07 Dec 2023 14:51:25 +0530, Suraj Jaiswal wrote:
> Add binding doc for safety IRQ. The safety IRQ will be
> triggered for ECC, DPP, FSM error.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 9 ++++++---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 6 ++++--
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
