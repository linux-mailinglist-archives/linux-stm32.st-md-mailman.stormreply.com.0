Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE67105A7E
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 20:39:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BF9FC36B0B;
	Thu, 21 Nov 2019 19:39:35 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1367C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 19:39:32 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 14so4262170oir.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 11:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c4KjpD+ns0ACXFE5v6l81aoQVHuHJsxlS4JefMC5EMY=;
 b=r0mtYAOYENcbJlWjeVa+arIBCd90pOLsPMIq7srWexnE8CxeqRdaoYIJ/3e5idSmcn
 KXqxkOGYRkCfPvkxepQJQUzLLHlswVbpIMihWaleOSsajmgBqqHFj7nUULUuNIdShgVM
 7GFMOQExFRE2V7Hw8mJl+4Wm+rK3T+sxapUwBbRoCao/yRo6EnKmeLH2JsFsVoKlNUIJ
 PjaCp4a4ArPbsoCFTntylVlDC2TCe66uTL7L9a3Rxi5RWHPvA8/QV2ufrhUNQ8mcCFab
 I4solyWYIc8zbprQ3Rn6g/DS+fM4lkN1D+rq5bXZyaHgoU+OEvsJVhzMCvY+LZMS4czs
 DFEQ==
X-Gm-Message-State: APjAAAX18qfkJSH8ctfNiBy//842kExwKhDSWJ71xJ4bX6DQ3QZwIofB
 JLpQk4ztb8B4+DzQvIhalLcXcvw=
X-Google-Smtp-Source: APXvYqw+O/5gVYMGrcCumNOlMYDrrdD4XmwLhJA1mxJFW4xVlHhGW1dwTOU1ghWvK2UUGvx0UeKwSA==
X-Received: by 2002:aca:1715:: with SMTP id j21mr8631035oii.6.1574365171174;
 Thu, 21 Nov 2019 11:39:31 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u204sm1229289oig.35.2019.11.21.11.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 11:39:30 -0800 (PST)
Date: Thu, 21 Nov 2019 13:39:29 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20191121193929.GA6676@bogus>
References: <1574342866-8348-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574342866-8348-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wsa@the-dreams.de,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: i2c: stm32: Migrate
 i2c-stm32 documentation to yaml
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

On Thu, 21 Nov 2019 14:27:46 +0100, Alain Volmat wrote:
> The document was migrated to Yaml format and renamed st,stm32-i2c.yaml
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
> v2: remove i2c-scl.*time description, ref (moved into i2c-controller.yaml
>     push the st,syscfg-fmt into the if compatible st,stm32f7 part
>     fix the st,syscfg-fmt ref syntax and set minItems/maxItems to 3
>     make the clock-frequency part common and only keep enum in the st,stm32f4 case
>     remove unnecesary minItems/maxItems
>     remove address-cells/size-cells from required fields
> ---
>  .../devicetree/bindings/i2c/i2c-stm32.txt          |  65 ----------
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml      | 141 +++++++++++++++++++++
>  2 files changed, 141 insertions(+), 65 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-stm32.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
