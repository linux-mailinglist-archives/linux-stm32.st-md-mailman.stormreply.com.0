Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDDFE7DF9
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2019 02:26:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A09CEC36B0B;
	Tue, 29 Oct 2019 01:26:53 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9811C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 01:26:51 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n48so8356598ota.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2019 18:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eCcfvuoPjyHMd42pi6nHfOR0UQumVD6OC7pdJhU7kf0=;
 b=GkQv1ZpbsxgXV+s7h7hW1zxG2oEgHEq4W7spMs/s/rrftkCJGuzmFEXB0MN039zVNc
 8fHPjglmDMdVAo9YOsjCWUNa5jzZyLNcNdn/U8Sp6WlC7DvPdmrMnXGQ9umgVvtOnjt9
 FXtbMdRcJZ35fN9gjnla2qDMZQn5lGU8Rb8Fos7qk6RkTHy3qf4aTqSEUoT9lLs4woF3
 5OX6DKAl2HVWleucX5tjIyhG++Zq4k8ohgfigpKgjm83FRAS35F/Afb9tiZaNf08bCkI
 P2ay9dUfsvD4GrfApETzvC0dXxiMhD4GMI8tLNPNUciEgOucwXZ+OD14vyffYbHDdtaS
 p93A==
X-Gm-Message-State: APjAAAVWqTI7za77HZs+f5+poeS8R0t+L6/5ny5c+E9/amlNJa140lNy
 Yy88uowhLYH1x0kjKmH6Dg==
X-Google-Smtp-Source: APXvYqzullEppKlo2Vs5I8EFaP7D80fR49srcNV1CcFfdV+cfQk+WtNPkgcRwpUjgM2VuMnhCwAMsg==
X-Received: by 2002:a9d:7653:: with SMTP id o19mr15691588otl.4.1572312410530; 
 Mon, 28 Oct 2019 18:26:50 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i7sm2136223otl.25.2019.10.28.18.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 18:26:49 -0700 (PDT)
Date: Mon, 28 Oct 2019 20:26:49 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20191029012649.GA21858@bogus>
References: <1571228029-31652-1-git-send-email-fabien.dessenne@st.com>
 <1571228029-31652-2-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571228029-31652-2-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: mailbox: stm32-ipcc:
 Updates for wakeup management
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

On Wed, Oct 16, 2019 at 02:13:48PM +0200, Fabien Dessenne wrote:
> The wakeup specific IRQ management is no more needed to wake up the stm32
> plaform.

typo

> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

With that fixed,

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
