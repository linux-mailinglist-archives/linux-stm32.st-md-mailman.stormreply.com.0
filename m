Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7515B4705
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Sep 2022 16:53:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCEC9C64117;
	Sat, 10 Sep 2022 14:53:58 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86E05C64115
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Sep 2022 14:53:57 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-12803ac8113so11466671fac.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Sep 2022 07:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=85ahIlvo8IWoFxRTWFFF8AdVN61dvRZSed2EwF8yXgA=;
 b=UCxEEqEZFGYWdIWGkWWQB0pSCsCDxCUJhN71Wlk1NMRPL95xTYKtQNyfnt3Y5ZtSen
 aSdwZvzdqMyEo1rpVoOL56g6kZ3owMmcF61nH2qmHN/XADD1XGixEO0US5qlYnuyadRv
 VLl3FubD3hw9anTc67FnjQNjTZsC+uJzJwZOfGSMOJLyESfiOD8sykXw1TqpIftI9i/9
 QSV0XPQzqA4MwVxDmpqcosw6lQLjzyaGVo0ekkNIQa4chfQQdwF5Q5X7gxQ6xabVWAUu
 xCy/JkuhPpFn23CZkB+g0SFbLXrOZMwyzJC05h8ulnE5/mpLfQzFqQgy+1UaCu/e1yW2
 DmjA==
X-Gm-Message-State: ACgBeo2U+nBcwBpSaXDlMYQJGYzemfj77t9bSKPznnD/IlORI4RRYI5z
 xfHb+xwEeTu1S9deBKVcYA==
X-Google-Smtp-Source: AA6agR6kT6NFsonaHXPp4wpmeYYYkkqwuksA7+CErrbYE2vW+nLoubjG+79eHSGEFoGioIpoRwr0qw==
X-Received: by 2002:a05:6870:58a6:b0:127:86d4:6707 with SMTP id
 be38-20020a05687058a600b0012786d46707mr7387223oab.88.1662821636301; 
 Sat, 10 Sep 2022 07:53:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l2-20020a056808020200b00344f28a7a4csm1251362oie.22.2022.09.10.07.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 07:53:55 -0700 (PDT)
Received: (nullmailer pid 34694 invoked by uid 1000);
 Sat, 10 Sep 2022 14:53:55 -0000
From: Rob Herring <robh@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
In-Reply-To: <20220909165959.5899-2-hugues.fruchet@foss.st.com>
References: <20220909165959.5899-1-hugues.fruchet@foss.st.com>
 <20220909165959.5899-2-hugues.fruchet@foss.st.com>
Date: Sat, 10 Sep 2022 09:53:55 -0500
Message-Id: <1662821635.155935.34693.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: media: add bindings for
	dcmipp driver
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

On Fri, 09 Sep 2022 18:59:55 +0200, Hugues Fruchet wrote:
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
