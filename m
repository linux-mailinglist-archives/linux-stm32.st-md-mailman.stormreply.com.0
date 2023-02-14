Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0B69724C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 00:59:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98710C6A5F5;
	Tue, 14 Feb 2023 23:59:45 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7F20C6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 23:59:43 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id t7so5279485ilq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 15:59:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47c8N65+bA0va12esEad9F+wfY0jNc6/6f/7s5GMhO8=;
 b=fBtprmePqeO8cMIGqkypq/HAuvkdSdJkGKZ8ekohH2G5crJQhvQVsV2hj0aKDm2Lv5
 wZG7LE8SekpTqVm3UfHi8ac5QLV0bGXyBbLp4Y20Fu7HUrrafde7PSPtlJSCyWSaIVx0
 nnsAZdNcBCHnFfftn5EIkGy5XCUvqVZpfva7Z8XE3SuSERVF3CrF8a3m5YAiuWjDerL3
 of5Idg5Wvvp+PhEnHL+0Lh/nQv7138gBBCAPQI3KzdqZtGRciCg/SoUplKwwclXRlrNO
 t32kGf3XlDITN4VSWCA1QBCABTvM8IV7mF/KtnKonqqMydt5TfELLT1OxUh1GQUgher6
 6s/A==
X-Gm-Message-State: AO0yUKXoIevEFtjqXzkEY2RxQvPdgQx4EBFTtiL3iQsA29FUO/xecHBX
 H2hROBvQx+kxRLC1/NmUow==
X-Google-Smtp-Source: AK7set+XH9b8ktNsasvbgIJRBQmFqKfQdWRX5JLUyb8R3zB6ZuA6Qqi0YDWXX0Dbqs+2khFXzLwNVQ==
X-Received: by 2002:a05:6e02:b2f:b0:302:a58f:38ab with SMTP id
 e15-20020a056e020b2f00b00302a58f38abmr527073ilu.0.1676419182555; 
 Tue, 14 Feb 2023 15:59:42 -0800 (PST)
Received: from robh_at_kernel.org ([65.158.198.6])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a92dd8f000000b00313f2279f06sm5044113iln.73.2023.02.14.15.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 15:59:42 -0800 (PST)
Received: (nullmailer pid 59144 invoked by uid 1000);
 Tue, 14 Feb 2023 23:59:40 -0000
Date: Tue, 14 Feb 2023 17:59:40 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167641913806.58082.2803069837642065032.robh@kernel.org>
References: <20230211124540.71208-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211124540.71208-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: dt-bindings: st,
	stm32-cec: drop obsolete file
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


On Sat, 11 Feb 2023 13:45:40 +0100, Krzysztof Kozlowski wrote:
> The st,stm32-cec.yaml was moved to media/cec directory, however the
> "remove" part disappeared during applying.
> 
> Fixes: 8f43766211af ("media: dt-bindings: st,stm32-cec: move to cec subfolder")
> Link: https://lore.kernel.org/all/20221208103115.25512-3-krzysztof.kozlowski@linaro.org/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/st,stm32-cec.yaml          | 53 -------------------
>  1 file changed, 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
