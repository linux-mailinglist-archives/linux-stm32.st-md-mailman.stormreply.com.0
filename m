Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9D5B5245
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Sep 2022 02:44:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A76F0C03FC6;
	Mon, 12 Sep 2022 00:44:20 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98A9AC035A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 00:44:18 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-11eab59db71so19422009fac.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Sep 2022 17:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=V+fdkvdPWRhvXn+afJKKR9vxZ+OhqSngIUjZosWiaGM=;
 b=xcDTec3PhSrhLYmSIn5iuGZ8VYTzWURLq57NXFjhbpD1kyhDJnGWM0RnEYqKpPjRWV
 QyikozwDF3YrG6dfz5SgZjcnxHlqidSpawiPFYSWVFS1ri+by8QF2FzvsFJ6wQWnHWZX
 Y7xgeUGmNnwd2givUKMzdeE4/kDLK42BKQ2iDvUZ2Y1h9p30DQyFbjf8S4Y8FpZWEmuX
 eX0OQtEl/pv5x8UryyvW5egE3U/8nadTWQMNplytR3jshOFn1Q9JHwMPNWniFpFL4YDw
 3tl4qxJakIxYdCV+wk/B32GNaOXBzA9K9+sD58S7petQx8rSuOwSm/G2BcMSyKY/2R2L
 gljw==
X-Gm-Message-State: ACgBeo1pBgZftPb9WZbyCPARGj1USNvxMCVgvaYbXme43PXbvEF8PMbi
 xB48l/XN/uCdY9XZGSRnnw==
X-Google-Smtp-Source: AA6agR6EjSggqXBE7a+I9hL6SZCJ+S5mIWBC+TVZZAoQKWYb+xJHzJHktuQdS8OxzNaK4ZaxTze78Q==
X-Received: by 2002:a05:6808:d4c:b0:345:32dc:7a69 with SMTP id
 w12-20020a0568080d4c00b0034532dc7a69mr8061256oik.118.1662943457205; 
 Sun, 11 Sep 2022 17:44:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y5-20020a4ade05000000b00475790c9a08sm470912oot.16.2022.09.11.17.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 17:44:16 -0700 (PDT)
Received: (nullmailer pid 3629323 invoked by uid 1000);
 Mon, 12 Sep 2022 00:44:15 -0000
From: Rob Herring <robh@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
In-Reply-To: <20220910144010.34272-2-hugues.fruchet@foss.st.com>
References: <20220910144010.34272-1-hugues.fruchet@foss.st.com>
 <20220910144010.34272-2-hugues.fruchet@foss.st.com>
Date: Sun, 11 Sep 2022 19:44:15 -0500
Message-Id: <1662943455.958018.3629322.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v1 1/5] dt-bindings: media: add bindings
	for dcmipp driver
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Sat, 10 Sep 2022 16:40:06 +0200, Hugues Fruchet wrote:
> From: Alain Volmat <alain.volmat@foss.st.com>
> 
> Add the yaml binding for the DCMIPP driver.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../bindings/media/st,stm32-dcmipp.yaml       | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/st,stm32-dcmipp.example.dtb: dcmipp@5a000000: port:endpoint: Unevaluated properties are not allowed ('pclk-max-frequency' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
