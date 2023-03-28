Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 307EA6CC213
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 16:32:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC356C6905A;
	Tue, 28 Mar 2023 14:32:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E782C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 14:32:00 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1A90F2000D;
 Tue, 28 Mar 2023 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680013919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJsUxV1GCYJmepMN7qDxXfeGUt0LBtGmEOWRiNNJIVU=;
 b=CL/4ceslVvnWZODI6nvZVXQHAY6b1WfBFDeXLjcRMvSadFLxWx4Wh/E5ns043wxzQNLMqP
 2cuXRtayeY2QO3fczgGf4U4sn1+VGHSHHaoE4+r/7GUlTMA+nx+F1Oh4Usa+9Bkg9E+DMY
 pZw0VVSEn1mFamQaJpqUQfWivO5uYjeGfFxCj+3WPMq5uChFf+HBUmEmz0peuMi5vNscLO
 Mh0xIs/oFPfJ4VriKptstPt/MbdNiPE6gTbU5sOtOo57Q73mW0LUFSowqDHdn/V04Smswu
 8eA6LDOvrdqClOFsScPmiqLTd4wrmQG6O+GsCvPSAaxdH6Ze/9t/mokv4v+M8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 krzysztof.kozlowski@linaro.org
Date: Tue, 28 Mar 2023 16:31:56 +0200
Message-Id: <20230328143156.441625-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324155105.826063-3-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bb685c1f35c357e9b935880b2946b402d6860ee0'
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/2] mtd: rawnand: stm32_fmc2: depends on
	ARCH_STM32 instead of MACH_STM32MP157
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

On Fri, 2023-03-24 at 15:51:05 UTC, Christophe Kerello wrote:
> To be able to compile the driver on all STM32MP SOCs, we move the
> "depends on" on ARCH_STM32.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
