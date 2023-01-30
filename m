Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDA681C84
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jan 2023 22:16:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE3C8C6506E;
	Mon, 30 Jan 2023 21:16:54 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF6F6C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 21:16:53 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 r17-20020a056830449100b0068bb088317aso3113385otv.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 13:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcrV54BiwPoY9Fj0QzoXljDOtBmNJXprxT9kEPPunIo=;
 b=muHNTvDC1VxSS7vmY0h1DraTfkLsZzq1AK9w9cuv5VwEj1cLhCuwyKFoOSV3RBZTei
 Z/5f+UN/gWyYSBsfTe+fpa/RFO6V2CMxzrc+S22PTWwN6pLDU5nL7dQLnYJ7uBKmYX6w
 cCGxObwCO6ldkx5wEbpU1PqqavYYotDUmKYDm1/A966sDrNnrdOuZoPVVs2mlRQk/aFp
 AgFjetYiDfh50+f/tPzV+gcT57TfXzwin3w/1wzeNnYRCuiyG/y/TIc+ximIHgXzSPsb
 OfWX/zRkMR6nMh5mNTYmsNSUX9caVHGKFvHHMDeHQ1CcaNQBM6Lwdndb+CbVURiZnzND
 O4uw==
X-Gm-Message-State: AO0yUKW0CsDntlYUKDfAPseItfXqe4yUKklhlDn8TTNvCxM65+LBoF4M
 wXBRdrmLoJc6sAWvctHu2w==
X-Google-Smtp-Source: AK7set9mpHIxfS1q1mfC7od0uezdqQ4nZnOQEwXW6chL10CHt094V/in9eOzZc7rXGaQD+kKcqsv2Q==
X-Received: by 2002:a9d:4d87:0:b0:684:dbfd:f239 with SMTP id
 u7-20020a9d4d87000000b00684dbfdf239mr5080904otk.9.1675113412412; 
 Mon, 30 Jan 2023 13:16:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q1-20020a9d5781000000b0068bd922a244sm865309oth.20.2023.01.30.13.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:16:52 -0800 (PST)
Received: (nullmailer pid 3454207 invoked by uid 1000);
 Mon, 30 Jan 2023 21:16:51 -0000
Date: Mon, 30 Jan 2023 15:16:51 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167511341075.3454008.8039440710554703660.robh@kernel.org>
References: <20230127202040.196411-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127202040.196411-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: input: touchscreen: st,
 stmfts: convert to dtschema
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


On Fri, 27 Jan 2023 21:20:40 +0100, Krzysztof Kozlowski wrote:
> Convert the ST-Microelectronics FingerTip touchscreen controller
> bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/input/touchscreen/st,stmfts.txt  | 41 -----------
>  .../bindings/input/touchscreen/st,stmfts.yaml | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/st,stmfts.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
