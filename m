Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F575807E7
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jul 2022 01:02:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C870AC640EF;
	Mon, 25 Jul 2022 23:02:00 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9F00C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 23:01:59 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id n133so5101936oib.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 16:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tNDL9l45N5Qx84qzLXSWONA/jhkumfsBUM0cy83Dbwo=;
 b=J9FVW2FZu5RiPHnySVK5ojIMKhvLtDoYCuKeO2mqveqyzEjfKBFkUiOvEQbmzPlIvu
 Gjp/Oc3PuDr/Xq616Jus8OiKDkvBrFj2aP1t6tGaUvRr8rvU0cNVD/93KN6BJpPCAtQW
 DOHB/7g5novvEDgrkw9ucAKRvoFjeZxk6au4t6XJxSYw6jjJE2eWPmKAz0bRF5SEtrUd
 ieoM+cyX2TRWnrBNO4l4SKo4FCzbfUErDrCHlgiOycKg0Azk6g/xDxQ0YE+7izR6S6ja
 cVE+ni5ioZXmeVTwHPIHCvIosYY25bi0iQrMjDPDWIchrst8A3fmyCBfb09vbMGl8wSa
 olrg==
X-Gm-Message-State: AJIora9Q4gIlXgWmDhg0d1QsXaiHFeKknoET3SXWICBMPes/lSITiaCC
 c/p/WsKxEcCpm89hUn2nHA==
X-Google-Smtp-Source: AGRyM1thvIGbberDblL1SPGPjobM4rzELteLF6kUVV/nsNXwhdbWj3qKBLcrkhtLq6A0U4YTo1zXqg==
X-Received: by 2002:a05:6808:20f:b0:33a:6151:4e54 with SMTP id
 l15-20020a056808020f00b0033a61514e54mr6839840oie.257.1658790118535; 
 Mon, 25 Jul 2022 16:01:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a9d4c07000000b0061c4c925c87sm5537850otf.78.2022.07.25.16.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 16:01:57 -0700 (PDT)
Received: (nullmailer pid 2912875 invoked by uid 1000);
 Mon, 25 Jul 2022 23:01:55 -0000
Date: Mon, 25 Jul 2022 17:01:55 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20220725230155.GA2912841-robh@kernel.org>
References: <20220722130554.236925-1-fabrice.gasnier@foss.st.com>
 <20220722130554.236925-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722130554.236925-2-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 mka@chromium.org, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: usb: generic-ehci: allow
 usb-hcd schema properties
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

On Fri, 22 Jul 2022 15:05:51 +0200, Fabrice Gasnier wrote:
> Allow properties and usb-device child nodes as defined in usb-hcd.yaml, by
> using unevaluatedProperties: false. By the way, remove the "companion"
> property as it's redundant with usb-hcd.yaml.
> As example, this allows an onboard hub, to be described in generic-ehci
> controller node:
> usb {
>   compatible = "generic-ehci";
>   #address-cells = <1>;
>   #size-cells = <0>;
>   /* onboard HUB */
>   hub@1 {
>     compatible = "usb424,2514";
>     reg = <1>;
>     vdd-supply = <&v3v3>;
>   };
> };
> 
> Without this, dtbs_check complains on '#address-cells', '#size-cells',
> 'hub@1' do not match any of the regexes: 'pinctrl-[0-9]+'
> From schema: ..../generic-ehci.yaml
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
