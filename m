Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0B80AD80
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 21:06:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F6BCC6A613;
	Fri,  8 Dec 2023 20:06:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 747C4C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 20:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 528406258E;
 Fri,  8 Dec 2023 20:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76438C433C7;
 Fri,  8 Dec 2023 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702065978;
 bh=AJRugcmqGU7FRRyaxRvctwC7Ym1TtKH9ucxVu6xYxSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TjZYQtmlieiMq0bzqSV7VeRFOrVA7N6YxttU/rDbwYla8jPLi37LdgIm9XpwLI87h
 yOqYUZrCR0EVO6ymqIfofzxnIu+Kzd4TzSIe/DY7T3YqYDuM49JcogqT0dQtArtXBo
 hQ8JJ4dYEGRx3kfwWOqYTykjFj6qk3+UjfHv5SRT567YvC0SQwMDOv5YAlcMcWuSdv
 VeMQzoi0UWG+aGEq7s175kl/LixERP49B6zPPg5MfDFSUKm+E9mGebd0q/W6KHIiQy
 Q58Mye3TU9mS00rJg1ygRDbvFYziatTUewDo6IAIdyAQx0y9qO6Sz7rAPdbDiljMpa
 bVjjH/wQvC+4g==
Date: Fri, 8 Dec 2023 21:06:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20231208200610.hrpup7ghhjtehcsc@zenone.zhora.eu>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
 <20231208164719.3584028-3-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208164719.3584028-3-alain.volmat@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/7] i2c: stm32f7: simplify status
 messages in case of errors
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

Hi Alain,

On Fri, Dec 08, 2023 at 05:47:11PM +0100, Alain Volmat wrote:
> Avoid usage of __func__ when reporting an error message
> since dev_err/dev_dbg are already providing enough details
> to identify the source of the message.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
