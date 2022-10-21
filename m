Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155F607987
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Oct 2022 16:26:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2179C64115;
	Fri, 21 Oct 2022 14:26:00 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3933DC0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 14:25:59 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id o64so3332278oib.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 07:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MWmxzeBv04SeJOw6jKYpRv1e5SEanghL8yyC/XAz/0=;
 b=ymun1ldOPxPOstDN+O5U3Q74ooJpFySneFgqT8tntvt3g831OocwdGQ27Zf4NR5fHg
 jPKhsy7Bu5M60IlCdb1fPoxLwuPGrIP8XVN+oB+l7GpSDe7/apC663XHIpEFU4ZTurcE
 G5Fb3DdI1AujPaO7kt1d+HuVUJOQddmgL0Ez3mZSemZo+tEaGUrPyY70RrD+WF7mQ9mp
 90B4UIgwC+aSQHh7D5hoBSR896xZDeb0jWe4o/hHPP1gn/0jnbGB4OVN/e8vYCPXV3C4
 iueGJPg2wMudgUbwYlkBokf0bqy6UXH7+9Jw/IJspS+oPPJxEUCoOaOHnPiab4RE1Zvn
 T9Fw==
X-Gm-Message-State: ACrzQf2VVquK12QqiKNSD2DQAc2vYiyXuihbvtNMXtaDbof+rkIpHC51
 u+TQ71DWOGwblqYuku94rQ==
X-Google-Smtp-Source: AMsMyM5waqqF2ZrhT4UdNdl/SeZivLSgo9IEVXbX8TNVdatsQdb89iPevIW908f0tKmIF3Fv496Zew==
X-Received: by 2002:aca:a84c:0:b0:355:4262:28ef with SMTP id
 r73-20020acaa84c000000b00355426228efmr11136678oie.14.1666362357884; 
 Fri, 21 Oct 2022 07:25:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l10-20020aca190a000000b003549db40f38sm1118351oii.46.2022.10.21.07.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 07:25:57 -0700 (PDT)
Received: (nullmailer pid 3658172 invoked by uid 1000);
 Fri, 21 Oct 2022 14:25:58 -0000
Date: Fri, 21 Oct 2022 09:25:58 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <166636173496.3593878.13529338596528679973.robh@kernel.org>
References: <20221021084447.5550-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021084447.5550-1-alexandre.torgue@foss.st.com>
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] scripts: dtc: only show unique unit
 address warning for enabled nodes
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

On Fri, 21 Oct 2022 10:44:47 +0200, Alexandre Torgue wrote:
> In some cases an hardware peripheral can be used for two exclusive usages.
> For example, on STM32MP15 we have the same peripheral for I2S and SPI. We
> have dedicated driver for each usage and so a dedicated device node in
> devicetree.
> To avoid to get useless warnings running "make W=1 dtbs", this patch adds
> the "-Wunique_unit_address_if_enabled" flag for a make with W=1. In this
> case we will detect a duplicate address only if both devices are
> enabled in the devicetree, which is a real error case.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Applied, thanks!

I refactored the options and kept 'unique_unit_address' for W=2.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
