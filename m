Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DEF7BD321
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 08:12:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 944CDC6B442;
	Mon,  9 Oct 2023 06:12:56 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23BF6C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 06:12:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A2C56CE0FBB;
 Mon,  9 Oct 2023 06:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466E2C433C8;
 Mon,  9 Oct 2023 06:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696831972;
 bh=Y3aPPA/Uz59BqLA+bMigC55yHKyVdJyWquDM4i6a01o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=vH15VrEzkmvSK9goSKxnj2/xW763xAdTg47ySmpP5UFyiznUZhT9JFpySbMAznxdc
 8I+HDfyKhpvaOD8Y3+9eI3e5ahPk/V1lcqFomxc/FtdBnSTNoJkYo8Ht+dGyqhoZtO
 eQrDEl7FkwQtuexJDi0l6M9Z2CBJReGTQNfD+2iAj1qIAJV/IPs+n9VaS90E8qJP26
 Wy26h1HDfQBmXxYI3LPui8JKYYu0VhKPxf7abQr6d4SLvNdG+LERs/VWPut8GyUArU
 QFShUzYYCLVq5k9ncgoXK4c3LGnUTerojUoZiCmWNqm7QVSGN1u3yeKt82MUsL4Jmb
 WQRfLRAiCnUvQ==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20231004155024.2609531-1-amelie.delaunay@foss.st.com>
References: <20231004155024.2609531-1-amelie.delaunay@foss.st.com>
Message-Id: <169683196986.44135.1324779584069715200.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 11:42:49 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dmaengine: stm32-dma: fix
 stm32_dma_prep_slave_sg in case of MDMA chaining
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


On Wed, 04 Oct 2023 17:50:23 +0200, Amelie Delaunay wrote:
> Current Target (CT) have to be reset when starting an MDMA chaining use
> case, as Double Buffer mode is activated. It ensures the DMA will start
> processing the first memory target (pointed with SxM0AR).
> 
> 

Applied, thanks!

[1/2] dmaengine: stm32-dma: fix stm32_dma_prep_slave_sg in case of MDMA chaining
      commit: 2df467e908ce463cff1431ca1b00f650f7a514b4
[2/2] dmaengine: stm32-dma: fix residue in case of MDMA chaining
      commit: 67e13e89742c3b21ce177f612bf9ef32caae6047

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
