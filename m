Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C631042C2
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 19:01:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D37AC36B0B;
	Wed, 20 Nov 2019 18:01:09 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9909DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 18:01:08 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c14so407630oth.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 10:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UtnezaPuJR3DtOQdYq4UX6HRJep5yiFrHSjeRzh0lw8=;
 b=R7EW0gLnURS2hEVDr7STXroIVVu6ndHsGN/9RPw82poBK5jUtpN5ANwhzcFvCVkIJV
 DRCfTIEmjb9MvG2giayEy6jVljUMJLW1tlX/qkI2pI7tMxY0jLnq5zSEtEMPrIXLeKUb
 oCOp8A+qt1pFrmE2u9QiZjjq7AmfeDQZRGld43BlioLB8KDZgC2u/BLPY72mY1I/AMOm
 3pKsQ6cNWfSXZGPIc29X7LQft2kM8bS2j2xGTsXA0BRB454+zz3FO7V54wl/15e37myK
 hpze2tOl4CYSN8mBmKXQbQBo1unoNtn6QDVqkRM5TZEaP2I87adRCUo3CsXlPg9N38D2
 caLA==
X-Gm-Message-State: APjAAAW/N4BRCzIa1/zfAvOYyj2qDNDNke3UwdvxSxCKIU/d8vim9lvp
 ay830jaJ4DWb27sN5co+0Q==
X-Google-Smtp-Source: APXvYqynzcOYtJD1o3rqHfApKvPoyf3FBMEtPkZFYjA48wZ6n/YuiuIZDoHhntnj4J8//Fy+4USHdA==
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr3098883otj.239.1574272867110; 
 Wed, 20 Nov 2019 10:01:07 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w25sm8731323otj.45.2019.11.20.10.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 10:01:06 -0800 (PST)
Date: Wed, 20 Nov 2019 12:01:05 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191120180105.GA11465@bogus>
References: <20191115102427.31224-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115102427.31224-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh+dt@kernel.org, linux-crypto@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: crypto: Convert stm32
 HASH bindings to json-schema
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

On Fri, 15 Nov 2019 11:24:27 +0100, Benjamin Gaignard wrote:
> Convert the STM32 HASH binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 2:
> - add type ref, min, max and default values for dma-maxburst property
> 
>  .../devicetree/bindings/crypto/st,stm32-hash.txt   | 30 ----------
>  .../devicetree/bindings/crypto/st,stm32-hash.yaml  | 69 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-hash.txt
>  create mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
