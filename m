Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B002A1042BA
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 19:00:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66DBDC36B0B;
	Wed, 20 Nov 2019 18:00:06 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AA6EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 18:00:03 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id v138so588004oif.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 10:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x8ePvXP6yBjIswFN0sdVge4OwEb8RGh4Ff5OcAFkAGM=;
 b=kb+m6se+fBNwHbZFUKRLWT5WC+JfFiwWjqltVRcbt1S2EVulv/bkCLUvvAmXYROf+N
 gTtQMiQrn/NeO6D/iWoTOzlqrxQEKKxRvVu7gcnq/GSUWBDI3RXJ52RpoARXG/pUY4PF
 IebJj3SW6vOgUYflNk0HbKb5uQZnN51IF1gl9GrgM9hZcUrX6AVkhSky6D8sw+alSFSW
 1wwAqaN1EVbJ/qp6RQXfVNRs0PPKdUiZgS/xrvDafDS84pK95gOFhTvFpcY78BnnK+oY
 8baZvd8BSYgHmW87f/ido7daCrFKo6c4UbK4F+m5rjVNhHHZHA1rxfFtv3qNBUjJEqR8
 M3Sw==
X-Gm-Message-State: APjAAAVBBsan/LwnQH3O0oPl3VJ+NRDXYs74HossRg3sff/3Zf7cpyI3
 MzeGRKHVtdgh/OlvbHC8ug==
X-Google-Smtp-Source: APXvYqzDJfTkwXh/5EwhxyVPxH0tUWubEzVqDD9sGhy5+DHuWlRO4ADPw/t8mbBv7JzFCN3xOHULzg==
X-Received: by 2002:a54:4407:: with SMTP id k7mr4009997oiw.129.1574272802323; 
 Wed, 20 Nov 2019 10:00:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m20sm5915810otr.47.2019.11.20.10.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 10:00:01 -0800 (PST)
Date: Wed, 20 Nov 2019 12:00:01 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191120180001.GA9839@bogus>
References: <20191115100854.17938-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115100854.17938-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-crypto@vger.kernel.org,
 mpm@selenic.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rng: Convert stm32 RNG
 bindings to json-schema
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

On Fri, 15 Nov 2019 11:08:54 +0100, Benjamin Gaignard wrote:
> Convert the STM32 RNG binding to DT schema format using json-schema
> Remove interrupt from the json-schema because it is not used by the driver.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/rng/st,stm32-rng.txt       | 25 -----------
>  .../devicetree/bindings/rng/st,stm32-rng.yaml      | 48 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rng/st,stm32-rng.txt
>  create mode 100644 Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
