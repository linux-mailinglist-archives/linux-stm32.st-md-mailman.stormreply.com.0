Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E691540D
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 18:37:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB980C71282;
	Mon, 24 Jun 2024 16:37:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77ED9C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 16:37:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 53A1760DCA;
 Mon, 24 Jun 2024 16:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86FAC2BBFC;
 Mon, 24 Jun 2024 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719247024;
 bh=8vaRXZjqin2JDTOMmrFuxGajy9VxH/lsI1KpjXW2Q/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ir84Tycbp3vKwaBQ9sVg0Io1tyqL4+98Ga3A8NmgEC4j8U/grDSE+vkAdJIywidxy
 lV053/uYb5MFJX6/V7iCt19JLOTPykVlURuq8ydLgUSX8ZuXiKTlnGJXOt1XmfhPLj
 sRsAUcC+rYxFuYhyLszaV1TK4d4O7+3V1ZoA/e/z03M23gO3L8DqWkHuLDSDC9BZPp
 RJ0noehGGMxT+sh889j4Sxfu9mnv40CC30GTiaFxSa1jCBBim0srR9QKRO1T6ud0ys
 jQ5C5uLYOAkt6Rq6GSwbSrZw1jWS93/kcl66Lo5b0owFRKQq79fXZ+R7pfhR9y8HmQ
 Pk2IcseYZllUQ==
Date: Mon, 24 Jun 2024 10:37:02 -0600
From: Rob Herring <robh@kernel.org>
To: Etienne Carriere <etienne.carriere@foss.st.com>
Message-ID: <20240624163702.GA4048689-robh@kernel.org>
References: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Pascal Paillet <p.paillet@st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: dual licensing for
 st, stpmic1 bindings
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

On Mon, Jun 17, 2024 at 11:20:16AM +0200, Etienne Carriere wrote:
> Change include/dt-bindings/mfd/st,stpmic1.h license model from GPLv2.0
> only to dual GPLv2.0 or BSD-2-Clause. I have every legitimacy to request
> this change on behalf of STMicroelectronics. This change clarifies that
> this DT binding header file can be shared with software components as
> bootloaders and OSes that are not published under GPLv2 terms.
> 
> In CC are all the contributors to this header file.
> 
> Cc: Pascal Paillet <p.paillet@st.com>
> Cc: Lee Jones <lee@kernel.org>

My copy comes from b4, and looks like it fixes old addresses. Neat.

> Cc: Rob Herring <robh@kernel.org>

The file only shows contributions from Pascal, so you don't need any 
acks for license change. For the change itself:

Acked-by: Rob Herring (Arm) <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
