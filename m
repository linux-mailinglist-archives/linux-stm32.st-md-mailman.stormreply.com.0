Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE547BD317
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 08:12:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AC59C6B442;
	Mon,  9 Oct 2023 06:12:27 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BB37C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 06:12:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5CA00CE0FAF;
 Mon,  9 Oct 2023 06:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6A1C433C8;
 Mon,  9 Oct 2023 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696831943;
 bh=5f+2wJGQzlRojPEbL9LmQ2JKb0J4iRCgoHbmh6Ge8AY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=etPvgShYg/c7J1yi7u8i9OgwL1vw+pcIjTb9b38F4BBC/Yp+N1HbVuTo5qyZalDMb
 KE14h/1H8M/LSLTckJmuIBVL2Y7jfP61Wi9tYNVavCz1E3WnHYYHpG4rTrUETVOdr2
 dFl+ZTs4o43/KtRuQDKkCOND/FAXTr5ZC4sQtpNIl3GUDfb4Oh9K3gLO20SagmFhFC
 BiITolNSU5MaLSbcQXFJD5lc/7jPZyzvbFS2g7Qhh8tm3yrlzYMAyUHcq3dK0VbPIy
 RmL9b9zbt59IMg3pjH/33qNsydg6xhCPYzXxwjq0AepkoSJEaoVKJbpHJnrxZFBEOx
 E74M61gsLrnAw==
From: Vinod Koul <vkoul@kernel.org>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20231006213835.332848-1-robh@kernel.org>
References: <20231006213835.332848-1-robh@kernel.org>
Message-Id: <169683193991.43997.3040899490383872549.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 11:42:19 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dmaengine: Drop unnecessary
	of_match_device() calls
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


On Fri, 06 Oct 2023 16:38:35 -0500, Rob Herring wrote:
> If probe is reached, we've already matched the device and in the case of
> DT matching, the struct device_node pointer will be set. Therefore, there
> is no need to call of_match_device() in probe.
> 
> 

Applied, thanks!

[1/1] dmaengine: Drop unnecessary of_match_device() calls
      commit: c48de45d4cefc5a2f0d0e4101c39884326ac704c

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
