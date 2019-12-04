Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 944CD113607
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 20:55:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 546ECC36B0B;
	Wed,  4 Dec 2019 19:55:04 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9930C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 19:55:00 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id l136so444318oig.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2019 11:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OPmJQ+fyJlkP3BfGVuuBfX22U36bspS/c0JjyT/n6XY=;
 b=bcBvUqm19Cvi1IblJTyBLIxvUqenUa4CWsneKoz8Fs+0WoYlYrV9uhvZ0pNApqkP8H
 5prNMtotOkWuhovmvQlvE+hB9Sb5ZZcrrMLzSH2n8azOVbav7EIcm/kf3N9pcp6hSDdq
 TrIjpkZuKZpLMUhrJT7nkijdjfX+m0ZdXQm240FnXQVl42UL/KYewPsDdpXoQAuUJH5m
 FsNQNaFJ3pXPROPBQSx4TuCG+9ODwGraNwL3n1YlKpdvVQL0FWZA80qZbxH/axukBp/L
 yEbeeUuJ8hh08hdrp1syQqdzJ68APFvqn7WqMCOCAIdrF4+bTxccfVLdu8f5S9L2Y4oc
 LluA==
X-Gm-Message-State: APjAAAXAZrsoN3Oh0UbAW42FvzuR3l+J8zMGoRiKEatokoEQx1A9+k62
 d98kp4sTqpstotW/Y48gCA==
X-Google-Smtp-Source: APXvYqxd3fK9jhwjpyiSCh7faZowBYmsINV1Az1SfSXSPdjh2kqdLN95svGwJT4zf5QfC8ZsOqEirw==
X-Received: by 2002:aca:190b:: with SMTP id l11mr4217896oii.65.1575489298861; 
 Wed, 04 Dec 2019 11:54:58 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 64sm2543076oth.31.2019.12.04.11.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 11:54:58 -0800 (PST)
Date: Wed, 4 Dec 2019 13:54:57 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20191204195457.GA18882@bogus>
References: <20191122103942.23572-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122103942.23572-1-alexandre.torgue@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: arm: stm32: Convert
 stm32-syscon to json-schema
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

On Fri, 22 Nov 2019 11:39:42 +0100, Alexandre Torgue wrote:
> Convert the STM32 syscon binding to DT schema format using json-schema.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
