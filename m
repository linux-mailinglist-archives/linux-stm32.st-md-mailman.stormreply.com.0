Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D051B678
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 05:20:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B6B3C6046B;
	Thu,  5 May 2022 03:20:45 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D10DDC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 03:20:42 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-e9027efe6aso3098623fac.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 May 2022 20:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eRBDAPVmHirfU8XkTF17XAM/zWgEEKcXvSn1diz5G3s=;
 b=oCek2EfEv/lVSculo5jOrth4WlllVT7sWUJRgqxfAUIaRojVM2Ppwl4emYlAwGQofZ
 Ye4I3cKa+qLPU/T6d/Z1Li4mYfjsxL1VeIo7PXPczOgmRndUrH42iVDWJirP1y995ZGt
 q3LIvbIsc2SVkA5tMR+uorlKPiPKhkVok4InC/EvOIVrSnQ4U+MX93/ggKSYsPMet5Zv
 F1NQLg5vhwMw+UqVZ5cBW8A7mjIdrqTMAxZenHa49M5MeJR7uA8Gd13EL7hcdy7Eg+8K
 Po6oxkZw+7uj8r86SPW8L1ONolIqE2WfggKRbTgXB2RWsf6L6cNuohy+2t6qTkReSB7Q
 eROQ==
X-Gm-Message-State: AOAM530lp0jMVz+zJVUpusQ1e0hr27ktMRFaMr6Xyt798lNobjhkMB5O
 edHUFEazPfqukF5fsuINlw==
X-Google-Smtp-Source: ABdhPJxT3mpokGd1m5BJqGKfgMEJjonJ6vOb1sxgtGWbM24PZK3WJX7ILS37jtEPM9kp5OCRjg0VyQ==
X-Received: by 2002:a05:6870:1244:b0:ce:c0c9:620 with SMTP id
 4-20020a056870124400b000cec0c90620mr1331311oao.114.1651720841656; 
 Wed, 04 May 2022 20:20:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j28-20020a056830241c00b0060603221264sm159867ots.52.2022.05.04.20.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 20:20:41 -0700 (PDT)
Received: (nullmailer pid 2749715 invoked by uid 1000);
 Thu, 05 May 2022 03:20:40 -0000
Date: Wed, 4 May 2022 22:20:40 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Message-ID: <YnNCiNWQQU7bc/Eh@robh.at.kernel.org>
References: <20220503145559.525804-1-fabien.dessenne@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503145559.525804-1-fabien.dessenne@foss.st.com>
Cc: devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: mailbox: remove the IPCC
	"wakeup" IRQ
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

On Tue, 03 May 2022 16:55:59 +0200, Fabien Dessenne wrote:
> The stm32 ipcc mailbox driver supports only two interrupts (rx and tx), so
> remove the unsupported "wakeup" one.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> ---
>  .../devicetree/bindings/mailbox/st,stm32-ipcc.yaml    | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
