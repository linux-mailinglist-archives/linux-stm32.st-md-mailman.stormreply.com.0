Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F3C3A81C0
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jun 2021 16:05:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47BF5C597B0;
	Tue, 15 Jun 2021 14:05:04 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEB1AC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 14:05:01 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id z1so15430593ils.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 07:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Ul7S+YmegefjytTCybJFOmbLUpYojuCju7Gxif7Sbhw=;
 b=g/oIBxoxQw/GdQRGRaRZAHdLRQQg4wrzbXFCZWAjxpRfJPjRF/9oIKvxGq3zP2oVPs
 QY+052itcLi5/NzmxKvv8hNBZM6HsEqSOqwrl0fA+AnuiCVrnX5mN5xJuaVCrEUm+dg9
 V1tkrrP++bWbhBKlgBCzzKQvUu56D4hcdvg0ASiZtNJy3QIEtIC9VZLmAGnYftzWLkw0
 ExagBhqVaoRbSBwbUrkqyB661IgigDewlVAQbyIuouwiSBdvTRU86ZN1DoxVh5My5jqj
 V87H0Tw4LPfOY5GfqHeQTvKn1Ts6V2I6v+YNRW6N2g9F+v7pcXPfgLqQkQV49G9PwYd8
 tyOg==
X-Gm-Message-State: AOAM530X6L9KMWvEwn1Huu/vnKV66397EkDwspJQY/Iv8naBMtZlHcxw
 YExb0spwl7q0G3rGvVNEBw==
X-Google-Smtp-Source: ABdhPJxlnUeLKisaHXDilxBGNC4oZcH3BSSM4B2ikEr4N4pEw8d4AZXuCBOQPgy54qWgugEGKRfulg==
X-Received: by 2002:a05:6e02:809:: with SMTP id
 u9mr18073417ilm.63.1623765900676; 
 Tue, 15 Jun 2021 07:05:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id d5sm9299257ilf.55.2021.06.15.07.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 07:04:59 -0700 (PDT)
Received: (nullmailer pid 487355 invoked by uid 1000);
 Tue, 15 Jun 2021 14:04:53 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?b?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
In-Reply-To: <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
Date: Tue, 15 Jun 2021 08:04:53 -0600
Message-Id: <1623765893.376832.487354.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alexandre.torgue@st.com,
 sernia.zhou@foxmail.com, rick.tyliu@ingenic.com, dongsheng.qiu@ingenic.com,
 sihui.liu@ingenic.com, aric.pzqi@ingenic.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, kuba@kernel.org,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jun.jiang@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: dwmac: Add bindings
	for new Ingenic SoCs.
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
Content-Type: multipart/mixed; boundary="===============3679547539169646604=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3679547539169646604==
Content-Type: text/plain

On Tue, 15 Jun 2021 01:15:36 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add the dwmac bindings for the JZ4775 SoC, the X1000 SoC,
> the X1600 SoC, the X1830 SoC and the X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     No change.
> 
>     v2->v3:
>     Add "ingenic,mac.yaml" for Ingenic SoCs.
> 
>  .../devicetree/bindings/net/ingenic,mac.yaml       | 76 ++++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        | 15 +++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ingenic,mac.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.example.dt.yaml: ethernet@134b0000: compatible: ['ingenic,x1000-mac', 'snps,dwmac'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.example.dt.yaml: ethernet@134b0000: compatible: Additional items are not allowed ('snps,dwmac' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.example.dt.yaml: ethernet@134b0000: 'phy-mode' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/snps,dwmac.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1491797

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


--===============3679547539169646604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3679547539169646604==--
