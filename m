Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A136B6D69DC
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 19:08:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34956C6A603;
	Tue,  4 Apr 2023 17:08:47 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E3F4C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 17:08:45 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id l18so24696250oic.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 10:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680628124;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OaNiABUcvVtmqheZOblHu0qpT7KFyONMzcxJR5viS78=;
 b=07WeY4HAn20TAVCSTWFnzcPzb+75qryJVIWBROJkzIqqEXlJJ9CmtCh3xnhtCIuSIe
 ctJ26LVg4HoQ0XvuEETImDFuNgUE1aK9b1hxuFb58cTZUO/afaGCOca3981ddV9pWagq
 deivCHIBHqOETPZ97YlOT8CYLD04oCqQE3yuMxJ/rm2SWL/ezATsI/LJUaV9u4FOfQl6
 vQSg5r3WO2WjQcQa0k9gbwWQwqPJgPjYJIHHE7rPPwI3wFmccLIgYQmnhu5YqRatscQQ
 BwIKFbMLAkFSoMw9GfaLzdq4wLYJb6gdzKvzbtM/LuPaq9URWUiimc4jZjQlu++hbceY
 T3PA==
X-Gm-Message-State: AAQBX9dKRyhddyJsWK+1c51gKdANKmFLa+fMaTeu47z839otq8TdkkfQ
 QQTmMSIBDb8jEv94ZGJ6/g==
X-Google-Smtp-Source: AKy350YfBZrfqcW8PEMfVNBBRRfK7rLxbfeh5SefSwbtVkxAw/f8hlOJB1kpUb6wE9T+az73emC35w==
X-Received: by 2002:a05:6808:c8:b0:384:1e0c:fbbf with SMTP id
 t8-20020a05680800c800b003841e0cfbbfmr1455403oic.40.1680628124037; 
 Tue, 04 Apr 2023 10:08:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z127-20020aca3385000000b00383cc29d6b2sm5358287oiz.51.2023.04.04.10.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 10:08:43 -0700 (PDT)
Received: (nullmailer pid 121579 invoked by uid 1000);
 Tue, 04 Apr 2023 17:08:42 -0000
Date: Tue, 4 Apr 2023 12:08:42 -0500
From: Rob Herring <robh@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@xilinx.com>
Message-ID: <20230404170842.GD49361-robh@kernel.org>
References: <20230322173449.3970718-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322173449.3970718-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mailbox: Drop unneeded quotes
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

On Wed, Mar 22, 2023 at 12:34:48PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml   | 4 ++--
>  .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml   | 4 ++--
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml    | 4 ++--
>  Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml   | 4 ++--
>  Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml  | 4 ++--
>  .../devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  | 4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)

Applied, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
