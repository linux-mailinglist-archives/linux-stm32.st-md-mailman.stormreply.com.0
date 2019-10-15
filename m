Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9851D7D72
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2019 19:22:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A26FC36B0B;
	Tue, 15 Oct 2019 17:22:19 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A06EBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 17:22:17 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g13so17620175otp.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 10:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jbHpx7XPETlJ9vzemeHjD6QE7tFzcrH2Jm0Y5GaVUsE=;
 b=Rn1EzdXZ15HIwmuxqRyE4OYNj0el6AHAAsDhQDwC0m7aAnNzVjmoQlUxWpFduNjeDY
 uqGeLlydgZIRoHJf7BALRetZflIIUd+/wYSND+bLuOMjm88SpIfqxzcasisLUjdnvjQO
 CnUTyLFC7LmtNI/G+8epEO5oN1sy7w7i/mtxjrH082irGoeuBh8BjF2WPtBn570BKny6
 RCiaCu7EKMgyTV/Yy6FHsmF4l7/vurp1z5TGxZx0Mt7aIoRQLXVHe4BAeVfh0ck/LDvN
 3baiaMYXBVhx54vHePZL5iD/ijsFBqN6cft1DppWwsM/M4ZFHwaLKM7sce1K9hGjozLR
 gViA==
X-Gm-Message-State: APjAAAU43/yffFsDBGd5l2etJOMVthzLB0tnPzhRBSm1xcvJqHZSRKZp
 kg3uFr74ZqP+dTWLTW+QAg==
X-Google-Smtp-Source: APXvYqwPKZrxBjDVG/uILAEhdydbS48WivhzBHRDzrcYQxF0oufQKLAlBVKJ72NlODmOQyjYCQPneg==
X-Received: by 2002:a05:6830:1188:: with SMTP id
 u8mr26388246otq.190.1571160136331; 
 Tue, 15 Oct 2019 10:22:16 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s1sm6446834otd.49.2019.10.15.10.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 10:22:15 -0700 (PDT)
Date: Tue, 15 Oct 2019 12:22:15 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20191015172215.GA30472@bogus>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
 <20191007134410.10337-3-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007134410.10337-3-alexandre.torgue@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: pinctrl: stm32: Fix 'st,
 syscfg' description field
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

On Mon, 7 Oct 2019 15:44:09 +0200, Alexandre Torgue wrote:
> As there is only one item "st,syscfg" this commit moves phandle description
> fields under "description" tag. It'll fix a validation issue seen  during
> stm32 DT check.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
