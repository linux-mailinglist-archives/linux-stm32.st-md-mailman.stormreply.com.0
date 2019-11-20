Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BB1042D8
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 19:06:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E320BC36B0B;
	Wed, 20 Nov 2019 18:06:10 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F4D5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 18:06:09 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 94so386243oty.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 10:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7pC2i2tAxNfTAMOIZsJuvMlE/NJ0sUDUFXuzIAgYHxg=;
 b=g4Dx1+Dtb0/HV9FIMmN9Y0M/CgVGzwMId7FjHoj2Pwu/wlxwNw59tnq2uIGdZsK6TJ
 gZJbEvQ39Y+NEN4MOLOFJEukNmhMkOsQNAecb7/X5mNhkPXLrYDV0wQG1ttTd5C6XoTK
 7P7HcYaNtj7PtyLXRo+C4ekCISS/t2Md80LOYWfBaBHAKdlHFg0fU3LmBJKtQm2QvFot
 900WW+bXosYQvNVRjuHxdNxdpOL8X4zTfBbE6ngaHbenVimqyrPBA5tSQO1lmBxvG1x3
 Rxy1yXJtItulxMj0bQzlsARWn1pVFIoHkohjCl1hxrgQerEw8d8f7B1nPS/YO4k9zmpi
 h3jQ==
X-Gm-Message-State: APjAAAV8xIP7Cq5cte80Y2R8KJ97O8lYRpncmGiqm4ZFtfeUQ5A4E5m4
 2+fysb59WuUsTKts2WlN8w==
X-Google-Smtp-Source: APXvYqwHgLayY+pckxZcjVrsUp91/dg86G7xrybugemvko/49GqQTNwFbiMki3EAXUomYvb0uqxa+w==
X-Received: by 2002:a05:6830:1f51:: with SMTP id
 u17mr3184832oth.318.1574273167847; 
 Wed, 20 Nov 2019 10:06:07 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 41sm8654664otd.67.2019.11.20.10.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 10:06:07 -0800 (PST)
Date: Wed, 20 Nov 2019 12:06:06 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20191120180606.GA18754@bogus>
References: <20191115181239.549-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115181239.549-1-alexandre.torgue@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: interrupt-controller:
 Convert stm32-exti to json-schema
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

On Fri, 15 Nov 2019 19:12:39 +0100, Alexandre Torgue wrote:
> Convert the STM32 external interrupt controller (EXTI) binding to DT
> schema format using json-schema.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> ---
> 
> Changes since v1:
> 
> According to Rob's review:
> 
> -fix license
> -fix interrupts conditional declaration
> 
> regards
> Alex
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
